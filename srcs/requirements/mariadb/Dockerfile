
# Use the Alpine Linux base image
FROM alpine:3.18

# Install MariaDB server and client
RUN apk --no-cache add mariadb mariadb-client mysql

# Create a directory for MariaDB data
RUN mkdir -p /var/lib/mysql && \
    mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/lib/mysql && \
    chown -R mysql:mysql /var/run/mysqld

COPY tools/entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

# Copy custom MariaDB configuration file
COPY conf/my.cnf /etc/mysql/my.cnf

# Initialize MariaDB database
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

#HEALTHCHECK --start-period=5m \
#  CMD mariadb -e 'SELECT @@datadir;' || exit 1

# Start MariaDB
#CMD ["mysqld", "--user=mysql"]
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
