# Utilisation d'une image debian 
FROM debian:bookworm-slim

LABEL mainterner="Etienne Pernon"
LABEL version="1.0"

# Se déplacer sur le répertoire courant 
WORKDIR /var/www/html

# execution des commande 
RUN apt-get update && apt-get install -y \
apache2 \
php \
libapache2-mod-php \
&& rm -rf /var/lib/apt/lists/* \
&& a2enmod \
&& php8.2 \
&& echo "<html><body><p> <?php phpinfo();?> </p></body></html>" > /var/www/html/index.php \
&& rm -rf index.html

# exposition du port 80 dans la VM 
EXPOSE 80 

# Commande de lancement d'apache 
CMD [ "apache2ctl", "-D", "FOREGROUND"]