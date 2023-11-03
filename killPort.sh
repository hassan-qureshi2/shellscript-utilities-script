#!/bin/bash
GREEN="\e[32m"
YELLOW="\e[33m"
RED="\e[31m"
RESET="\e[0m"
# Check if a port number was provided as an argument
if [ $# -ne 1 ]; then
        echo -e "${RED} Port number not passed.${RESET}"
    exit 1
fi

# Get the port number from the command line argument
port="$1"

# Check if the port is in use
if lsof -i :"$port" > /dev/null 2>&1; then
    # Kill the process using the port
    sudo fuser -k "$port/tcp"
    echo "Process using port $port has been killed."
    echo -e "${RED} Process using port $port has been killed.${RESET}"
else
    echo -e "${RED} Port $port is not in use.${RESET}"
fi
