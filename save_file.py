#!C:/Program Files/Python312/python.exe
import cgi, os
import cgitb
cgitb.enable()
#!D:/cygwin64/bin/python3.9.exe
DEFAULT_UPLOAD_DIR = './upload/'
form = cgi.FieldStorage()


# Get filename here.
# Test if the file was uploaded
fileitem  = form['filename']
uploadDir = form.getvalue('uploadDir')

if fileitem.filename:
   try:
      uploadDir = str(uploadDir)
   except:
      uploadDir = DEFAULT_UPLOAD_DIR
   # No relative paths in upload folder to avoid
   # directory traversal attacks
   if '..' in uploadDir:
      uploadDir = DEFAULT_UPLOAD_DIR
   # Can not traverse outside(up) of current folder folder to avoid
   # directory traversal attacks
   if not uploadDir.startswith('./'):
      uploadDir = './' + uploadDir
   # Ensure that upload location is indeed a folder.
   if not uploadDir.endswith('/'):
      uploadDir = uploadDir + '/'
   if not os.path.isdir(uploadDir):
      uploadDir = DEFAULT_UPLOAD_DIR
   # strip leading path from file name to avoid.
   # directory traversal attacks
   fn = os.path.basename(fileitem.filename)
   open(uploadDir + fn, 'wb').write(fileitem.file.read())

   message = 'The file "' + fn + '" was uploaded successfully'

else:
   message = 'No file was uploaded'
   uploadDir = DEFAULT_UPLOAD_DIR

print("Content-Type:text/html\r\n\r\n");
print("<html> <body> <p> %s to </p> <a href='%s'>Upload folder</a></body></html>" % (message, uploadDir));