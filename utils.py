import sys, os, traceback, types
if( sys.version_info.major < 3 ):
    print("Use python 3.x to run this script", file=sys.stderr)
    raise RuntimeError("Use python 3.x to run this script")

import socket, errno, io, re, random, time, requests
from concurrent.futures import ThreadPoolExecutor
from threading import Thread
from socketserver import ThreadingMixIn
from http.server import HTTPServer, BaseHTTPRequestHandler

if os.name != 'nt':
    print("This script is primarily to be run via native Windows command prompt and python.\nSome of the functionality may not work with cygwin.", file=sys.stderr)
    # time.sleep(3)
    # raise RuntimeError("Use native install of Windows Python from Microsoft Store")


def ensureModule(*argv):
    """Ensures that all python modules provided as arguments are installed and available as import."""
    try:
        from pip._internal.cli.main import main as pipmain
    except:
        import urllib.request
        u=urllib.request.urlopen('https://bootstrap.pypa.io/get-pip.py')
        d=u.read()
        u.close()
        with open('.' + os.path.sep + 'get-pip.py', 'wb') as f:
            f.write(d)
            f.close()

        d=''
        os.system('python get-pip.py')
        os.system('python -m pip install --upgrade pip')
        from pip._internal.cli.main import main as pipmain

    modules=[]
    import re, importlib
    for m in argv:
        modules.extend(re.split('[\\s,]+',m.strip()))
    for m in modules:
        module = m.split('=')
        pkg=None
        if (len(module) > 1):
           pkg=module[1]
        m=module[0]
        result=0
        try:
           globals()[m] = importlib.import_module(m, pkg)
        except:
            if ( pkg == None ):
                result=pipmain(['install', m])
            else:
                result=pipmain(['install', pkg])
                if result != 0 :
                    result=pipmain(['install', m])
        if result == 0 :
            globals()[m] = importlib.import_module(m, pkg)
        else:
            print("No module/pkg '%s/%s' available." % (m,pkg))


ensureModule("fire,httpagentparser, termcolor, bs4")
from termcolor import colored, cprint

def get_all_IPV4_Addrs_impl():
    ensureModule("wmi,psutil,win32con,shutil")
    IPs = []
    all_itfs = psutil.net_if_addrs()
    for itf in all_itfs:
        for addr in all_itfs[itf]:
           if(addr.family == 2):
               IPs.append((addr.address, itf))
    return IPs

def test(arg1, arg2):
    print( str(eval(arg1)) + '::' + str(eval(str(arg2))) )
    if not isUserAdmin():
        runAsAdmin()
    os.system('c:\\cygwin64\\Cygwin.bat')

inpStack=[]
ansStack=[]
finalAns=[]
BEST_FIT_LIMIT=500

def update():
    global ansStack , finalAns
    if(sum(ansStack) > sum(finalAns)):
        finalAns=ansStack[:]
        print("finalAns sum is now " + str(sum(finalAns)))

def xfer(fromSt, toStack):
    if len(fromSt) > 0:
        toStack.append(fromSt.pop())

def bsum():
    global inpStack, ansStack, BEST_FIT_LIMIT
    ret=0
    if( sum(ansStack) == BEST_FIT_LIMIT or len(inpStack) == 0 ):
        update()
        return ret
    if( sum(ansStack) < BEST_FIT_LIMIT):
        xfer(inpStack, ansStack)
        ret=bsum()
        if ret == 0:
            update()
            xfer(ansStack, inpStack)
            return ret
    if(sum(ansStack) > BEST_FIT_LIMIT):
        xfer(ansStack, inpStack)
        tempSt=[]
        xfer(inpStack, tempSt)
        ret=bsum()
        if ret == 0:
            update()
            xfer(ansStack, inpStack)
        xfer(tempSt, inpStack)
    return ret

def bestFitSum(MAX_LIMIT,*argv):
    global finalAns, inpStack, BEST_FIT_LIMIT
    BEST_FIT_LIMIT=MAX_LIMIT
    for n in argv:
        inpStack.append(n)
    tempst=inpStack[:]
    for x in inpStack:
        bsum()
        tempst.pop()
        inpStack=tempst[:]
    update()
    print(finalAns)
    print("finalAns sum is now " + str(sum(finalAns)))

