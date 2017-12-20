#!/bin/bash

read -p "Set Account Name: "  ACCOUNT_NAME
read -p "Set Admin Email: "  ADMIN_EMAIL
read -s -p "Set Admin Password: "  ADMIN_PASSWORD

docker-compose up -d
