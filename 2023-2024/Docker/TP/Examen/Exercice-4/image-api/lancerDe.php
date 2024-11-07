<?php

// Recuperation des informations de l'action
$partieId = $_GET['partieId'];
$joueurId = $_GET['joueurId'];
$typeId = $_GET['typeId'];


// Lancement du dé aléatoire
$resultatDes = rand(0, 2);

// Insertion dans la base de données
$databaseHost = getenv('LOVECRAFT_DB_HOST');
$databaseName = getenv('LOVECRAFT_DB_NAME');
$databasePort = getenv('LOVECRAFT_DB_PORT');
$databaseUser = getenv('LOVECRAFT_DB_USER');
$databasePassword = getenv('LOVECRAFT_DB_PWD');

$pdo = new PDO("mysql:host=$databaseHost;dbname=$databaseName", $databaseUser, $databasePassword);
$sql = "INSERT INTO action (partie_id, type_id, joueur_id, resultat_des) VALUES (?,?,?,?)";
$pdo->prepare($sql)->execute([$partieId, $typeId, $joueurId, $resultatDes]);

// Affichage de la reponse au format json
header('Content-Type: application/json; charset=utf-8');
echo json_encode(["result"=> $resultatDes]);