def binPatch(chunkBytes, replacementBytes, fileName):
    """Updates bytes in given binary file with replacement bytes.\n
    Example Usage:\n	python <this-script-file> '68 28 23 00 00 68 7B 23 00 00' "b'\\x90' * 0x1A" 'c:/windows/syswow64/cmd.exe'
    	python <this-script-file> 'BA 7B 23 00 00 33 C9'          "b'\\x90' * 0x20" 'c:/windows/system32/cmd.exe' """
    f = open(fileName, 'r+b'),
    a = f.read()
    z = ''.join(chr(int(b, 16)) for b in chunkBytes.split())
    p = a.find(z)
    if p == -1 or a.find(z, p+len(z)) != -1:
        print('patch doesn\'t fit or file already patched')
    else:
        if raw_input('chunk found (offset %#x), patch? (Y/n) ' % p) != 'n':
            shutil.copy(fileName, fileName + '.bak')
            f.seek(p)
            f.write(str(eval(replacementBytes)))
            print('patch successful.')
        else:
            print('patching cancelled.')
    f.close()
def get_all_IPV4_Addrs(verbose=False):
    """(Windows only) Lists all IPv4 Addresses of various network interfaces.
    -verbose to list interface names too."""
    if verbose:
        print(get_all_IPV4_Addrs_impl())
    else:
        print(dict(get_all_IPV4_Addrs_impl()).keys())

def get_fast_cygwin_mirrors():
    """Lists top 5 fastest mirrors currently online for cygwin installation."""
    from urllib.request import  urlopen
    mirrors_url = "http://cygwin.com/mirrors.lst"
    test_file = "/x86_64/setup.ini"

    mirrors = [
        #    {"host": "",
        #     "time": 1
        #  }
    ]
    print("Downloading Cygwin mirrors list from %s ..." % mirrors_url, end='')
    sys.stdout.flush()
    u = urlopen(mirrors_url)
    for line in u:
      strline = str(line)[2:-3]
      host = strline.split(";")
      # Only test http
      if host[0].startswith("http://"):
        mirrors.append({"host": host, "time": 9999})
    print("done, %d entries" % len(mirrors))
    random.shuffle(mirrors)

    block_sz = 8192
    max_hosts_to_try = 100
    testn = 1
    for hostentry in mirrors:
      host = hostentry["host"]
      print("testing mirror %s ..." % host[1], end='')
      sys.stdout.flush()
      start_time = time.time()
      try:
        test = urlopen(host[0] + test_file, timeout=5)
        test.read(block_sz)
        time_spent = time.time() - start_time
        hostentry["time"] = time_spent
        print("%s sec" % time_spent)
      except IOError:
        hostentry["time"] = 9999
        print("timeout")
      testn += 1
      if testn > max_hosts_to_try:
        break

    mirrors = sorted(mirrors, key=lambda entry: entry["time"])

    print("\nTop 5 mirrors\n")
    sys.stdout.flush()
    
    block_sz = 8192 << 3
    max_hosts_to_try = 5
    testn = 1
    for i in range(max_hosts_to_try):
      mirror = mirrors[i]
      host_info = mirror["host"]
      if mirror["time"] < 9999:
        print("%.3f, %14s, %10s, %s" % (mirror["time"], host_info[2], host_info[3], host_info[0]), file=sys.stderr)
    testn = 1
    for hostentry in mirrors:
      host = hostentry["host"]
      print("Final pass: testing mirror %s ..." % host[1], end='')
      sys.stdout.flush()
      start_time = time.time()
      try:
        test = urlopen(host[0] + test_file, timeout=5)
        test.read(block_sz)
        time_spent = time.time() - start_time
        hostentry["time"] = time_spent
        print("%s sec" % time_spent)
      except IOError:
        hostentry["time"] = 9999
        print("timeout")
      testn += 1
      if testn > max_hosts_to_try:
        break


