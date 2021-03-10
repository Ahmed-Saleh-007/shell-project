#!/bin/bash

#script for installing apache2 web server
# exit : success code 0

# get latest update
sudo apt update

# install apache2
sudo apt install apache2

# start apache2 server
sudo service apache2 start

echo "apache2 installed successfully"

exit 0
