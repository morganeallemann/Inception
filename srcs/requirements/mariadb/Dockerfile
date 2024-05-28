FROM debian:buster

# Mise à jour et installation de MariaDB
RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y mariadb-server default-mysql-client \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copier les fichiers de configuration et le script d'initialisation
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/script.sh /usr/local/bin/script.sh

# Définir les permissions et exécuter le script d'initialisation
RUN chmod +x /usr/local/bin/script.sh \
    && mkdir -p /var/run/mysqld/ \
    && chown -R mysql:mysql /var/lib/mysql /var/run/mysqld/ \
    && chmod -R 775 /var/lib/mysql /var/run/mysqld/

# Exécuter le script d'initialisation lors du démarrage du conteneur
CMD ["sh", "/usr/local/bin/script.sh"]