def installCygwin(root='c:\\cygwin64', mirror='http://download.nus.edu.sg/mirror/cygwin/'):
    """(Windows only) Install cygwin in c:\\cygwin64 (default) folder... e.g
    python utils.py --root='c:\\cygwin64' --mirror='http://download.nus.edu.sg/mirror/cygwin/'

    root : string
        The Local Root folder cygwin should be installed in. default='c:\\cygwin64'
    mirror : string
        web url to use as cgwin mirror. default='http://download.nus.edu.sg/mirror/cygwin/'
    """
    import urllib.request
    cyg_installer_url='https://cygwin.com/setup-x86_64.exe'
    cyg_installer_url=cyg_installer_url.strip('/')
    print ("Downloading installer from %s" % cyg_installer_url)
    u=urllib.request.urlopen(cyg_installer_url)
    d=u.read()
    u.close()
    with open('.' + os.path.sep + cyg_installer_url.split('/')[-1], 'wb') as f:
        f.write(d)
        f.close()

    d=''
    os.system('.' + os.path.sep + cyg_installer_url.split('/')[-1] + ' -V')
    rootArgs=''
    if mirror != "":
        mirror=' -s ' + mirror
    if root != "":
        rootArgs=' -R \"' + root + '\"' + ' -l \"' + root + '\\' + 'repo\"'
    cmdline='.' + os.path.sep + cyg_installer_url.split('/')[-1] + ' -g -d -f -v %s %s -C Admin -C Base -C Net -C Utils -p wget' % (rootArgs,mirror)
    print('Installer Download complete. Will next execute : ')
    YELLOW = "\033[1;33m"
    RESET = "\033[0;0m"
    sys.stdout.write(YELLOW)
    # cprint(cmdline,'yellow')
    print(cmdline)
    sys.stdout.write(RESET)
    ensureModule("subprocess")
    ans=input('Press any key to continue...');
    os.system(cmdline)

    bashrc='\\\\indshare\\share\\campaign_acc_india_mustang\\dev\\setup\\.bashrc'
    f= open(bashrc, 'r+b')
    a=f.read()
    username=subprocess.check_output('whoami', shell=True)
    username=username.decode().strip()
    if username.find('\\') != -1:
        username=username.split('\\')[1]
    f1=open(root + '\\home\\' + username + '\\.bashrc', 'r+b')
    f1.write(a)
    f.close()
    f1.close()
    if not isUserAdmin():
        runAsAdmin()
    os.system(root + 'Cygwin.bat')

def num(i):
    """Convert a numeric number to words and speech."""
    ensureModule('num2words,pyttsx3,numpy')
    from num2words import num2words
    a=''
    if ( numpy.isscalar(i) ):
        a=str(i).replace(',','')
    else:
        for j in i:
            a+=str(j).replace(',','')
    print(num2words(a))
    sys.stdout.flush()
    engine = pyttsx3.init()
    b=0
    roundA=a
    if '.' in a:
        b=-1
        roundA=a.split('.',1)[0]
    if b == 0:
        b={True: pow(10, len(roundA) - 3), False: 1} [len(roundA) > 6 ]
        roundA=int((int(roundA) + b/2)/b)*b
    else:
        roundA=a
    engine.say( num2words(roundA) + {True: ' approx', False:''} [ b > 1] )
    engine.runAndWait()

def imageToText(imgPath, fetchCode=False, binPath=r'C:\\Program Files\\Tesseract-OCR\\tesseract.exe'):
    """(Windows only) Extracts text out of an image.Needs tesseract engine exe to be installed. e.g C:\\Program Files\\Tesseract-OCR\\tesseract.exe"""
    from tkinter import filedialog as fd
    fd.askopenfilename
    """Converts Image to Text."""
    if ( fetchCode == True ):
        fetchCode='fetchCode'
    from pathlib import Path,PurePath
    if ( not Path(imgPath).is_file() ):
        initdir=PurePath(imgPath).parent
        imgPath=''
    if(imgPath == ''):
        root = Tk()
        ftypes = [ ('Windows bitmaps', 'bmp,*.dib')        \
            ,('JPEG', '*.jpeg;*.jpg;*.jpe')                \
            ,('JPEG 2000', '*.jp2')                        \
            ,('Portable Network Graphics', '*.png')        \
            ,('Portable image format', '*.pbm;*.pgm;*.ppm')\
            ,('Sun raster', '*.sr;*.ras')                  \
            ,('TIFF', '*.tiff;*.tif')                      \
            ,('All Files', '*') ]
        imgPath=fd.askopenfilename(initialdir = initdir, title='Select Image', filetypes = ftypes)
        root.destroy()
        if(imgPath == ''):
            return

    """ ensureModule('opencv-python,pytesseract,cv2') """
    ensureModule('pytesseract')
    import cv2
    img=cv2.imread(imgPath)
    if (img is None):
        raise RuntimeError('Could not read image file %s' % imgPath)
    pytesseract.pytesseract.tesseract_cmd=binPath
    t=pytesseract.image_to_string(img)
    t=(re.findall(r"[0-9][0-9][0-9][0-9][0-9]", (re.findall(r"SECURITY CODE\\s+[0-9][0-9][0-9][0-9][0-9]",t) or [''])[0]) or [''])[0] if( fetchCode == 'fetchCode' ) else t
    print(t)

