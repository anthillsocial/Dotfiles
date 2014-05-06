import SocketServer

class MyTCPHandler(SocketServer.BaseRequestHandler):
	def handle(self):
		self.reqdata = self.request.recv(1024).strip()
		print "{} wrote:"+format(self.client_address[0])
		print self.reqdata
		self.send('webserver ONLINE')

	def send(self, content):
		self.request.sendall('HTTP/1.0 200 OK\n\n{}'.format(content))

if __name__ == "__main__":
	HOST, PORT = "0.0.0.0", 9997
	server = SocketServer.TCPServer((HOST, PORT), MyTCPHandler)
	server.serve_forever()
