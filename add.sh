#!/bin/bash


read -p "Enter the site name : " sitename #just a name
read -p "Enter the host ip : " host #127.0.0.X

# Create and configure folder in `/var/www` if option if option selected

  name=/var/www/$sitename
  #echo $name
  #exit 0

  mkdir /var/www/$sitename
  echo "Folder /var/www/$sitename created"
  # Creating dummy landing page
  cp default-index.html /var/www/$sitename/index.html
  echo "Intitialized with index page"

# Creating configuration files

cp default-vhost.conf /etc/apache2/sites-available/$sitename.conf
cd /etc/apache2/sites-available/
sed -i "s/example.local/$sitename/g" $sitename.conf
sed -i "s/127.0.0.x/$host/g" $sitename.conf
sed -i "s|example.dir|$name|g" $sitename.conf
echo "Configuration files created"

# Enabling virtual host and restarting the server
cd /etc/apache2/sites-available
a2ensite $sitename.conf
service apache2 reload
echo "Restarted apache"
echo "All done! Visit your newly created virtual host at https://$sitename"

