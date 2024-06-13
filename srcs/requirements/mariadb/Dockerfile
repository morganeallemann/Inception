FROM alpine:latest

RUN     apk update && apk upgrade && apk add --no-cache \
        mariadb \
        mariadb-client
        
COPY tools/script.sh /tmp/script.sh

#ENTRYPOINT ["sh", "/tmp/script.sh"]
