FROM debian:latest

RUN apt-get update
RUN apt-get install apache2 -y
RUN echo '<html><body><p>Hello world</p></body></html>' > /var/www/html/index.html

WORKDIR /var/www/html

#COPY index.html /var/www/html/

EXPOSE 80 

CMD [ "apache2ctl", "-D", "FOREGROUND"]