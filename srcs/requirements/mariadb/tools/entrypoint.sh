#! /usr/bin/env /bin/bash

echo "CREATE DATABASE IF NOT EXISTS ${DB_NAME} ;" > init.sql
echo "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}' ;" >> init.sql
echo "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' ;" >> init.sql
echo "ALTER USER 'root@'localhost' IDENTIFIED BY ${ROOT_PASS} ;" >> init.sql
echo "FLUSH PRIVILEGES;" >> init.sql

mysqld --user=root --init-file=/init.sql