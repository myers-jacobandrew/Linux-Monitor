# Process and Hardware Monitor

This is a simple script that monitors running processes and CPU temperature on a Linux system and sends alerts to a WebSocket server when certain thresholds are exceeded.

## Requirements

This script requires the following tools to be installed:

-   `bash`
-   `bc`
-   `sensors`
-   `websocketd`

You can install `bc` and `sensors` on Ubuntu or Debian systems with the following command:

csharp

`sudo apt-get install bc lm-sensors`

To install `websocketd`, download the appropriate binary for your system from the [official website](https://websocketd.com/#download) and add it to your system path.

## Usage

To use this script, simply run the following command:

bash

`./monitor.sh`

This will start the monitor and send alerts to the WebSocket server as needed.

You can modify the alert thresholds and check interval by editing the variables at the top of the script.

## WebSocket Server

To receive alerts from the monitor, you'll need to run a WebSocket server that listens for incoming connections. You can use any WebSocket server that supports the `JSON` format.

For example, you can use the following Python script to start a WebSocket server that listens on port `8080`:


```python
import asyncio
import websockets

async def handler(websocket, path):
    async for message in websocket:
        print(message)

async def main():
    async with websockets.serve(handler, "localhost", 8080):
        await asyncio.Future()  # run forever

asyncio.run(main())
```

Once the server is running, you should see incoming alerts from the monitor in the server console.

## License

This project is licensed under the MIT License.
