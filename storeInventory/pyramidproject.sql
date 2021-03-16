-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.14-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


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
	(1, 'Dress', 3, '\\static\\dress.jpg'),
	(2, 'Jean', 1, '\\static\\jean.jpg'),
	(3, 'Short', 0, '\\static\\shorts.jpg'),
	(4, 'Skirt', 0, '\\static\\skirt.jpeg'),
	(5, 'Wool coat', 0, '\\static\\coat.jpeg'),
	(6, 'Heels', 0, '\\static\\heels.jpg');
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
