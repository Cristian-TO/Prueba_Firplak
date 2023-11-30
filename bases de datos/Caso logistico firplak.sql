-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: firplak_s.a
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `documentosentrega`
--

DROP TABLE IF EXISTS `documentosentrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documentosentrega` (
  `id_documento` int NOT NULL,
  `id_linea` int DEFAULT NULL,
  `numero_consecutivo` int NOT NULL,
  `fecha_despacho` date NOT NULL,
  `fecha_entrega` date DEFAULT NULL,
  PRIMARY KEY (`id_documento`),
  KEY `id_linea` (`id_linea`),
  CONSTRAINT `documentosentrega_ibfk_1` FOREIGN KEY (`id_linea`) REFERENCES `pedidos` (`id_pedido`),
  CONSTRAINT `id_linea` FOREIGN KEY (`id_linea`) REFERENCES `lineaspedido` (`id_linea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentosentrega`
--

LOCK TABLES `documentosentrega` WRITE;
/*!40000 ALTER TABLE `documentosentrega` DISABLE KEYS */;
/*!40000 ALTER TABLE `documentosentrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturas` (
  `id_Factura` int NOT NULL,
  `id_Documento` int DEFAULT NULL,
  `FechaFacturacion` date DEFAULT NULL,
  `MetodoEnvio` enum('CorreoElectronico','Fisico') DEFAULT NULL,
  PRIMARY KEY (`id_Factura`),
  KEY `id_Documento` (`id_Documento`),
  CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`id_Documento`) REFERENCES `documentosentrega` (`id_documento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guiastransporte`
--

DROP TABLE IF EXISTS `guiastransporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guiastransporte` (
  `id_GuiaTransporte` int NOT NULL,
  `id_Documento` int DEFAULT NULL,
  `id_Cliente` int DEFAULT NULL,
  `id_Ubicacion` int DEFAULT NULL,
  `FechaDespacho` date DEFAULT NULL,
  `EstadoGuia` enum('Pendiente','EnProceso','Entregado') DEFAULT NULL,
  PRIMARY KEY (`id_GuiaTransporte`),
  KEY `guiastransporte_ibfk_1` (`id_Documento`),
  CONSTRAINT `guiastransporte_ibfk_1` FOREIGN KEY (`id_Documento`) REFERENCES `documentosentrega` (`id_documento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guiastransporte`
--

LOCK TABLES `guiastransporte` WRITE;
/*!40000 ALTER TABLE `guiastransporte` DISABLE KEYS */;
/*!40000 ALTER TABLE `guiastransporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lineaspedido`
--

DROP TABLE IF EXISTS `lineaspedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lineaspedido` (
  `id_linea` int NOT NULL,
  `id_pedido` int DEFAULT NULL,
  `sku_producto` varchar(50) NOT NULL,
  `cantidad` int NOT NULL,
  `fecha_entrega` date NOT NULL,
  `tipo_pediddo` enum('MTO','MTS') NOT NULL,
  `bodega` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_linea`),
  KEY `id_pedido` (`id_pedido`),
  CONSTRAINT `lineaspedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lineaspedido`
--

LOCK TABLES `lineaspedido` WRITE;
/*!40000 ALTER TABLE `lineaspedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `lineaspedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id_pedido` int NOT NULL,
  `consecutivo` int NOT NULL,
  `fecha_pedido` date NOT NULL,
  PRIMARY KEY (`id_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pruebasentrega`
--

DROP TABLE IF EXISTS `pruebasentrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pruebasentrega` (
  `id_PruebaEntrega` int NOT NULL,
  `id_GuiaTransporte` int DEFAULT NULL,
  `FotoGuiaTransporte` blob,
  `FotoDocumentoEntrega` blob,
  `Observaciones` text,
  PRIMARY KEY (`id_PruebaEntrega`),
  KEY `id_GuiaTransporte` (`id_GuiaTransporte`),
  CONSTRAINT `pruebasentrega_ibfk_1` FOREIGN KEY (`id_GuiaTransporte`) REFERENCES `guiastransporte` (`id_GuiaTransporte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pruebasentrega`
--

LOCK TABLES `pruebasentrega` WRITE;
/*!40000 ALTER TABLE `pruebasentrega` DISABLE KEYS */;
/*!40000 ALTER TABLE `pruebasentrega` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-30  9:57:18
