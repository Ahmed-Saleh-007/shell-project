#!/bash/bash

read -p "Enter the site name : " sitename

cd /etc/apache2/sites-available
a2dissite $sitename.conf
echo "Site disabled Successfully"


service apache2 reload
