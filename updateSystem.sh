#!/bin/bash

#!/bin/bash

# Define color codes
GREEN="\e[32m"
YELLOW="\e[33m"
RESET="\e[0m"

# Update the package list
echo -e "${GREEN}Updating the package list${RESET}"
sudo apt-get update

# Upgrade all packages to the latest version
echo -e "${YELLOW}Upgrading all packages to the latest version${RESET}"
sudo apt-get -y upgrade

# Dist-upgrade to handle dependencies and other changes
echo -e "${YELLOW}Performing dist-upgrade to handle dependencies and other changes${RESET}"
sudo apt-get -y dist-upgrade

# Clean up the old packages to free up disk space
echo -e "${GREEN}Cleaning up old packages to free up disk space${RESET}"
sudo apt-get -y autoremove
sudo apt-get -y autoclean

GREEN="\e[32m"
YELLOW="\e[33m"
RED="\e[31m"
RESET="\e[0m"

# Check if Flatpak is installed
if command -v flatpak &>/dev/null; then
  echo -e "${GREEN}Flatpak is installed.${RESET}"

  # Update all Flatpak applications
  echo -e "${YELLOW}Updating Flatpak applications...${RESET}"
  flatpak update -y

  # Check for errors during the update
  if [ $? -eq 0 ]; then
    echo -e "${GREEN}Flatpak applications updated successfully.${RESET}"
  else
    echo -e "${GREEN}Failed to update Flatpak applications.${RESET}"
  fi
fi