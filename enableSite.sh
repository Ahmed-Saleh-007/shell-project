#!/bash/bash

read -p "Enter the site name : " sitename

cd /etc/apache2/sites-available
a2ensite $sitename.conf
echo "Site enabled Successfully"
service apache2 reload
