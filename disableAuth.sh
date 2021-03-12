#!bin/bash
#disable auth

#get name and host from user
read -p "Enter the site name : " sitename
read -p "Enter the host name : " host

name=/var/www/$sitename

rm /etc/apache2/sites-available/${sitename}withAuth.conf
rm $name/.htaccess $name/.htpasswd

#restart server
service apache2 reload

echo "auth disabled successfully"


