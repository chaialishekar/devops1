FROM ubuntu:latest

# Install nginx and dependencies
RUN apt-get update && \
    apt-get install -y nginx openssl && \
    rm -rf /var/lib/apt/lists/*

# Copy SSL certificate and key to the container
#COPY nginx-selfsigned.crt /etc/ssl/certs/nginx-selfsigned.crt
#COPY nginx-selfsigned.key /etc/ssl/private/nginx-selfsigned.key
COPY cert.pem /etc/ssl/certs/nginx-selfsigned.crt
COPY key.pem /etc/ssl/private/nginx-selfsigned.key



COPY nginx.conf /etc/nginx/nginx.conf


COPY myapp.html /usr/share/nginx/html/myapp.html


EXPOSE 80 443

# Start nginx
CMD ["nginx", "-g", "daemon off;"]


