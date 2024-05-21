FROM debian:buster

RUN apt update && apt upgrade && apt install -y \
    nginx \
    openssl
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Lausanne/O=42/OU=42/CN=malleman.42.fr/UID=malleman"
RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf