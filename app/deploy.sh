#!/bin/bash

# Check for the latest "release" tag on the branch
latest_tag=$(git describe --tags $(git rev-list --tags --max-count=1))

# Checkout the latest "release" tag
git checkout tags/$latest_tag

# Build and deploy the Docker containers
docker-compose up --build -d

# Print the IP addresses of the containers
python_web_app_ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' python-web-app)
nginx_ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' nginx)

echo "Python Web App IP: $python_web_app_ip"
echo "Nginx Proxy IP: $nginx_ip"
