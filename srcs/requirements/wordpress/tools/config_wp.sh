#!/bin/bash
sleep 5

mkdir -p /var/www/html
mkdir -p /var/www/html/wordpress
cp /tmp/index.html /var/www/html/index.html
cd /var/www/html/wordpress/
wp core download --allow-root
echo "DOWNLOAD"

# cp /tmp/wp-config.php .
# wp config create --dbname=$WP_DATABASE_NAME --dbuser=$WP_DATABASE_USR --dbpass=$WP_DATABASE_PWD --dbhost=$MYSQL_HOST --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb:3306 --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
echo "Created config $?"
wp core install --url=$WP_DOMAINNAME/wordpress --title=$WP_TITLE --admin_user=$WP_ADMINNAME --admin_password=$WP_ADMINPWD --admin_email=$WP_ADMINMAIL --skip-email --allow-root
echo "Installed core"
wp user create $WP_USERNAME $WP_USERMAIL --user_pass=$WP_USERPWD --allow-root
echo "Created user"
echo "Running..."

/usr/sbin/php-fpm7.3 -F