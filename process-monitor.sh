#!/bin/bash

# Set alert thresholds
CPU_THRESHOLD=90   # CPU usage threshold in percent
TEMP_THRESHOLD=70  # Temperature threshold in degrees Celsius

# Check interval in seconds
CHECK_INTERVAL=5

while true; do
  # Check running processes
  processes=$(ps aux --sort=-%cpu | head -n 11 | tail -n +2)
  for process in $processes; do
    cpu=$(echo $process | awk '{ print $3 }')
    name=$(echo $process | awk '{ print $11 }')
    pid=$(echo $process | awk '{ print $2 }')

    if (( $(echo "$cpu > $CPU_THRESHOLD" | bc -l) )); then
      # Send process alert to WebSocket server
      echo "{\"sensor\": \"Process\", \"name\": \"$name\", \"pid\": \"$pid\", \"value\": \"$cpu\"}" | websocketd --port=8080 -
    fi
  done

  # Check CPU temperature
  temp=$(sensors | grep -oP 'Core 0:\s+\+\K[0-9.]+')
  if (( $(echo "$temp > $TEMP_THRESHOLD" | bc -l) )); then
    # Send temperature alert to WebSocket server
    echo "{\"sensor\": \"CPU temperature\", \"value\": $temp}" | websocketd --port=8080 -
  fi

  sleep $CHECK_INTERVAL
done
