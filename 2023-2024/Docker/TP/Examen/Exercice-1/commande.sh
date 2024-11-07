
# 1.1 
# Lancemenet d'un conteneur à partir d'un image docker hub 
docker run --name apache-ctn -d -p 9191:80 httpd

# 1.2
#Lister les conteneur 
docker container ls -a 

# 1.3 

#connexion au Terminal du conteneur 
docker exec -it apache-ctn bash

# Ecriture dans le fichier index.html
echo '<html><body><p>Coucou depuis mon conteneur Apache</p></body></html>' > /var/www/html/index.html


# 1.4 
# Création d'une image local à partir d'un conteneur 
docker commit -m  "Modification index.html"   fc5efe0ff7fe31742455fa475b6782f4cd8337cfd5bb08c4ab024bc8a7779578 apache-coucou

# 1.5 

# Arret du conteneur 
docker container stop apache-ctn
# Suppression du conteneur 
docker container rm apache-ctn

# 1.6 

# Lancement d'un conteneur avec un image locale + définition du port 
docker run --name apache-new -d -p 8080:80 coucou-apache

#1.7 

# Arret du conteneur 
docker container stop apache-new

# Suppression du conteneur 
docker container rm apache-new

# Suppression de l'image
docker image rm coucou-apache




