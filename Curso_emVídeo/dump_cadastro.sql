CREATE DATABASE  IF NOT EXISTS `cadastro` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `cadastro`;
-- MySQL dump 10.13  Distrib 8.0.26, for macos11 (x86_64)
--
-- Host: localhost    Database: cadastro
-- ------------------------------------------------------
-- Server version	5.7.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Gafanhotos`
--

DROP TABLE IF EXISTS `Gafanhotos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Gafanhotos` (
  `cpf` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `prof` varchar(20) DEFAULT NULL,
  `nascimento` date DEFAULT NULL,
  `sexo` enum('M','F') DEFAULT NULL,
  `peso` decimal(5,2) DEFAULT NULL,
  `altura` decimal(3,2) DEFAULT NULL,
  `nacionalidade` varchar(20) DEFAULT 'Brasil',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Gafanhotos`
--

LOCK TABLES `Gafanhotos` WRITE;
/*!40000 ALTER TABLE `Gafanhotos` DISABLE KEYS */;
INSERT INTO `Gafanhotos` VALUES (NULL,1,'Godofredo',NULL,'1984-01-02','M',78.50,1.83,'Estônia'),(NULL,2,'Maria',NULL,'1955-05-30','F',60.40,1.45,'Rússia'),(NULL,3,'Vladmir',NULL,'1917-08-12','M',70.00,1.70,'Ucrânia'),(NULL,4,'Trotsky',NULL,'1950-04-28','M',67.30,1.72,'Brasil'),(NULL,5,'Trotsky',NULL,'1950-04-28','M',67.30,1.72,'Brasil'),(NULL,6,'Adalberto',NULL,'2001-05-20','M',80.90,1.30,'Brasil'),(NULL,7,'Ana',NULL,'1978-06-21','F',43.70,1.70,'Brasil'),(NULL,8,'Joana',NULL,'1900-08-25','F',47.50,1.90,'Brasil'),(NULL,9,'Heloísa',NULL,'2000-01-17','F',49.80,1.70,'Brasil'),(NULL,10,'Jõao',NULL,'1990-06-14','M',103.00,1.40,'Indiano');
/*!40000 ALTER TABLE `Gafanhotos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos` (
  `idcurso` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `descricao` text,
  `carga` int(10) unsigned DEFAULT NULL,
  `totalaulas` int(11) DEFAULT NULL,
  `ano` year(4) DEFAULT '2016',
  PRIMARY KEY (`idcurso`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (1,'HTML5','Curso de HTML 5',9,10,2016),(2,'Algorítmos','Lógica Algorítmica',8,13,2006),(3,'Eng de Requisitos','Prof Sheila',4,16,2004),(4,'IHC','Interface humano computador',8,4,2007),(5,'POO','Professor MArk',26,15,2012),(6,'JAVA','Curso de JAVAr e etc',0,15,2009),(7,'Edição de vídeos','Editando vídeos com Schmidt',9,10,2016),(8,'Yourtube','Curso para não ter juízo',9,10,2013),(9,'Js','Professor Linux',45,17,1997),(10,'Modelagem de processos','Professora Regina, um amor',4,15,2020),(11,'MySql','Curso da professora Deborah e do Guanabara',50,35,2021),(12,'HTML5 aulas complementares','Curso de HTML5',40,37,2014),(13,'Logica','Lógica de programação',20,15,2014),(14,'Photoshop','Dicas de Photoshop CC',10,8,2014),(15,'PHP','Curso de PHP para iniciantes',40,20,2019),(16,'Java aulas','Introdução a Linguagem Java',10,29,2001),(17,'MySQL Workbench','Banco de dados MySQL',30,15,2016),(18,'Word','Curso completo de Word',40,30,2016);
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-20 20:17:54
