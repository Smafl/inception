#!/bin/bash

# Start MySQL service in the background
service mariadb start

sleep 10

# Create MySQL user and grant privileges
mysql -u root -p"${ROOT_PASS}" -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"
mysql -u root -p"${ROOT_PASS}" -e "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}';"
mysql -u root -p"${ROOT_PASS}" -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';"
mysql -u root -p"${ROOT_PASS}" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOT_PASS}';"
mysql -u root -p"${ROOT_PASS}" -e "FLUSH PRIVILEGES;"

# Stop MySQL service in the background
mysqladmin -u root -p$ROOT_PASS shutdown

# Run MySQL service in the foreground
mysqld_safe
