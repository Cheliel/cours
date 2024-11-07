FROM debian:latest

LABEL mainterner="Etienne Pernon"
LABEL version="1.0"

ARG ARG_MOT
ENV mot=${ARG_MOT}

#RUN printf "deb http://archive.debian.org/debian/ jessie main\ndeb-src http://archive.debian.org/debian/ jessie main\ndeb http://security.debian.org jessie/updates main\ndeb-src http://security.debian.org jessie/updates main" > /etc/apt/sources.list
RUN apt-get update && apt-get install -y \
apache2 \
php \
libapache2-mod-php 

RUN rm -rf /var/lib/apt/lists/*

RUN a2enmod php8.2

WORKDIR /var/www/html

RUN rm index.html

RUN echo "<?php echo 'Votre prenom est ' . getenv('mot') . base64_encode(getenv('mot')) ?>" > index.php 
#<?php echo 'Votre prenom est ' . getenv('mot') . ' Sur la base 64 : ' . base64_encode(getenv('mot')) ?>



#COPY index.html /var/www/html/

EXPOSE 80 

CMD [ "apache2ctl", "-D", "FOREGROUND"]