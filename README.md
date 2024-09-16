# Inception

## Summary

This project aims to broaden knowledge in system administration using Docker. It involves creating and managing Docker containers to set up services such as NGINX, WordPress and MariaDB, all within a virtual machine. The goal is to set up a small infrastructure consisting of several services. Each service will run in its own dedicated container, built from either the penultimate stable version of Debian.

### Services to Set Up:

1. **NGINX** with TLSv1.2 or TLSv1.3
2. **WordPress** with php-fpm (without NGINX)
3. **MariaDB** (without NGINX)
4. A volume for the WordPress database
5. A volume for WordPress website files
6. A docker-network to connect all containers

### Directory Structure:
    .
    ├── Makefile
    ├── requirements
    └── srcs
        ├── .env
        ├── docker-compose.yml
        └── requirements
            ├── mariadb
            │   ├── Dockerfile
            │   └── tools
            │       └── start.sh
            ├── nginx
            │   ├── Dockerfile
            │   └── conf
            │       └── nginx.conf
            └── wordpress
                ├── Dockerfile
                └── tools
                    └── config.sh
                
