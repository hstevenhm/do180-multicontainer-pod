#/bin/bash

sudo podman pod create --name wordpresspod -p 8080:80 -p 13306:3306

sudo podman run -d --pod wordpresspod \
-e MYSQL_ROOT_PASSWORD=mysql \
-e MYSQL_DATABASE=wordpress \
-e MYSQL_USER=wordpress \
-e MYSQL_PASSWORD=wordpress --name db docker.io/library/mysql:5.7


sudo podman run -d --pod wordpresspod \
-e WORDPRESS_DB_HOST=127.0.0.1 \
-e WORDPRESS_DB_USER=wordpress -e WORDPRESS_DB_PASSWORD=wordpress \
-e WORDPRESS_DB_NAME=wordpress --name wp \
docker.io/library/wordpress:latest
