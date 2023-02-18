# Process Monitor and WebSocket Server

This repository contains two scripts:

    process-monitor.sh: A shell script that monitors the CPU usage of a given process and sends an alert to a WebSocket server if the usage exceeds a certain threshold.

    websocket-server.js: A Node.js server that receives alerts from the process-monitor.sh script and logs them to the console.

## Getting Started

To use the process-monitor.sh script, you'll need to edit the script and set the PROCESS_NAME and CPU_THRESHOLD variables to match the process you want to monitor and the threshold at which you want to receive an alert. You'll also need to install the websocketd tool, which can be downloaded from the WebSocketd GitHub repository.

To use the websocket-server.js script, you'll need to install Node.js and the ws module, which can be installed using npm. Once you've installed the dependencies, you can start the server by running the following command:

node websocket-server.js

## Usage

To use the process-monitor.sh script, simply run it from the command line and pass in the name of the process you want to monitor as an argument:

bash

./process-monitor.sh <process-name>

The script will then start monitoring the CPU usage of the specified process and send an alert to the WebSocket server if the usage exceeds the specified threshold.

To view the alerts received by the WebSocket server, simply open a WebSocket client and connect to the server at ws://localhost:8080. The server will log each alert to the console as it is received.

## Contributing

If you find a bug or would like to suggest a new feature, please open an issue or submit a pull request.

## License

This repository is licensed under the MIT License.
