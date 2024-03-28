
# Use the Alpine Linux base image
FROM alpine:3.18

RUN apk update && apk upgrade
# Install Nginx
RUN apk --no-cache add nginx openssl

# Create a directory for Nginx logs
RUN mkdir -p /var/log/nginx && \
	mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/ssl/nginx.key \
	-out /etc/nginx/ssl/nginx.crt \
	-subj "/C=DE/ST=BW/L=Heilbronn/O=42Heilbronn/CN=www.ekulichk.42.fr"

# Copy Nginx configuration file
COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
