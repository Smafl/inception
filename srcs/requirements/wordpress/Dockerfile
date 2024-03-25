
FROM debian:bullseye

RUN apt-get -y install wget
RUN apt-get install -y php7.3 \
	php-fpm \
	php-mysql \
	mariadb-client \
    && rm -rf /var/lib/apt/lists/*

# RUN curl https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
# RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
# RUN chown -R root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY tools/entrypoint.sh /tmp/
RUN chmod +x /tmp/entrypoint.sh

RUN mkdir -p /var/www/html
RUN mkdir -p /run/php

# Change php fpm configuration
RUN chmod +x /usr/local/bin/wordpress_entrypoint.sh && \
    sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" \
    /etc/php/7.3/fpm/pool.d/www.conf && \
    sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" \
    /etc/php/7.3/fpm/pool.d/www.conf && \
    sed -i "s|;listen.group = nobody|listen.group = nobody|g" \
    /etc/php/7.3/fpm/pool.d/www.conf && \
    rm -f /var/cache/apk/*

ENTRYPOINT ["/tmp/entrypoint.sh"]
