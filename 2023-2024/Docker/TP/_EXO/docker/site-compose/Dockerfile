FROM wordpress:latest

RUN apt update && \
apt install -y

WORKDIR /var/www/html

#COPY index.html /var/www/html/

EXPOSE 80 

CMD [ "apache2ctl", "-D", "FOREGROUND"]