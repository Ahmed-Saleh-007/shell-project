#!/bash/bash
# enable site

# get site name from user
read -p "Enter the site name : " sitename

# enable site
cd /etc/apache2/sites-available
a2ensite $sitename.conf

# reload apache2
service apache2 reload

echo "All done, site enabled, apache reloaded"
