#!bin/bash

read -p "Enter the site name : " sitename
read -p "Enter the host name : " host

name=/var/www/$sitename

cd /etc/apache2/sites-available/
cp default-vhost.conf $sitename.conf
sed -i "s/example.local/$sitename/g" $sitename.conf
sed -i "s/127.0.0.x/$host/g" $sitename.conf
sed -i "s|example.dir|$name|g" $sitename.conf

rm $name/.htaccess $name/.htpasswd

service apache2 reload
