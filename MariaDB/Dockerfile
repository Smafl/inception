
# Use the Alpine Linux base image
FROM alpine:latest

# Install MariaDB server and client
RUN apk --no-cache add mariadb mariadb-client

# Create a directory for MariaDB data
RUN mkdir -p /var/lib/mysql && \
    mkdir -p /var/run/mysql && \
    chown -R mysql:mysql /var/lib/mysql && \
    chown -R mysql:mysql /var/run/mysql

EXPOSE 3306

# Copy custom MariaDB configuration file
COPY my.cnf /etc/mysql/my.cnf

# Initialize MariaDB database
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

WORKDIR /MariaDB

#HEALTHCHECK --start-period=5m \
#  CMD mariadb -e 'SELECT @@datadir;' || exit 1

# Start MariaDB
CMD ["mysqld", "--user=mysql"]