def generateHistgramOnTerminal(nstep  = 64, base = 10 ):
    """Generates a horizontal histogram on console terminal window from input format
        where first column is the frequency/measure/count to plot and
        second column is the data.See Description section for details.

        Sample Data:
            ITEMS_SOLD      DATE
            712345          2023-04-15
            112345          2023-04-20
            3123            2023-04-25
        The plot on terminal will look like:
            2023-04-15 (712345) : ==========================================================================
            2023-04-20 (112345) : ====================
            2023-04-25 (  3123) : ==========

        Sample Usage:
        python utils.py histogram < f.txt
        cat f.txt | python utils.py histogram
    """
    daA = []
    wdA = []
    wdNormalized = []
    for line in sys.stdin:
        width, data = line.split()
        daA.append(data)
        wdA.append(int(width))
    dMaxLen=max(len(x) for x in daA)
    wMaxLen=max(len(str(x)) for x in wdA)
    minVal = int(min(wdA))
    maxVal = int(max(wdA))
    stepW = (float(maxVal - minVal) / nstep)
    for w in wdA:
        wdNormalized.append(float((w-minVal))/stepW + base)
    for d,w,wdN in zip(daA, wdA, wdNormalized):
        print("{:<10}{:=<{wdN}}".format(d.ljust(dMaxLen,' ')+' ('+str(w).rjust(wMaxLen, ' ')+') : ', "", wdN=wdN))

def getBrowserName(userAgentString, detailed="no"):
    """Takes User Agent string and returns browser name. Use double quotes("") preferably, to specify user agents."""
    ensureModule('httpagentparser')
    if detailed == "no" :
        return httpagentparser.simple_detect(userAgentString)[1]
    else:
        return httpagentparser.detect(userAgentString)

def isUserAdmin():
    if os.name == 'nt':
        ensureModule('ctypes')
        # WARNING: requires Windows XP SP2 or higher!
        try:
            return ctypes.windll.shell32.IsUserAnAdmin()
        except:
            traceback.print_exc()
            print("Admin check failed, assuming not an admin.")
            return False
    elif os.name == 'posix':
        # Check for root on Posix
        import platform
        if platform.system().lower().startswith('cygwin'):
            return True
        return os.getuid() == 0
    else:
        raise RuntimeError("Unsupported operating system for this module: %s" % (os.name))

def runAsAdmin(cmdLine=None, wait=True):
    print("Running as Admin")
    if os.name != 'nt':
        raise RuntimeError("This function is only implemented on Windows.")
    ensureModule("wmi,psutil,win32con,shutil")
    ensureModule('win32api, win32com, win32event, win32process')
    from win32com.shell.shell import ShellExecuteEx
    from win32com.shell import shellcon

    python_exe = sys.executable

    if cmdLine is None:
        cmdLine = [python_exe] + sys.argv
    elif type(cmdLine) not in (types.TupleType,types.ListType):
        raise ValueError("cmdLine is not a sequence.")
    cmd = '"%s"' % (cmdLine[0],)
    # XXX TODO: isn't there a function or something we can call to massage command line params?
    params = " ".join(['"%s"' % (x,) for x in cmdLine[1:]])
    cmdDir = ''
    showCmd = win32con.SW_SHOWNORMAL
    #showCmd = win32con.SW_HIDE
    lpVerb = 'runas'  # causes UAC elevation prompt.

    # print("Running", cmd, params)

    # ShellExecute() doesn't seem to allow us to fetch the PID or handle
    # of the process, so we can't get anything useful from it. Therefore
    # the more complex ShellExecuteEx() must be used.

    # procHandle = win32api.ShellExecute(0, lpVerb, cmd, params, cmdDir, showCmd)

    procInfo = ShellExecuteEx(nShow=showCmd,
                              fMask=shellcon.SEE_MASK_NOCLOSEPROCESS,
                              lpVerb=lpVerb,
                              lpFile=cmd,
                              lpParameters=params)

    if wait:
        procHandle = procInfo['hProcess']    
        obj = win32event.WaitForSingleObject(procHandle, win32event.INFINITE)
        rc = win32process.GetExitCodeProcess(procHandle)
        #print("Process handle %s returned code %s" % (procHandle, rc))
    else:
        rc = None

    return rc


