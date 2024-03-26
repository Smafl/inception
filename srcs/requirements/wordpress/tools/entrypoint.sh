#!/bin/bash

# Wait for MySQL to be ready
# until mysqladmin ping -h mariadb -P 3306 --silent; do
#   echo 'Waiting for MySQL to be ready...'
#   sleep 1
# done

echo "cutie pie"

while ! mysqladmin ping -h "mariadb" -P"3306" -u"$DB_USER" -p"$DB_PASS" --silent 2>/dev/null; do
	echo "Waiting for MySQL to be ready..."
	sleep 1
done

cd "/var/www/html"

# Download WordPress
wp core download --allow-root
# Set permissions
chmod -R 0755 wp-content/

# Create wp-config.php
wp config create \
	--dbname=${DB_NAME} \
	--dbuser=${DB_USER} \
	--dbpass=${DB_PASS} \
	--dbhost=mariadb \
	--allow-root && echo "wp-config.php created"

# Check if the database exists before creating
# if ! wp db check --allow-root; then
#     wp db create --allow-root && echo "Database created"
# fi

# Install WordPress
wp core install \
    --url="www.ekulichk.42.fr" \
    --title="inception" \
    --admin_user=${WP_ADMIN_USER} \
    --admin_password=${WP_ADMIN_PASS} \
    --admin_email=${WP_ADMIN_EMAIL} \
	--allow-root && echo "Wordpress installed"

# Run WP-CLI to create users
wp user create ${WP_USER1} ${USER1_EMAIL} --user_pass=${USER1_PASS} --allow-root

# Run PHP-FPM in the foreground
/usr/sbin/php-fpm7.4 -F
