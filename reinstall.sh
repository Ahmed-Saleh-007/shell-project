#!/bin/bash
#script for reinstalling apache2 web server
# exit : success code 0

sudo apt update
sudo apt reinstall apache2
sudo service apache2 start
echo "apache2 reinstalled successfully"

exit 0
