#!/bin/bash

# Update the package list
sudo apt-get update

# Upgrade all packages to the latest version
sudo apt-get -y upgrade

# Dist-upgrade to handle dependencies and other changes
sudo apt-get -y dist-upgrade

#update the flatpacks
flatpak -y update

# Clean up the old packages to free up disk space
sudo apt-get -y autoremove
sudo apt-get -y autoclean
