#!/bin/bash


read -p "Enter the site name : " sitename
read -p "Enter the host name : " host

# Create and configure folder in `/var/www` if option if option selected

  name=/var/www/$sitename
  #echo $name
  #exit 0

  mkdir /var/www/$sitename
  echo "Folder /var/www/$sitename created"
  # Creating dummy landing page
  cp default-index.html /var/www/$sitename/index.html
  echo "Intitialized with index page"
  # Changing owner and permission of the folder
  #chown $SUDO_USER:$SUDO_USER /var/www/$sitename
  #chmod 755 /var/www/$sitename
  #echo "Modified permissions and owner"

# Creating configuration files
cp default-vhost.conf /etc/apache2/sites-available/
cd /etc/apache2/sites-available/
cp default-vhost.conf $sitename.conf
sed -i "s/example.local/$sitename/g" $sitename.conf
sed -i "s/127.0.0.x/$host/g" $sitename.conf
sed -i "s|example.dir|$name|g" $sitename.conf
echo "Configuration files created"

# Configuring hosts file
sed -i "0,/# The following lines are desirable for IPv6 capable hosts/s/^# The following lines are desirable.*/$host       $sitename\n&/" /etc/hosts
echo "Added entry in hosts file"

# Enabling virtual host and restarting the server
cd /etc/apache2/sites-available
a2ensite $sitename.conf
service apache2 reload
echo "Restarted apache"
echo "All done! Visit your newly created virtual host at https://$sitename"

