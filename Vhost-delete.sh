#!/bin/bash
# remove Vhost

# get name from user
read -p "Enter the site name : " sitename

# go to site-available folder
cd /etc/apache2/sites-available/

# delete conf file
rm $sitename.conf

# delete auth conf if exists
# that occur if user enable auth for this site
if [ -f ${sitename}withAuth.conf ]; then
	rm ${sitename}withAuth.conf
fi

# go to www folder
cd /var/www

# delete site
rm -R $sitename

echo "Deleted Successfully"
