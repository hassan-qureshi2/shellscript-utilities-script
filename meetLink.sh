#!/bin/bash

link=" https://meet.google.com/hdc-nhoj-abi"

if [[ "$(uname)" == "Darwin" ]]; then
  echo "$link" | pbcopy
  echo "Link copied to clipboard."
elif [[ "$(uname)" == "Linux" ]]; then
  if command -v xsel >/dev/null 2>&1; then
    echo "$link" | xsel --clipboard
    echo "Link copied to clipboard."
  else
    echo "Please install 'xsel' to copy the link to the clipboard."
  fi
else
  echo "Unsupported operating system. Please copy the link manually."
fi
