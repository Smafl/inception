
FROM debian:bullseye

# Update package lists and upgrade installed packages
RUN apt update -y && apt upgrade -y
# Install MariaDB server and client without recommended packages
RUN apt install -y mariadb-server mariadb-client
# Clean up apt cache to reduce image size
    # apt clean && rm -rf /var/lib/apt/lists/*

# Create a directory for MariaDB data
RUN mkdir -p /var/lib/mysql && \
    mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/lib/mysql && \
    chown -R mysql:mysql /var/run/mysqld

COPY tools/entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

# Copy custom MariaDB configuration file
COPY conf/my.cnf /etc/my.cnf

# Initialize MariaDB database
RUN mysql_install_db

# Start MariaDB
#CMD ["mysqld", "--user=mysql"]
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
