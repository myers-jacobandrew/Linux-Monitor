const WebSocket = require('ws');

const server = new WebSocket.Server({ port: 8080 });

// Set filters for alert messages
const filters = ['CPU usage', 'memory usage'];

server.on('connection', (socket) => {
  console.log('Client connected');

  socket.on('message', (message) => {
    console.log(`Received message: ${message}`);

    if (filters.some(filter => message.includes(filter))) {
      server.clients.forEach(client => {
        if (client.readyState === WebSocket.OPEN) {
          client.send(message);
        }
      });
    }
  });

  socket.on('close', () => {
    console.log('Client disconnected');
  });
});
