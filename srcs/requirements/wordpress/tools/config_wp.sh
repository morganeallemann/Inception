sleep 10 

cd /var/www/wordpress/
wp core download --allow-root
wp config create --allow-root \
											--dbname=$MYSQL_DATABASE \
											--dbuser=$MYSQL_USER \
											--dbpass=$MYSQL_PASSWORD \
											--dbhost=mariadb:3306 --path='/var/www/wordpress'
wp core install --url=$WP_DOMAINNAME --title=$WP_TITLE --admin_user=$WP_ADMINNAME --admin_password=$WP_ADMINPWD --admin_email=$WP_ADMINMAIL --skip-email --allow-root
wp user create $WP_USERNAME $WP_USERMAIL --user_pass=$WP_USERPWD --allow-root

/usr/sbin/php-fpm7.3 -F