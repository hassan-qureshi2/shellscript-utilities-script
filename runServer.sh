#!/bin/bash

# Default port
PORT=9876

# Check if a port number is provided as an argument
if [ -n "$1" ]; then
  PORT=$1
fi

# Install http-server if not already installed
if ! command -v http-server &> /dev/null
then
  echo "http-server could not be found. Installing..."
  npm install -g http-server
fi

# Serve the site
echo "Serving the site on port $PORT..."
http-server dist -p $PORT
