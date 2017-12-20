#!/bin/bash

read -p "Set Account Name: "  ACCOUNT_NAME
read -p "Set Admin Email: "  ADMIN_EMAIL
read -s -p "Set Admin Password: "  ADMIN_PASSWORD

# Get latest Docker Compose release
latest=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep  '"name"' | head -n 1 | cut -d '"' -f 4)

# Install Docker Compose as a container
curl -L --fail "https://github.com/docker/compose/releases/download/$latest/run.sh" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

docker-compose up -d
