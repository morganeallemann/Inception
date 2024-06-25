FROM alpine:latest

RUN     apk update && apk upgrade && apk add mariadb --no-cache \
        mariadb \
        mariadb-client

COPY tools/script.sh /tmp/script.sh
COPY tools/commands.txt /tmp/cmd.txt
COPY conf/50-server.cnf /etc/my.cnf.d/mariadb-server.cnf

ENTRYPOINT ["sh", "/tmp/script.sh"]
