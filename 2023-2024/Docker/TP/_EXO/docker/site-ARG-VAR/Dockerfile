FROM debian:latest

ARG ARG_PRENOM
ENV name=${ARG_PRENOM}

#RUN printf "deb http://archive.debian.org/debian/ jessie main\ndeb-src http://archive.debian.org/debian/ jessie main\ndeb http://security.debian.org jessie/updates main\ndeb-src http://security.debian.org jessie/updates main" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y apache2
RUN apt-get install -y php
RUN apt-get install -y libapache2-mod-php 
RUN rm -rf /var/lib/apt/lists/*
RUN a2enmod php8.2
WORKDIR /var/www/html

RUN rm index.html

RUN echo "<?php echo 'Votre prenom est ' . getenv('name'); ?>" > index.php 
#<?php echo . getenv('name'); ?>


#COPY index.html /var/www/html/

EXPOSE 80 

CMD [ "apache2ctl", "-D", "FOREGROUND"]