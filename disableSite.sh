#!/bash/bash
# disable site

# get site name from user
read -p "Enter the site name : " sitename

# disable site
cd /etc/apache2/sites-available
a2dissite $sitename.conf

# reload apache2
service apache2 reload

echo "All done, site disabled apache2 reloaded"
