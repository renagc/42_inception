# Use Debian bullseye as the base image
FROM debian:bullseye

# Update and upgrade the package repository
RUN apt update -y && apt upgrade -y

# Install Nginx and OpenSSL
RUN apt install -y nginx openssl

# Create necessary directories
RUN mkdir -p /run/nginx  # Create directory for NGINX runtime files
RUN mkdir -p /etc/nginx/ssl  # Create directory for SSL/TLS certificates

# Configure SSL/TLS certification
# openssl newkey rsa:2048 \  # Generate a new RSA private key
#    -x509 \  # Create a self-signed certificate
#    -sha256 \  # Use the SHA-256 hash function
#    -days 365 \  # Set certificate validity period to 365 days
#    -nodes \  # Do not encrypt the private key
#    -out /etc/nginx/ssl/ssl.crt \  # Set output path for the certificate
#    -keyout /etc/nginx/ssl/ssl.key \  # Set output path for the private key
#    -subj "/C=PT/L=Lisboa/O=42/OU=rgomes-c/CN=rgomes-c.42.fr/"  # Set certificate subject
RUN openssl req \
    -newkey rsa:2048 \
    -x509 \
    -sha256 \
    -days 365 \
    -nodes \
    -out /etc/nginx/ssl/ssl.crt \
    -keyout /etc/nginx/ssl/ssl.key \
    -subj "/C=PT/L=Lisboa/O=42/OU=rgomes-c/CN=rgomes-c.42.fr/"

# Copy NGINX configuration file to the appropriate directory
COPY ./conf/nginx.conf /etc/nginx/conf.d/

# Expose port 443 for HTTPS traffic
EXPOSE 443

# Start NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]
