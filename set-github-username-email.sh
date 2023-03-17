#!/bin/bash

# Prompt the user for their GitHub username and email
read -p "Enter your GitHub username: " username
read -p "Enter your GitHub email: " email

# Set the GitHub username and email using the git config command
git config --global user.name "$username"
git config --global user.email "$email"

echo "Your GitHub username and email have been set to:"
echo "Username: $username"
echo "Email: $email"