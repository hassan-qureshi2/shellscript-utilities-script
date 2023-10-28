#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: $0 <port>"
  exit 1
fi

port=$1

# Find the process using the specified port
pid=$(sudo lsof -ti :$port)

if [ -z "$pid" ]; then
  echo "No process found using port $port"
else
  # Kill the process
  sudo kill $pid
  echo "Process with PID $pid killed"
fi
