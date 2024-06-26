FROM debian:buster

# Mise à jour et installation de WP & PHP + octroie des droits root 
RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get -y install wget \
    && apt-get install -y php7.3 \
						php-fpm \
						php-mysql \
						mariadb-client \
    #&& wget https://fr.wordpress.org/wordpress-6.5.3-fr_FR.tar.gz -P /var/www \
    #&& cd /var/www && tar -xzf wordpress-6.5.3-fr_FR.tar.gz && rm wordpress-6.5.3-fr_FR.tar.gz \
    #&& chown -R root:root /var/www/wordpress \
    && wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp \
    && mkdir -p /run/php/php7.3-fpm/
RUN useradd nginx
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY tools/config_wp.sh /tmp/
COPY conf/wp-config.php /tmp/
COPY tools/index.html /tmp/

ENTRYPOINT ["/bin/bash", "/tmp/config_wp.sh"]

#ENTRYPOINT [ "/bin/bash" ]