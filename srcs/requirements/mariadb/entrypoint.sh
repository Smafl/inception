#!/bin/sh
echo "HELLO"
# mysql -u root -p"$ROOT_PASS" <<EOSQL
# CREATE DATABASE ${WP_DB_NAME};
# CREATE USER '${WP_DB_USER}'@'%' IDENTIFIED BY '${WP_DB_PASS}';
# GRANT ALL PRIVILEGES ON '${WP_DB_NAME}.* TO '${WP_DB_USER}'@'%';
# FLUSH PRIVILEGES;
#EOSQL
