#Script permettant l'ouverture de MYSQL et la creation de la db + user
#Demarre MYSQL
#Creation de la table, creation de l'utilisateur si il n'existe pas avec un mdp indiquer dans .env. 
#Attribution des droits a MYSQL_USER avec le mdp MYSQL_PASSWORD
#Changement des droit de root avec le mdp MYSQL_ROOT_PASSWORD 

service mysql start;
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"
