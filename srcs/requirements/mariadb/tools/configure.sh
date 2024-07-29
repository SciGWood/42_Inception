#!/bin/sh

#!/bin/bash

echo "Starting MariaDB..."
service mariadb start

sleep 10

echo "Creating user..."
mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';"

mysql -e "FLUSH PRIVILEGES;"

echo "Generating database..."
mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"

echo "Stopping MariaDB..."
mysqladmin -u root shutdown

exec "$@"


#service mariadb start
#sleep 10
#mariadb -p"${MYSQL_ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
#mariadb -p"${MYSQL_ROOT_PASSWORD}" -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
#mariadb -p"${MYSQL_ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
#mariadb -p"${MYSQL_ROOT_PASSWORD}" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
#mariadb -p"${MYSQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"
#mariadb-admin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown
#sleep 10
#exec mysqld_safe