def beep():
    print("beep beep")

def range_str_2_int(r):
    res_ints = []
    res_ints = [int(x) for x in r.split('-')]
    res_ints.sort()
    return range(res_ints[0], res_ints[-1]+1)

def is_port_in_use(host: str, port: int, timeout: float=3.0) -> str:
    """Checks if a given host is listening(i.e in Use) on to the specified network port."""
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.settimeout(timeout)
        try:
            if s.connect_ex((host, int(port))) == 0:
                res="in Use"
            else:
                res="Available"
        except socket.error as e:
            res="Skipped"
        s.close()
    return res

def portscan(*argv):
    """(Windows only) Takes a port or range of ports as arguments and returns if each one of them is available for binding e.g. 80 8080-8082 5030-5034."""
    if not isUserAdmin():
        runAsAdmin()
    
    ports=','.join(map(str, argv))
    # ports="4,10, 1-3 ,100 , 1"
    # ports="4,10, 1-3-5,100 , 1, #28"
    myRegex = re.compile(r'^[1-9][0-9]*$|^[1-9][0-9]*-[1-9][0-9]*$')
    rangeRegex = re.compile(r'^[1-9][0-9]*-[1-9][0-9]*$')
    # rng_tmp_1 = [ x.strip() for x in ports.split(',') ]
    port_rng = [ myRegex.search(x.strip()).group() for x in ports.split(',') if (myRegex.search(x.strip()) == None) == False ]
    port_rng2 = []
    for x in port_rng:
        if (rangeRegex.search(x) == None):
            port_rng2.append(int(x))
        else :
            for i in range_str_2_int(x):
                port_rng2.append(i)
    port_rng2 = list(set(port_rng2))
    port_rng2.sort()
    print("Scanning ports",str(port_rng2), "...")
    for port in port_rng2:
        port_not_available = False
        for ip in get_all_IPV4_Addrs_impl():
            statusMsg = io.StringIO()
            print("Checking Interface IP", ip[0], "-", ip[1] , file=statusMsg, end='')
            print('%-80s' % statusMsg.getvalue(), end='')
            statusMsg.close()
            status=is_port_in_use(ip[0], port,0.5)
            port_not_available = status == "in Use"
            print("...%s" % status)
        if (port_not_available == True):
           print("\nPort", str(port),"is in use on atleast one Interface on this machine\n")
        else:
            print("Port" , str(port) , " is available\n")

class Handler(BaseHTTPRequestHandler):
    def __init__(self, hostname='', port=80):
        self.port = port
        self.hostname=hostname.strip()
    def __call__(self, *args, **kwargs):
        """Handle a request."""
        super().__init__(*args, **kwargs)
    def do_GET(self):
        self.server_version="ACC_HPARMAR/V1"
        self.send_response(200)
        self.send_header("Content-type", "text/html")
        self.end_headers()
        response="<HTML><HEAD><TITLE>" + self.hostname + ":" + str(self.port) + "</TITLE></HEAD<BODY><p>" + str(self.date_time_string()) + " : Hello " + str(self.client_address) +"</p></BODY></HTML>"
#        print(response)
        self.wfile.write(bytes(response, "utf-8"))
        self.close_connection=True

class ThreadingHTTPServer(ThreadingMixIn, HTTPServer):
    daemon_threads = True

