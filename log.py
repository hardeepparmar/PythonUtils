#!C:/Program Files/Python312/python.exe
import os, sys, datetime
import cgi, cgitb
import json
cgitb.enable()
print("Content-Type: text/html")  # Set the content type header
print()  # Print a blank line to indicate the end of the headers
# cgi.print_environ_usage()
# for headername, headervalue in os.environ.items():
  # if headername.startswith("HTTP_"):
    # print(f"<p>{headername} = {headervalue}</p>")
def getType(logtype='info'):
  if type(logtype) is not str:
     return 'info'
  if logtype.lower() == 'error':
    pass
  if logtype.lower() == 'warn':
    pass
  elif logtype.lower() == 'info':
    pass
  elif logtype.lower() == 'debug':
    pass
  elif logtype.lower() == 'trace':
    pass
  else:
    return 'info'
  return logtype.lower()

DEFAULT_UPLOAD_DIR = './upload/'
uploadDir          = DEFAULT_UPLOAD_DIR
logFileName        = 'jQueryMigrate.log'
MAX_INP_SIZE       = 64*1024
inp                = ''
inpSize            = 0
iRc                = 0
jsonData           = '{}'

for line in sys.stdin:
  inp+=line
  inpSize+=len(line)
  if inpSize > MAX_INP_SIZE:
    print("Log data length is too large, should be < 64 KB")
    iRc=1
    break
if len(inp) < 1:
  inp=jsonData

msg  = inp
msg_type = 'info'
url  = 'https://<missing-URL>/'

if iRc == 0:
  try:
    jsonData  = json.loads(msg)
    if 'type' in jsonData:
      msg_type = getType(jsonData['msg_type'])
    if 'msg' in jsonData:
      msg  = jsonData['msg']
    if 'url' in jsonData:
      url  = jsonData['url']
  except:
    print("Warning: Log data should preferably be in a valid json format.")
if iRc == 0:
  logline=str(datetime.datetime.now()) + ' ' + msg_type + ' ' + url + ' ' + msg + '\n'
  with open(uploadDir + logFileName,'a') as f: f.write(logline)
# Send an empty response
print("")