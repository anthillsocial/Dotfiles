# Load the simple server module
#from wsgiref.simple_server import make_server
#print 'Start this script with python 2: $ python2 scr/python2server.py'
import http.server

def generateWebPage(env, start_response):
   # Specify the text to display in the browser
   body = 'Hello World<br />'
   body += '<a href="/?on">ON</a> / <a href="/?off">OFF</a><br />'
   # Grab server variables
   getvar = env['QUERY_STRING']
   ledstate = "LED is: "+getvar
   # Build the response for the browser
   html = "<html><body>"+body+ledstate+"</body></html>"
   status = '200 OK'
   response_headers = [('Content-Type', 'text/html'), ('Content-Length', str(len(html)))]
   start_response(status, response_headers)
   return [html]

httpd = make_server('localhost', 3331, generateWebPage)
httpd.serve_forever()
