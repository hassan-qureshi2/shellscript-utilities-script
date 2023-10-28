#!/bin/bash

start=false
stop=false

while [[ $# -gt 0 ]]; do
  key="$1"
  case $key in
    --start)
      start=true
      shift
      ;;
    --stop)
      stop=true
      shift
      ;;
    *)
      echo "Invalid option: $1"
      exit 1
      ;;
  esac
done

if [[ $start == true ]]; then
    sudo systemctl stop apache2
    sudo /opt/lampp/lampp start
    echo "PHPMYADMIN have been started."
    exit 0;
fi

if [[ $stop == true ]]; then
    sudo /opt/lampp/lampp stop
    sudo systemctl start apache2
    echo "PHPMYADMIN have been stop."
    exit 0;
fi

# Check if no flag was provided
if [[ $start == false && $stop == false ]]; then
  echo "No flag provided. Use '--start' to start the LAMP stack or '--stop' to stop it."
fi

# Check if PHP is available
if php -v >/dev/null 2>&1; then
  echo "PHP is available"
else
  echo "PHP is not available"
fi
