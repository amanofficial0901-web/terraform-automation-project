#!/bin/bash
apt-get update -y
apt-get install nginx -y
systemctl start nginx
systemctl enable nginx

echo "Hello from my NGINX server" > /var/www/html/index.html

