-- MySQL dump 10.13  Distrib 5.7.14, for Win32 (AMD64)
--
-- Host: localhost    Database: myfridgedb
-- ------------------------------------------------------
-- Server version	5.7.14

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingredients` (
  `ingID` int(11) NOT NULL,
  `iname` varchar(45) DEFAULT NULL,
  `dateLogged` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `expDate` int(11) DEFAULT NULL,
  `category` varchar(60) DEFAULT NULL,
  `users_userid` int(11) NOT NULL,
  PRIMARY KEY (`ingID`,`users_userid`),
  KEY `fk_ingredients_users1_idx` (`users_userid`),
  CONSTRAINT `fk_ingredients_users1` FOREIGN KEY (`users_userid`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (1,'Pear',30817,4,31217,NULL,4),(2,'Apple',30817,4,31517,NULL,4),(3,'Peach',30817,4,31417,NULL,4),(4,'Pie Crust',30817,2,32017,NULL,4),(5,'Gallon of Milk',30817,1,31817,NULL,4),(6,'Cup of Flour',30817,3,32717,NULL,4),(7,'Cup of Sugar',30817,2,31917,NULL,4),(8,'Stick of Butter',30817,2,31317,NULL,4),(9,'Pint of Cream',30817,1,31817,NULL,4),(10,'Box of Cereal',30817,1,32217,NULL,4),(11,'Dash of Meme',30817,3,42099,NULL,4);
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipie`
--

DROP TABLE IF EXISTS `recipie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipie` (
  `rname` varchar(200) DEFAULT NULL,
  `difficulty` int(11) DEFAULT NULL,
  `instructions` varchar(250) DEFAULT NULL,
  `recipieID` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  `users_userid` int(11) NOT NULL,
  PRIMARY KEY (`recipieID`,`users_userid`),
  KEY `fk_recipie_users1_idx` (`users_userid`),
  CONSTRAINT `fk_recipie_users1` FOREIGN KEY (`users_userid`) REFERENCES `users` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipie`
--

LOCK TABLES `recipie` WRITE;
/*!40000 ALTER TABLE `recipie` DISABLE KEYS */;
INSERT INTO `recipie` VALUES ('Apple pie',4,'easy as pie!',1,'Baked Goods',4),('Peach pie',4,'easy as pie!',2,'Baked Goods',4),('Pear pie',4,'easy as pie!',3,'Baked Goods',4),('Apple slices',1,'cut up some apples ya dummy',4,'Fruit',4),('Cereal with milk',1,'add cereal and milk',5,'Breakfast',4);
/*!40000 ALTER TABLE `recipie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipie_has_ingredients`
--

DROP TABLE IF EXISTS `recipie_has_ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipie_has_ingredients` (
  `recipie_recipieID` int(11) NOT NULL,
  `ingredients_ingID` int(11) NOT NULL,
  PRIMARY KEY (`recipie_recipieID`,`ingredients_ingID`),
  KEY `fk_recipie_has_ingredients_ingredients1_idx` (`ingredients_ingID`),
  KEY `fk_recipie_has_ingredients_recipie_idx` (`recipie_recipieID`),
  CONSTRAINT `fk_recipie_has_ingredients_ingredients1` FOREIGN KEY (`ingredients_ingID`) REFERENCES `ingredients` (`ingID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipie_has_ingredients_recipie` FOREIGN KEY (`recipie_recipieID`) REFERENCES `recipie` (`recipieID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipie_has_ingredients`
--

LOCK TABLES `recipie_has_ingredients` WRITE;
/*!40000 ALTER TABLE `recipie_has_ingredients` DISABLE KEYS */;
INSERT INTO `recipie_has_ingredients` VALUES (2,1),(2,3),(2,4),(5,5);
/*!40000 ALTER TABLE `recipie_has_ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userid` int(11) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Ben','password'),(2,'Sam','password'),(3,'John','password'),(4,'testUserName','password');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-07 11:21:33
