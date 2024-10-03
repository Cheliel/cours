> Formateur [Razvan BIZOI](mail:razvan@bizoi.fr)

# Systèmes de gestion des données


## SGBDR Transactionnel VS Décisionnel

> Transactionnel -> atomicité et isolation, on fait essentiellement des petites requêtes.

> Décisionnel -> on veut faire des requêtes en bulk, de l'analyse, de la Big Data. -> **Modèle en étoile**

Réaliser une simple copie d'une PROD transactionnelle n'est pas une onne pratique, il vaut mieux changer d'architecture pour un système plus capable d'analyser de larges quantité d'informations.

Dans un BDD Décisionnelle, on va changer la structure des données pour se rapprocher de l'utilisation métier de la donnée. Pour se faire, on crée un moyen d'accès, une **dimension**, supposée "universelle" pour toutes les données. Un exemple courant c'est la date, une analyse se fera quasiment systématiquement sur une dimension de temps. C'est la mise en relation de plusieurs dimensions, filtrées qui données alors un resultat d'analyse décisionnelle. De plus on établit une **hiérarchie** entre les dimensions (année > mois > semaines > jours ...), sous forme d'attributs de la dimensions (ex: un produit (dimension), définit par un code < gamme < marque < ... qui sont aussi des dimensions du produit). 

> /!\ aux contraintes techniques -> augmenter la hiérarchie, c'est aussi augmenter la taille du stockage nécessaire 

On parle donc de **modèle en étoile** pour les BDD décisionnelles car la relation entre des dimensions qui permettent une table de mesure forment une étoile autour de la mesure, qui elle concentre la majorité du poids physique du stockage de donnée.

> *Data Lake*, on casse la hiérarchie, toutes les données sont au même niveau.

## Big Data

Pour savoir si une solution à besoin des techniques de Big Data :
**Les 3 V** (base, mais plusieurs versions des règles des nV existent).
- Volume, volumétrie importante des données à traiter
- Vitesse, besoin en rapidité de traitement
- Variété, diversité de structure de l'information, de leur types et des sources

### Stockage

Pour favoriser ces 3 aspects (au moins), les serveurs de gestion des accès aux données crées des **_shards_**, des bouts de données, de fichier, qu'il va répartir sur différents serveurs, des **_nodes_**, avec _a minima_ **3 réplicats** de chaque shard.

### Traitement

> Processus `MapReduce`

Chaque noeud du cluster de serveurs a son propre _node manager_, qui seront appelés individuellements (_map_) par le _resource manager_ du serveur de gestion. Cela permet de répartir la charge du traitement sur chacun des noeuds. 
Le RM principal (qui fait l'appel est qui est notre point d'entrée) ne fait que récupérer ces résultats et consolide (_reduce_) les informations avec sa connaissance du partitionnement des données à travers les shards.

