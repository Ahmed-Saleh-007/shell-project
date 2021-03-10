#!/bin/bash

read -p "Enter the site name : " sitename
read -p "Enter the host name : " host

name=/var/www/$sitename
#--------------------------------------------------
echo "Needing utils to allow authentication"
echo "Will try to install utils"

sudo apt-get update
sudo apt-get install apache2-utils

#---------------------------------------------------
touch $name/.htpasswd
read -p "Please set the user name : " username
htpasswd $name/.htpasswd $username

cp default-vhostwithAuth.conf /etc/apache2/sites-available/
cd /etc/apache2/sites-available/
cp default-vhostwithAuth.conf $sitename.conf
sed -i "s/example.local/$sitename/g" $sitename.conf
sed -i "s/127.0.0.x/$host/g" $sitename.conf
sed -i "s|example.dir|$name|g" $sitename.conf

cp default-htaccess $name/.htaccess
cd $name
sed -i "s|example.dir|$name|g" .htaccess
echo "changed successfully auth successfully"

echo "will Restart apache2"

service apache2 reload
