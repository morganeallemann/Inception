#!/bin/bash
sleep 5


cd /var/www/wordpress/
wp core download --allow-root
echo "DOWNLOAD"
# echo "defined('DB_NAME', '$MYSQL_DATABASE);" >> wp-config.php
# echo "defined('DB_USER', '$MYSQL_USER);" >> wp-config.php
# echo "defined('DB_PASSWORD', '$MYSQL_PASSWORD);" >> wp-config.php
# echo "defined('DB_HOST', 'mariadb:3306);" >> wp-config.php

cp /tmp/wp-config.php .
# wp config create --dbname=$WP_DATABASE_NAME --dbuser=$WP_DATABASE_USR --dbpass=$WP_DATABASE_PWD --dbhost=$MYSQL_HOST --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
# wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb:3306 --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
echo "Created config $?"
wp core install --url=$WP_DOMAINNAME --title=$WP_TITLE --admin_user=$WP_ADMINNAME --admin_password=$WP_ADMINPWD --admin_email=$WP_ADMINMAIL --skip-email --allow-root
echo "Installed core"
wp user create $WP_USERNAME $WP_USERMAIL --user_pass=$WP_USERPWD --allow-root
echo "Created user"
echo "Running..."
/usr/sbin/php-fpm7.3 -F