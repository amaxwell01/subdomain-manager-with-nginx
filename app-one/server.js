// Load the http module to create an http server.
const http = require('http');

// Configure our HTTP server to respond with Hello World to all requests.
const server = http.createServer(function (request, response) {
  response.writeHead(200, {'Content-Type': 'text/plain'});
  response.end('Hello World app-one');
});

// Listen on port 1111, IP defaults to 127.0.0.1
server.listen(1111);

// Put a friendly message on the terminal
console.log('Server running at http://127.0.0.1:1111/');
