FROM debian:bullseye

RUN apt update -y && apt upgrade -y
RUN apt-get install -y \
	curl \
	php7.4 \
	php-cgi \
	php-fpm \
	php-mysql \
	mariadb-client \
    && rm -rf /var/lib/apt/lists/*

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x /usr/local/bin/wp

COPY tools/entrypoint.sh /tmp/
RUN chmod +x /tmp/entrypoint.sh

RUN mkdir -p /var/www/html
RUN mkdir -p /run/php

# Change php fpm configuration
RUN chmod +x /tmp/entrypoint.sh && \
    sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = 9000|g" /etc/php/7.4/fpm/pool.d/www.conf && \
    sed -i "s|listen.owner = www-data|listen.owner = nobody|g" /etc/php/7.4/fpm/pool.d/www.conf && \
    sed -i "s|listen.group = www-data|listen.group = nobody|g" /etc/php/7.4/fpm/pool.d/www.conf && \
    rm -f /var/cache/apk/*

ENTRYPOINT ["/tmp/entrypoint.sh"]
