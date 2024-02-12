#!/bin/bash

# Start MySQL service in the background
service mariadb start

# Create MySQL user and grant privileges
mysql -u root -p$ROOT_PASS -e "CREATE DATABASE IF NOT EXISTS ${WP_DB_NAME};"
mysql -u root -p$ROOT_PASS -e "CREATE USER '${WP_DB_USER}'@'%' IDENTIFIED BY '${WP_DB_PASS}';"
mysql -u root -p$ROOT_PASS -e "GRANT ALL PRIVILEGES ON ${WP_DB_NAME}.* TO '${WP_DB_USER}'@'%';"
mysql -u root -p$ROOT_PASS -e "FLUSH PRIVILEGES;"

# Stop MySQL service in the background
mysqladmin -u root -p$ROOT_PASS shutdown

# Run MySQL service in the foreground
mysqld_safe