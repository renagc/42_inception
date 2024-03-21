# Use Debian bullseye as the base image
FROM debian:bullseye

# Update and upgrade the package repository
RUN apt update -y && apt upgrade -y

# Install MariaDB server
RUN apt install -y mariadb-server

# Create the mysql folder and set the right permissions
RUN mkdir -p /run/mysqld
RUN chown -R mysql:mysql /run/mysqld

# Create and set permissions for the mysqld directory
RUN mkdir -p /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld \
    && chmod 777 /var/run/mysqld

# Expose port 3306 for MySQL traffic
EXPOSE 3306

# Copy the start script to the root directory and make it executable
COPY ./conf/start.sh /
RUN chmod +x start.sh

# Set the start script as the entry point
ENTRYPOINT ["./start.sh"]