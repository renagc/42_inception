# Use Debian Bullseye as the base image
FROM debian:bullseye

# Update and upgrade the package repository
RUN apt update -y && apt upgrade -y

# Install necessary packages for WordPress
RUN apt install -y wget \
                    php \
                    php-fpm \
                    php-mysql \
                    php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip \
                    mariadb-server mariadb-client curl

# Download the latest WordPress release
RUN wget https://wordpress.org/latest.tar.gz

# Extract the WordPress archive
RUN tar -xzvf latest.tar.gz

# Remove the WordPress archive
RUN rm -rf latest.tar.gz

# Move WordPress files to the web server directory
RUN mkdir /var/www && mkdir /var/www/html
RUN mv /wordpress/* /var/www/html/
RUN rm -rf wordpress/

# Create directory for PHP-FPM to run
RUN mkdir /run/php

# Copy the configuration script for WordPress container
COPY ./conf/config.sh /usr/local/bin/config.sh
RUN chmod +x /usr/local/bin/config.sh

# Install wp-cli for WordPress management
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Set working directory to WordPress installation directory
WORKDIR /var/www/html/

# Set the configuration script as the entry point
ENTRYPOINT ["/usr/local/bin/config.sh"]