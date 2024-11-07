# Utilisation d'une image debian 
FROM debian:bookworm-slim

LABEL mainterner="Etienne Pernon"
LABEL version="1.0"

# Se déplacer sur le répertoire courant 
WORKDIR /var/www/html

# Ajouter un utilisateur 
RUN useradd appUser

# execution des commande 
RUN apt-get update && apt-get install -y \
apache2 \
php \
libapache2-mod-php \
&& rm -rf /var/lib/apt/lists/* \
&& a2enmod \
&& php8.2 

# Donner les droit à l'utilisateur basic 
RUN chown -R appUser:appUser /var/www/html

# RUN useradd userapache && usermod -aG userapache www-data
# RUN chmod 775 /var/www && \
#     chown userapache:www-data -R /var/www && \
#     chmod 775 /var/log/apache2 && \
#     chown userapache:www-data -R /var/log/apache2

USER appUser

RUN echo "<html><body><p> <?php phpinfo();?> </p></body></html>" > /var/www/html/index.php \
&& rm -rf index.html

USER root

# exposition du port 80 dans la VM 
EXPOSE 80 

# Commande de lancement d'apache 
CMD [ "apache2ctl", "-D", "FOREGROUND"]