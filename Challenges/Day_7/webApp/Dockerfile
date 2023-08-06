# Use the official nginx base image
FROM nginx:latest

# Copy the web application files to the nginx html directory
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# CMD instruction to start Nginx
CMD ["nginx", "-g", "daemon off;"]