def serve_on_port(port,host=''):
    hostname=host.strip()
    if not hostname:
        if socket.gethostname().find('.')>=0:
            hostname=socket.gethostname()
        else:
            hostname=socket.gethostbyaddr(socket.gethostname())[0]
    server = ThreadingHTTPServer((hostname,port), Handler(hostname, port))
    server.serve_forever()

def servePorts(*argv):
    """Takes a port or range of ports as arguments and starts listening on them if they are not already being listened to."""
    """You can listen to response using curl e.g curl http://<hostname>:<port>"""
    try:
        if not isUserAdmin():
            runAsAdmin()
    except RuntimeError as e:
        print(str(e))

    ports=','.join(map(str, argv))
    # ports="4,10, 1-3 ,100 , 1"
    # ports="4,10, 1-3-5,100 , 1, #28"
    myRegex = re.compile(r'^[1-9][0-9]*$|^[1-9][0-9]*-[1-9][0-9]*$')
    rangeRegex = re.compile(r'^[1-9][0-9]*-[1-9][0-9]*$')
    # rng_tmp_1 = [ x.strip() for x in ports.split(',') ]
    port_rng = [ myRegex.search(x.strip()).group() for x in ports.split(',') if (myRegex.search(x.strip()) == None) == False ]
    port_rng2 = []
    for x in port_rng:
        if (rangeRegex.search(x) == None):
            port_rng2.append(int(x))
        else :
            for i in range_str_2_int(x):
                port_rng2.append(i)
    port_rng2 = list(set(port_rng2))
    port_rng2.sort()
    if socket.gethostname().find('.')>=0:
        hostname=socket.gethostname()
    else:
        hostname=socket.gethostbyaddr(socket.gethostname())[0]

    print("Serving ports",str(port_rng2), "...")
    portServedByMainThread=0
    for port in port_rng2:
        status=is_port_in_use(hostname, port,0.5)
        port_not_available = status == "in Use"
        if (port_not_available == True):
            print("Port ", str(port)," is in use on on this machine ", hostname)
        else:
            if (portServedByMainThread == 0) :
                portServedByMainThread=port
            else:
                Thread(target=serve_on_port, args=[port]).start()
    if (portServedByMainThread != 0) :
       serve_on_port(portServedByMainThread)

def get_windows_PID_Ports():
    """(Windows only) List all MS Windows processes and the network ports they are currently listening on."""

    if not isUserAdmin():
        runAsAdmin()
    ensureModule("wmi,psutil,win32con,shutil")
    c = wmi.WMI ()
    print('%25s' % "Process Name", '%6s' % "PID", '%25s' % "Port(s)", sep=':')
    for process in c.Win32_Process ():
        try:
            p = psutil.Process(process.ProcessId)
        except:
            print(process.Name)
        proc_listen_sockets=[x for x in p.connections() if x.status == psutil.CONN_LISTEN]
        if( len(proc_listen_sockets) > 0):
            ports=[]
            print('%25s' % process.Name, '%6s' % str(process.ProcessId), sep=':', end='')
            for s in proc_listen_sockets:
                ports.append(s.laddr.port)
            ports = list(set(ports))
            if (process.CommandLine == None):
                print('%25s' % ports)
            else:
                print('%25s' % ports, process.CommandLine, sep=' ')

def http_get_with_requests(url, timeout = 10):
    response=[]
    try:
        response = requests.get(url)
    except:
        return (url, 404)

    response_json = None
    try:
        response_json = response.json()
    except:
        pass

    response_content = None
    try:
        response_content = response.content
    except:
        pass

    return (url, response.status_code)

def http_get_with_requests_parallel(*argv):
    list_of_urls=','.join(map(str, argv)).split(',')
    results = []
    executor = ThreadPoolExecutor(max_workers=100)
    for result in executor.map(http_get_with_requests, list_of_urls):
        results.append({result[0], result[1]})
    return results

def convert_targz_2_zip(file_name):
    import  tarfile, zipfile
    out_file = file_name.replace('.tar.gz', '.zip')
    print('Converting '+ file_name + ' to ' +  out_file)
    with tarfile.open(file_name, mode='r:gz') as tf:
        with zipfile.ZipFile(out_file, mode='a', compression=zipfile.ZIP_DEFLATED) as zf:
            for m in tf.getmembers():
                f = tf.extractfile( m )
                fl = f.read()
                fn = m.name
                zf.writestr(fn, fl)

