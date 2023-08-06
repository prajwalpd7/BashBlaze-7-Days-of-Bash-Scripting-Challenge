#!/bin/bash

# Install dependencies
sudo apt update
sudo apt install docker.io nginx -y

# Start and enable nginx
sudo systemctl start nginx
sudo systemctl enable nginx

# Get public IP and project name from command line arguments
PUBLIC_IP="$1"
PROJECT_NAME="$2"
# Create nginx configuration file
sudo tee "/etc/nginx/sites-available/$PROJECT_NAME" <<EOF
server {
    listen 80;
    server_name $PUBLIC_IP;

    location / {
        proxy_pass http://127.0.0.1:8000;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
    }
}
EOF

# Enable Nginx configuration
sudo ln -s "/etc/nginx/sites-available/$PROJECT_NAME" "/etc/nginx/sites-enabled/"
sudo systemctl reload nginx

# Build Docker image and run container
sudo docker build -t myapp "/home/ubuntu/$PROJECT_NAME"
sudo docker run -d -p 8000:8000 myapp
