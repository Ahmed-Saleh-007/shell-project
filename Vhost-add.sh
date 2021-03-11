#!/bin/bash
# add new Vhost

#get site name and host ip from user
read -p "Enter the site name : " sitename 	#site name
read -p "Enter the host ip : " host 		#127.0.0.X


# Create and conf folder in `/var/www`
name=/var/www/$sitename

mkdir /var/www/$sitename
echo "Folder /var/www/$sitename created"

# Creating page for defualt page, you can edit it
cp default-index.html /var/www/$sitename/index.html
echo "Intitialize index page"


# Creating conf files
cp default-vhost.conf /etc/apache2/sites-available/$sitename.conf

cd /etc/apache2/sites-available/

#here we replace dummy data in conf file with real data that user entered
sed -i "s/example.local/$sitename/g" $sitename.conf
sed -i "s/127.0.0.x/$host/g" $sitename.conf
sed -i "s|example.dir|$name|g" $sitename.conf
echo "Conf files created"

# Enabling virtual host
cd /etc/apache2/sites-available
a2ensite $sitename.conf

# Restarting apache2
service apache2 reload
echo "Apache restarted"

echo "Vhost added successfuly..."


