FROM debian:buster

# Update and install necessary packages
RUN apt update && apt upgrade -y && apt install -y \
    nginx \
    openssl

# Create directory for SSL certificates
RUN mkdir -p /etc/nginx/ssl

# Generate self-signed SSL certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/inception.key \
    -out /etc/nginx/ssl/inception.crt \
    -subj "/C=CH/ST=Vaud/L=Lausanne/O=42/OU=42/CN=malleman.42.fr/UID=malleman"

# Create necessary directories and set permissions
RUN mkdir -p /var/run/nginx
RUN chmod 755 /var/www/html && chown -R www-data:www-data /var/www/html

# Copy custom Nginx configuration file and HTML content
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Expose port 443 for HTTPS
EXPOSE 443

# Start Nginx in the foreground
ENTRYPOINT ["nginx", "-g", "daemon off;"]
