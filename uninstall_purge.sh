#!/bin/bash
#script for uninstalling apache2 web server with the configuration files
# exit : success code 0

sudo apt purge apache2
sudo autoremove

echo "apache2 and its configuration files removed successfully"

exit 0