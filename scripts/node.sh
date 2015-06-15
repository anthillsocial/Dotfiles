# Derived From: http://gravitronic.com/self-hosted-meteor-deploy-script/

# METEOR DEPLOYMENT SCRIPT: Requires nodesj:0.10.36 | MongoDB: 3
# As normal user run:
# packer -S nodejs-pm2
# packer -S nvm-git
# echo 'source /usr/share/nvm/init-nvm.sh' >> ~/.bashrc
# Then exit out of the shell and install the correct version of nodejs:
 
	nvm install 0.10.36

# And ensure it loads as the deafult

	nvm alias default 0.10.36

# Test nodejs works
// hello_node.js
var http = require('http');
http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('Hello Node.js\n');
}).listen(8124, "dev.theanthillsocial.co.uk");
console.log('Server running at http://dev.theanthillsocial.co.uk:8124/');

# Install mongodb

	sudo pacman -S mongodb
	sudo systemctl enable mongodb.service

# And check which port mongo is listening on:

	sudo lsof -iTCP -sTCP:LISTEN | grep mongo


