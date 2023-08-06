#!/bin/bash

# Pull the Docker image from the server
docker pull sr-virtual-machine/webapp-image

# Stop and remove any existing container
docker kill webapp-image
docker rm webapp-image
# Run the Docker container with Nginx reverse proxy
docker run -d -p 80:80 sr-virtual-machine/webapp-image