def targz_2_zip(path):
    """ Converts  file/directory from tar.gz format to zip format."""
    import glob
    if not os.path.exists(path) :
        print("path does not exist", file=sys.stderr)
        return None
    if os.path.isfile(path) and 'tar.gz' != '.'.join(os.path.basename(path).split('.')[1:]) :
        print("file should  have tar.gz extension ", file=sys.stderr)
        return None
    if os.path.isdir(path) :
        for file_name in glob.glob(path + '/*.tar.gz'):
            convert_targz_2_zip(file_name)
    else:
        convert_targz_2_zip(path)

def normalize_tracking_data(sep='|'):
    # Typical Input is data as in
    # tracking_logs_db_analysis.sh -> per_day_delivery_hit_freq_distribution_all_dlvs.txt
    from datetime import datetime
    import pandas as pd
    import numpy as np
    tracking_data_max_days=36
    dlv=''
    last_date=''
    batch=[]
    dlv_data=[]
    col_names=['deliveryId', 'totalHits']
    for index in range(tracking_data_max_days):
        col_names.append('day' + f'{index:02d}' + 'Hits' )
    df=pd.DataFrame(columns=col_names)
    for line in sys.stdin:
        fields=line.strip().split(sep=sep)
        if fields[0] != dlv:
            if dlv:
                total=0
                dlv_data=[]
                dlv_data.append(int(dlv))
                for f in batch:
                    total+=int(f[2])
                dlv_data.append(total)
                for index in range(tracking_data_max_days):
                    dlv_data.append(0)
                for f in batch:
                    dlv_data[int(f[1])+2]=int(f[2])
                df.loc[len(df)] = dlv_data
#                print('%s' % sep.join(map(str, dlv_data)))
            batch.clear()
            dlv=fields[0]
            last_date=fields[1]
        norm_day=(datetime.strptime(fields[1], "%Y-%m-%d") - datetime.strptime(last_date, "%Y-%m-%d")).days
        fields[1]=str(int(norm_day))
        batch.append(fields)
    if dlv:
        total=0
        dlv_data=[]
        dlv_data.append(int(dlv))
        for f in batch:
            total+=int(f[2])
        dlv_data.append(total)
        for index in range(tracking_data_max_days):
            dlv_data.append(0)
        for f in batch:
            dlv_data[int(f[1])+2]=int(f[2])
        df.loc[len(df)] = dlv_data
#       print('%s' % sep.join(map(str, dlv_data)))
        df.to_pickle("tracking_data.pkl")
        # df = pd.read_pickle("tracking_data.pkl")
        # df.to_hdf("tracking_data.hdf")
        # df = pd.read_hdf("tracking_data.hdf")

def getDeliveryInfo(minTrackingHits=1000, nDayAfter=7, minHitPercentRequired=90):
    from datetime import datetime
    import pandas as pd
    import numpy as np
    df = pd.read_pickle("tracking_data.pkl")
    df2 = df[df.totalHits > minTrackingHits]
    df3 = df2.iloc[:,1:nDayAfter+2].copy()
    col_list = list(df3)[1:]
    df3['cumsum'] = df3[col_list].sum(axis=1)
    tot_p = df3['cumsum'].sum() * 100 /  df3['totalHits'].sum()
    p = len(df3[df3['cumsum']*100/df3['totalHits'] > minHitPercentRequired])*100/len(df3)
    print('%d %%   deliveries have hit rate of at least  %d %% after %d days' % (p , minHitPercentRequired, nDayAfter) )
    print('%d is the hit rate across all considered deliveries' % tot_p)

