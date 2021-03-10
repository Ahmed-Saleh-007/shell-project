#!/bin/bash

#script for reinstalling apache2 web server
# exit : success code 0

# get latest updates
sudo apt update

# reinstall apache2
sudo apt reinstall apache2

# start apache2 server
sudo service apache2 start

echo "apache2 reinstalled successfully"

exit 0
