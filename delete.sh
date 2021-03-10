#!/bin/bash

read -p "Enter the site name : " sitename

cd /etc/apache2/sites-available/

rm $sitename.conf

cd /var/www

rm -R $sitename

echo "Deleted Successfully"
