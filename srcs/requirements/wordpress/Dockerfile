FROM debian:buster

# Mise à jour et installation de WP & PHP + octroie des droits root 
RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get -y install wget \
    && apt-get install -y php7.3\
						php-fpm\
						php-mysql\
						mariadb-client\
    && wget https://fr.wordpress.org/wordpress-6.5.3-fr_FR.tar.gz -P /var/www \
    && cd /var/www && tar -xzf wordpress-6.5.3-fr_FR.tar.gz && rm wordpress-6.5.3-fr_FR.tar.gz \
    && chown -R root:root /var/www/wordpress

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf