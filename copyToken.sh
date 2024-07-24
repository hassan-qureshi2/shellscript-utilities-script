#!/bin/bash

# Check if xclip is installed
if ! command -v xclip &> /dev/null; then
    echo "Error: xclip is not installed. Please install it first."
    exit 1
fi

# ANSI escape codes for color
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Initialize variables with default values
company_token="CompanyToken123"
personal_token=""

if [ "$#" -eq 0 ]; then
    echo -e "${GREEN}Usage:${NC} $0 -c (for company account token) OR $0 -p (for personal token)"
    exit 1
fi

while getopts ":cp" opt; do
    case ${opt,,} in
        c)
            text_to_copy=$company_token
            ;;
        p)
            text_to_copy=$personal_token
            ;;
        \?)
            echo -e "${GREEN}Invalid option: -$OPTARG. Use -c for company account token or -p for personal token.${NC}"
            exit 1
            ;;
    esac
done

# Copy the text to the clipboard
echo -n "$text_to_copy" | xclip -selection clipboard

echo -e "${GREEN}Copied to clipboard${NC}"
