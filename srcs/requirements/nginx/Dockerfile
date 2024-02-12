
# Use the Alpine Linux base image
FROM alpine:3.18

RUN apk update && apk upgrade
# Install Nginx
RUN apk --no-cache add nginx openssl

# Create a directory for Nginx logs
RUN mkdir -p /var/log/nginx

# Copy Nginx configuration file
COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
