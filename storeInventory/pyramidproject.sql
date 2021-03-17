-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.14-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for pyramidproject
DROP DATABASE IF EXISTS `pyramidproject`;
CREATE DATABASE IF NOT EXISTS `pyramidproject` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `pyramidproject`;

-- Dumping structure for table pyramidproject.inventory
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE IF NOT EXISTS `inventory` (
  `Id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `total` int(50) unsigned NOT NULL DEFAULT 0,
  `link` varchar(256) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table pyramidproject.inventory: ~6 rows (approximately)
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
REPLACE INTO `inventory` (`Id`, `name`, `total`, `link`) VALUES
	(1, 'Dress', 3, '/static/img/dress.jpg'),
	(2, 'Jean', 2, '/static/img/jean.jpg'),
	(3, 'Short', 0, '/static/img/shorts.jpg'),
	(4, 'Skirt', 5, '/static/img/skirt.jpeg'),
	(5, 'Coat', 0, '/static/img/coat.jpeg'),
	(6, 'Heels', 0, '/static/img/heels.jpg');
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;

-- Dumping structure for table pyramidproject.menu
DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `menuId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `link` varchar(50) NOT NULL,
  `dateModified` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`menuId`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table pyramidproject.menu: ~3 rows (approximately)
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
REPLACE INTO `menu` (`menuId`, `name`, `link`, `dateModified`) VALUES
	(1, 'Home', '/', '2021-03-17 00:25:11'),
	(2, 'Products', '/product', '2021-03-17 00:25:16'),
	(3, 'Inventory', '/inventory', '2021-03-17 00:25:33');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
