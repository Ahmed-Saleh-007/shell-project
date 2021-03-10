#!bin/bash

read -p "Enter the site name : " sitename
read -p "Enter the host name : " host

name=/var/www/$sitename

rm /etc/apache2/sites-available/${sitename}withAuth.conf
rm $name/.htaccess $name/.htpasswd

service apache2 reload
echo "authentication disabled successfully"


