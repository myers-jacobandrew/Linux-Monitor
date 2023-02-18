#!/bin/bash

# Set the process to monitor
PROCESS_NAME="myprocess"

# Set the CPU usage threshold in percentage
CPU_THRESHOLD=50

# Set the WebSocket endpoint to send the alert
WEBSOCKET_ENDPOINT="wss://my.websocket.endpoint"

while true; do
  # Get the CPU usage of the process
  CPU_USAGE=$(top -b -n1 | grep "$PROCESS_NAME" | awk '{print $9}')

  # Check if the CPU usage is over the threshold
  if [ $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc) -eq 1 ]; then
    # Send an alert over the WebSocket
    echo "CPU usage of $PROCESS_NAME is above threshold ($CPU_USAGE%)" | \
      wscat -c $WEBSOCKET_ENDPOINT
  fi

  # Wait for 10 seconds before checking again
  sleep 10
done
