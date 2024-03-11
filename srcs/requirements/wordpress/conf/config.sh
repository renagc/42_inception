#!/bin/bash

# Update PHP-FPM configuration to listen on port 9000 for incoming connections
sed -i "s/listen = \/run\/php\/php7.4-fpm.sock/listen = 0.0.0.0:9000/g" /etc/php/7.4/fpm/pool.d/www.conf

# Wait for 10 seconds to ensure PHP-FPM is ready
sleep 10s

# Generate WordPress configuration file
# wp config create \
#     --dbname=${MYSQL_DB_NAME} \          # Specify the WordPress database name
#     --dbuser=${MYSQL_DB_USER} \          # Specify the WordPress database user
#     --dbpass=${MYSQL_DB_PASSWORD} \      # Specify the WordPress database password
#     --dbhost=mariadb \                   # Specify the MariaDB database host
#     --dbcharset="utf8" \                  # Specify the database character set
#     --dbcollate="utf8_general_ci" \       # Specify the database collation
#     --allow-root                          # Allow execution as root user
wp config create \
    --dbname=${MYSQL_DB_NAME} \
    --dbuser=${MYSQL_DB_USER} \
    --dbpass=${MYSQL_DB_PASSWORD} \
    --dbhost=mariadb \
    --dbcharset="utf8" \
    --dbcollate="utf8_general_ci" \
    --allow-root

# Install WordPress with specified configuration
# 	wp core install \
#     	--url=${WP_TITLE} \                   # Specify the WordPress site URL
#     	--title=${WP_TITLE} \                 # Specify the WordPress site title
#     	--admin_user=${WP_ADMIN_USER} \       # Specify the WordPress admin username
#     	--admin_password=${WP_ADMIN_PASSOWRD} \  # Specify the WordPress admin password
#     	--admin_email=${WP_ADMIN_EMAIL} \     # Specify the WordPress admin email
#     	--allow-root                          # Allow execution as root user
wp core install \
    	--url=${WP_TITLE} \
    	--title=${WP_TITLE} \
    	--admin_user=${WP_ADMIN_USER} \
    	--admin_password=${WP_ADMIN_PASSOWRD} \
    	--admin_email=${WP_ADMIN_EMAIL} \
    	--allow-root

# Set ownership of WordPress files to the web server user and group
chown -R www-data:www-data /var/www/html

# Start PHP-FPM in foreground mode
/usr/sbin/php-fpm7.4 -F
