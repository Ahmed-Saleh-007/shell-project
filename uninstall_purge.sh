#!/bin/bash
#script for uninstalling apache2 web server with conf files
# exit : success code 0

# apache2 totally uninstall
sudo apt purge apache2
sudo autoremove

echo "apache2 and its conf files removed successfully"

exit 0
