#!/bin/bash

# Build docker image

DOCKER_IMAGE="flaskapp:latest"
DOCKER_CONTAINER="flaskcontainer"

echo "Stopping docker container if running"
docker kill $DOCKER_CONTAINER
docker container rm $DOCKER_CONTAINER
echo "Building docker image"
docker build . -t $DOCKER_IMAGE

if [[ $? -ne 0 ]];then
	echo "Failed to build docker image"
	exit 1
fi

echo "Docker image built"

# Start docker container

echo "Now trying to start docker container on port 5000"

docker run -d --name $DOCKER_CONTAINER -p 5000:5000 $DOCKER_IMAGE

if [[ $? -ne 0 ]];
then
	echo "Failed to start docker container"
	exit 1
fi

# Configure nginx

hostname=`curl -s http://169.254.169.254/latest/meta-data/public-hostname`
sed -e "s/\${PLACEHOLDER}/$hostname/" reverse-proxy-template.conf > reverse-proxy.conf
sudo mv reverse-proxy.conf /etc/nginx/conf.d/

sudo nginx -t

sudo systemctl restart nginx
