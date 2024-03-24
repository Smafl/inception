#!/bin/bash

# Wait for MySQL to be ready
until mysqladmin ping -h"$WORDPRESS_DB_HOST" --silent; do
  echo 'Waiting for MySQL to be ready...'
  sleep 1
done

wp config create \
	--dbname=${DB_NAME} \
	--dbuser=${DB_USER} \
	--dbpass=${DB_PASS} \
	--dbhost=mariadb && echo "wp-config.php created"

# Install WordPress
wp core install \
    --url="www.ekulichk.42.fr" \
    --title="inception" \
    --admin_user=${WP_ADMIN_USER} \
    --admin_password=${WP_ADMIN_PASS} \
    --admin_email=${WP_ADMIN_EMAIL} && echo "Wordpress installed"

# Run WP-CLI to create users
wp user create ${WP_USER1} ${USER1_EMAIL} --user_pass=${USER1_PASS}

# Run PHP-FPM in the foreground
exec "$@"
