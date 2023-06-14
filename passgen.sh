#!/bin/bash

# Parse command line arguments
while getopts ":l:" opt; do
  case $opt in
    l) length="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2 
    ;;
  esac
done

# Prompt user for email and site name
read -p "Enter email: " email
read -p "Enter site name: " site

# Generate password with letters, numbers, and special characters
password=$(openssl rand -base64 $((length * 3)) | tr -d '\n\r' | tr -dc 'a-zA-Z0-9!@#$%^&*()_+{}|:<>?,./~' | cut -c1-$length)

# Save password to hidden file with appropriate permissions
echo -e "$email,$site,$password\n" >> /mnt/5236783411A76B87/.passwords.txt
chmod 400 /mnt/5236783411A76B87/.passwords.txt

# Output password to user
echo "Your password is: $password"
