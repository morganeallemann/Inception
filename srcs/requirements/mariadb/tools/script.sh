#Script permettant l'ouverture de MYSQL et la creation de la db + user
#Demarre MYSQL
#Creation de la table, creation de l'utilisateur si il n'existe pas avec un mdp indiquer dans .env. 
#Attribution des droits a MYSQL_USER avec le mdp MYSQL_PASSWORD
#Changement des droit de root avec le mdp MYSQL_ROOT_PASSWORD 

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

chown -R mysql:mysql /var/lib/

echo "Install" 
mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null
echo "Database create"

mysqld --user=mysql --bootstrap < /tmp/cmd.txt

echo "END"

exec mysqld --user=mysql --console