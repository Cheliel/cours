-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.3.0 - MySQL Community Server - GPL
-- SE du serveur:                Linux
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour i_lovecraft
CREATE DATABASE IF NOT EXISTS `i_lovecraft` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `i_lovecraft`;

-- Listage de la structure de la table i_lovecraft. action
CREATE TABLE IF NOT EXISTS `action` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_action` datetime NOT NULL DEFAULT (now()),
  `partie_id` int NOT NULL,
  `type_id` int NOT NULL,
  `joueur_id` int NOT NULL,
  `resultat_des` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_actions_type1_idx` (`type_id`),
  KEY `fk_actions_joueur1_idx` (`joueur_id`),
  KEY `fk_action_partie1_idx` (`partie_id`),
  CONSTRAINT `fk_action_partie1` FOREIGN KEY (`partie_id`) REFERENCES `partie` (`id`),
  CONSTRAINT `fk_actions_joueur1` FOREIGN KEY (`joueur_id`) REFERENCES `joueur` (`id`),
  CONSTRAINT `fk_actions_type1` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table i_lovecraft.action : ~4 rows (environ)
DELETE FROM `action`;
INSERT INTO `action` (`id`, `date_action`, `partie_id`, `type_id`, `joueur_id`, `resultat_des`) VALUES
	(1, '2024-01-20 20:27:43', 1, 3, 1, 0),
	(2, '2024-01-20 20:28:10', 1, 1, 3, 1),
	(3, '2024-01-20 20:28:17', 1, 4, 3, 2),
	(4, '2024-01-20 19:29:20', 1, 3, 1, 1);

-- Listage de la structure de la table i_lovecraft. joueur
CREATE TABLE IF NOT EXISTS `joueur` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table i_lovecraft.joueur : ~0 rows (environ)
DELETE FROM `joueur`;
INSERT INTO `joueur` (`id`, `nom`) VALUES
	(1, 'Goku'),
	(2, 'Mario'),
	(3, 'John Doe'),
	(4, 'Link'),
	(5, 'Lord Stark');

-- Listage de la structure de la table i_lovecraft. partie
CREATE TABLE IF NOT EXISTS `partie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_creation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nom_partie` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table i_lovecraft.partie : ~0 rows (environ)
DELETE FROM `partie`;
INSERT INTO `partie` (`id`, `date_creation`, `nom_partie`) VALUES
	(1, '2024-01-20 19:26:54', 'La partie LoveCraft');

-- Listage de la structure de la table i_lovecraft. type
CREATE TABLE IF NOT EXISTS `type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table i_lovecraft.type : ~0 rows (environ)
DELETE FROM `type`;
INSERT INTO `type` (`id`, `libelle`) VALUES
	(1, 'Test de force'),
	(2, 'Test d\'intélligence'),
	(3, 'Test agiilité'),
	(4, 'Test mental');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
