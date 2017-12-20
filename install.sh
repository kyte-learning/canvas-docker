#!/bin/bash

# Set environment variables
read -p "Set Account Name: "  ACCOUNT_NAME
read -p "Set Admin Email: "  ADMIN_EMAIL
read -s -p "Set Admin Password: "  ADMIN_PASSWORD

# Create canvas-variables.env so we can pass them into docker-compose
cat <<EOF > canvas-variables.env
ACCOUNT_NAME=$ACCOUNT_NAME
ADMIN_EMAIL=$ADMIN_EMAIL
ADMIN_PASSWORD=$ADMIN_PASSWORD
EOF

# Get latest Docker Compose release
latest=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep  '"name"' | head -n 1 | cut -d '"' -f 4)

# Install Docker Compose as a container
curl -L --fail "https://github.com/docker/compose/releases/download/$latest/run.sh" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Build, create, start, and attach to container
docker-compose up -d
