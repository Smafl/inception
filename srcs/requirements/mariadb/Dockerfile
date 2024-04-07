FROM debian:bullseye

# Update package lists and upgrade installed packages
RUN apt update -y && apt upgrade -y
# Install MariaDB server and client without recommended packages
RUN apt install -y mariadb-server mariadb-client

# Create a directory for MariaDB data
RUN mkdir -p /var/lib/mysql && \
    mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/lib/mysql && \
    chown -R mysql:mysql /var/run/mysqld

COPY tools/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh


# Copy custom MariaDB configuration file
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Initialize MariaDB database
# RUN mysql_install_db
EXPOSE 3306

# Start MariaDB
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
