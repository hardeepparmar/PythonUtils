import socket
from threading import Thread
from socketserver import ThreadingMixIn
from http.server import HTTPServer, BaseHTTPRequestHandler
class Handler(BaseHTTPRequestHandler):
    def __init__(self, port=80):
        self.port = port
        self.hostname
        if socket.gethostname().find('.')>=0:
            self.hostname=socket.gethostname()
        else:
            self.hostname=socket.gethostbyaddr(socket.gethostname())[0]
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

def serve_on_port(port):
    server = ThreadingHTTPServer((socket.gethostname(),port), Handler(port=port))
    server.serve_forever()

# Thread(target=serve_on_port, args=[1111]).start()
serve_on_port(2222)