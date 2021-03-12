#!/bin/bash
#create vhost with auth

#get name and host from user
read -p "Enter the site name : " sitename
read -p "Enter the host name : " host

name=/var/www/$sitename

#install utils
echo "Needing utils to allow authentication"

sudo apt-get update
sudo apt-get install apache2-utils

#creating htpasswd in site folder
touch $name/.htpasswd
read -p "Please set the user name : " username
htpasswd $name/.htpasswd $username

#set conf file
cp default-vhostwithAuth.conf /etc/apache2/sites-available/${sitename}withAuth.conf
sed -i "s/example.local/$sitename/g" /etc/apache2/sites-available/${sitename}withAuth.conf
sed -i "s/127.0.0.x/$host/g" /etc/apache2/sites-available/${sitename}withAuth.conf
sed -i "s|example.dir|$name|g" /etc/apache2/sites-available/${sitename}withAuth.conf

#set htaccess
cp default-htaccess $name/.htaccess
cd $name
sed -i "s|example.dir|$name|g" .htaccess
echo "set auth successfully"

#restart apache2
echo "Restart apache2"
service apache2 reload
