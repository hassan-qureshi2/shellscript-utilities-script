#!/bin/bash

# check if the script was called with an argument
if [ $# -eq 0 ]; then
  echo "Error: Please specify a file extension."
  exit 1
fi

# save the file extension in a variable
file_ext="$1"

# delete all files with the specified extension

find . -type f -name "*.$file_ext" -delete

echo "Deleted all .$file_ext files in the current directory and its subdirectories."



