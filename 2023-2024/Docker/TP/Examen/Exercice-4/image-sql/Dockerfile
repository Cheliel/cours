# Utilisation d'une image debian 
FROM mysql:latest

LABEL mainterner="Etienne Pernon"
LABEL version="1.0"

ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=i_lovecraft
ENV MYSQL_USER=user
ENV MYSQL_PASSWORD=root

COPY ilovecraft_database.sql /docker-entrypoint-initdb.d/

EXPOSE 3306

