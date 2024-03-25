#!/bin/bash

echo 1
# Wait for MySQL to be ready
until mysqladmin ping -h"$WORDPRESS_DB_HOST" --silent; do
  echo 'Waiting for MySQL to be ready...'
  sleep 1
done

echo 2

cd "/var/www/html"

# Download WordPress
wp core download --allow-root
# Set permissions
chmod -R 0755 wp-content/

echo 3

# Create wp-config.php
wp config create \
	--dbname=${DB_NAME} \
	--dbuser=${DB_USER} \
	--dbpass=${DB_PASS} \
	--dbhost=mariadb \
	--allow-root && echo "wp-config.php created"

echo 4

# Install WordPress
wp core install \
    --url="www.ekulichk.42.fr" \
    --title="inception" \
    --admin_user=${WP_ADMIN_USER} \
    --admin_password=${WP_ADMIN_PASS} \
    --admin_email=${WP_ADMIN_EMAIL} \
	--allow-root && echo "Wordpress installed"

echo 5

# Run WP-CLI to create users
wp user create ${WP_USER1} ${USER1_EMAIL} --user_pass=${USER1_PASS}

echo 6

# Run PHP-FPM in the foreground
/usr/sbin/php-fpm7.4 -F
