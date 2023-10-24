#!/bin/bash

NETWORK="mynet"
VOLUME="northwind-db"

docker network create $NETWORK
echo "created network $NETWORK"

docker volume create $VOLUME
echo "created volume $VOLUME"

docker run -d --name mydb --network $NETWORK -v $VOLUME:/var/lib/mysql stackupiss/northwind-db:v1
echo "created db"

docker run -d --name myapp --network $NETWORK -p 8080:3000 -e DB_HOST="mydb" -e DB_USER="root" -e DB_PASSWORD="changeit" stackupiss/northwind-app:v1
echo "created app"
