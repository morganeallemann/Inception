#!/bin/bash
sleep 5

cd /var/www/wordpress/
wp core download --allow-root
wp config create --allow-root \
											--dbname=my_database \
											--dbuser=user \
											--dbpass=user_password\
											--dbhost=mariadb:3306 --path='/var/www/wordpress'
wp core install --url=$WP_DOMAINNAME --title=$WP_TITLE --admin_user=$WP_ADMINNAME --admin_password=$WP_ADMINPWD --admin_email=$WP_ADMINMAIL --skip-email --allow-root
echo "creating user"
wp user create $WP_USERNAME $WP_USERMAIL --user_pass=$WP_USERPWD --allow-root
echo "running php-fpm"
/usr/sbin/php-fpm7.3 -F