def updateHTMLFile(file_path: str, bkpDir: str = '') :
    """ Modifies HTML file."""
    from bs4 import BeautifulSoup
    fp = open(file_path, "r")
    soup = BeautifulSoup(fp, 'html.parser')
    fp.close()
    title_tag=soup.new_tag("title")
    if not soup.head.title:
        soup.head.append(title_tag)
    if not soup.head.title.text:
        soup.head.title.string="ACC Test Widgets - " + os.path.splitext(os.path.basename(file_path))[0]
    else:
        return None
    if bkpDir:
        if not os.path.isdir(bkpDir):
            os.makedirs(bkpDir,exist_ok = True)
        bkpPath=os.path.join(bkpDir, os.path.basename(file_path))
    else:
        bkpPath=file_path
    bkpPath += '.bak'
    os.rename(file_path, bkpPath)
    fp = open(file_path, "w")
    fp.write(str(soup))
    fp.close()

def updateHTML(path: str, bkpDir: str = '') :
    """ Modifies HTML file/folder."""
    if not os.path.exists(path) :
        print("path does not exist", file=sys.stderr)
        return None
    ext = ('.html', '.htm')
    if os.path.isfile(path) and not path.endswith(ext):
        print("Only (.htm, .html) file extensions are considered.", file=sys.stderr)
        return None
    if os.path.isdir(path) :
        for file_name in os.listdir(path):
            if file_name.endswith(ext):
                updateHTMLFile(os.path.join(path,file_name), bkpDir)
    else:
        updateHTMLFile(path, bkpDir)

def getDeliveryInfoPlot(minTrackingHits=1000, minHitPercentRequired=90):
    from datetime import datetime
    import pandas as pd
    import numpy as np
    import plotly.express as px
    df4Plot=pd.DataFrame(columns=['dayCount', 'percent' , 'With minimum Hit Percent'])
    df = pd.read_pickle("tracking_data.pkl")
    df2 = df[df.totalHits > minTrackingHits]
    col_names = list(df4Plot)
    legend_Total_hit_percent="Total Hit %(Across All deliveries)"
    for hp in range(minHitPercentRequired-10, 100, 3):
        for d in range(1,30):
            df3 = df2.iloc[:,1:d+2].copy()
            df3['cumsum'] = df3[list(df3)[1:]].sum(axis=1)
            p = len(df3[df3['cumsum']*100/df3['totalHits'] > hp])*100/len(df3)
            if(len(df4Plot.loc[(df4Plot[col_names[0]] == d) & (df4Plot[col_names[2]] == legend_Total_hit_percent)]) < 1):
                tot_p = df3['cumsum'].sum() * 100 /  df3['totalHits'].sum()
                df4Plot.loc[len(df4Plot)] = [d,tot_p,legend_Total_hit_percent]
            df4Plot.loc[len(df4Plot)] = [d,p,hp]
    fig = px.line(df4Plot, x=col_names[0], y=col_names[1], color=col_names[2])
    fig['data'][0]['line']['color'] = 'rgb(0, 0, 0)'
    fig['data'][0]['line']['width'] = 2
    fig['data'][0]['line']['dash'] = 'dot'
    fig.update_layout(
        xaxis = dict(
        tickmode = 'linear',
        tick0 = 1,
        dtick = 1
        ),
        yaxis = dict(
        tickmode = 'linear',
        tick0 = 0,
        dtick = 10
        ),
        yaxis_title='<b>% of Deliveries</b><br>(Total hit % in case of dotted black line)'
    )
    # fig.update_traces(line_color='#0000ff', line_width=5)
    fig.show()

if __name__ == '__main__':
  fire.Fire({
      'IPV4'                    : get_all_IPV4_Addrs,
      'get_windows_PID_Ports'   : get_windows_PID_Ports,
      'scanports'               : portscan,
      'servePorts'              : servePorts,
      'num'                     : num,
      'img2txt'                 : imageToText,
      'ensureModule'            : ensureModule,
      'browser'                 : getBrowserName,
      'patch'                   : binPatch,
      'cygmirror'               : get_fast_cygwin_mirrors,
      'installCygwin'           : installCygwin,
      'is_port_in_use'          : is_port_in_use,
      'generateHits'            : http_get_with_requests_parallel,
      'histogram'               : generateHistgramOnTerminal,
      'normalize'               : normalize_tracking_data,
      'getDeliveryInfo'         : getDeliveryInfo,
      'getDeliveryInfoPlot'     : getDeliveryInfoPlot,
      'tar.gz2zip'              : targz_2_zip,
      'bestFitSum'              : bestFitSum,
      'updateHTML'              : updateHTML,
      'test': test
  })
