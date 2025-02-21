-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: swlor
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `ApartmentBuilding`
--

DROP TABLE IF EXISTS `ApartmentBuilding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ApartmentBuilding` (
  `ID` int NOT NULL,
  `Name` varchar(64) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ApartmentBuilding`
--

LOCK TABLES `ApartmentBuilding` WRITE;
/*!40000 ALTER TABLE `ApartmentBuilding` DISABLE KEYS */;
INSERT INTO `ApartmentBuilding` VALUES (1,'Starchaser Homes'),(3,'Under the Sea');
/*!40000 ALTER TABLE `ApartmentBuilding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Area`
--

DROP TABLE IF EXISTS `Area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Area` (
  `ID` varchar(64) NOT NULL,
  `Resref` varchar(16) NOT NULL,
  `Name` varchar(128) NOT NULL,
  `Tag` varchar(32) NOT NULL,
  `ResourceSpawnTableID` int NOT NULL,
  `Width` int NOT NULL DEFAULT '0',
  `Height` int NOT NULL DEFAULT '0',
  `IsBuildable` tinyint(1) NOT NULL DEFAULT '0',
  `NorthwestOwner` varchar(64) DEFAULT NULL,
  `NortheastOwner` varchar(64) DEFAULT NULL,
  `SouthwestOwner` varchar(64) DEFAULT NULL,
  `SoutheastOwner` varchar(64) DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '0',
  `PurchasePrice` int NOT NULL DEFAULT '0',
  `DailyUpkeep` int NOT NULL DEFAULT '0',
  `AutoSpawnResources` tinyint(1) NOT NULL DEFAULT '0',
  `ResourceQuality` int NOT NULL DEFAULT '0',
  `NorthwestLootTableID` int DEFAULT NULL,
  `NortheastLootTableID` int DEFAULT NULL,
  `SouthwestLootTableID` int DEFAULT NULL,
  `SoutheastLootTableID` int DEFAULT NULL,
  `MaxResourceQuality` int NOT NULL DEFAULT '0',
  `ClusterID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CIX_Area_ID` (`ClusterID`),
  UNIQUE KEY `UQ_Area_Resref` (`Resref`),
  KEY `FK_Area_ResourceSpawnTableID` (`ResourceSpawnTableID`),
  KEY `FK_Area_NorthwestOwner` (`NorthwestOwner`),
  KEY `FK_Area_NortheastOwner` (`NortheastOwner`),
  KEY `FK_Area_SouthwestOwner` (`SouthwestOwner`),
  KEY `FK_Area_SoutheastOwner` (`SoutheastOwner`),
  KEY `FK_Area_NorthwestLootTableID` (`NorthwestLootTableID`),
  KEY `FK_Area_NortheastLootTableID` (`NortheastLootTableID`),
  KEY `FK_Area_SouthwestLootTableID` (`SouthwestLootTableID`),
  KEY `FK_Area_SoutheastLootTableID` (`SoutheastLootTableID`),
  CONSTRAINT `FK_Area_NortheastLootTableID` FOREIGN KEY (`NortheastLootTableID`) REFERENCES `LootTable` (`ID`),
  CONSTRAINT `FK_Area_NortheastOwner` FOREIGN KEY (`NortheastOwner`) REFERENCES `Player` (`ID`),
  CONSTRAINT `FK_Area_NorthwestLootTableID` FOREIGN KEY (`NorthwestLootTableID`) REFERENCES `LootTable` (`ID`),
  CONSTRAINT `FK_Area_NorthwestOwner` FOREIGN KEY (`NorthwestOwner`) REFERENCES `Player` (`ID`),
  CONSTRAINT `FK_Area_ResourceSpawnTableID` FOREIGN KEY (`ResourceSpawnTableID`) REFERENCES `Spawn` (`ID`),
  CONSTRAINT `FK_Area_SoutheastLootTableID` FOREIGN KEY (`SoutheastLootTableID`) REFERENCES `LootTable` (`ID`),
  CONSTRAINT `FK_Area_SoutheastOwner` FOREIGN KEY (`SoutheastOwner`) REFERENCES `Player` (`ID`),
  CONSTRAINT `FK_Area_SouthwestLootTableID` FOREIGN KEY (`SouthwestLootTableID`) REFERENCES `LootTable` (`ID`),
  CONSTRAINT `FK_Area_SouthwestOwner` FOREIGN KEY (`SouthwestOwner`) REFERENCES `Player` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Area`
--

LOCK TABLES `Area` WRITE;
/*!40000 ALTER TABLE `Area` DISABLE KEYS */;
/*!40000 ALTER TABLE `Area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Association`
--

DROP TABLE IF EXISTS `Association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Association` (
  `ID` int NOT NULL,
  `Name` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Association`
--

LOCK TABLES `Association` WRITE;
/*!40000 ALTER TABLE `Association` DISABLE KEYS */;
INSERT INTO `Association` VALUES (1,'Jedi Order'),(2,'Mandalorian'),(3,'Sith Empire'),(4,'Smugglers'),(5,'Unaligned'),(6,'Hutt Cartel'),(7,'Republic'),(8,'Czerka'),(9,'Sith Order');
/*!40000 ALTER TABLE `Association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Attribute`
--

DROP TABLE IF EXISTS `Attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Attribute` (
  `ID` int NOT NULL,
  `NWNValue` int NOT NULL DEFAULT '0',
  `Name` varchar(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Attribute`
--

LOCK TABLES `Attribute` WRITE;
/*!40000 ALTER TABLE `Attribute` DISABLE KEYS */;
INSERT INTO `Attribute` VALUES (0,-1,'N/A'),(1,0,'STR'),(2,1,'DEX'),(3,2,'CON'),(4,3,'INT'),(5,4,'WIS'),(6,5,'CHA');
/*!40000 ALTER TABLE `Attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuthorizedDM`
--

DROP TABLE IF EXISTS `AuthorizedDM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AuthorizedDM` (
  `ID` int NOT NULL,
  `Name` varchar(255) NOT NULL,
  `CDKey` varchar(20) NOT NULL,
  `DMRole` int NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuthorizedDM`
--

LOCK TABLES `AuthorizedDM` WRITE;
/*!40000 ALTER TABLE `AuthorizedDM` DISABLE KEYS */;
INSERT INTO `AuthorizedDM` VALUES (1,'zunath','UPWVMPKM',2,1),(2,'Taelon','UPC6MP9M',1,1),(3,'Lestat','QRJKYLN3',1,1),(4,'Xeph','QRJYQNJW',1,0),(5,'Naia','Q6ULMXHV',1,0),(6,'Liareth','UPFXR3CW',1,0),(7,'Mithreas','UPFTJJUU',1,0),(8,'PILGRIM','QRHQQ333',1,0),(9,'Miskol','UPWVGDGY',1,1),(10,'Burl','QRMGNPY4',1,0),(11,'Missy/Chessa','QRJLKYHX',1,0),(12,'Amon/Lanari','QRR9WMY7',1,0),(13,'Seela / littlelilyflower','QRRGYQNX',1,0),(14,'Terallis','QRRHKCKP',1,0),(15,'Vennel','QR6UJWLN',1,1),(16,'TYK1','QRMJVGVK',1,1),(17,'TYK2','UPWNHFPR',1,1),(18,'Alice','UPWWRV4K',1,1);
/*!40000 ALTER TABLE `AuthorizedDM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Backgrounds`
--

DROP TABLE IF EXISTS `Backgrounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Backgrounds` (
  `ID` varchar(64) NOT NULL,
  `Name` varchar(64) NOT NULL DEFAULT '',
  `Description` varchar(512) NOT NULL DEFAULT '',
  `Bonuses` varchar(512) NOT NULL DEFAULT '',
  `IsActive` tinyint(1) NOT NULL DEFAULT '0',
  `ClusterID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CIX_Backgrounds_ID` (`ClusterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Backgrounds`
--

LOCK TABLES `Backgrounds` WRITE;
/*!40000 ALTER TABLE `Backgrounds` DISABLE KEYS */;
/*!40000 ALTER TABLE `Backgrounds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Bank`
--

DROP TABLE IF EXISTS `Bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Bank` (
  `ID` int NOT NULL,
  `AreaName` varchar(255) NOT NULL,
  `AreaTag` varchar(64) NOT NULL,
  `AreaResref` varchar(16) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bank`
--

LOCK TABLES `Bank` WRITE;
/*!40000 ALTER TABLE `Bank` DISABLE KEYS */;
/*!40000 ALTER TABLE `Bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BankItem`
--

DROP TABLE IF EXISTS `BankItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BankItem` (
  `ID` varchar(64) NOT NULL,
  `BankID` int NOT NULL,
  `PlayerID` varchar(64) NOT NULL,
  `ItemID` varchar(60) NOT NULL,
  `ItemName` longtext NOT NULL,
  `ItemTag` varchar(64) NOT NULL,
  `ItemResref` varchar(16) NOT NULL,
  `ItemObject` longtext NOT NULL,
  `DateStored` datetime(6) NOT NULL,
  `ClusterID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CIX_BankItem_ID` (`ClusterID`),
  UNIQUE KEY `UQ_BankItem_ItemID` (`ItemID`),
  KEY `IX_BankItem_PlayerID` (`PlayerID`,`BankID`,`DateStored`,`ItemID`,`ItemName`(255),`ItemObject`(255),`ItemResref`,`ItemTag`),
  KEY `FK_BankItem_BankID` (`BankID`),
  CONSTRAINT `FK_BankItem_BankID` FOREIGN KEY (`BankID`) REFERENCES `Bank` (`ID`),
  CONSTRAINT `FK_BankItem_PlayerID` FOREIGN KEY (`PlayerID`) REFERENCES `Player` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BankItem`
--

LOCK TABLES `BankItem` WRITE;
/*!40000 ALTER TABLE `BankItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `BankItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BaseItemType`
--

DROP TABLE IF EXISTS `BaseItemType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BaseItemType` (
  `ID` int NOT NULL,
  `Name` varchar(64) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BaseItemType`
--

LOCK TABLES `BaseItemType` WRITE;
/*!40000 ALTER TABLE `BaseItemType` DISABLE KEYS */;
INSERT INTO `BaseItemType` VALUES (-1,'Invalid'),(0,'shortsword'),(1,'longsword'),(2,'battleaxe'),(3,'bastardsword'),(4,'lightflail'),(5,'warhammer'),(6,'heavycrossbow'),(7,'lightcrossbow'),(8,'longbow'),(9,'lightmace'),(10,'halberd'),(11,'shortbow'),(12,'twobladedsword'),(13,'greatsword'),(14,'smallshield'),(15,'torch'),(16,'armor'),(17,'helmet'),(18,'greataxe'),(19,'amulet'),(20,'arrow'),(21,'belt'),(22,'dagger'),(23,'DELETED'),(24,'miscsmall'),(25,'bolt'),(26,'boots'),(27,'bullet'),(28,'club'),(29,'miscmedium'),(30,'DELETED'),(31,'dart'),(32,'diremace'),(33,'doubleaxe'),(34,'misclarge'),(35,'heavyflail'),(36,'gloves'),(37,'lighthammer'),(38,'handaxe'),(39,'healerskit'),(40,'kama'),(41,'katana'),(42,'kukri'),(43,'DELETED'),(44,'magicrod'),(45,'magicstaff'),(46,'magicwand'),(47,'morningstar'),(48,'DELETED'),(49,'potions'),(50,'quarterstaff'),(51,'rapier'),(52,'ring'),(53,'scimitar'),(54,'DELETED'),(55,'scythe'),(56,'largeshield'),(57,'towershield'),(58,'shortspear'),(59,'shuriken'),(60,'sickle'),(61,'sling'),(62,'thievestools'),(63,'throwingaxe'),(64,'trapkit'),(65,'key'),(66,'largebox'),(67,'DELETED'),(68,'DELETED'),(69,'cslashweapon'),(70,'cpiercweapon'),(71,'cbludgweapon'),(72,'cslshprcweap'),(73,'creatureitem'),(74,'book'),(75,'spellscroll'),(76,'ld'),(77,'gem'),(78,'bracer'),(79,'miscthin'),(80,'cloak'),(81,'grenade'),(82,'Encampment'),(83,'padding'),(84,'padding'),(85,'padding'),(86,'padding'),(87,'padding'),(88,'padding'),(89,'padding'),(90,'padding'),(91,'padding'),(92,'Lance'),(93,'Trumpet'),(94,'MoonOnAStick'),(95,'trident'),(96,'XP2SpecReq'),(97,'XP2SpecReq'),(98,'XP2SpecReq'),(99,'XP2SpecReq'),(100,'XP2SpecReq'),(101,'empty_potion'),(102,'blank_scroll'),(103,'blank_magicwand'),(104,'crafted_potion'),(105,'crafted_scroll'),(106,'crafted_magicwand'),(107,'XP2SpecialRequest'),(108,'dwarvenwaraxe'),(109,'craftcompbase'),(110,'craftcompsmall'),(111,'Whip'),(112,'craftbase');
/*!40000 ALTER TABLE `BaseItemType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BaseStructure`
--

DROP TABLE IF EXISTS `BaseStructure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BaseStructure` (
  `ID` int NOT NULL,
  `BaseStructureTypeID` int NOT NULL,
  `Name` varchar(64) NOT NULL DEFAULT '',
  `PlaceableResref` varchar(16) NOT NULL DEFAULT '',
  `ItemResref` varchar(16) NOT NULL DEFAULT '',
  `IsActive` tinyint(1) NOT NULL DEFAULT '0',
  `Power` double NOT NULL DEFAULT '0',
  `CPU` double NOT NULL DEFAULT '0',
  `Durability` double NOT NULL DEFAULT '0',
  `Storage` int NOT NULL DEFAULT '0',
  `HasAtmosphere` tinyint(1) NOT NULL DEFAULT '0',
  `ReinforcedStorage` int NOT NULL DEFAULT '0',
  `RequiresBasePower` tinyint(1) NOT NULL DEFAULT '0',
  `ResourceStorage` int NOT NULL DEFAULT '0',
  `RetrievalRating` int NOT NULL DEFAULT '0',
  `FuelRating` int NOT NULL DEFAULT '0',
  `DefaultStructureModeID` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `FK_BaseStructure_BaseStructureTypeID` (`BaseStructureTypeID`),
  KEY `FK_BaseStructure_DefaultStructureModeID` (`DefaultStructureModeID`),
  CONSTRAINT `FK_BaseStructure_BaseStructureTypeID` FOREIGN KEY (`BaseStructureTypeID`) REFERENCES `BaseStructureType` (`ID`),
  CONSTRAINT `FK_BaseStructure_DefaultStructureModeID` FOREIGN KEY (`DefaultStructureModeID`) REFERENCES `StructureMode` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BaseStructure`
--

LOCK TABLES `BaseStructure` WRITE;
/*!40000 ALTER TABLE `BaseStructure` DISABLE KEYS */;
INSERT INTO `BaseStructure` VALUES (1,1,'Small Control Tower','c_tower_small','control_tower',1,50,20,20,340,0,7200,1,10,0,1,0),(2,1,'Medium Control Tower','c_tower_medium','control_tower',1,125,50,40,360,0,7200,1,15,0,2,0),(3,1,'Large Control Tower','c_tower_large','control_tower',1,265,120,60,380,0,7200,1,20,0,3,0),(4,8,'Obelisk, Large','x0_obelisk','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(5,8,'Jukebox','jukebox','furniture',1,0,0,0,0,0,0,0,0,0,0,0),(6,8,'Obelisk, Small','nw_plc_seaobelsk','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(7,8,'Ladder, Light','x0_weatheredladd','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(8,8,'Ladder, Dark','x0_ladder','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(9,8,'Statue, Huge','x2_plc_statue_h','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(10,8,'Mining Well','x2_plc_minewell','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(11,11,'Molecular Reassembly Terminal','atom_reass','furniture',1,0,0,0,0,0,0,1,0,0,0,0),(12,8,'Statue, Wizard','x3_plc_gg001','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(13,8,'Gong','plc_gong','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(14,8,'Statue, Monster','plc_statue3','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(17,8,'Brazier, Stone','plc_brazier','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(18,8,'Statue, Guardian','plc_statue1','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(19,8,'Doorway, Metal','x0_doormetal','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(20,8,'Flaming Statue','x2_plc_statue_fl','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(21,8,'Brazier, Round','x3_plc_brazier','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(22,8,'Pedestal','plc_pedestal','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(23,8,'Rope Coil','nw_plc_ropecoil1','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(24,8,'Statue, Wyvern ','x3_plc_statuew','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(25,8,'Pedestal, Evil','x3_plc_pedestal','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(26,8,'Birdbath','plc_birdbath','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(27,8,'Sphinx Statue','x0_sphinxstatue','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(28,8,'Mining Well Platform','x2_plc_minewellb','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(29,8,'Pedestal, Sword','x3_plc_pedsword','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(30,8,'Doorway, Stone','x0_stonewalldoor','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(31,8,'Female Statue','x2_plc_statue_f','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(32,8,'Gnomish Contraption','plc_gnomcntrptn','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(33,8,'Pillar, Stone','plc_pillar3','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(35,8,'Statue of Lathander','x2_plc_statue_la','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(36,8,'Pillar, Flame','plc_pillar1','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(37,8,'Cage','plc_animalcage','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(38,8,'Lamp Post','plc_lamppost','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(39,8,'Torch Bracket','plc_freetorch','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(40,8,'Pillar, Wood','plc_pillar2','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(41,8,'Statue, Cyric','x3_plc_statuec','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(42,8,'Sea Idol','nw_plc_seaidol','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(43,8,'Fountain','plc_fountain','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(44,8,'Monster Statue','x2_plc_statue_mo','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(45,8,'Easel','plc_pntingeasel','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(47,8,'Keg','plc_keg','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(48,8,'Dran Statue ','x2_plc_statu_dra','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(51,8,'Net','nw_plc_net','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(52,8,'Bed, Extra Large','x0_largebed','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(54,8,'Carpet, Round, Blue','x0_roundrugorien','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(55,8,'Altar, Evil','plc_altrevil','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(56,8,'Table, Wood, Large','x3_plc_table002','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(57,8,'Table, Wood, With Fish','x3_plc_table001','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(58,8,'Table, Stone, Small','nw_plc_seatable','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(59,8,'Altar, Hand','plc_altrod','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(60,8,'Window','x0_window','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(61,8,'Cushions','x0_cushions','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(62,8,'Candle','nw_plc_candle1','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(64,8,'Bear Skin Rug','x0_bearskinrug1','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(65,8,'Chandelier','x0_chandelier','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(67,8,'Urn','plc_urn','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(68,8,'Altar, Stone','plc_altrneutral','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(69,8,'Cot','plc_cot','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(70,8,'Table, Wood','plc_table','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(72,8,'Throw Rug','plc_throwrug','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(73,8,'Table, Stone, Large','nw_plc_dwarftabl','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(74,8,'Bed, Stone, Yellow','nw_plc_dwarfbed','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(75,8,'Bed, Large','x0_beddouble','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(76,8,'Vase, Rounded','x0_vaseflower','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(77,8,'Carpet','x0_ruglarge','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(78,8,'Bed, Wood, Yellow','plc_bed','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(79,8,'Overgrown Pillar','x0_overgrownrui','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(80,8,'Tome','x0_tome','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(81,8,'Bird Cage','plc_birdcage','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(82,8,'Pillar, Wood, Dark','x3_plc_pillar1','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(83,8,'Bunk Bed','x2_plc_bunkbed','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(84,8,'Vase, Tall','x0_bigvase','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(85,8,'Bed Roll','plc_bedrolls','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(86,8,'Ottoman','x0_ottoman','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(88,8,'Pillar, Rounded','x0_ruinedpillar','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(89,8,'Painting 2','x0_painting2','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(90,8,'Candelabra','plc_candelabra','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(91,8,'Potted Plant','plc_pottedplant','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(92,8,'Painting 1','x0_painting','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(93,8,'Carpet, Fancy','x0_rugoriental','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(95,8,'Illithid Table','x2_plc_tablemind','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(96,8,'Carpet, Fancy, Smaller','x0_rugoriental2','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(97,8,'Drow Altar','x2_plc_drowaltar','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(98,8,'Dartboard','x3_plc_dartbrd','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(99,8,'Map','x0_maps','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(100,8,'Floor-anchored shackles','plc_flrshackles','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(101,8,'Round Wooden Table','x2_plc_tablernd','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(102,8,'Drow Bar','x2_plc_drowbar','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(103,8,'Shrine of Umberlee','nw_plc_shrnumbr1','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(104,8,'Rune Pillar','x0_runepillar','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(106,8,'Mirror','x2_plc_mirror','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(107,8,'Footstool','plc_footstool','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(108,8,'Drow Table','x2_plc_tabledrow','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(111,8,'Bench, Stone, Dwarven','bench_stonedwarf','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(112,8,'Illithid Chair','illithid_chair','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(113,8,'Bench, Wood','bench_wood','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(114,8,'Chair, Wood, Medium','chair_med_wood','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(115,8,'Bench, Large','bench_large','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(116,8,'Drow Chair','drow_chair','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(117,8,'Bench, Wood, Large','bench_largewood','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(118,8,'Bench, Wood, Small','bench_woodsmall','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(119,8,'Chair, Wood','chair_wood','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(120,8,'Chair, Wood, Small','chair_wood_small','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(121,8,'Throne, Wood','thronewood001','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(122,8,'Chair, Stone','chair_stone','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(123,8,'Bench, Wood, Small 2','bench_wood2','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(124,8,'Chair, Shell','chair_shell','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(125,8,'Couch, Wood, Yellow','couch_wood','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(126,12,'Barrel','elm_barrel','furniture',1,0,0,0,10,0,0,0,0,0,0,0),(129,12,'Crate','elm_barrel001','furniture',1,0,0,0,20,0,0,0,0,0,0,0),(132,12,'Book Shelf','elm_barrel002','furniture',1,0,0,0,15,0,0,0,0,0,0,0),(133,12,'Chest','elm_barrel003','furniture',1,0,0,0,30,0,0,0,0,0,0,0),(136,12,'Desk','elm_barrel004','furniture',1,0,0,0,15,0,0,0,0,0,0,0),(146,11,'Refinery','cft_forge','furniture',1,0,0,0,0,1,0,1,0,0,0,0),(147,11,'Armorsmith Workbench','armorsmith_bench','furniture',1,0,0,0,0,0,0,1,0,0,0,0),(148,11,'Weaponsmith Bench','weapon_bench','furniture',1,0,0,0,0,0,0,1,0,0,0,0),(149,11,'Cookpot','cookpot','furniture',1,0,0,0,0,0,0,1,0,0,0,0),(150,11,'Engineering Bench','engineer_bench','furniture',1,0,0,0,0,0,0,1,0,0,0,0),(152,8,'Mysterious Obelisk','myst_obelisk','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(153,5,'Small Building','','building',1,5,2,5,55,0,0,1,0,0,0,1),(154,5,'Medium Building','','building',1,11,5,15,65,0,0,1,0,0,0,1),(155,5,'Large Building','','building',1,17,10,25,75,0,0,1,0,0,0,1),(156,9,'Basic Stronidium Silo','stron_silo','silo',1,5,2,5,5,0,0,1,0,0,0,0),(157,9,'Stronidium Silo I','stron_silo','silo',1,9,3,5,10,0,0,1,0,0,0,0),(158,9,'Stronidium Silo II','stron_silo','silo',1,14,4,5,15,0,0,1,0,0,0,0),(159,9,'Stronidium Silo III','stron_silo','silo',1,18,5,5,20,0,0,1,0,0,0,0),(160,9,'Stronidium Silo IV','stron_silo','silo',1,24,6,5,25,0,0,1,0,0,0,0),(161,10,'Basic Fuel Silo','fuel_silo','silo',1,5,2,5,5,0,0,1,0,0,0,0),(162,10,'Fuel Silo I','fuel_silo','silo',1,9,3,5,10,0,0,1,0,0,0,0),(163,10,'Fuel Silo II','fuel_silo','silo',1,14,4,5,15,0,0,1,0,0,0,0),(164,10,'Fuel Silo III','fuel_silo','silo',1,18,5,5,20,0,0,1,0,0,0,0),(165,10,'Fuel Silo IV','fuel_silo','silo',1,24,6,5,25,0,0,1,0,0,0,0),(166,3,'Basic Resource Silo','resource_silo','silo',1,5,2,5,5,0,0,1,0,0,0,0),(167,3,'Resource Silo I','resource_silo','silo',1,9,3,5,10,0,0,1,0,0,0,0),(168,3,'Resource Silo II','resource_silo','silo',1,14,4,5,15,0,0,1,0,0,0,0),(169,3,'Resource Silo III','resource_silo','silo',1,18,5,5,20,0,0,1,0,0,0,0),(170,3,'Resource Silo IV','resource_silo','silo',1,24,6,5,25,0,0,1,0,0,0,0),(171,2,'Basic Resource Drill','resource_drill','drill',1,25,15,5,0,0,0,1,0,1,0,0),(172,2,'Resource Drill I','resource_drill','drill',1,30,20,5,0,0,0,1,0,2,0,0),(173,2,'Resource Drill II','resource_drill','drill',1,35,25,5,0,0,0,1,0,3,0,0),(174,2,'Resource Drill III','resource_drill','drill',1,40,30,5,0,0,0,1,0,4,0,0),(175,2,'Resource Drill IV','resource_drill','drill',1,45,35,5,0,0,0,1,0,5,0,0),(176,11,'Fabrication Terminal','fabrication_term','furniture',1,0,0,0,0,0,0,1,0,0,0,0),(177,11,'Medical Terminal','medical_term','furniture',1,0,0,0,0,0,0,1,0,0,0,0),(178,8,'Wookiee Rug','wookiee_rug','furniture',1,0,0,0,0,1,0,0,0,0,0,0),(179,7,'Starship Dock','starship_dock','silo',1,30,5,15,0,0,0,1,0,0,0,0),(180,13,'Starship: Light Freighter 1','starship1','starship',1,0,0,50,400,0,100,0,30,0,0,0),(181,13,'Starship: Light Escort 1','starship2','starship',1,0,0,50,400,0,300,0,10,0,0,0);
/*!40000 ALTER TABLE `BaseStructure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BaseStructureType`
--

DROP TABLE IF EXISTS `BaseStructureType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BaseStructureType` (
  `ID` int NOT NULL,
  `Name` varchar(64) NOT NULL DEFAULT '',
  `IsActive` tinyint(1) NOT NULL DEFAULT '0',
  `CanPlaceInside` tinyint(1) NOT NULL DEFAULT '0',
  `CanPlaceOutside` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BaseStructureType`
--

LOCK TABLES `BaseStructureType` WRITE;
/*!40000 ALTER TABLE `BaseStructureType` DISABLE KEYS */;
INSERT INTO `BaseStructureType` VALUES (1,'Control Tower',1,0,1),(2,'Drill',1,0,1),(3,'Resource Silo',1,0,1),(4,'Turret',1,0,1),(5,'Building',1,0,1),(6,'Mass Production',1,0,1),(7,'Starship Production',1,0,1),(8,'Furniture',1,1,0),(9,'Stronidium Silo',1,0,1),(10,'Fuel Silo',1,0,1),(11,'Crafting Device',1,1,0),(12,'Persistent Storage',1,1,0),(13,'Starship',1,0,1);
/*!40000 ALTER TABLE `BaseStructureType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BugReport`
--

DROP TABLE IF EXISTS `BugReport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BugReport` (
  `ID` varchar(64) NOT NULL,
  `SenderPlayerID` varchar(64) DEFAULT NULL,
  `CDKey` varchar(20) NOT NULL,
  `Text` varchar(1000) NOT NULL,
  `TargetName` varchar(64) NOT NULL,
  `AreaResref` varchar(16) NOT NULL,
  `SenderLocationX` double NOT NULL,
  `SenderLocationY` double NOT NULL,
  `SenderLocationZ` double NOT NULL,
  `SenderLocationOrientation` double NOT NULL,
  `DateSubmitted` datetime(6) NOT NULL,
  `ClusterID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CIX_BugReport_ID` (`ClusterID`),
  KEY `FK_BugReport_SenderPlayerID` (`SenderPlayerID`),
  CONSTRAINT `FK_BugReport_SenderPlayerID` FOREIGN KEY (`SenderPlayerID`) REFERENCES `Player` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BugReport`
--

LOCK TABLES `BugReport` WRITE;
/*!40000 ALTER TABLE `BugReport` DISABLE KEYS */;
/*!40000 ALTER TABLE `BugReport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BuildingStyle`
--

DROP TABLE IF EXISTS `BuildingStyle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BuildingStyle` (
  `ID` int NOT NULL,
  `Name` varchar(64) NOT NULL DEFAULT '',
  `Resref` varchar(16) NOT NULL DEFAULT '',
  `BaseStructureID` int DEFAULT NULL,
  `IsDefault` tinyint(1) NOT NULL DEFAULT '0',
  `DoorRule` varchar(64) NOT NULL DEFAULT '',
  `IsActive` tinyint(1) NOT NULL DEFAULT '0',
  `BuildingTypeID` int NOT NULL,
  `PurchasePrice` int NOT NULL DEFAULT '0',
  `DailyUpkeep` int NOT NULL DEFAULT '0',
  `FurnitureLimit` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `FK_BuildingStyle_BaseStructureID` (`BaseStructureID`),
  KEY `FK_BuildingStyle_BuildingTypeID` (`BuildingTypeID`),
  CONSTRAINT `FK_BuildingStyle_BaseStructureID` FOREIGN KEY (`BaseStructureID`) REFERENCES `BaseStructure` (`ID`),
  CONSTRAINT `FK_BuildingStyle_BuildingTypeID` FOREIGN KEY (`BuildingTypeID`) REFERENCES `BuildingType` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BuildingStyle`
--

LOCK TABLES `BuildingStyle` WRITE;
/*!40000 ALTER TABLE `BuildingStyle` DISABLE KEYS */;
INSERT INTO `BuildingStyle` VALUES (1,'Small Style 1 - Interior','house_int_1',153,1,'',1,2,0,0,0),(2,'Old House - Exterior','old_house',153,0,'OldHouseRule',0,1,0,0,0),(3,'Medium Style 1 - Interior','house_int_2',154,1,'',1,2,0,0,0),(4,'Large Style 1 - Interior','house_int_3',155,1,'',1,2,0,0,0),(5,'Small Round Building','house_ext_1',153,1,'SmallRoundBuildingRule',1,1,0,0,0),(6,'Medium Round Building','house_ext_2',154,1,'MediumRoundBuildingRule',1,1,0,0,0),(7,'Large Square Building','house_ext_3',155,1,'LargeSquareBuildingRule',1,1,0,0,0),(8,'Small Apartment Style 1','apartment_002',NULL,1,'',1,3,1000,100,30),(9,'Medium Apartment Style 1','apartment_2',NULL,0,'',1,3,1500,200,40),(10,'Large Apartment Style 1','apartment_3',NULL,0,'',1,3,2000,300,50),(11,'Small Style 2 - Interior','house_int_4',153,0,'',1,2,0,0,0),(12,'Medium Style 2 - Interior','house_int_5',154,0,'',1,2,0,0,0),(13,'Large Style 2 - Interior','house_int_6',155,0,'',1,2,0,0,0),(14,'Small Style 3 - Interior','house_int_7',153,0,'',1,2,0,0,0),(15,'Medium Style 3 - Interior','house_int_8',154,0,'',1,2,0,0,0),(16,'Large Style 3 - Interior','house_int_9',155,0,'',1,2,0,0,0),(17,'Small Style 4 - Interior','house_int_10',153,0,'',1,2,0,0,0),(18,'Medium Style 4 - Interior','house_int_11',154,0,'',1,2,0,0,0),(19,'Large Style 4 - Interior','house_int_12',155,0,'',1,2,0,0,0),(20,'Light Freighter 1','starship1',180,1,'Starship1Rule',1,1,0,0,0),(21,'Light Escort 1','starship2',181,1,'Starship2Rule',1,1,0,0,0),(22,'Light Freighter 1 Interior','starship1_int',180,1,'',1,4,0,0,60),(23,'Light Escort 1 Interior','starship2_int',181,1,'',1,4,0,0,45);
/*!40000 ALTER TABLE `BuildingStyle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BuildingType`
--

DROP TABLE IF EXISTS `BuildingType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BuildingType` (
  `ID` int NOT NULL,
  `Name` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BuildingType`
--

LOCK TABLES `BuildingType` WRITE;
/*!40000 ALTER TABLE `BuildingType` DISABLE KEYS */;
INSERT INTO `BuildingType` VALUES (1,'Exterior'),(2,'Interior'),(3,'Apartment'),(4,'Starship');
/*!40000 ALTER TABLE `BuildingType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ChatChannel`
--

DROP TABLE IF EXISTS `ChatChannel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ChatChannel` (
  `ID` int NOT NULL,
  `Name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ChatChannel`
--

LOCK TABLES `ChatChannel` WRITE;
/*!40000 ALTER TABLE `ChatChannel` DISABLE KEYS */;
INSERT INTO `ChatChannel` VALUES (1,'Shout'),(2,'Whisper'),(3,'Talk'),(4,'Party'),(5,'DM'),(6,'Tell'),(7,'Server');
/*!40000 ALTER TABLE `ChatChannel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ChatLog`
--

DROP TABLE IF EXISTS `ChatLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ChatLog` (
  `ID` varchar(64) NOT NULL,
  `ChatChannelID` int NOT NULL,
  `SenderPlayerID` varchar(64) DEFAULT NULL,
  `SenderAccountName` varchar(1024) NOT NULL DEFAULT '',
  `SenderCDKey` varchar(20) NOT NULL DEFAULT '',
  `ReceiverPlayerID` varchar(64) DEFAULT NULL,
  `ReceiverAccountName` varchar(1024) DEFAULT NULL,
  `ReceiverCDKey` varchar(20) DEFAULT NULL,
  `Message` longtext NOT NULL,
  `DateSent` datetime(6) NOT NULL,
  `SenderDMName` varchar(300) DEFAULT NULL,
  `ReceiverDMName` varchar(300) DEFAULT NULL,
  `ClusterID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CIX_ChatLog_ID` (`ClusterID`),
  KEY `fk_ChatLog_ChatChannelID` (`ChatChannelID`),
  KEY `fk_ChatLog_SenderPlayerID` (`SenderPlayerID`),
  KEY `fk_ChatLog_ReceiverPlayerID` (`ReceiverPlayerID`),
  CONSTRAINT `fk_ChatLog_ChatChannelID` FOREIGN KEY (`ChatChannelID`) REFERENCES `ChatChannel` (`ID`),
  CONSTRAINT `fk_ChatLog_ReceiverPlayerID` FOREIGN KEY (`ReceiverPlayerID`) REFERENCES `Player` (`ID`),
  CONSTRAINT `fk_ChatLog_SenderPlayerID` FOREIGN KEY (`SenderPlayerID`) REFERENCES `Player` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ChatLog`
--

LOCK TABLES `ChatLog` WRITE;
/*!40000 ALTER TABLE `ChatLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `ChatLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ComponentType`
--

DROP TABLE IF EXISTS `ComponentType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ComponentType` (
  `ID` int NOT NULL,
  `Name` varchar(32) NOT NULL DEFAULT '',
  `ReassembledResref` varchar(16) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ComponentType`
--

LOCK TABLES `ComponentType` WRITE;
/*!40000 ALTER TABLE `ComponentType` DISABLE KEYS */;
INSERT INTO `ComponentType` VALUES (0,'Invalid',''),(1,'Raw Ore',''),(2,'Metal','ass_metal'),(3,'Organic Material','ass_organic'),(4,'Small Blade',''),(5,'Medium Blade',''),(6,'Large Blade',''),(7,'Shaft',''),(8,'Small Handle',''),(9,'Medium Handle',''),(10,'Large Handle',''),(11,'Enhancement',''),(12,'Fiberplast','ass_fiberplast'),(13,'Leather','ass_leather'),(14,'Padding',''),(15,'Electronics','ass_electronics'),(16,'Wood Baton Frame',''),(17,'Metal Baton Frame',''),(18,'Ranged Weapon Core',''),(19,'Rifle Barrel',''),(20,'Pistol Barrel',''),(21,'Power Crystal','ass_powcry'),(22,'Saber Hilt',''),(23,'Seeds',''),(24,'Blue Crystal','ass_bluecry'),(25,'Red Crystal','ass_redcry'),(26,'Green Crystal','ass_greencry'),(27,'Yellow Crystal','ass_yellowcry'),(28,'Blue Crystal Cluster',''),(29,'Red Crystal Cluster',''),(30,'Green Crystal Cluster',''),(31,'Yellow Crystal Cluster',''),(32,'Power Crystal Cluster',''),(33,'Heavy Armor Core',''),(34,'Light Armor Core',''),(35,'Force Armor Core',''),(36,'Heavy Armor Segment',''),(37,'Light Armor Segment',''),(38,'Force Armor Segment',''),(39,'Small Structure Frame',''),(40,'Medium Structure Frame',''),(41,'Large Structure Frame',''),(42,'Computing Module',''),(43,'Construction Parts',''),(44,'Mainframe',''),(45,'Power Relay',''),(46,'Power Core',''),(47,'Ingredient',''),(48,'Herb','ass_herb'),(49,'Carbosyrup',''),(50,'Meat',''),(51,'Cereal',''),(52,'Grain',''),(53,'Vegetable',''),(54,'Water',''),(55,'Curry Paste',''),(56,'Soup',''),(57,'Spiced Milk',''),(58,'Dough',''),(59,'Butter',''),(60,'Noodles',''),(61,'Eggs',''),(62,'Emitter',''),(63,'Hyperdrive',''),(64,'Hull Plating',''),(65,'Starship Weapon','');
/*!40000 ALTER TABLE `ComponentType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CooldownCategory`
--

DROP TABLE IF EXISTS `CooldownCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CooldownCategory` (
  `ID` int NOT NULL,
  `Name` varchar(64) NOT NULL DEFAULT '',
  `BaseCooldownTime` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CooldownCategory`
--

LOCK TABLES `CooldownCategory` WRITE;
/*!40000 ALTER TABLE `CooldownCategory` DISABLE KEYS */;
INSERT INTO `CooldownCategory` VALUES (1,'Evasiveness',60),(2,'Force Speed',600),(3,'Knockdown',60),(4,'Absorb Energy',600),(5,'Force Body',600),(6,'Mind Shield',300),(7,'Rage',600),(8,'Force Persuade',600),(9,'Confusion',600),(10,'Force Stun',600),(11,'Sith Alchemy',600),(12,'Throw Saber',10),(13,'Rest/Meditate',300),(14,'Provoke',30),(15,'Sneak Attack',300),(16,'Premonition',600),(17,'Comprehend Speech',600),(18,'Cross-Cut',300),(19,'Hide',300),(20,'Force Detection',600),(21,'Farseeing',600),(22,'Shield Boost',300),(23,'Recovery Blast',600),(24,'Leg Shot',300),(25,'Tranquilizer',120),(26,'Mass Tranquilizer',300),(27,'Precise Toss',300),(28,'Battle/Force Insight',600),(29,'Dash',300),(30,'Electric Fist',300),(31,'Plasma Cell',300),(32,'Chi',300),(33,'Stance',600),(34,'Animal Bond',600),(35,'Drain Life',12),(36,'Force Lightning',12),(37,'Force Push',10),(38,'Force Breach',10),(40,'Skewer',300);
/*!40000 ALTER TABLE `CooldownCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CraftBlueprint`
--

DROP TABLE IF EXISTS `CraftBlueprint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CraftBlueprint` (
  `ID` int NOT NULL,
  `CraftCategoryID` int NOT NULL,
  `BaseLevel` int NOT NULL,
  `ItemName` varchar(64) NOT NULL,
  `ItemResref` varchar(16) NOT NULL,
  `Quantity` int NOT NULL,
  `SkillID` int NOT NULL,
  `CraftDeviceID` int NOT NULL,
  `PerkID` int DEFAULT NULL,
  `RequiredPerkLevel` int NOT NULL DEFAULT '0',
  `IsActive` tinyint(1) NOT NULL DEFAULT '0',
  `MainComponentTypeID` int NOT NULL,
  `MainMinimum` int NOT NULL DEFAULT '0',
  `SecondaryComponentTypeID` int NOT NULL,
  `SecondaryMinimum` int NOT NULL DEFAULT '0',
  `TertiaryComponentTypeID` int NOT NULL,
  `TertiaryMinimum` int NOT NULL DEFAULT '0',
  `EnhancementSlots` int NOT NULL DEFAULT '0',
  `MainMaximum` int NOT NULL DEFAULT '0',
  `SecondaryMaximum` int NOT NULL DEFAULT '0',
  `TertiaryMaximum` int NOT NULL DEFAULT '0',
  `BaseStructureID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK__CraftBlue__BaseS__4A18FC72` (`BaseStructureID`),
  KEY `fk_CraftBlueprint_MainComponentTypeID` (`MainComponentTypeID`),
  KEY `fk_CraftBlueprint_SecondaryComponentTypeID` (`SecondaryComponentTypeID`),
  KEY `fk_CraftBlueprint_TertiaryComponentTypeID` (`TertiaryComponentTypeID`),
  KEY `fk_CraftBlueprint_CraftCategoryID` (`CraftCategoryID`),
  KEY `FK_CraftBlueprint_SkillID` (`SkillID`),
  KEY `FK_CraftBlueprint_CraftDeviceID` (`CraftDeviceID`),
  KEY `FK_CraftBlueprint_PerkID` (`PerkID`),
  CONSTRAINT `FK__CraftBlue__BaseS__4A18FC72` FOREIGN KEY (`BaseStructureID`) REFERENCES `BaseStructure` (`ID`),
  CONSTRAINT `fk_CraftBlueprint_CraftCategoryID` FOREIGN KEY (`CraftCategoryID`) REFERENCES `CraftBlueprintCategory` (`ID`),
  CONSTRAINT `FK_CraftBlueprint_CraftDeviceID` FOREIGN KEY (`CraftDeviceID`) REFERENCES `CraftDevice` (`ID`),
  CONSTRAINT `fk_CraftBlueprint_MainComponentTypeID` FOREIGN KEY (`MainComponentTypeID`) REFERENCES `ComponentType` (`ID`),
  CONSTRAINT `FK_CraftBlueprint_PerkID` FOREIGN KEY (`PerkID`) REFERENCES `Perk` (`ID`),
  CONSTRAINT `fk_CraftBlueprint_SecondaryComponentTypeID` FOREIGN KEY (`SecondaryComponentTypeID`) REFERENCES `ComponentType` (`ID`),
  CONSTRAINT `FK_CraftBlueprint_SkillID` FOREIGN KEY (`SkillID`) REFERENCES `Skill` (`ID`),
  CONSTRAINT `fk_CraftBlueprint_TertiaryComponentTypeID` FOREIGN KEY (`TertiaryComponentTypeID`) REFERENCES `ComponentType` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CraftBlueprint`
--

LOCK TABLES `CraftBlueprint` WRITE;
/*!40000 ALTER TABLE `CraftBlueprint` DISABLE KEYS */;
INSERT INTO `CraftBlueprint` VALUES (1,5,5,'Basic Heavy Vibroblade GA','greataxe_b',1,12,2,NULL,0,1,6,1,10,1,0,0,2,2,2,0,NULL),(2,5,7,'Heavy Vibroblade GA1','greataxe_1',1,12,2,84,1,1,6,1,10,1,0,0,3,2,2,0,NULL),(3,5,12,'Heavy Vibroblade GA2','greataxe_2',1,12,2,84,3,1,6,1,10,1,0,0,4,2,2,0,NULL),(4,5,17,'Heavy Vibroblade GA3','greataxe_3',1,12,2,84,5,1,6,1,10,1,0,0,5,2,2,0,NULL),(5,5,22,'Heavy Vibroblade GA4','greataxe_4',1,12,2,84,7,1,6,1,10,1,0,0,6,2,2,0,NULL),(6,1,6,'Basic Vibroblade BA','battleaxe_b',1,12,2,NULL,0,1,5,1,9,1,0,0,1,2,2,0,NULL),(7,1,8,'Vibroblade BA1','battleaxe_1',1,12,2,84,1,1,5,1,9,1,0,0,2,2,2,0,NULL),(8,1,13,'Vibroblade BA2','battleaxe_2',1,12,2,84,3,1,5,1,9,1,0,0,3,2,2,0,NULL),(9,1,18,'Vibroblade BA3','battleaxe_3',1,12,2,84,5,1,5,1,9,1,0,0,4,2,2,0,NULL),(10,1,23,'Vibroblade BA4','battleaxe_4',1,12,2,84,7,1,5,1,9,1,0,0,5,2,2,0,NULL),(11,1,5,'Basic Vibroblade BS','bst_sword_b',1,12,2,NULL,0,1,5,1,9,1,0,0,1,2,2,0,NULL),(12,1,7,'Vibroblade BS1','bst_sword_1',1,12,2,84,1,1,5,1,9,1,0,0,2,2,2,0,NULL),(13,1,12,'Vibroblade BS2','bst_sword_2',1,12,2,84,3,1,5,1,9,1,0,0,3,2,2,0,NULL),(14,1,17,'Vibroblade BS3','bst_sword_3',1,12,2,84,5,1,5,1,9,1,0,0,4,2,2,0,NULL),(15,1,22,'Vibroblade BS4','bst_sword_4',1,12,2,84,7,1,5,1,9,1,0,0,5,2,2,0,NULL),(16,2,0,'Basic Finesse Vibroblade D','dagger_b',1,12,2,NULL,0,1,4,1,8,1,0,0,1,2,2,0,NULL),(17,2,5,'Finesse Vibroblade D1','dagger_1',1,12,2,84,1,1,4,1,8,1,0,0,2,2,2,0,NULL),(18,2,10,'Finesse Vibroblade D2','dagger_2',1,12,2,84,3,1,4,1,8,1,0,0,3,2,2,0,NULL),(19,2,15,'Finesse Vibroblade D3','dagger_3',1,12,2,84,5,1,4,1,8,1,0,0,4,2,2,0,NULL),(20,2,20,'Finesse Vibroblade D4','dagger_4',1,12,2,84,7,1,4,1,8,1,0,0,5,2,2,0,NULL),(21,5,7,'Basic Heavy Vibroblade GS','greatsword_b',1,12,2,NULL,0,1,6,1,10,1,0,0,2,2,2,0,NULL),(22,5,8,'Heavy Vibroblade GS1','greatsword_1',1,12,2,84,1,1,6,1,10,1,0,0,3,2,2,0,NULL),(23,5,13,'Heavy Vibroblade GS2','greatsword_2',1,12,2,84,3,1,6,1,10,1,0,0,4,2,2,0,NULL),(24,5,18,'Heavy Vibroblade GS3','greatsword_3',1,12,2,84,5,1,6,1,10,1,0,0,5,2,2,0,NULL),(25,5,23,'Heavy Vibroblade GS4','greatsword_4',1,12,2,84,7,1,6,1,10,1,0,0,6,2,2,0,NULL),(26,1,2,'Basic Vibroblade LS','longsword_b',1,12,2,NULL,0,1,5,1,9,1,0,0,1,2,2,0,NULL),(27,1,6,'Vibroblade LS1','longsword_1',1,12,2,84,1,1,5,1,9,1,0,0,2,2,2,0,NULL),(28,1,11,'Vibroblade LS2','longsword_2',1,12,2,84,3,1,5,1,9,1,0,0,3,2,2,0,NULL),(29,1,16,'Vibroblade LS3','longsword_3',1,12,2,84,5,1,5,1,9,1,0,0,4,2,2,0,NULL),(30,1,21,'Vibroblade LS4','longsword_4',1,12,2,84,7,1,5,1,9,1,0,0,5,2,2,0,NULL),(31,2,6,'Basic Finesse Vibroblade R','rapier_b',1,12,2,NULL,0,1,5,1,9,1,0,0,1,2,2,0,NULL),(32,2,8,'Finesse Vibroblade R1','rapier_1',1,12,2,84,1,1,5,1,9,1,0,0,2,2,2,0,NULL),(33,2,13,'Finesse Vibroblade R2','rapier_2',1,12,2,84,3,1,5,1,9,1,0,0,3,2,2,0,NULL),(34,2,18,'Finesse Vibroblade R3','rapier_3',1,12,2,84,5,1,5,1,9,1,0,0,4,2,2,0,NULL),(35,2,23,'Finesse Vibroblade R4','rapier_4',1,12,2,84,7,1,5,1,9,1,0,0,5,2,2,0,NULL),(36,1,4,'Basic Vibroblade K','katana_b',1,12,2,NULL,0,1,5,1,9,1,0,0,1,2,2,0,NULL),(37,1,7,'Vibroblade K1','katana_1',1,12,2,84,1,1,5,1,9,1,0,0,2,2,2,0,NULL),(38,1,12,'Vibroblade K2','katana_2',1,12,2,84,3,1,5,1,9,1,0,0,3,2,2,0,NULL),(39,1,17,'Vibroblade K3','katana_3',1,12,2,84,5,1,5,1,9,1,0,0,4,2,2,0,NULL),(40,1,22,'Vibroblade K4','katana_4',1,12,2,84,7,1,5,1,9,1,0,0,5,2,2,0,NULL),(41,2,4,'Basic Finesse Vibroblade SS','shortsword_b',1,12,2,NULL,0,1,4,1,8,1,0,0,1,2,2,0,NULL),(42,2,7,'Finesse Vibroblade SS1','shortsword_1',1,12,2,84,1,1,4,1,8,1,0,0,2,2,2,0,NULL),(43,2,12,'Finesse Vibroblade SS2','shortsword_2',1,12,2,84,3,1,4,1,8,1,0,0,3,2,2,0,NULL),(44,2,17,'Finesse Vibroblade SS3','shortsword_3',1,12,2,84,5,1,4,1,8,1,0,0,4,2,2,0,NULL),(45,2,22,'Finesse Vibroblade SS4','shortsword_4',1,12,2,84,7,1,4,1,8,1,0,0,5,2,2,0,NULL),(46,3,1,'Basic Baton C','club_b',1,12,2,NULL,0,1,16,1,8,1,0,0,1,2,2,0,NULL),(47,3,4,'Baton C1','club_1',1,12,2,84,1,1,16,1,8,1,0,0,2,2,2,0,NULL),(48,3,9,'Baton C2','club_2',1,12,2,84,3,1,16,1,8,1,0,0,3,2,2,0,NULL),(49,3,14,'Baton C3','club_3',1,12,2,84,5,1,16,1,8,1,0,0,4,2,2,0,NULL),(50,3,19,'Baton C4','club_4',1,12,2,84,7,1,16,1,8,1,0,0,5,2,2,0,NULL),(51,3,1,'Basic Baton M','mace_b',1,12,2,NULL,0,1,17,1,8,1,0,0,1,2,2,0,NULL),(52,3,5,'Baton M1','mace_1',1,12,2,84,1,1,17,1,8,1,0,0,2,2,2,0,NULL),(53,3,10,'Baton M2','mace_2',1,12,2,84,3,1,17,1,8,1,0,0,3,2,2,0,NULL),(54,3,15,'Baton M3','mace_3',1,12,2,84,5,1,17,1,8,1,0,0,4,2,2,0,NULL),(55,3,20,'Baton M4','mace_4',1,12,2,84,7,1,17,1,8,1,0,0,5,2,2,0,NULL),(56,3,3,'Basic Baton MS','morningstar_b',1,12,2,NULL,0,1,17,1,9,1,0,0,1,2,2,0,NULL),(57,3,6,'Baton MS1','morningstar_1',1,12,2,84,1,1,17,1,9,1,0,0,2,2,2,0,NULL),(58,3,11,'Baton MS2','morningstar_2',1,12,2,84,3,1,17,1,9,1,0,0,3,2,2,0,NULL),(59,3,16,'Baton MS3','morningstar_3',1,12,2,84,5,1,17,1,9,1,0,0,4,2,2,0,NULL),(60,3,21,'Baton MS4','morningstar_4',1,12,2,84,7,1,17,1,9,1,0,0,5,2,2,0,NULL),(61,9,0,'Basic Quarterstaff','quarterstaff_b',1,12,2,NULL,0,1,7,1,10,1,0,0,2,2,2,0,NULL),(62,9,5,'Quarterstaff I','quarterstaff_1',1,12,2,84,1,1,7,1,10,1,0,0,3,2,2,0,NULL),(63,9,10,'Quarterstaff II','quarterstaff_2',1,12,2,84,3,1,7,1,10,1,0,0,4,2,2,0,NULL),(64,9,15,'Quarterstaff III','quarterstaff_3',1,12,2,84,5,1,7,1,10,1,0,0,5,2,2,0,NULL),(65,9,20,'Quarterstaff IV','quarterstaff_4',1,12,2,84,7,1,7,1,10,1,0,0,6,2,2,0,NULL),(66,7,7,'Basic Twin Vibroblade DA','doubleaxe_b',1,12,2,NULL,0,1,6,2,10,1,0,0,2,4,2,0,NULL),(67,7,8,'Twin Vibroblade DA1','doubleaxe_1',1,12,2,84,1,1,6,2,10,1,0,0,3,4,2,0,NULL),(68,7,13,'Twin Vibroblade DA2','doubleaxe_2',1,12,2,84,3,1,6,2,10,1,0,0,4,4,2,0,NULL),(69,7,18,'Twin Vibroblade DA3','doubleaxe_3',1,12,2,84,5,1,6,2,10,1,0,0,5,4,2,0,NULL),(70,7,23,'Twin Vibroblade DA4','doubleaxe_4',1,12,2,84,7,1,6,2,10,1,0,0,6,4,2,0,NULL),(71,7,5,'Basic Twin Vibroblade TS','twinblade_b',1,12,2,NULL,0,1,6,2,10,1,0,0,2,4,2,0,NULL),(72,7,7,'Twin Vibroblade TS1','twinblade_1',1,12,2,84,1,1,6,2,10,1,0,0,3,4,2,0,NULL),(73,7,12,'Twin Vibroblade TS2','twinblade_2',1,12,2,84,3,1,6,2,10,1,0,0,4,4,2,0,NULL),(74,7,17,'Twin Vibroblade TS3','twinblade_3',1,12,2,84,5,1,6,2,10,1,0,0,5,4,2,0,NULL),(75,7,22,'Twin Vibroblade TS4','twinblade_4',1,12,2,84,7,1,6,2,10,1,0,0,6,4,2,0,NULL),(76,2,2,'Basic Finesse Vibroblade K','kukri_b',1,12,2,NULL,0,1,5,1,9,1,0,0,1,2,2,0,NULL),(77,2,6,'Finesse Vibroblade K1','kukri_1',1,12,2,84,1,1,5,1,9,1,0,0,2,2,2,0,NULL),(78,2,11,'Finesse Vibroblade K2','kukri_2',1,12,2,84,3,1,5,1,9,1,0,0,3,2,2,0,NULL),(79,2,16,'Finesse Vibroblade K3','kukri_3',1,12,2,84,5,1,5,1,9,1,0,0,4,2,2,0,NULL),(80,2,21,'Finesse Vibroblade K4','kukri_4',1,12,2,84,7,1,5,1,9,1,0,0,5,2,2,0,NULL),(81,6,7,'Basic Polearm H','halberd_b',1,12,2,NULL,0,1,6,1,10,1,0,0,2,2,2,0,NULL),(82,6,8,'Polearm H1','halberd_1',1,12,2,84,1,1,6,1,10,1,0,0,3,2,2,0,NULL),(83,6,13,'Polearm H2','halberd_2',1,12,2,84,3,1,6,1,10,1,0,0,4,2,2,0,NULL),(84,6,18,'Polearm H3','halberd_3',1,12,2,84,5,1,6,1,10,1,0,0,5,2,2,0,NULL),(85,6,23,'Polearm H4','halberd_4',1,12,2,84,7,1,6,1,10,1,0,0,6,2,2,0,NULL),(86,6,5,'Basic Polearm S','spear_b',1,12,2,NULL,0,1,6,1,10,1,0,0,2,2,2,0,NULL),(87,6,7,'Polearm S1','spear_1',1,12,2,84,1,1,6,1,10,1,0,0,3,2,2,0,NULL),(88,6,12,'Polearm S2','spear_2',1,12,2,84,3,1,6,1,10,1,0,0,4,2,2,0,NULL),(89,6,17,'Polearm S3','spear_3',1,12,2,84,5,1,6,1,10,1,0,0,5,2,2,0,NULL),(90,6,22,'Polearm S4','spear_4',1,12,2,84,7,1,6,1,10,1,0,0,6,2,2,0,NULL),(91,13,1,'Small Blade','small_blade',1,12,2,NULL,0,1,2,1,0,0,0,0,0,4,0,0,NULL),(92,13,2,'Medium Blade','medium_blade',1,12,2,NULL,0,1,2,1,0,0,0,0,0,5,0,0,NULL),(93,13,3,'Large Blade','large_blade',1,12,2,NULL,0,1,2,1,0,0,0,0,0,6,0,0,NULL),(94,13,0,'Wood Baton Frame','w_baton_frame',1,12,2,NULL,0,1,3,2,0,0,0,0,0,4,0,0,NULL),(95,13,2,'Metal Baton Frame','m_baton_frame',1,12,2,NULL,0,1,2,2,0,0,0,0,0,4,0,0,NULL),(96,13,2,'Shaft','shaft',1,12,2,NULL,0,1,3,3,0,0,0,0,0,6,0,0,NULL),(97,13,1,'Small Handle','small_handle',1,12,2,NULL,0,1,3,2,0,0,0,0,0,2,0,0,NULL),(98,13,1,'Medium Handle','medium_handle',1,12,2,NULL,0,1,3,3,0,0,0,0,0,3,0,0,NULL),(99,13,3,'Large Handle','large_handle',1,12,2,NULL,0,1,3,4,0,0,0,0,0,4,0,0,NULL),(100,13,3,'Ranged Weapon Core','r_weapon_core',1,22,4,NULL,0,1,2,2,15,1,0,0,0,4,2,0,NULL),(101,13,2,'Rifle Barrel','rifle_barrel',1,22,4,NULL,0,1,2,3,0,0,0,0,0,3,0,0,NULL),(102,13,1,'Pistol Barrel','pistol_barrel',1,22,4,NULL,0,1,2,2,0,0,0,0,0,2,0,0,NULL),(103,11,3,'Basic Blaster Rifle','rifle_b',1,22,4,NULL,0,1,18,1,19,1,0,0,2,2,2,0,NULL),(104,11,6,'Blaster Rifle I','rifle_1',1,22,4,96,1,1,18,1,19,1,0,0,3,2,2,0,NULL),(105,11,11,'Blaster Rifle II','rifle_2',1,22,4,96,3,1,18,1,19,1,0,0,4,2,2,0,NULL),(106,11,16,'Blaster Rifle III','rifle_3',1,22,4,96,5,1,18,1,19,1,0,0,5,2,2,0,NULL),(107,11,21,'Blaster Rifle IV','rifle_4',1,22,4,96,7,1,18,1,19,1,0,0,6,2,2,0,NULL),(108,10,1,'Basic Blaster Pistol','blaster_b',1,22,4,NULL,0,1,18,1,20,1,0,0,2,2,2,0,NULL),(109,10,5,'Blaster Pistol I','blaster_1',1,22,4,96,1,1,18,1,20,1,0,0,3,2,2,0,NULL),(110,10,10,'Blaster Pistol II','blaster_2',1,22,4,96,3,1,18,1,20,1,0,0,4,2,2,0,NULL),(111,10,15,'Blaster Pistol III','blaster_3',1,22,4,96,5,1,18,1,20,1,0,0,5,2,2,0,NULL),(112,10,20,'Blaster Pistol IV','blaster_4',1,22,4,96,7,1,18,1,20,1,0,0,6,2,2,0,NULL),(113,13,1,'Green Crystal Cluster','c_cluster_green',1,22,4,NULL,0,1,26,4,0,0,0,0,0,4,0,0,NULL),(114,13,1,'Blue Crystal Cluster','c_cluster_blue',1,22,4,NULL,0,1,24,4,0,0,0,0,0,4,0,0,NULL),(115,13,1,'Red Crystal Cluster','c_cluster_red',1,22,4,NULL,0,1,25,4,0,0,0,0,0,4,0,0,NULL),(116,13,1,'Yellow Crystal Cluster','c_cluster_yellow',1,22,4,NULL,0,1,27,4,0,0,0,0,0,4,0,0,NULL),(117,14,9,'Attack Bonus +1','rune_ab1',1,22,4,96,1,1,29,1,0,0,0,0,0,2,0,0,NULL),(118,14,8,'Constitution +1','rune_con1',1,22,4,96,1,1,29,1,0,0,0,0,0,2,0,0,NULL),(119,14,9,'Dexterity +1','rune_dex1',1,22,4,96,1,1,29,1,0,0,0,0,0,2,0,0,NULL),(120,14,10,'Strength +1','rune_str1',1,22,4,96,1,1,29,1,0,0,0,0,0,2,0,0,NULL),(121,15,11,'Cooldown Reduction +1','rune_cstspd1',1,22,4,96,1,1,28,1,0,0,0,0,0,2,0,0,NULL),(122,15,8,'Charisma +1','rune_cha1',1,22,4,96,1,1,28,1,0,0,0,0,0,2,0,0,NULL),(123,15,9,'Intelligence +1','rune_int1',1,22,4,96,1,1,28,1,0,0,0,0,0,2,0,0,NULL),(124,15,10,'Wisdom +1','rune_wis1',1,22,4,96,1,1,28,1,0,0,0,0,0,2,0,0,NULL),(125,14,15,'Damage +1','rune_dmg1',1,22,4,96,1,1,29,1,0,0,0,0,0,2,0,0,NULL),(126,14,14,'Hit Points +5','rune_hp1',1,22,4,96,1,1,29,1,0,0,0,0,0,2,0,0,NULL),(127,17,16,'Armor Class +1','rune_ac1',1,22,4,96,1,1,31,1,0,0,0,0,0,2,0,0,NULL),(128,15,15,'Light Potency +1','rune_alt1',1,22,4,96,1,0,28,1,0,0,0,0,0,2,0,0,NULL),(129,15,15,'Dark Potency +1','rune_evo1',1,22,4,96,1,0,28,1,0,0,0,0,0,2,0,0,NULL),(130,15,14,'FP +5','rune_mana1',1,22,4,96,1,1,28,1,0,0,0,0,0,2,0,0,NULL),(131,16,14,'Cooking +1','rune_cooking1',1,22,4,96,1,1,30,1,0,0,0,0,0,2,0,0,NULL),(132,15,15,'Mind Potency +1','rune_sum1',1,22,4,96,1,0,28,1,0,0,0,0,0,2,0,0,NULL),(133,16,16,'Harvesting +1','rune_mining1',1,22,4,96,1,1,30,1,0,0,0,0,0,2,0,0,NULL),(134,16,17,'Armorsmith +1','rune_armsmth1',1,22,4,96,1,1,30,1,0,0,0,0,0,2,0,0,NULL),(135,16,17,'Weaponsmith +1','rune_wpnsmth1',1,22,4,96,1,1,30,1,0,0,0,0,0,2,0,0,NULL),(136,16,18,'Engineering +1','rune_engin1',1,22,4,96,1,1,30,1,0,0,0,0,0,2,0,0,NULL),(137,17,16,'Medicine +1','rune_faid1',1,22,4,96,1,1,31,1,0,0,0,0,0,2,0,0,NULL),(138,17,17,'Improved Enmity +1','rune_enmup1',1,22,4,96,1,1,31,1,0,0,0,0,0,2,0,0,NULL),(139,17,18,'Sneak Attack +1','rune_snkatk1',1,22,4,96,1,1,31,1,0,0,0,0,0,2,0,0,NULL),(140,14,22,'Enhancement Bonus +1','rune_eb1',1,22,4,96,3,1,29,2,0,0,0,0,0,3,0,0,NULL),(141,14,20,'HP Regen +1','rune_hpregen1',1,22,4,96,3,1,29,2,0,0,0,0,0,3,0,0,NULL),(142,14,22,'Base Attack Bonus +1','rune_bab1',1,22,4,96,3,1,29,2,0,0,0,0,0,3,0,0,NULL),(143,15,21,'FP Regen +1','rune_manareg1',1,22,4,96,3,1,28,2,0,0,0,0,0,3,0,0,NULL),(144,17,19,'Durability +1','rune_dur1',1,22,4,96,3,1,31,2,0,0,0,0,0,3,0,0,NULL),(145,17,21,'Reduced Enmity -1','rune_enmdown1',1,22,4,96,3,1,31,2,0,0,0,0,0,3,0,0,NULL),(146,12,2,'Basic Dart','dart_b',1,12,2,NULL,0,1,4,1,8,1,0,0,1,2,2,0,NULL),(147,17,22,'Level Decrease -3','rune_lvldown1',1,22,4,96,3,1,31,2,0,0,0,0,0,3,0,0,NULL),(148,14,24,'Attack Bonus +2','rune_ab2',1,22,4,96,3,1,29,2,0,0,0,0,0,3,0,0,NULL),(149,14,23,'Constitution +2','rune_con2',1,22,4,96,3,1,29,2,0,0,0,0,0,3,0,0,NULL),(150,14,24,'Dexterity +2','rune_dex2',1,22,4,96,3,1,29,2,0,0,0,0,0,3,0,0,NULL),(151,14,25,'Strength +2','rune_str2',1,22,4,96,3,1,29,2,0,0,0,0,0,3,0,0,NULL),(152,15,26,'Cooldown Reduction +2','rune_cstspd2',1,22,4,96,3,1,28,2,0,0,0,0,0,3,0,0,NULL),(153,15,23,'Charisma +2','rune_cha2',1,22,4,96,3,1,28,2,0,0,0,0,0,3,0,0,NULL),(154,15,24,'Intelligence +2','rune_int2',1,22,4,96,3,1,28,2,0,0,0,0,0,3,0,0,NULL),(155,15,25,'Wisdom +2','rune_wis2',1,22,4,96,3,1,28,2,0,0,0,0,0,3,0,0,NULL),(156,17,27,'Luck +1','rune_luck1',1,22,4,96,3,1,31,2,0,0,0,0,0,3,0,0,NULL),(157,17,27,'Meditate +1','rune_med1',1,22,4,96,3,1,31,2,0,0,0,0,0,3,0,0,NULL),(158,14,30,'Damage +2','rune_dmg2',1,22,4,96,5,1,29,3,0,0,0,0,0,4,0,0,NULL),(159,14,29,'Hit Points +10','rune_hp2',1,22,4,96,5,1,29,3,0,0,0,0,0,4,0,0,NULL),(160,17,31,'Armor Class +2','rune_ac2',1,22,4,96,5,1,31,3,0,0,0,0,0,4,0,0,NULL),(161,15,30,'Light Potency +2','rune_alt2',1,22,4,96,5,0,28,3,0,0,0,0,0,4,0,0,NULL),(162,15,30,'Dark Potency +2','rune_evo2',1,22,4,96,5,0,28,3,0,0,0,0,0,4,0,0,NULL),(163,15,29,'FP +10','rune_mana2',1,22,4,96,5,1,28,3,0,0,0,0,0,4,0,0,NULL),(164,16,29,'Cooking +2','rune_cooking2',1,22,4,96,5,1,30,3,0,0,0,0,0,4,0,0,NULL),(165,15,30,'Mind Potency +2','rune_sum2',1,22,4,96,5,0,28,3,0,0,0,0,0,4,0,0,NULL),(166,16,31,'Harvesting +2','rune_mining2',1,22,4,96,5,1,30,3,0,0,0,0,0,4,0,0,NULL),(167,16,32,'Armorsmith +2','rune_armsmth2',1,22,4,96,5,1,30,3,0,0,0,0,0,4,0,0,NULL),(168,16,32,'Weaponsmith +2','rune_wpnsmth2',1,22,4,96,5,1,30,3,0,0,0,0,0,4,0,0,NULL),(169,16,33,'Engineering +2','rune_engin2',1,22,4,96,5,1,30,3,0,0,0,0,0,4,0,0,NULL),(170,17,31,'Medicine +2','rune_faid2',1,22,4,96,5,1,31,3,0,0,0,0,0,4,0,0,NULL),(171,17,32,'Improved Enmity +2','rune_enmup2',1,22,4,96,5,1,31,3,0,0,0,0,0,4,0,0,NULL),(172,17,32,'Sneak Attack +2','rune_snkatk2',1,22,4,96,5,1,31,3,0,0,0,0,0,4,0,0,NULL),(173,14,37,'Enhancement Bonus +2','rune_eb2',1,22,4,96,5,1,29,3,0,0,0,0,0,4,0,0,NULL),(174,14,35,'HP Regen +2','rune_hpregen2',1,22,4,96,5,1,29,3,0,0,0,0,0,4,0,0,NULL),(175,14,37,'Base Attack Bonus +2','rune_bab2',1,22,4,96,5,0,29,3,0,0,0,0,0,4,0,0,NULL),(176,15,35,'FP Regen +2','rune_manareg2',1,22,4,96,5,1,28,3,0,0,0,0,0,4,0,0,NULL),(177,17,34,'Durability +2','rune_dur2',1,22,4,96,5,1,31,3,0,0,0,0,0,4,0,0,NULL),(178,17,36,'Reduced Enmity -2','rune_enmdown2',1,22,4,96,5,1,31,3,0,0,0,0,0,4,0,0,NULL),(179,14,39,'Attack Bonus +3','rune_ab3',1,22,4,96,7,1,29,4,0,0,0,0,0,5,0,0,NULL),(180,15,45,'Mind Potency +3','rune_sum3',1,22,4,96,7,0,28,4,0,0,0,0,0,5,0,0,NULL),(181,14,38,'Constitution +3','rune_con3',1,22,4,96,7,1,29,4,0,0,0,0,0,5,0,0,NULL),(182,14,39,'Dexterity +3','rune_dex3',1,22,4,96,7,1,29,4,0,0,0,0,0,5,0,0,NULL),(183,14,40,'Strength +3','rune_str3',1,22,4,96,7,1,29,4,0,0,0,0,0,5,0,0,NULL),(184,15,41,'Cooldown Reduction +3','rune_cstspd3',1,22,4,96,7,1,28,4,0,0,0,0,0,5,0,0,NULL),(185,15,38,'Charisma +3','rune_cha3',1,22,4,96,7,1,28,4,0,0,0,0,0,5,0,0,NULL),(186,15,39,'Intelligence +3','rune_int3',1,22,4,96,7,1,28,4,0,0,0,0,0,5,0,0,NULL),(187,15,40,'Wisdom +3','rune_wis3',1,22,4,96,7,1,28,4,0,0,0,0,0,5,0,0,NULL),(188,14,45,'Damage +3','rune_dmg3',1,22,4,96,7,1,29,4,0,0,0,0,0,5,0,0,NULL),(189,14,44,'Hit Points +15','rune_hp3',1,22,4,96,7,1,29,4,0,0,0,0,0,5,0,0,NULL),(190,17,46,'Armor Class +3','rune_ac3',1,22,4,96,7,1,31,4,0,0,0,0,0,5,0,0,NULL),(191,15,45,'Light Potency +3','rune_alt3',1,22,4,96,7,0,28,4,0,0,0,0,0,5,0,0,NULL),(192,15,45,'Dark Potency +3','rune_evo3',1,22,4,96,7,0,28,4,0,0,0,0,0,5,0,0,NULL),(193,15,44,'FP +15','rune_mana3',1,22,4,96,7,1,28,4,0,0,0,0,0,5,0,0,NULL),(194,16,44,'Cooking +3','rune_cooking3',1,22,4,96,7,1,30,4,0,0,0,0,0,5,0,0,NULL),(195,15,15,'Electrical Potency +1','rune_ele1',1,22,4,96,1,0,28,1,0,0,0,0,0,2,0,0,NULL),(196,16,46,'Harvesting +3','rune_mining3',1,22,4,96,7,1,30,4,0,0,0,0,0,5,0,0,NULL),(197,16,47,'Armorsmith +3','rune_armsmth3',1,22,4,96,7,1,30,4,0,0,0,0,0,5,0,0,NULL),(198,16,47,'Weaponsmith +3','rune_wpnsmth3',1,22,4,96,7,1,30,4,0,0,0,0,0,5,0,0,NULL),(199,16,48,'Engineering +3','rune_engin3',1,22,4,96,7,1,30,4,0,0,0,0,0,5,0,0,NULL),(200,17,46,'Medicine +3','rune_faid3',1,22,4,96,7,1,31,4,0,0,0,0,0,5,0,0,NULL),(201,17,47,'Improved Enmity +3','rune_enmup3',1,22,4,96,7,1,31,4,0,0,0,0,0,5,0,0,NULL),(202,17,47,'Sneak Attack +3','rune_snkatk3',1,22,4,96,7,1,31,4,0,0,0,0,0,5,0,0,NULL),(203,14,49,'Enhancement Bonus +3','rune_eb3',1,22,4,96,7,1,29,4,0,0,0,0,0,5,0,0,NULL),(204,14,50,'HP Regen +3','rune_hpregen3',1,22,4,96,7,1,29,4,0,0,0,0,0,5,0,0,NULL),(205,14,52,'Base Attack Bonus +1','rune_bab3',1,22,4,96,7,0,29,4,0,0,0,0,0,5,0,0,NULL),(206,15,50,'FP Regen +3','rune_manareg3',1,22,4,96,7,1,28,4,0,0,0,0,0,5,0,0,NULL),(207,17,49,'Durability +3','rune_dur3',1,22,4,96,7,1,31,4,0,0,0,0,0,5,0,0,NULL),(208,17,51,'Reduced Enmity -3','rune_enmdown3',1,22,4,96,7,1,31,4,0,0,0,0,0,5,0,0,NULL),(209,17,42,'Luck +2','rune_luck2',1,22,4,96,3,1,31,4,0,0,0,0,0,5,0,0,NULL),(210,17,42,'Meditate +2','rune_med2',1,22,4,96,3,1,31,4,0,0,0,0,0,5,0,0,NULL),(211,4,2,'Basic Training Foil (Blue)','lightsaber_b',1,14,4,151,1,1,62,1,22,1,28,2,1,2,2,3,NULL),(212,4,7,'Training Foil I (Blue)','lightsaber_1',1,14,4,151,3,1,62,1,22,1,28,2,2,2,2,3,NULL),(213,4,12,'Training Foil II (Blue)','lightsaber_2',1,14,4,151,5,1,62,1,22,1,28,2,3,2,2,3,NULL),(214,4,17,'Training Foil III (Blue)','lightsaber_3',1,14,4,151,7,1,62,1,22,1,28,2,4,2,2,3,NULL),(215,4,22,'Training Foil IV (Blue)','lightsaber_4',1,14,4,151,9,1,62,1,22,1,28,2,5,2,2,3,NULL),(216,8,7,'Basic Training Foil Staff (Blue)','saberstaff_b',1,14,4,151,1,1,62,2,22,1,28,2,2,2,2,3,NULL),(217,8,8,'Training Foil Staff I (Blue)','saberstaff_1',1,14,4,151,3,1,62,2,22,1,28,2,3,4,2,3,NULL),(218,8,13,'Training Foil Staff II (Blue)','saberstaff_2',1,14,4,151,5,1,62,2,22,1,28,2,4,4,2,3,NULL),(219,8,18,'Training Foil Staff III (Blue)','saberstaff_3',1,14,4,151,7,1,62,2,22,1,28,2,5,4,2,3,NULL),(220,8,23,'Training Foil Staff IV (Blue)','saberstaff_4',1,14,4,151,9,1,62,2,22,1,28,2,6,4,2,3,NULL),(221,13,1,'Saber Hilt','ls_hilt',1,14,4,151,1,1,2,3,0,0,0,0,0,3,0,0,NULL),(222,13,1,'Power Crystal Cluster','c_cluster_power',1,22,4,NULL,0,1,21,2,0,0,0,0,0,5,0,0,NULL),(223,13,1,'Light Armor Segment','l_armor_segment',1,13,1,NULL,0,1,13,2,0,0,0,0,0,4,0,0,NULL),(224,13,2,'Force Armor Segment','f_armor_segment',1,13,1,NULL,0,1,13,3,0,0,0,0,0,5,0,0,NULL),(225,13,3,'Heavy Armor Segment','h_armor_segment',1,13,1,NULL,0,1,13,4,0,0,0,0,0,6,0,0,NULL),(226,13,0,'Fiberplast Padding','padding_fiber',1,13,1,NULL,0,1,12,3,0,0,0,0,0,3,0,0,NULL),(227,13,2,'Light Armor Core','core_l_armor',1,13,1,NULL,0,1,14,1,0,0,0,0,0,3,0,0,NULL),(228,13,3,'Force Armor Core','core_f_armor',1,13,1,NULL,0,1,14,1,0,0,0,0,0,3,0,0,NULL),(229,13,4,'Heavy Armor Core','core_h_armor',1,13,1,NULL,0,1,14,1,0,0,0,0,0,3,0,0,NULL),(230,13,0,'Metal Reinforcement','padding_metal',1,13,1,NULL,0,1,2,2,12,1,0,0,0,4,2,0,NULL),(231,20,3,'Basic Breastplate','breastplate_b',1,13,1,NULL,0,1,33,1,36,1,0,0,1,2,2,0,NULL),(232,20,6,'Breastplate I','breastplate_1',1,13,1,124,1,1,33,1,36,1,0,0,2,2,2,0,NULL),(233,20,11,'Breastplate II','breastplate_2',1,13,1,124,3,1,33,1,36,1,0,0,3,2,2,0,NULL),(234,20,16,'Breastplate III','breastplate_3',1,13,1,124,5,1,33,1,36,1,0,0,4,2,2,0,NULL),(235,20,21,'Breastplate IV','breastplate_4',1,13,1,124,7,1,33,1,36,1,0,0,5,2,2,0,NULL),(236,19,2,'Basic Force Robes','force_robe_b',1,13,1,NULL,0,1,35,1,38,1,0,0,1,2,2,0,NULL),(237,19,6,'Force Robes I','force_robe_1',1,13,1,124,1,1,35,1,38,1,0,0,2,2,2,0,NULL),(238,19,11,'Force Robes II','force_robe_2',1,13,1,124,3,1,35,1,38,1,0,0,3,2,2,0,NULL),(239,19,16,'Force Robes III','force_robe_3',1,13,1,124,5,1,35,1,38,1,0,0,4,2,2,0,NULL),(240,19,21,'Force Robes IV','force_robe_4',1,13,1,124,7,1,35,1,38,1,0,0,5,2,2,0,NULL),(241,18,1,'Basic Leather Tunic','leather_tunic_b',1,13,1,NULL,0,1,34,1,37,1,0,0,1,2,2,0,NULL),(242,18,5,'Leather Tunic I','leather_tunic_1',1,13,1,124,1,1,34,1,37,1,0,0,2,2,2,0,NULL),(243,18,10,'Leather Tunic II','leather_tunic_2',1,13,1,124,3,1,34,1,37,1,0,0,3,2,2,0,NULL),(244,18,15,'Leather Tunic III','leather_tunic_3',1,13,1,124,5,1,34,1,37,1,0,0,4,2,2,0,NULL),(245,18,20,'Leather Tunic IV','leather_tunic_4',1,13,1,124,7,1,34,1,37,1,0,0,5,2,2,0,NULL),(246,18,3,'Basic Small Shield','small_shield_b',1,13,1,NULL,0,1,34,1,37,1,0,0,1,2,2,0,NULL),(247,18,6,'Small Shield I','small_shield_1',1,13,1,124,1,1,34,1,37,1,0,0,2,2,2,0,NULL),(248,18,11,'Small Shield II','small_shield_2',1,13,1,124,3,1,34,1,37,1,0,0,3,2,2,0,NULL),(249,18,16,'Small Shield III','small_shield_3',1,13,1,124,5,1,34,1,37,1,0,0,4,2,2,0,NULL),(250,18,21,'Small Shield IV','small_shield_4',1,13,1,124,7,1,34,1,37,1,0,0,5,2,2,0,NULL),(251,20,4,'Basic Large Shield','large_shield_b',1,13,1,NULL,0,1,33,1,36,1,0,0,1,2,2,0,NULL),(252,20,7,'Large Shield I','large_shield_1',1,13,1,124,1,1,33,1,36,1,0,0,2,2,2,0,NULL),(253,20,12,'Large Shield II','large_shield_2',1,13,1,124,3,1,33,1,36,1,0,0,3,2,2,0,NULL),(254,20,17,'Large Shield III','large_shield_3',1,13,1,124,5,1,33,1,36,1,0,0,4,2,2,0,NULL),(255,20,22,'Large Shield IV','large_shield_4',1,13,1,124,7,1,33,1,36,1,0,0,5,2,2,0,NULL),(256,20,5,'Basic Tower Shield','tower_shield_b',1,13,1,NULL,0,1,33,2,36,2,0,0,1,4,4,0,NULL),(257,20,7,'Tower Shield I','tower_shield_1',1,13,1,124,1,1,33,2,36,2,0,0,2,4,4,0,NULL),(258,20,12,'Tower Shield II','tower_shield_2',1,13,1,124,3,1,33,2,36,2,0,0,3,4,4,0,NULL),(259,20,17,'Tower Shield III','tower_shield_3',1,13,1,124,5,1,33,2,36,2,0,0,4,4,4,0,NULL),(260,20,22,'Tower Shield IV','tower_shield_4',1,13,1,124,7,1,33,2,36,2,0,0,5,4,4,0,NULL),(261,9,3,'Basic Power Glove','powerglove_b',1,13,1,NULL,0,1,34,1,37,1,0,0,1,2,2,0,NULL),(262,9,6,'Power Glove I','powerglove_1',1,13,1,124,1,1,34,1,37,1,0,0,2,2,2,0,NULL),(263,9,11,'Power Glove II','powerglove_2',1,13,1,124,3,1,34,1,37,1,0,0,3,2,2,0,NULL),(264,9,16,'Power Glove III','powerglove_3',1,13,1,124,5,1,34,1,37,1,0,0,4,2,2,0,NULL),(265,9,21,'Power Glove IV','powerglove_4',1,13,1,124,7,1,34,1,37,1,0,0,5,2,2,0,NULL),(266,18,7,'Light Belt I','light_belt_1',1,13,1,124,1,1,34,1,37,1,0,0,0,2,2,0,NULL),(267,18,14,'Light Belt II','light_belt_2',1,13,1,124,3,1,34,1,37,1,0,0,1,2,2,0,NULL),(268,18,22,'Light Belt III','light_belt_3',1,13,1,124,5,1,34,1,37,1,0,0,2,2,2,0,NULL),(269,19,7,'Force Belt I','force_belt_1',1,13,1,124,1,1,35,1,38,1,0,0,0,2,2,0,NULL),(270,19,15,'Force Belt II','force_belt_2',1,13,1,124,3,1,35,1,38,1,0,0,1,2,2,0,NULL),(271,19,23,'Force Belt III','force_belt_3',1,13,1,124,5,1,35,1,38,1,0,0,2,2,2,0,NULL),(272,20,8,'Heavy Belt I','heavy_belt_1',1,13,1,124,1,1,33,1,36,1,0,0,0,2,2,0,NULL),(273,20,16,'Heavy Belt II','heavy_belt_2',1,13,1,124,3,1,33,1,36,1,0,0,1,2,2,0,NULL),(274,20,24,'Heavy Belt III','heavy_belt_3',1,13,1,124,5,1,33,1,36,1,0,0,2,2,2,0,NULL),(275,19,24,'Prismatic Force Belt','prism_belt_f',1,13,1,124,7,1,32,1,35,1,38,1,2,2,2,2,NULL),(276,18,24,'Prismatic Light Belt','prism_belt_l',1,13,1,124,7,1,32,1,34,1,37,1,2,2,2,2,NULL),(277,20,24,'Prismatic Heavy Belt','prism_belt_h',1,13,1,124,7,1,32,1,33,1,36,1,2,2,2,2,NULL),(278,19,3,'Basic Force Boots','force_boots_b',1,13,1,NULL,0,1,35,1,38,1,0,0,1,2,2,0,NULL),(279,19,6,'Force Boots I','force_boots_1',1,13,1,124,1,1,35,1,38,1,0,0,1,2,2,0,NULL),(280,19,11,'Force Boots II','force_boots_2',1,13,1,124,3,1,35,1,38,1,0,0,2,2,2,0,NULL),(281,19,16,'Force Boots III','force_boots_3',1,13,1,124,5,1,35,1,38,1,0,0,3,2,2,0,NULL),(282,19,21,'Force Boots IV','force_boots_4',1,13,1,124,7,1,35,1,38,1,0,0,4,2,2,0,NULL),(283,18,2,'Basic Light Boots','light_boots_b',1,13,1,NULL,0,1,34,1,37,1,0,0,1,2,2,0,NULL),(284,18,6,'Light Boots I','light_boots_1',1,13,1,124,1,1,34,1,37,1,0,0,1,2,2,0,NULL),(285,18,11,'Light Boots II','light_boots_2',1,13,1,124,3,1,34,1,37,1,0,0,2,2,2,0,NULL),(286,18,16,'Light Boots III','light_boots_3',1,13,1,124,5,1,34,1,37,1,0,0,3,2,2,0,NULL),(287,18,21,'Light Boots IV','light_boots_4',1,13,1,124,7,1,34,1,37,1,0,0,4,2,2,0,NULL),(288,20,4,'Basic Heavy Boots','heavy_boots_b',1,13,1,NULL,0,1,33,1,36,1,0,0,1,2,2,0,NULL),(289,20,7,'Heavy Boots I','heavy_boots_1',1,13,1,124,1,1,33,1,36,1,0,0,1,2,2,0,NULL),(290,20,12,'Heavy Boots II','heavy_boots_2',1,13,1,124,3,1,33,1,36,1,0,0,2,2,2,0,NULL),(291,20,17,'Heavy Boots III','heavy_boots_3',1,13,1,124,5,1,33,1,36,1,0,0,3,2,2,0,NULL),(292,20,22,'Heavy Boots IV','heavy_boots_4',1,13,1,124,7,1,33,1,36,1,0,0,4,2,2,0,NULL),(293,19,5,'Force Necklace I','force_neck_1',1,13,1,124,1,1,35,1,38,1,0,0,1,2,2,0,NULL),(294,19,10,'Force Necklace II','force_neck_2',1,13,1,124,3,1,35,1,38,1,0,0,2,2,2,0,NULL),(295,19,15,'Force Necklace III','force_neck_3',1,13,1,124,5,1,35,1,38,1,0,0,3,2,2,0,NULL),(296,19,20,'Force Necklace IV','force_neck_4',1,13,1,124,7,1,35,1,38,1,0,0,4,2,2,0,NULL),(297,20,5,'Heavy Crest I','h_crest_1',1,13,1,124,1,1,33,1,36,1,0,0,1,2,2,0,NULL),(298,20,10,'Heavy Crest II','h_crest_2',1,13,1,124,3,1,33,1,36,1,0,0,2,2,2,0,NULL),(299,20,15,'Heavy Crest III','h_crest_3',1,13,1,124,5,1,33,1,36,1,0,0,3,2,2,0,NULL),(300,20,20,'Heavy Crest IV','h_crest_4',1,13,1,124,7,1,33,1,36,1,0,0,4,2,2,0,NULL),(301,18,4,'Light Choker I','lt_choker_1',1,13,1,124,1,1,34,1,37,1,0,0,1,2,2,0,NULL),(302,18,9,'Light Choker II','lt_choker_2',1,13,1,124,3,1,34,1,37,1,0,0,2,2,2,0,NULL),(303,18,14,'Light Choker III','lt_choker_3',1,13,1,124,5,1,34,1,37,1,0,0,3,2,2,0,NULL),(304,18,19,'Light Choker IV','lt_choker_4',1,13,1,124,7,1,34,1,37,1,0,0,4,2,2,0,NULL),(305,19,24,'Prism Force Necklace','prism_neck_f',1,13,1,124,7,1,32,1,35,1,38,1,2,2,2,2,NULL),(306,18,24,'Prism Light Necklace','prism_neck_l',1,13,1,124,7,1,32,1,34,1,37,1,2,2,2,2,NULL),(307,20,24,'Prism Heavy Necklace','prism_neck_h',1,13,1,124,7,1,32,1,33,1,36,1,2,2,2,2,NULL),(308,16,17,'Fabrication +1','rune_fab1',1,22,4,96,1,1,30,1,0,0,0,0,0,2,0,0,NULL),(309,16,32,'Fabrication +2','rune_fab2',1,22,4,96,5,1,30,3,0,0,0,0,0,4,0,0,NULL),(310,16,47,'Fabrication +3','rune_fab3',1,22,4,96,7,1,30,4,0,0,0,0,0,5,0,0,NULL),(311,21,0,'Small Control Tower','control_tower',1,15,5,2,1,1,39,1,44,1,45,1,5,2,2,2,1),(312,21,10,'Medium Control Tower','control_tower',1,15,5,2,1,1,40,1,44,2,45,2,5,2,3,3,2),(313,21,6,'Large Control Tower','control_tower',1,15,5,2,3,1,41,1,44,3,45,3,5,2,4,4,3),(314,13,3,'Mainframe','mainframe',1,15,5,2,1,1,42,3,43,2,0,0,3,6,4,0,NULL),(315,13,2,'Power Relay','power_relay',1,15,5,2,1,1,46,3,43,2,0,0,3,6,4,0,NULL),(316,13,2,'Small Structure Frame','s_frame_small',1,15,5,NULL,0,1,2,2,12,1,3,1,2,6,3,3,NULL),(317,13,4,'Medium Structure Frame','s_frame_medium',1,15,5,NULL,0,1,39,1,2,2,3,1,3,2,6,3,NULL),(318,13,6,'Large Structure Frame','s_frame_large',1,15,5,NULL,0,1,40,1,2,2,3,1,4,2,6,3,NULL),(319,13,0,'Construction Parts','const_parts',1,15,5,NULL,0,1,2,2,0,0,0,0,0,8,0,0,NULL),(320,13,1,'Computing Module','computing_module',1,15,5,2,1,1,15,3,0,0,0,0,0,6,0,0,NULL),(321,13,0,'Power Core','power_core',1,15,5,NULL,0,1,21,2,0,0,0,0,0,4,0,0,NULL),(322,35,6,'Obelisk, Large','furniture',1,15,5,2,1,1,2,3,0,0,0,0,1,6,0,0,4),(323,15,30,'Electrical Potency +2','rune_ele2',1,22,4,96,5,0,28,3,0,0,0,0,0,4,0,0,NULL),(324,35,5,'Obelisk, Small','furniture',1,15,5,NULL,0,1,2,2,0,0,0,0,1,4,0,0,6),(325,32,1,'Ladder, Light','furniture',1,15,5,NULL,0,1,3,2,0,0,0,0,1,4,0,0,7),(326,32,2,'Ladder, Dark','furniture',1,15,5,NULL,0,1,3,2,0,0,0,0,1,4,0,0,8),(327,35,8,'Statue, Huge','furniture',1,15,5,2,1,1,2,2,0,0,0,0,1,4,0,0,9),(328,32,7,'Mining Well','furniture',1,15,5,2,1,1,2,1,3,1,12,1,1,2,2,2,10),(329,15,45,'Electrical Potency +3','rune_ele3',1,22,4,96,7,0,28,4,0,0,0,0,0,5,0,0,NULL),(330,35,5,'Statue, Wizard','furniture',1,15,5,NULL,0,1,2,2,0,0,0,0,1,4,0,0,12),(331,32,0,'Gong','furniture',1,15,5,2,1,1,2,2,0,0,0,0,1,4,0,0,13),(332,35,7,'Statue, Monster','furniture',1,15,5,2,1,1,2,2,0,0,0,0,1,4,0,0,14),(333,15,16,'Dark Defense +1','rune_ddef1',1,22,4,96,1,0,28,1,0,0,0,0,0,2,0,0,NULL),(334,15,31,'Dark Defense +2','rune_ddef2',1,22,4,96,5,0,28,3,0,0,0,0,0,4,0,0,NULL),(335,33,4,'Brazier, Stone','furniture',1,15,5,NULL,0,1,2,2,0,0,0,0,1,4,0,0,17),(336,35,5,'Statue, Guardian','furniture',1,15,5,NULL,0,1,2,2,0,0,0,0,1,4,0,0,18),(337,34,6,'Doorway, Metal','furniture',1,15,5,2,1,1,2,2,0,0,0,0,1,4,0,0,19),(338,35,7,'Flaming Statue','furniture',1,15,5,2,1,1,2,2,0,0,0,0,1,4,0,0,20),(339,33,3,'Brazier, Round','furniture',1,15,5,NULL,0,1,2,2,0,0,0,0,1,4,0,0,21),(340,29,3,'Pedestal','furniture',1,15,5,NULL,0,1,2,2,0,0,0,0,0,4,0,0,22),(341,32,3,'Rope Coil','furniture',1,15,5,NULL,0,1,12,2,0,0,0,0,1,4,0,0,23),(342,35,4,'Statue, Wyvern ','furniture',1,15,5,NULL,0,1,2,2,0,0,0,0,1,4,0,0,24),(343,29,4,'Pedestal, Evil','furniture',1,15,5,NULL,0,1,2,2,0,0,0,0,0,4,0,0,25),(344,32,2,'Birdbath','furniture',1,15,5,NULL,0,1,2,2,0,0,0,0,1,4,0,0,26),(345,35,3,'Sphinx Statue','furniture',1,15,5,NULL,0,1,2,2,0,0,0,0,1,4,0,0,27),(346,32,6,'Mining Well Platform','furniture',1,15,5,2,1,1,2,2,3,1,0,0,1,4,2,0,28),(347,29,5,'Pedestal, Sword','furniture',1,15,5,NULL,0,1,2,2,0,0,0,0,0,4,0,0,29),(348,34,5,'Doorway, Stone','furniture',1,15,5,NULL,0,1,2,2,0,0,0,0,1,4,0,0,30),(349,35,5,'Female Statue','furniture',1,15,5,NULL,0,1,2,2,0,0,0,0,1,4,0,0,31),(350,32,2,'Gnomish Contraption','furniture',1,15,5,NULL,0,1,2,2,0,0,0,0,1,4,0,0,32),(351,35,4,'Pillar, Stone','furniture',1,15,5,2,1,1,2,2,0,0,0,0,1,4,0,0,33),(352,15,46,'Dark Defense +3','rune_ddef3',1,22,4,96,7,0,28,4,0,0,0,0,0,5,0,0,NULL),(353,35,2,'Statue of Lathander','furniture',1,15,5,2,1,1,2,2,0,0,0,0,1,4,0,0,35),(354,35,6,'Pillar, Flame','furniture',1,15,5,2,1,1,2,2,0,0,0,0,1,4,0,0,36),(355,32,5,'Cage','furniture',1,15,5,2,1,1,2,2,0,0,0,0,1,4,0,0,37),(356,33,5,'Lamp Post','furniture',1,15,5,2,1,1,2,2,0,0,0,0,1,4,0,0,38),(357,33,5,'Torch Bracket','furniture',1,15,5,2,1,1,3,2,0,0,0,0,1,4,0,0,39),(358,35,3,'Pillar, Wood','furniture',1,15,5,2,1,1,3,2,0,0,0,0,1,4,0,0,40),(359,35,4,'Statue, Cyric','furniture',1,15,5,2,1,1,2,2,0,0,0,0,1,4,0,0,41),(360,35,3,'Sea Idol','furniture',1,15,5,2,1,1,2,2,0,0,0,0,1,4,0,0,42),(361,32,6,'Fountain','furniture',1,15,5,2,1,1,2,2,0,0,0,0,1,4,0,0,43),(362,35,6,'Monster Statue','furniture',1,15,5,2,1,1,2,2,0,0,0,0,1,4,0,0,44),(363,32,4,'Easel','furniture',1,15,5,2,1,1,3,2,0,0,0,0,1,4,0,0,45),(364,15,16,'Light Defense +1','rune_ldef1',1,22,4,96,1,0,28,1,0,0,0,0,0,2,0,0,NULL),(365,32,1,'Keg','furniture',1,15,5,NULL,0,1,3,2,0,0,0,0,1,4,0,0,47),(366,35,8,'Dran Statue ','furniture',1,15,5,2,1,1,2,3,0,0,0,0,1,6,0,0,48),(367,15,31,'Light Defense +2','rune_ldef2',1,22,4,96,5,0,28,3,0,0,0,0,0,4,0,0,NULL),(368,15,46,'Light Defense +3','rune_ldef3',1,22,4,96,7,0,28,4,0,0,0,0,0,5,0,0,NULL),(369,32,1,'Net','furniture',1,15,5,NULL,0,1,13,2,0,0,0,0,1,4,0,0,51),(370,31,4,'Bed, Extra Large','furniture',1,15,5,2,1,1,3,2,13,1,0,0,1,4,2,0,52),(371,15,16,'Mind Defense +1','rune_mdef1',1,22,4,96,1,0,28,1,0,0,0,0,0,2,0,0,NULL),(372,30,3,'Carpet, Round, Blue','furniture',1,15,5,2,1,1,13,3,0,0,0,0,1,6,0,0,54),(373,29,0,'Altar, Evil','furniture',1,15,5,NULL,0,1,2,2,0,0,0,0,0,4,0,0,55),(374,28,2,'Table, Wood, Large','furniture',1,15,5,2,1,1,3,2,0,0,0,0,0,4,0,0,56),(375,28,1,'Table, Wood, With Fish','furniture',1,15,5,2,1,1,3,2,0,0,0,0,0,4,0,0,57),(376,28,3,'Table, Stone, Small','furniture',1,15,5,2,1,1,2,2,0,0,0,0,0,4,0,0,58),(377,29,0,'Altar, Hand','furniture',1,15,5,2,1,1,2,2,0,0,0,0,0,4,0,0,59),(378,32,4,'Window','furniture',1,15,5,2,1,1,3,1,2,1,0,0,1,2,2,0,60),(379,37,0,'Cushions','furniture',1,15,5,2,1,1,13,1,12,1,0,0,1,2,2,0,61),(380,33,1,'Candle','furniture',1,15,5,2,1,1,12,1,0,0,0,0,1,2,0,0,62),(381,15,31,'Mind Defense +2','rune_mdef2',1,22,4,96,5,0,28,3,0,0,0,0,0,4,0,0,NULL),(382,30,1,'Bear Skin Rug','furniture',1,15,5,2,1,1,13,2,0,0,0,0,1,4,0,0,64),(383,33,0,'Chandelier','furniture',1,15,5,2,1,1,2,2,0,0,0,0,1,4,0,0,65),(384,15,46,'Mind Defense +3','rune_mdef3',1,22,4,96,7,0,28,4,0,0,0,0,0,5,0,0,NULL),(385,32,2,'Urn','furniture',1,15,5,2,1,1,2,2,0,0,0,0,1,4,0,0,67),(386,29,1,'Altar, Stone','furniture',1,15,5,2,1,1,2,2,0,0,0,0,0,4,0,0,68),(387,31,2,'Cot','furniture',1,15,5,2,1,1,3,1,13,1,0,0,1,2,2,0,69),(388,28,0,'Table, Wood','furniture',1,15,5,NULL,0,1,3,2,0,0,0,0,0,4,0,0,70),(389,15,16,'Electrical Defense +1','rune_edef1',1,22,4,96,1,0,28,1,0,0,0,0,0,2,0,0,NULL),(390,30,0,'Throw Rug','furniture',1,15,5,NULL,0,1,13,2,0,0,0,0,1,4,0,0,72),(391,28,5,'Table, Stone, Large','furniture',1,15,5,NULL,0,1,2,3,0,0,0,0,0,6,0,0,73),(392,31,5,'Bed, Stone, Yellow','furniture',1,15,5,NULL,0,1,2,1,13,1,0,0,1,2,2,0,74),(393,31,3,'Bed, Large','furniture',1,15,5,NULL,0,1,3,1,13,1,0,0,1,2,2,0,75),(394,32,2,'Vase, Rounded','furniture',1,15,5,NULL,0,1,2,2,0,0,0,0,1,4,0,0,76),(395,30,2,'Carpet','furniture',1,15,5,NULL,0,1,13,2,0,0,0,0,1,4,0,0,77),(396,31,3,'Bed, Wood, Yellow','furniture',1,15,5,NULL,0,1,2,1,13,1,0,0,1,2,2,0,78),(397,35,5,'Overgrown Pillar','furniture',1,15,5,NULL,0,1,2,2,0,0,0,0,1,4,0,0,79),(398,32,5,'Tome','furniture',1,15,5,NULL,0,1,12,2,0,0,0,0,1,4,0,0,80),(399,32,2,'Bird Cage','furniture',1,15,5,NULL,0,1,2,2,0,0,0,0,1,4,0,0,81),(400,35,3,'Pillar, Wood, Dark','furniture',1,15,5,NULL,0,1,3,2,0,0,0,0,1,4,0,0,82),(401,31,4,'Bunk Bed','furniture',1,15,5,NULL,0,1,3,2,13,1,0,0,1,4,2,0,83),(402,32,2,'Vase, Tall','furniture',1,15,5,NULL,0,1,2,2,0,0,0,0,1,4,0,0,84),(403,31,0,'Bed Roll','furniture',1,15,5,NULL,0,1,13,2,0,0,0,0,1,4,0,0,85),(404,37,0,'Ottoman','furniture',1,15,5,NULL,0,1,3,2,0,0,0,0,1,4,0,0,86),(405,15,31,'Electrical Defense +2','rune_edef2',1,22,4,96,5,0,28,3,0,0,0,0,0,4,0,0,NULL),(406,35,4,'Pillar, Rounded','furniture',1,15,5,2,1,1,2,2,0,0,0,0,1,4,0,0,88),(407,32,1,'Painting 2','furniture',1,15,5,2,1,1,12,2,0,0,0,0,1,4,0,0,89),(408,33,4,'Candelabra','furniture',1,15,5,2,1,1,2,2,0,0,0,0,1,4,0,0,90),(409,32,1,'Potted Plant','furniture',1,15,5,2,1,1,3,2,0,0,0,0,1,4,0,0,91),(410,32,1,'Painting 1','furniture',1,15,5,2,1,1,12,2,0,0,0,0,1,4,0,0,92),(411,30,2,'Carpet, Red','furniture',1,15,5,2,1,1,13,2,0,0,0,0,1,4,0,0,93),(412,15,46,'Electrical Defense +3','rune_edef3',1,22,4,96,7,0,28,4,0,0,0,0,0,5,0,0,NULL),(413,28,7,'Illithid Table','furniture',1,15,5,2,1,1,3,3,0,0,0,0,0,6,0,0,95),(414,30,1,'Carpet, Red, Small','furniture',1,15,5,2,1,1,13,2,0,0,0,0,1,4,0,0,96),(415,29,6,'Drow Altar','furniture',1,15,5,2,1,1,2,3,0,0,0,0,0,6,0,0,97),(416,32,4,'Dartboard','furniture',1,15,5,2,1,1,3,2,0,0,0,0,1,4,0,0,98),(417,32,0,'Map','furniture',1,15,5,2,1,1,12,1,0,0,0,0,1,2,0,0,99),(418,32,6,'Floor-anchored shackles','furniture',1,15,5,2,1,1,2,2,0,0,0,0,1,4,0,0,100),(419,28,6,'Round Wooden Table','furniture',1,15,5,2,1,1,3,2,0,0,0,0,0,4,0,0,101),(420,28,4,'Drow Bar','furniture',1,15,5,2,1,1,3,3,0,0,0,0,0,6,0,0,102),(421,35,2,'Shrine of Umberlee','furniture',1,15,5,2,1,1,2,2,0,0,0,0,1,4,0,0,103),(422,35,4,'Rune Pillar','furniture',1,15,5,2,1,1,2,2,0,0,0,0,1,4,0,0,104),(423,12,5,'Dart I','dart_1',1,12,2,NULL,0,1,4,1,8,1,0,0,2,2,2,0,NULL),(424,32,3,'Mirror','furniture',1,15,5,2,1,1,3,1,2,1,0,0,1,2,2,0,106),(425,37,0,'Footstool','furniture',1,15,5,2,1,1,3,2,0,0,0,0,1,4,0,0,107),(426,28,7,'Drow Table','furniture',1,15,5,2,1,1,3,3,0,0,0,0,0,6,0,0,108),(427,39,5,'Molecular Reassembly Terminal','furniture',1,15,5,2,3,1,32,5,43,1,0,0,0,5,1,0,11),(428,12,10,'Dart II','dart_2',1,12,2,NULL,0,1,4,1,8,1,0,0,3,2,2,0,NULL),(429,37,3,'Bench, Stone, Dwarven','furniture',1,15,5,2,1,1,2,2,0,0,0,0,1,4,0,0,111),(430,37,2,'Illithid Chair','furniture',1,15,5,2,1,1,2,2,0,0,0,0,1,4,0,0,112),(431,37,2,'Bench, Wood','furniture',1,15,5,2,1,1,3,2,0,0,0,0,1,4,0,0,113),(432,37,1,'Chair, Wood, Medium','furniture',1,15,5,2,1,1,3,2,0,0,0,0,1,4,0,0,114),(433,37,4,'Bench, Large','furniture',1,15,5,2,1,1,3,2,0,0,0,0,1,4,0,0,115),(434,37,1,'Drow Chair','furniture',1,15,5,2,1,1,3,2,0,0,0,0,1,4,0,0,116),(435,37,3,'Bench, Wood, Large','furniture',1,15,5,2,1,1,3,3,0,0,0,0,1,6,0,0,117),(436,37,1,'Bench, Wood, Small','furniture',1,15,5,2,1,1,3,2,0,0,0,0,1,4,0,0,118),(437,37,0,'Chair, Wood','furniture',1,15,5,2,1,1,3,2,0,0,0,0,1,4,0,0,119),(438,37,0,'Chair, Wood, Small','furniture',1,15,5,2,1,1,3,2,0,0,0,0,1,4,0,0,120),(439,37,1,'Throne, Wood','furniture',1,15,5,2,1,1,3,3,0,0,0,0,1,6,0,0,121),(440,37,2,'Chair, Stone','furniture',1,15,5,2,1,1,2,2,0,0,0,0,1,4,0,0,122),(441,37,1,'Bench, Wood, Small 2','furniture',1,15,5,2,1,1,3,2,0,0,0,0,1,4,0,0,123),(442,37,2,'Chair, Shell','furniture',1,15,5,2,1,1,2,2,0,0,0,0,1,4,0,0,124),(443,37,1,'Couch, Wood, Yellow','furniture',1,15,5,2,1,1,3,2,0,0,0,0,1,4,0,0,125),(444,38,1,'Barrel','furniture',1,15,5,2,1,1,3,3,0,0,0,0,1,6,0,0,126),(445,12,15,'Dart III','dart_3',1,12,2,NULL,0,1,4,1,8,1,0,0,4,2,2,0,NULL),(446,12,20,'Dart IV','dart_4',1,12,2,NULL,0,1,4,1,8,1,0,0,5,2,2,0,NULL),(447,38,2,'Crate','furniture',1,15,5,2,1,1,3,4,0,0,0,0,1,8,0,0,129),(448,12,3,'Basic Shuriken','shuriken_b',1,12,2,NULL,0,1,4,1,8,1,0,0,1,2,2,0,NULL),(449,12,6,'Shuriken I','shuriken_1',1,12,2,NULL,0,1,4,1,8,1,0,0,2,2,2,0,NULL),(450,38,1,'Book Shelf','furniture',1,15,5,2,1,1,3,3,0,0,0,0,1,6,0,0,132),(451,38,3,'Chest','furniture',1,15,5,2,1,1,3,5,0,0,0,0,1,10,0,0,133),(452,12,11,'Shuriken II','shuriken_2',1,12,2,NULL,0,1,4,1,8,1,0,0,3,2,2,0,NULL),(453,12,16,'Shuriken III','shuriken_3',1,12,2,NULL,0,1,4,1,8,1,0,0,4,2,2,0,NULL),(454,38,2,'Desk','furniture',1,15,5,2,1,1,3,3,0,0,0,0,1,4,0,0,136),(455,12,21,'Shuriken IV','shuriken_4',1,12,2,NULL,0,1,4,1,8,1,0,0,5,2,2,0,NULL),(456,45,7,'Throwing Weapon Repair Kit I','th_rep_1',1,12,2,84,1,1,3,2,2,2,0,0,0,4,4,0,NULL),(457,45,17,'Throwing Weapon Repair Kit II','th_rep_2',1,12,2,84,3,1,3,2,2,2,0,0,1,4,4,0,NULL),(458,45,27,'Throwing Weapon Repair Kit III','th_rep_3',1,12,2,84,5,1,3,2,2,2,0,0,2,4,4,0,NULL),(459,45,7,'Throwing Weapon Repair Kit IV','th_rep_4',1,12,2,84,7,1,3,2,2,2,0,0,3,4,4,0,NULL),(464,39,0,'Refinery','furniture',1,15,5,2,1,1,2,2,3,2,0,0,0,2,2,0,146),(465,39,0,'Armorsmith Workbench','furniture',1,15,5,2,1,1,2,2,3,2,0,0,0,2,2,0,147),(466,39,0,'Weaponsmith Bench','furniture',1,15,5,2,1,1,2,2,3,2,0,0,0,2,2,0,148),(467,39,0,'Cookpot','furniture',1,15,5,2,1,1,2,2,3,2,0,0,0,2,2,0,149),(468,39,0,'Engineering Bench','furniture',1,15,5,2,1,1,2,2,3,2,0,0,0,2,2,0,150),(470,35,5,'Mysterious Obelisk','furniture',1,15,5,2,1,1,2,2,0,0,0,0,1,4,0,0,152),(471,40,5,'Small Building','building',1,15,5,2,1,1,39,1,43,4,45,1,3,2,8,2,153),(472,40,15,'Medium Building','building',1,15,5,2,1,1,40,1,43,6,45,1,3,2,12,3,154),(473,40,20,'Large Building','building',1,15,5,2,3,1,41,1,43,8,45,1,3,2,16,4,155),(474,41,0,'Basic Resource Harvester','harvest_r_b',1,22,4,NULL,0,1,15,3,0,0,0,0,1,6,0,0,NULL),(475,41,10,'Resource Harvester I','harvest_r_1',1,22,4,96,1,1,15,3,0,0,0,0,2,6,0,0,NULL),(476,41,20,'Resource Harvester II','harvest_r_2',1,22,4,96,3,1,15,3,0,0,0,0,3,6,0,0,NULL),(477,41,30,'Resource Harvester III','harvest_r_3',1,22,4,96,5,1,15,3,0,0,0,0,4,6,0,0,NULL),(478,41,40,'Resource Harvester IV','harvest_r_4',1,22,4,96,7,1,15,3,0,0,0,0,5,6,0,0,NULL),(479,41,0,'Basic Resource Scanner','scanner_r_b',1,22,4,NULL,0,1,15,3,0,0,0,0,1,6,0,0,NULL),(480,41,10,'Resource Scanner I','scanner_r_1',1,22,4,96,1,1,15,3,0,0,0,0,2,6,0,0,NULL),(481,41,20,'Resource Scanner II','scanner_r_2',1,22,4,96,3,1,15,3,0,0,0,0,3,6,0,0,NULL),(482,41,30,'Resource Scanner III','scanner_r_3',1,22,4,96,5,1,15,3,0,0,0,0,4,6,0,0,NULL),(483,41,40,'Resource Scanner IV','scanner_r_4',1,22,4,96,7,1,15,3,0,0,0,0,5,6,0,0,NULL),(484,42,2,'Fuel Cell','fuel_cell',5,22,4,NULL,0,1,21,1,0,0,0,0,0,1,0,0,NULL),(485,42,12,'Fuel Cell','fuel_cell',15,22,4,96,1,1,21,2,0,0,0,0,0,2,0,0,NULL),(486,42,22,'Fuel Cell','fuel_cell',20,22,4,96,3,1,21,3,0,0,0,0,0,3,0,0,NULL),(487,42,32,'Fuel Cell','fuel_cell',25,22,4,96,5,1,21,4,0,0,0,0,0,4,0,0,NULL),(488,42,42,'Fuel Cell','fuel_cell',35,22,4,96,7,1,21,5,0,0,0,0,0,5,0,0,NULL),(489,23,0,'Basic Stronidium Silo','silo',1,15,5,2,1,1,40,1,43,2,0,0,0,2,4,0,156),(490,23,5,'Stronidium Silo I','silo',1,15,5,2,1,1,40,1,43,2,0,0,1,2,4,0,157),(491,23,10,'Stronidium Silo II','silo',1,15,5,2,3,1,40,1,43,2,0,0,2,2,4,0,158),(492,23,15,'Stronidium Silo III','silo',1,15,5,2,5,1,40,1,43,2,0,0,3,2,4,0,159),(493,23,20,'Stronidium Silo IV','silo',1,15,5,2,7,1,40,1,43,2,0,0,4,2,4,0,160),(494,23,0,'Basic Fuel Silo','silo',1,15,5,2,1,1,40,1,43,2,0,0,0,2,4,0,161),(495,23,5,'Fuel Silo I','silo',1,15,5,2,1,1,40,1,43,2,0,0,1,2,4,0,162),(496,23,10,'Fuel Silo II','silo',1,15,5,2,3,1,40,1,43,2,0,0,2,2,4,0,163),(497,23,15,'Fuel Silo III','silo',1,15,5,2,5,1,40,1,43,2,0,0,3,2,4,0,164),(498,23,20,'Fuel Silo IV','silo',1,15,5,2,7,1,40,1,43,2,0,0,4,2,4,0,165),(499,43,2,'Healing Kit I','healing_kit',1,17,6,NULL,0,1,12,2,48,2,0,0,1,4,4,0,NULL),(500,43,12,'Healing Kit II','healing_kit_p1',1,17,6,9,1,1,12,2,48,2,0,0,2,4,4,0,NULL),(501,43,22,'Healing Kit III','healing_kit_p2',1,17,6,9,3,1,12,2,48,2,0,0,3,4,4,0,NULL),(502,43,32,'Healing Kit IV','healing_kit_p3',1,17,6,9,5,1,12,2,48,2,0,0,4,4,4,0,NULL),(503,43,42,'Healing Kit V','healing_kit_p4',1,17,6,9,7,1,12,2,48,2,0,0,5,4,4,0,NULL),(504,43,14,'Dexterity Stim I','stim_dex1',1,17,6,9,1,1,12,2,48,2,0,0,2,4,4,0,NULL),(505,43,15,'Intelligence Stim I','stim_int1',1,17,6,9,1,1,12,2,48,2,0,0,2,4,4,0,NULL),(506,43,16,'Strength Stim I','stim_str1',1,17,6,9,1,1,12,2,48,2,0,0,2,4,4,0,NULL),(507,43,17,'Charisma Stim I','stim_cha1',1,17,6,9,1,1,12,2,48,2,0,0,2,4,4,0,NULL),(508,43,18,'Constitution Stim I','stim_con1',1,17,6,9,1,1,12,2,48,2,0,0,2,4,4,0,NULL),(509,43,19,'Wisdom Stim I','stim_wis1',1,17,6,9,1,1,12,2,48,2,0,0,2,4,4,0,NULL),(510,43,24,'Dexterity Stim II','stim_dex2',1,17,6,9,3,1,12,2,48,2,0,0,3,4,4,0,NULL),(511,43,25,'Intelligence Stim II','stim_int2',1,17,6,9,3,1,12,2,48,2,0,0,3,4,4,0,NULL),(512,43,26,'Strength Stim II','stim_str2',1,17,6,9,3,1,12,2,48,2,0,0,3,4,4,0,NULL),(513,43,27,'Charisma Stim II','stim_cha2',1,17,6,9,3,1,12,2,48,2,0,0,3,4,4,0,NULL),(514,43,28,'Constitution Stim II','stim_con2',1,17,6,9,3,1,12,2,48,2,0,0,3,4,4,0,NULL),(515,43,29,'Wisdom Stim II','stim_wis2',1,17,6,9,3,1,12,2,48,2,0,0,3,4,4,0,NULL),(516,43,34,'Dexterity Stim III','stim_dex3',1,17,6,9,5,1,12,2,48,2,0,0,4,4,4,0,NULL),(517,43,35,'Intelligence Stim III','stim_int3',1,17,6,9,5,1,12,2,48,2,0,0,4,4,4,0,NULL),(518,43,36,'Strength Stim III','stim_str3',1,17,6,9,5,1,12,2,48,2,0,0,4,4,4,0,NULL),(519,43,37,'Charisma Stim III','stim_cha3',1,17,6,9,5,1,12,2,48,2,0,0,4,4,4,0,NULL),(520,43,38,'Constitution Stim III','stim_con3',1,17,6,9,5,1,12,2,48,2,0,0,4,4,4,0,NULL),(521,43,39,'Wisdom Stim III','stim_wis3',1,17,6,9,5,1,12,2,48,2,0,0,4,4,4,0,NULL),(522,43,1,'Bandages','bandages',1,17,6,NULL,0,1,12,1,0,0,0,0,1,4,0,0,NULL),(523,43,15,'Resuscitation Device I','res_kit_1',1,17,6,9,1,1,12,2,15,1,2,1,1,4,2,2,NULL),(524,43,25,'Resuscitation Device II','res_kit_2',1,17,6,9,3,1,12,2,15,1,2,1,2,4,2,2,NULL),(525,43,35,'Resuscitation Device III','res_kit_3',1,17,6,9,5,1,12,2,15,1,2,1,3,4,2,2,NULL),(526,43,45,'Resuscitation Device IV','res_kit_4',1,17,6,9,7,1,12,2,15,1,2,1,4,4,2,2,NULL),(527,43,3,'Force Pack I','force_pack_1',1,17,6,NULL,0,1,12,2,48,2,0,0,1,4,4,0,NULL),(528,43,13,'Force Pack II','force_pack_2',1,17,6,9,1,1,12,2,48,2,0,0,2,4,4,0,NULL),(529,43,23,'Force Pack III','force_pack_3',1,17,6,9,3,1,12,2,48,2,0,0,3,4,4,0,NULL),(530,43,33,'Force Pack IV','force_pack_4',1,17,6,9,5,1,12,2,48,2,0,0,4,4,4,0,NULL),(531,43,43,'Force Pack V','force_pack_5',1,17,6,9,7,1,12,2,48,2,0,0,5,4,4,0,NULL),(532,43,5,'Poison Treatment Kit','treatment_kit',1,17,6,NULL,0,1,12,2,48,2,0,0,1,4,4,0,NULL),(533,44,7,'Medical Enhancer I','m_enhancer',1,17,6,NULL,0,1,15,2,12,2,48,1,0,4,4,2,NULL),(534,44,17,'Medical Enhancer II','m_enhancer2',1,17,6,9,1,1,15,2,12,2,48,1,1,4,4,2,NULL),(535,44,27,'Medical Enhancer III','m_enhancer3',1,17,6,9,3,1,15,2,12,2,48,1,2,4,4,2,NULL),(536,44,37,'Medical Enhancer IV','m_enhancer4',1,17,6,9,5,1,15,2,12,2,48,1,3,4,4,2,NULL),(537,44,47,'Medical Enhancer V','m_enhancer5',1,17,6,9,7,1,15,2,12,2,48,1,4,4,4,2,NULL),(538,45,5,'Blaster Pistol Repair Kit I','bp_rep_1',1,22,4,96,1,1,15,2,2,2,0,0,0,4,4,0,NULL),(539,45,15,'Blaster Pistol Repair Kit II','bp_rep_2',1,22,4,96,3,1,15,2,2,2,0,0,1,4,4,0,NULL),(540,45,25,'Blaster Pistol Repair Kit III','bp_rep_3',1,22,4,96,5,1,15,2,2,2,0,0,2,4,4,0,NULL),(541,45,35,'Blaster Pistol Repair Kit IV','bp_rep_4',1,22,4,96,7,1,15,2,2,2,0,0,3,4,4,0,NULL),(542,45,6,'Blaster Rifle Repair Kit I','br_rep_1',1,22,4,96,1,1,15,2,2,2,0,0,0,4,4,0,NULL),(543,45,16,'Blaster Rifle Repair Kit II','br_rep_2',1,22,4,96,3,1,15,2,2,2,0,0,1,4,4,0,NULL),(544,45,26,'Blaster Rifle Repair Kit III','br_rep_3',1,22,4,96,5,1,15,2,2,2,0,0,2,4,4,0,NULL),(545,45,36,'Blaster Rifle Repair Kit IV','br_rep_4',1,22,4,96,7,1,15,2,2,2,0,0,3,4,4,0,NULL),(546,45,7,'Baton Repair Kit I','bt_rep_1',1,12,2,84,1,1,3,2,2,2,0,0,0,4,4,0,NULL),(547,45,17,'Baton Repair Kit II','bt_rep_2',1,12,2,84,3,1,3,2,2,2,0,0,1,4,4,0,NULL),(548,45,27,'Baton Repair Kit III','bt_rep_3',1,12,2,84,5,1,3,2,2,2,0,0,2,4,4,0,NULL),(549,45,37,'Baton Repair Kit IV','bt_rep_4',1,12,2,84,7,1,3,2,2,2,0,0,3,4,4,0,NULL),(550,45,8,'Finesse Vibroblade Repair Kit I','fv_rep_1',1,12,2,84,1,1,2,2,3,2,0,0,0,4,4,0,NULL),(551,45,18,'Finesse Vibroblade Repair Kit II','fv_rep_2',1,12,2,84,3,1,2,2,3,2,0,0,1,4,4,0,NULL),(552,45,28,'Finesse Vibroblade Repair Kit III','fv_rep_3',1,12,2,84,5,1,2,2,3,2,0,0,2,4,4,0,NULL),(553,45,38,'Finesse Vibroblade Repair Kit IV','fv_rep_4',1,12,2,84,7,1,2,2,3,2,0,0,3,4,4,0,NULL),(554,45,9,'Heavy Vibroblade Repair Kit I','hv_rep_1',1,12,2,84,1,1,2,3,3,3,0,0,0,6,6,0,NULL),(555,45,19,'Heavy Vibroblade Repair Kit II','hv_rep_2',1,12,2,84,3,1,2,3,3,3,0,0,1,6,6,0,NULL),(556,45,29,'Heavy Vibroblade Repair Kit III','hv_rep_3',1,12,2,84,5,1,2,3,3,3,0,0,2,6,6,0,NULL),(557,45,39,'Heavy Vibroblade Repair Kit IV','hv_rep_4',1,12,2,84,7,1,2,3,3,3,0,0,3,6,6,0,NULL),(558,45,7,'Lightsaber Repair Kit I','ls_rep_1',1,14,4,151,1,1,32,2,15,2,0,0,0,4,4,0,NULL),(559,45,17,'Lightsaber Repair Kit II','ls_rep_2',1,14,4,151,3,1,32,2,15,2,0,0,1,4,4,0,NULL),(560,45,27,'Lightsaber Repair Kit III','ls_rep_3',1,14,4,151,5,1,32,2,15,2,0,0,2,4,4,0,NULL),(561,45,37,'Lightsaber Repair Kit IV','ls_rep_4',1,14,4,151,7,1,32,2,15,2,0,0,3,4,4,0,NULL),(562,45,11,'Martial Arts Weapon Repair Kit I','ma_rep_1',1,12,2,84,1,1,3,2,13,2,0,0,0,4,4,0,NULL),(563,45,21,'Martial Arts Weapon Repair Kit II','ma_rep_2',1,12,2,84,3,1,3,2,13,2,0,0,1,4,4,0,NULL),(564,45,31,'Martial Arts Weapon Repair Kit III','ma_rep_3',1,12,2,84,5,1,3,2,13,2,0,0,2,4,4,0,NULL),(565,45,41,'Martial Arts Weapon Repair Kit IV','ma_rep_4',1,12,2,84,7,1,3,2,13,2,0,0,3,4,4,0,NULL),(566,45,12,'Polearm Repair Kit I','po_rep_1',1,12,2,84,1,1,2,3,3,3,0,0,0,6,6,0,NULL),(567,45,22,'Polearm Repair Kit II','po_rep_2',1,12,2,84,3,1,2,3,3,3,0,0,1,6,6,0,NULL),(568,45,32,'Polearm Repair Kit III','po_rep_3',1,12,2,84,5,1,2,3,3,3,0,0,2,6,6,0,NULL),(569,45,42,'Polearm Repair Kit IV','po_rep_4',1,12,2,84,7,1,2,3,3,3,0,0,3,6,6,0,NULL),(570,45,10,'Saberstaff Repair Kit I','ss_rep_1',1,14,4,151,1,1,32,3,15,3,0,0,0,6,6,0,NULL),(571,45,20,'Saberstaff Repair Kit II','ss_rep_2',1,14,4,151,3,1,32,3,15,3,0,0,1,6,6,0,NULL),(572,45,30,'Saberstaff Repair Kit III','ss_rep_3',1,14,4,151,5,1,32,3,15,3,0,0,2,6,6,0,NULL),(573,45,40,'Saberstaff Repair Kit IV','ss_rep_4',1,14,4,151,7,1,32,3,15,3,0,0,3,6,6,0,NULL),(574,45,14,'Twin Vibroblade Repair Kit I','tb_rep_1',1,12,2,84,1,1,2,3,3,3,0,0,0,6,6,0,NULL),(575,45,24,'Twin Vibroblade Repair Kit II','tb_rep_2',1,12,2,84,3,1,2,3,3,3,0,0,1,6,6,0,NULL),(576,45,34,'Twin Vibroblade Repair Kit III','tb_rep_3',1,12,2,84,5,1,2,3,3,3,0,0,2,6,6,0,NULL),(577,45,44,'Twin Vibroblade Repair Kit IV','tb_rep_4',1,12,2,84,7,1,2,3,3,3,0,0,3,6,6,0,NULL),(578,45,7,'Vibroblade Repair Kit I','vb_rep_1',1,12,2,84,1,1,2,2,3,2,0,0,0,4,4,0,NULL),(579,45,17,'Vibroblade Repair Kit II','vb_rep_2',1,12,2,84,3,1,2,2,3,2,0,0,1,4,4,0,NULL),(580,45,27,'Vibroblade Repair Kit III','vb_rep_3',1,12,2,84,5,1,2,2,3,2,0,0,2,4,4,0,NULL),(581,45,37,'Vibroblade Repair Kit IV','vb_rep_4',1,12,2,84,7,1,2,2,3,2,0,0,3,4,4,0,NULL),(582,45,12,'Force Armor Repair Kit I','fa_rep_1',1,13,1,124,1,1,13,2,12,2,0,0,0,4,4,0,NULL),(583,45,22,'Force Armor Repair Kit II','fa_rep_2',1,13,1,124,3,1,13,2,12,2,0,0,1,4,4,0,NULL),(584,45,32,'Force Armor Repair Kit III','fa_rep_3',1,13,1,124,5,1,13,2,12,2,0,0,2,4,4,0,NULL),(585,45,42,'Force Armor Repair Kit IV','fa_rep_4',1,13,1,124,7,1,13,2,12,2,0,0,3,4,4,0,NULL),(586,45,14,'Heavy Armor Repair Kit I','ha_rep_1',1,13,1,124,1,1,2,3,14,3,0,0,0,6,6,0,NULL),(587,45,24,'Heavy Armor Repair Kit II','ha_rep_2',1,13,1,124,3,1,2,3,14,3,0,0,1,6,6,0,NULL),(588,45,34,'Heavy Armor Repair Kit III','ha_rep_3',1,13,1,124,5,1,2,3,14,3,0,0,2,6,6,0,NULL),(589,45,44,'Heavy Armor Repair Kit IV','ha_rep_4',1,13,1,124,7,1,2,3,14,3,0,0,3,6,6,0,NULL),(590,45,10,'Light Armor Repair Kit I','la_rep_1',1,13,1,124,1,1,12,2,13,2,0,0,0,4,4,0,NULL),(591,45,20,'Light Armor Repair Kit II','la_rep_2',1,13,1,124,3,1,12,2,13,2,0,0,1,4,4,0,NULL),(592,45,30,'Light Armor Repair Kit III','la_rep_3',1,13,1,124,5,1,12,2,13,2,0,0,2,4,4,0,NULL),(593,45,40,'Light Armor Repair Kit IV','la_rep_4',1,13,1,124,7,1,12,2,13,2,0,0,3,4,4,0,NULL),(594,45,8,'Shield Repair Kit I','sh_rep_1',1,13,1,124,1,1,3,2,2,2,0,0,0,4,4,0,NULL),(595,45,18,'Shield Repair Kit II','sh_rep_2',1,13,1,124,3,1,3,2,2,2,0,0,1,4,4,0,NULL),(596,45,28,'Shield Repair Kit III','sh_rep_3',1,13,1,124,5,1,3,2,2,2,0,0,2,4,4,0,NULL),(597,45,38,'Shield Repair Kit IV','sh_rep_4',1,13,1,124,7,1,3,2,2,2,0,0,3,4,4,0,NULL),(598,23,0,'Basic Resource Silo','silo',1,15,5,2,1,1,40,1,43,2,0,0,0,2,4,0,166),(599,23,5,'Resource Silo I','silo',1,15,5,2,1,1,40,1,43,2,0,0,1,2,4,0,167),(600,23,10,'Resource Silo II','silo',1,15,5,2,3,1,40,1,43,2,0,0,2,2,4,0,168),(601,23,15,'Resource Silo III','silo',1,15,5,2,5,1,40,1,43,2,0,0,3,2,4,0,169),(602,23,20,'Resource Silo IV','silo',1,15,5,2,7,1,40,1,43,2,0,0,4,2,4,0,170),(603,22,0,'Basic Resource Drill','drill',1,15,5,2,1,1,41,1,43,6,0,0,0,2,12,0,171),(604,22,5,'Resource Drill I','drill',1,15,5,2,1,1,41,1,43,6,0,0,1,2,12,0,172),(605,22,10,'Resource Drill II','drill',1,15,5,2,3,1,41,1,43,6,0,0,2,2,12,0,173),(606,22,15,'Resource Drill III','drill',1,15,5,2,5,1,41,1,43,6,0,0,3,2,12,0,174),(607,22,20,'Resource Drill IV','drill',1,15,5,2,7,1,41,1,43,6,0,0,4,2,12,0,175),(608,41,5,'Basic Mineral Scanner','scanner_m_b',1,22,4,NULL,0,1,15,3,0,0,0,0,1,6,0,0,NULL),(609,39,0,'Fabrication Terminal','furniture',1,15,5,2,1,1,2,2,3,2,0,0,0,2,2,0,176),(610,39,0,'Medical Terminal','furniture',1,15,5,2,1,1,2,2,3,2,0,0,0,2,2,0,177),(611,13,1,'Emitter','emitter',1,14,4,151,1,1,15,2,0,0,0,0,3,4,0,0,NULL),(612,4,2,'Basic Training Foil (Red)','lightsaber_r_b',1,14,4,151,1,1,62,1,22,1,29,2,1,2,2,3,NULL),(613,4,7,'Training Foil I (Red)','lightsaber_r_1',1,14,4,151,3,1,62,1,22,1,29,2,2,2,2,3,NULL),(614,4,12,'Training Foil II (Red)','lightsaber_r_2',1,14,4,151,5,1,62,1,22,1,29,2,3,2,2,3,NULL),(615,4,17,'Training Foil III (Red)','lightsaber_r_3',1,14,4,151,7,1,62,1,22,1,29,2,4,2,2,3,NULL),(616,4,22,'Training Foil IV (Red)','lightsaber_r_4',1,14,4,151,9,1,62,1,22,1,29,2,5,2,2,3,NULL),(617,8,7,'Basic Training Foil Staff (Red)','saberstaff_r_b',1,14,4,151,1,1,62,2,22,1,29,2,2,2,2,3,NULL),(618,8,8,'Training Foil Staff I (Red)','saberstaff_r_1',1,14,4,151,3,1,62,2,22,1,29,2,3,4,2,3,NULL),(619,8,13,'Training Foil Staff II (Red)','saberstaff_r_2',1,14,4,151,5,1,62,2,22,1,29,2,4,4,2,3,NULL),(620,8,18,'Training Foil Staff III (Red)','saberstaff_r_3',1,14,4,151,7,1,62,2,22,1,29,2,5,4,2,3,NULL),(621,8,23,'Training Foil Staff IV (Red)','saberstaff_r_4',1,14,4,151,9,1,62,2,22,1,29,2,6,4,2,3,NULL),(622,4,2,'Basic Training Foil (Green)','lightsaber_g_b',1,14,4,151,1,1,62,1,22,1,30,2,1,2,2,3,NULL),(623,4,7,'Training Foil I (Green)','lightsaber_g_1',1,14,4,151,3,1,62,1,22,1,30,2,2,2,2,3,NULL),(624,4,12,'Training Foil II (Green)','lightsaber_g_2',1,14,4,151,5,1,62,1,22,1,30,2,3,2,2,3,NULL),(625,4,17,'Training Foil III (Green)','lightsaber_g_3',1,14,4,151,7,1,62,1,22,1,30,2,4,2,2,3,NULL),(626,4,22,'Training Foil IV (Green)','lightsaber_g_4',1,14,4,151,9,1,62,1,22,1,30,2,5,2,2,3,NULL),(627,8,7,'Basic Training Foil Staff (Green)','saberstaff_g_b',1,14,4,151,1,1,62,2,22,1,30,2,2,2,2,3,NULL),(628,8,8,'Training Foil Staff I (Green)','saberstaff_g_1',1,14,4,151,3,1,62,2,22,1,30,2,3,4,2,3,NULL),(629,8,13,'Training Foil Staff II (Green)','saberstaff_g_2',1,14,4,151,5,1,62,2,22,1,30,2,4,4,2,3,NULL),(630,8,18,'Training Foil Staff III (Green)','saberstaff_g_3',1,14,4,151,7,1,62,2,22,1,30,2,5,4,2,3,NULL),(631,8,23,'Training Foil Staff IV (Green)','saberstaff_g_4',1,14,4,151,9,1,62,2,22,1,30,2,6,4,2,3,NULL),(632,4,2,'Basic Training Foil (Yellow)','lightsaber_y_b',1,14,4,151,1,1,62,1,22,1,31,2,1,2,2,3,NULL),(633,4,7,'Training Foil I (Yellow)','lightsaber_y_1',1,14,4,151,3,1,62,1,22,1,31,2,2,2,2,3,NULL),(634,4,12,'Training Foil II (Yellow)','lightsaber_y_2',1,14,4,151,5,1,62,1,22,1,31,2,3,2,2,3,NULL),(635,4,17,'Training Foil III (Yellow)','lightsaber_y_3',1,14,4,151,7,1,62,1,22,1,31,2,4,2,2,3,NULL),(636,4,22,'Training Foil IV (Yellow)','lightsaber_y_4',1,14,4,151,9,1,62,1,22,1,31,2,5,2,2,3,NULL),(637,8,7,'Basic Training Foil Staff (Yellow)','saberstaff_y_b',1,14,4,151,1,1,62,2,22,1,31,2,2,2,2,3,NULL),(638,8,8,'Training Foil Staff I (Yellow)','saberstaff_y_1',1,14,4,151,3,1,62,2,22,1,31,2,3,4,2,3,NULL),(639,8,13,'Training Foil Staff II (Yellow)','saberstaff_y_2',1,14,4,151,5,1,62,2,22,1,31,2,4,4,2,3,NULL),(640,8,18,'Training Foil Staff III (Yellow)','saberstaff_y_3',1,14,4,151,7,1,62,2,22,1,31,2,5,4,2,3,NULL),(641,8,23,'Training Foil Staff IV (Yellow)','saberstaff_y_4',1,14,4,151,9,1,62,2,22,1,31,2,6,4,2,3,NULL),(642,30,10,'Wookiee Rug','furniture',1,15,5,2,3,1,13,1,12,2,0,0,1,1,2,0,178),(643,19,1,'Basic Force Helmet','helmet_fb',1,13,1,124,0,1,35,1,38,1,0,0,1,2,2,0,NULL),(644,19,5,'Force Helmet I','helmet_f1',1,13,1,124,1,1,35,1,38,1,0,0,1,2,2,0,NULL),(645,19,9,'Force Helmet II','helmet_f2',1,13,1,124,3,1,35,1,38,1,0,0,2,2,2,0,NULL),(646,19,14,'Force Helmet III','helmet_f3',1,13,1,124,5,1,35,1,38,1,0,0,3,2,2,0,NULL),(647,19,19,'Force Helmet IV','helmet_f4',1,13,1,124,7,1,35,1,38,1,0,0,4,2,2,0,NULL),(649,20,2,'Basic Heavy Helmet','helmet_hb',1,13,1,124,0,1,33,1,36,1,0,0,1,2,2,0,NULL),(650,20,7,'Heavy Helmet I','helmet_h1',1,13,1,124,1,1,33,1,36,1,0,0,1,2,2,0,NULL),(651,20,12,'Heavy Helmet II','helmet_h2',1,13,1,124,3,1,33,1,36,1,0,0,2,2,2,0,NULL),(652,20,17,'Heavy Helmet III','helmet_h3',1,13,1,124,3,1,33,1,36,1,0,0,3,2,2,0,NULL),(653,20,23,'Heavy Helmet IV','helmet_h4',1,13,1,124,7,1,33,1,36,1,0,0,4,2,2,0,NULL),(654,18,0,'Basic Light Helmet','helmet_lb',1,13,1,124,0,1,34,1,37,1,0,0,1,2,2,0,NULL),(655,18,5,'Light Helmet I','helmet_l1',1,13,1,124,1,1,34,1,37,1,0,0,1,2,2,0,NULL),(656,18,10,'Light Helmet II','helmet_l2',1,13,1,124,3,1,34,1,37,1,0,0,2,2,2,0,NULL),(657,18,15,'Light Helmet III','helmet_l3',1,13,1,124,5,1,34,1,37,1,0,0,3,2,2,0,NULL),(658,18,20,'Light Helmet IV','helmet_l4',1,13,1,124,7,1,34,1,37,1,0,0,4,2,2,0,NULL),(659,46,8,'Hyperdrive','hyperdrive',1,22,4,96,7,1,42,3,15,4,45,2,4,3,12,2,NULL),(660,46,4,'Hull Plating','hull_plating',1,13,1,124,7,1,2,4,0,0,0,0,4,12,0,0,NULL),(661,46,0,'Light Starship Blaster','ship_blaster_1',1,22,4,96,7,1,19,2,32,4,0,0,4,6,8,0,NULL),(662,46,10,'Starship Dock','silo',1,15,5,2,5,1,41,1,43,6,45,1,4,2,12,2,179),(663,46,0,'Starship 1 (Light Transport 1)','starship',1,15,5,2,7,1,63,1,64,4,65,1,4,1,6,1,180),(664,46,0,'Starship 2 (Light Escort 1)','starship',1,15,5,2,7,1,63,1,64,2,65,4,4,1,6,5,181),(665,45,30,'Starship Repair Kit','ss_rep',1,15,5,2,5,1,2,3,42,1,32,1,0,6,4,3,NULL),(666,46,25,'Starship Auxiliary Blaster','sswpn1',1,22,4,96,5,1,19,2,32,2,0,0,4,4,4,0,NULL),(667,46,46,'Starship Auxiliary Light Cannon','sswpn2',1,22,4,96,7,1,19,4,32,4,0,0,4,8,8,0,NULL),(668,46,23,'Auxiliary Shield Generator (Small)','ssshld1',1,22,4,96,5,1,15,4,45,2,0,0,4,6,2,0,NULL),(669,46,45,'Auxiliary Shield Generator (Medium)','ssshld2',1,22,4,96,7,1,15,4,45,2,0,0,4,6,2,0,NULL),(670,46,20,'Auxiliary Thruster (Small)','ssspd1',1,22,4,96,5,1,32,3,45,2,0,0,4,4,2,0,NULL),(671,46,38,'Auxiliary Thruster (Medium)','ssspd2',1,22,4,96,7,1,32,5,45,4,0,0,4,8,4,0,NULL),(672,46,25,'Auxiliary Targeter (Basic)','ssrang1',1,22,4,96,5,1,42,3,0,0,0,0,4,4,0,0,NULL),(673,46,42,'Auxiliary Targeter (Improved)','ssrang2',1,22,4,96,7,1,42,5,0,0,0,0,4,8,0,0,NULL),(674,46,20,'Additional Fuel Tank (Small)','ssfuel1',1,13,1,124,5,1,2,2,39,1,0,0,4,4,2,0,NULL),(675,46,40,'Additional Fuel Tank (Medium)','ssfuel2',1,13,1,124,7,1,2,2,40,1,0,0,4,4,2,0,NULL),(676,46,20,'Additional Stronidium Tank (Small)','ssstron1',1,13,1,124,5,1,43,1,39,1,0,0,4,2,2,0,NULL),(677,46,40,'Additional Stronidium Tank (Medium)','ssstron2',1,13,1,124,7,1,43,2,40,1,0,0,4,4,2,0,NULL),(678,46,20,'Cloaking Generator (Small)','ssstlth1',1,22,4,96,5,1,15,3,45,2,0,0,4,4,2,0,NULL),(679,46,38,'Cloaking Generator (Medium)','ssstlth2',1,22,4,96,7,1,15,5,45,4,0,0,4,8,4,0,NULL),(680,46,24,'Scanning Array (Small)','ssscan1',1,22,4,96,5,1,15,3,42,2,0,0,4,4,2,0,NULL),(681,46,40,'Scanning Array (Medium)','ssscan2',1,22,4,96,7,1,15,5,42,4,0,0,4,8,4,0,NULL),(682,47,7,'Jukebox','furniture',1,15,5,2,3,1,43,2,0,0,0,0,0,2,0,0,5),(683,12,2,'Basic Throwing Axe','axe_b',1,12,2,NULL,0,1,4,1,8,1,0,0,1,2,2,0,NULL),(684,12,5,'Throwing Axe I','axe_1',1,12,2,NULL,0,1,4,1,8,1,0,0,2,2,2,0,NULL),(685,12,10,'Throwing Axe II','axe_2',1,12,2,NULL,0,1,4,1,8,1,0,0,3,2,2,0,NULL),(686,12,15,'Throwing Axe III','axe_3',1,12,2,NULL,0,1,4,1,8,1,0,0,4,2,2,0,NULL),(687,12,20,'Throwing Axe IV','axe_4',1,12,2,NULL,0,1,4,1,8,1,0,0,5,2,2,0,NULL),(688,18,2,'Basic Light Bracer','bracer_light_b',1,13,1,NULL,0,1,34,1,37,1,0,0,0,2,2,0,NULL),(689,18,6,'Light Bracer I','bracer_light_1',1,13,1,124,1,1,34,1,37,1,0,0,1,2,2,0,NULL),(690,18,10,'Light Bracer II','bracer_light_2',1,13,1,124,3,1,34,1,37,1,0,0,2,2,2,0,NULL),(691,18,14,'Light Bracer III','bracer_light_3',1,13,1,124,5,1,34,1,37,1,0,0,3,2,2,0,NULL),(692,18,18,'Light Bracer IV','bracer_light_4',1,13,1,124,7,1,34,1,37,1,0,0,4,2,2,0,NULL),(693,19,3,'Basic Force Bracer','bracer_force_b',1,13,1,NULL,0,1,35,1,38,1,0,0,0,2,2,0,NULL),(694,19,9,'Force Bracer I','bracer_force_1',1,13,1,124,1,1,35,1,38,1,0,0,1,2,2,0,NULL),(695,19,11,'Force Bracer II','bracer_force_2',1,13,1,124,3,1,35,1,38,1,0,0,2,2,2,0,NULL),(696,19,15,'Force Bracer III','bracer_force_3',1,13,1,124,5,1,35,1,38,1,0,0,3,2,2,0,NULL),(697,19,19,'Force Bracer IV','bracer_force_4',1,13,1,124,7,1,35,1,38,1,0,0,4,2,2,0,NULL),(698,20,6,'Basic Heavy Bracer','bracer_heavy_b',1,13,1,NULL,0,1,33,1,36,1,0,0,0,2,2,0,NULL),(699,20,8,'Heavy Bracer I','bracer_heavy_1',1,13,1,124,1,1,33,1,36,1,0,0,1,2,2,0,NULL),(700,20,12,'Heavy Bracer II','bracer_heavy_2',1,13,1,124,3,1,33,1,36,1,0,0,2,2,2,0,NULL),(701,20,16,'Heavy Bracer III','bracer_heavy_3',1,13,1,124,5,1,33,1,36,1,0,0,3,2,2,0,NULL),(702,20,20,'Heavy Bracer IV','bracer_heavy_4',1,13,1,124,7,1,33,1,36,1,0,0,4,2,2,0,NULL);
/*!40000 ALTER TABLE `CraftBlueprint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CraftBlueprintCategory`
--

DROP TABLE IF EXISTS `CraftBlueprintCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CraftBlueprintCategory` (
  `ID` int NOT NULL,
  `Name` varchar(32) NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CraftBlueprintCategory`
--

LOCK TABLES `CraftBlueprintCategory` WRITE;
/*!40000 ALTER TABLE `CraftBlueprintCategory` DISABLE KEYS */;
INSERT INTO `CraftBlueprintCategory` VALUES (0,'Unknown',0),(1,'Vibroblades',1),(2,'Finesse Vibroblades',1),(3,'Batons',1),(4,'Lightsabers',1),(5,'Heavy Vibroblades',1),(6,'Polearms',1),(7,'Twin Vibroblades',1),(8,'Saberstaffs',1),(9,'Martial Arts',1),(10,'Blaster Pistols',1),(11,'Blaster Rifles',1),(12,'Throwing',1),(13,'Components',1),(14,'Red Mods',1),(15,'Blue Mods',1),(16,'Green Mods',1),(17,'Yellow Mods',1),(18,'Light Armor',1),(19,'Force Armor',1),(20,'Heavy Armor',1),(21,'Control Towers',1),(22,'Drills',1),(23,'Silos',1),(24,'Turrets',1),(25,'Buildings',1),(26,'Mass Production',1),(27,'Starship Production',1),(28,'Furniture - Tables',1),(29,'Furniture - Altars',1),(30,'Furniture - Flooring',1),(31,'Furniture - Beds',1),(32,'Furniture - Misc',1),(33,'Furniture - Lighting',1),(34,'Furniture - Doors',1),(35,'Furniture - Statues',1),(36,'Furniture - Pillars',1),(37,'Furniture - Seating',1),(38,'Item Storage',1),(39,'Crafting Devices',1),(40,'Buildings',1),(41,'Harvesters',1),(42,'Fuel',1),(43,'Medical',1),(44,'Enhancements',1),(45,'Repair Kits',1),(46,'Starship Production',1),(47,'Special Furniture',1);
/*!40000 ALTER TABLE `CraftBlueprintCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CraftDevice`
--

DROP TABLE IF EXISTS `CraftDevice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CraftDevice` (
  `ID` int NOT NULL,
  `Name` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CraftDevice`
--

LOCK TABLES `CraftDevice` WRITE;
/*!40000 ALTER TABLE `CraftDevice` DISABLE KEYS */;
INSERT INTO `CraftDevice` VALUES (1,'Armorsmith Bench'),(2,'Weaponsmith Bench'),(3,'Cookpot'),(4,'Engineering Bench'),(5,'Fabrication Terminal'),(6,'Medicine Bench');
/*!40000 ALTER TABLE `CraftDevice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CustomEffect`
--

DROP TABLE IF EXISTS `CustomEffect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CustomEffect` (
  `ID` int NOT NULL,
  `Name` varchar(32) NOT NULL,
  `IconID` int NOT NULL,
  `CustomEffectCategoryID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_CustomEffect_CustomEffectCategoryID` (`CustomEffectCategoryID`),
  CONSTRAINT `FK_CustomEffect_CustomEffectCategoryID` FOREIGN KEY (`CustomEffectCategoryID`) REFERENCES `CustomEffectCategory` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomEffect`
--

LOCK TABLES `CustomEffect` WRITE;
/*!40000 ALTER TABLE `CustomEffect` DISABLE KEYS */;
INSERT INTO `CustomEffect` VALUES (1,'Bleeding',129,1),(2,'Burning',0,1),(3,'Poison',0,1),(4,'Force Aura',0,1),(5,'Force Breach',0,1),(7,'Force Shock',0,1),(8,'Absorption Field',0,1),(9,'Force Spread',0,1),(11,'Shield Boost',0,1),(12,'Meditate',0,1),(13,'Rest',0,1),(14,'Fire Cell',0,1),(15,'Balanced Stance',0,2),(16,'Electric Cell',0,1),(17,'Sonic Cell',0,1),(18,'Acid Cell',0,1),(19,'Ice Cell',0,1),(20,'Divine Cell',0,1),(22,'Shield Oath',0,2),(23,'Precision Targeting',0,2),(24,'Force Pack',0,1);
/*!40000 ALTER TABLE `CustomEffect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CustomEffectCategory`
--

DROP TABLE IF EXISTS `CustomEffectCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CustomEffectCategory` (
  `ID` int NOT NULL,
  `Name` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomEffectCategory`
--

LOCK TABLES `CustomEffectCategory` WRITE;
/*!40000 ALTER TABLE `CustomEffectCategory` DISABLE KEYS */;
INSERT INTO `CustomEffectCategory` VALUES (1,'Normal Effect'),(2,'Stance'),(3,'Food Effect');
/*!40000 ALTER TABLE `CustomEffectCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DatabaseVersion`
--

DROP TABLE IF EXISTS `DatabaseVersion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DatabaseVersion` (
  `ID` varchar(64) NOT NULL,
  `ScriptName` varchar(100) NOT NULL DEFAULT '',
  `DateApplied` datetime(6) NOT NULL,
  `VersionDate` datetime(6) NOT NULL,
  `VersionNumber` int NOT NULL,
  `ClusterID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CIX_DatabaseVersion_ID` (`ClusterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DatabaseVersion`
--

LOCK TABLES `DatabaseVersion` WRITE;
/*!40000 ALTER TABLE `DatabaseVersion` DISABLE KEYS */;
INSERT INTO `DatabaseVersion` VALUES ('0199E788-AFD8-49E7-98D0-43E57128AC5F','2019-03-03.1.sql','2019-03-07 18:04:34.386666','2019-03-03 00:00:00.000000',1,25),('0225B31A-DE62-4CA4-B13C-9E58BC03C5FF','2018-11-27.3.sql','2018-11-27 15:07:31.946666','2018-11-27 00:00:00.000000',3,58),('02BB268D-EB8E-4BF7-B182-A7B50B4EA8FC','2018-11-21.1.sql','2018-11-22 10:15:24.340000','2018-11-21 00:00:00.000000',1,60),('052D95D6-770B-404E-A29B-7B6A6034BF34','2018-11-12.1.sql','2018-11-22 10:15:23.286666','2018-11-12 00:00:00.000000',1,48),('0773C64B-6C0D-43DE-939E-BC555A19984D','2019-01-04.1.sql','2019-01-08 16:09:06.976666','2019-01-04 00:00:00.000000',1,70),('0BBD8B4F-BD43-40B2-AF94-0A68650FABC3','2018-11-19.4.sql','2018-11-22 10:15:23.926666','2018-11-19 00:00:00.000000',4,5),('0D0DA767-8499-4D1B-9735-46BA83F857FB','2018-11-12.6.sql','2018-11-22 10:15:23.493333','2018-11-12 00:00:00.000000',6,28),('0D82A31A-1599-44CD-9F4E-FF5E6462F88B','2018-11-23.1.sql','2018-11-23 04:05:01.173333','2018-11-23 00:00:00.000000',1,93),('0E838045-959C-44AC-88AA-61B8881B1F2A','2019-07-19.1.sql','2019-07-19 19:18:20.203333','2019-07-19 00:00:00.000000',1,102),('11134035-A83D-4F5B-89C5-9AAED2A0408C','2018-12-03.1.sql','2018-12-03 16:29:51.240000','2018-12-03 00:00:00.000000',1,57),('15EC95D7-62A2-4BD2-ACF7-BFC152DF0891','2019-07-20.1.sql','2019-07-21 02:42:48.843333','2019-07-20 00:00:00.000000',1,103),('175037BD-3EC3-4166-BCC4-FC207BE2D882','2018-11-20.3.sql','2018-11-22 10:15:24.276666','2018-11-20 00:00:00.000000',3,92),('1A3B5D3E-520B-4D01-BCF4-DC3A8EA8CB65','2019-01-19.1.sql','2019-02-02 06:32:16.193333','2019-01-19 00:00:00.000000',1,82),('1A72C096-A22C-4CD7-86FF-CB55E2DC5171','2019-02-26.2.sql','2019-03-07 18:04:32.700000','2019-02-26 00:00:00.000000',2,75),('1ABC3C2C-9726-4B12-993B-078876630688','2019-08-26.1.sql','2019-08-29 00:32:12.203333','2019-08-26 00:00:00.000000',1,121),('1BA0C511-DA1C-45A4-9174-D659A893F754','2019-02-21.1.sql','2019-02-23 15:04:53.463333','2019-02-21 00:00:00.000000',1,80),('1F45E181-4B97-4B47-BC42-A3688C853182','2019-01-09.2.sql','2019-01-10 16:46:56.900000','2019-01-09 00:00:00.000000',2,59),('1F49DB8C-738F-4BAD-9644-83F6D638E607','2019-08-27.2.sql','2019-08-29 00:32:12.833333','2019-08-27 00:00:00.000000',2,125),('21FA8EBF-84A7-4D34-8FB9-7F6F849BD8D7','2018-11-08.5.sql','2018-11-22 10:15:23.166666','2018-11-08 00:00:00.000000',5,50),('271106B3-CF16-4AE7-9E9C-270C4CE90024','2019-08-26.2.sql','2019-08-29 00:32:12.673333','2019-08-26 00:00:00.000000',2,122),('2756E33D-B7E8-42B1-9A10-6792FA458694','2018-12-13.1.sql','2018-12-13 08:21:20.173333','2018-12-13 00:00:00.000000',1,41),('27CB6DA8-3FB5-46CE-AE7B-1FD64F02DED8','2018-12-13.2.sql','2018-12-13 14:38:10.406666','2018-12-13 00:00:00.000000',2,13),('28671451-73A3-4B6B-9D8A-A27AAEEAF54A','2019-08-19.2.sql','2019-08-22 17:31:42.993333','2019-08-19 00:00:00.000000',2,116),('2B3EA243-F62D-4962-A8E1-56F0956DF26E','2018-11-07.1.sql','2018-11-22 10:15:22.550000','2018-11-07 00:00:00.000000',1,33),('2C5C3EB6-0D5F-47AF-8A01-BB507A5F8A5B','2019-07-21.1.sql','2019-07-21 20:09:20.093333','2019-07-21 00:00:00.000000',1,104),('2D5790A8-330D-4115-A654-E6C20791DC42','2018-11-29.1.sql','2018-11-29 15:43:48.196666','2018-11-29 00:00:00.000000',1,88),('2EEBF7C1-BA24-426D-B56D-B37899582C7B','2019-03-24.1.sql','2019-03-25 16:10:44.480000','2019-03-24 00:00:00.000000',1,66),('31B3A7CB-AF6A-48AB-BAC2-2A26C781ED66','2019-07-21.2.sql','2019-07-21 20:09:20.560000','2019-07-21 00:00:00.000000',2,105),('32775730-EE5B-40F1-A914-7A02D268D002','2019-08-06.1.sql','2019-08-06 15:24:46.743333','2019-08-06 00:00:00.000000',1,108),('38CD2209-3E61-4E82-9667-4A898001F6A8','2018-11-24.1.sql','2018-11-24 06:14:38.220000','2018-11-24 00:00:00.000000',1,30),('3964529B-E9A0-47BF-8655-70023CCFA9F2','2018-11-12.2.sql','2018-11-22 10:15:23.296666','2018-11-12 00:00:00.000000',2,43),('3A214F91-F00C-46D5-B114-541B23E15B63','2019-02-23.2.sql','2019-02-26 00:02:33.960000','2019-02-23 00:00:00.000000',2,32),('3CE408E2-7AF1-4E23-B713-C9C61DA4DD04','2019-02-20.1.sql','2019-02-23 15:04:52.706666','2019-02-20 00:00:00.000000',1,72),('3D839638-162E-4FCA-821B-4518640872ED','2018-11-18.2.sql','2018-11-22 10:15:23.720000','2018-11-18 00:00:00.000000',2,27),('40173350-14DF-4CFC-A97B-3BD331C868CE','2018-11-16.1.sql','2018-11-22 10:15:23.620000','2018-11-16 00:00:00.000000',1,19),('41C30E51-FF01-470C-8020-E26A1EF3B4E4','2018-11-09.1.sql','2018-11-22 10:15:23.176666','2018-11-09 00:00:00.000000',1,86),('4246023F-405F-4F9C-A987-7CADD8649D04','2018-11-30.2.sql','2018-11-30 09:48:17.086666','2018-11-30 00:00:00.000000',2,49),('44BEB958-8F05-497A-A560-87F8CD834037','2019-03-28.1.sql','2019-03-29 02:45:30.156666','2019-03-28 00:00:00.000000',1,53),('453CEA52-372A-45E4-9E20-468196EFE3AC','2019-07-07.1.sql','2019-07-09 02:34:38.510000','2019-07-07 00:00:00.000000',1,96),('45A1CA21-8B4D-486E-8ACB-F0B1CBDDD35F','2019-01-16.2.sql','2019-01-17 14:37:22.860000','2019-01-16 00:00:00.000000',2,89),('4B2FCBBB-F33B-4E84-A596-FEA07BA028FD','2019-08-19.1.sql','2019-08-22 17:31:42.983333','2019-08-19 00:00:00.000000',1,115),('4BFB17A1-2558-48DA-B371-E441F9D0B8EF','2018-12-10.2.sql','2018-12-10 11:14:11.503333','2018-12-10 00:00:00.000000',2,87),('4D2D7BE0-8B9C-42EB-B2EB-407F09C3880E','2018-11-18.3.sql','2018-11-22 10:15:23.776666','2018-11-18 00:00:00.000000',3,22),('4E752D09-FDFA-454C-A705-0E27657C0F4E','2018-11-12.5.sql','2018-11-22 10:15:23.470000','2018-11-12 00:00:00.000000',5,7),('537F567B-AE6A-42C4-8E2B-9844E285E28F','2019-02-27.1.sql','2019-03-07 18:04:32.970000','2019-02-27 00:00:00.000000',1,56),('546C8CF2-25FE-4F12-98BE-1F2767175117','2018-11-15.1.sql','2018-11-22 10:15:23.563333','2018-11-15 00:00:00.000000',1,12),('5BD7FDC8-F246-49F6-88FE-6691417CFBBA','2018-12-10.1.sql','2018-12-10 11:14:11.246666','2018-12-10 00:00:00.000000',1,40),('667E4B09-EB86-4DCE-B7BF-12AFD7C4FD95','2018-11-12.3.sql','2018-11-22 10:15:23.336666','2018-11-12 00:00:00.000000',3,9),('66CD5755-8D61-4168-9DB0-FB84220732B8','2018-12-06.1.sql','2018-12-08 08:55:11.473333','2018-12-06 00:00:00.000000',1,91),('6A9760CD-0062-42A9-8D34-0CCDC9DC8BD6','2018-11-20.4.sql','2018-11-22 10:15:24.326666','2018-11-20 00:00:00.000000',4,6),('6B5D6D85-EF2D-44CC-B9B7-0E6319E1CA7D','2019-03-11.1.sql','2019-03-11 18:38:35.023333','2019-03-11 00:00:00.000000',1,8),('6C78B772-EFA0-46A2-A2E4-A4BA1BBB483B','2019-08-18.2.sql','2019-08-22 17:31:42.766666','2019-08-18 00:00:00.000000',2,113),('6FFE0BE4-36D0-428C-9D6A-4F8D95354FED','2018-11-20.2.sql','2018-11-22 10:15:24.270000','2018-11-20 00:00:00.000000',2,31),('75C33D74-26B3-4750-92DE-D0A50ED63426','2019-01-16.1.sql','2019-01-17 14:37:22.490000','2019-01-16 00:00:00.000000',1,77),('7CF8878B-ACF0-471C-AA72-60AF04C633AA','2019-02-19.1.sql','2019-02-23 15:04:52.016666','2019-02-19 00:00:00.000000',1,37),('7EC11AF0-8EC2-47EF-9DC4-62F630D509B9','2019-07-18.3.sql','2019-07-19 19:18:20.190000','2019-07-18 00:00:00.000000',3,101),('81FDA6C7-DA58-4A43-A478-6542D59542E7','2018-11-26.1.sql','2018-11-26 08:45:26.416666','2018-11-26 00:00:00.000000',1,39),('83703875-4AF7-4CFD-BD94-B3E49424EBCE','2019-02-20.2.sql','2019-02-23 15:04:53.353333','2019-02-20 00:00:00.000000',2,67),('8375503F-2F1A-4DD2-BDAE-6341FBF9F9F3','2018-11-10.1.sql','2018-11-22 10:15:23.203333','2018-11-10 00:00:00.000000',1,38),('854BDC53-3157-4615-B12B-3D7D30B5525A','2018-11-28.1.sql','2018-11-28 09:51:02.183333','2018-11-28 00:00:00.000000',1,20),('89546C98-3726-4D40-A14E-299B9389BEBB','2018-11-20.1.sql','2018-11-22 10:15:24.260000','2018-11-20 00:00:00.000000',1,15),('89F51664-487E-4963-943B-9832501301FF','2019-08-22.1.sql','2019-08-23 02:05:23.500000','2019-08-22 00:00:00.000000',1,117),('8B089172-9892-44E5-B088-3DECBA35A162','2018-11-19.3.sql','2018-11-22 10:15:23.893333','2018-11-19 00:00:00.000000',3,21),('8C06652F-33D7-4739-AC31-E16E0A0B50DD','2018-12-30.2.sql','2019-01-08 16:09:06.936666','2018-12-30 00:00:00.000000',2,85),('8DBB472F-82B7-42EA-9057-D9949971E9C7','2019-02-27.2.sql','2019-03-07 18:04:33.140000','2019-02-27 00:00:00.000000',2,81),('8DE79879-1284-48FD-B855-2937836F0F1F','2018-12-01.1.sql','2018-12-01 03:56:43.840000','2018-12-01 00:00:00.000000',1,14),('8ED3736D-712C-4F22-97D6-CAC5C800302A','2018-11-27.1.sql','2018-11-27 15:07:31.610000','2018-11-27 00:00:00.000000',1,73),('8FF92C46-B4D0-4531-83BE-8B71DFE1909E','2019-01-01.1.sql','2019-01-08 16:09:06.956666','2019-01-01 00:00:00.000000',1,55),('91711E73-3410-47B4-85C9-715975E3A1B7','2018-11-08.3.sql','2018-11-22 10:15:23.140000','2018-11-08 00:00:00.000000',3,44),('9235A6C4-F33B-4AE5-94DB-CAF83C5B95E4','2018-11-17.1.sql','2018-11-22 10:15:23.673333','2018-11-17 00:00:00.000000',1,74),('95C4745D-5A74-4722-8CDF-CCC7FA343DCA','2018-11-08.1.sql','2018-11-22 10:15:23.026666','2018-11-08 00:00:00.000000',1,76),('966A7379-08B6-4898-AF98-D1052B51FC60','2019-07-23.2.sql','2019-07-26 15:10:11.806666','2019-07-23 00:00:00.000000',2,107),('9A33DE74-BA09-414D-BA94-712EC25CB88C','2019-08-23.1.sql','2019-08-24 16:54:02.873333','2019-08-23 00:00:00.000000',1,118),('9D642452-1A99-461C-BD8E-AE29FCD21E9A','2019-03-27.1.sql','2019-03-28 14:52:15.503333','2019-03-27 00:00:00.000000',1,64),('9DC22EC7-E1F8-44E8-A199-44753F452EFD','2018-11-28.2.sql','2018-11-28 18:30:38.626666','2018-11-28 00:00:00.000000',2,26),('9E4E91B2-AA20-4B45-B90F-B41BF85BBFD5','2018-11-27.2.sql','2018-11-27 15:07:31.700000','2018-11-27 00:00:00.000000',2,68),('A168F172-64FB-4F97-9270-52F8331AF386','2019-08-07.2.sql','2019-08-22 17:31:42.716666','2019-08-07 00:00:00.000000',2,110),('A21208F7-994A-4DB5-9439-43A74100F126','2018-11-25.3.sql','2018-11-25 17:53:44.476666','2018-11-25 00:00:00.000000',3,23),('A3FB27B0-3A08-4E5C-9C0C-1CF738211522','2018-11-26.2.sql','2018-11-27 15:07:31.236666','2018-11-26 00:00:00.000000',2,11),('A6B4D9E4-B3AF-482C-952E-F8B464703F36','2018-11-19.5.sql','2018-11-22 10:15:23.933333','2018-11-19 00:00:00.000000',5,90),('A8C73980-C245-4FD4-B718-6999F54BFF73','2019-02-14.1.sql','2019-02-19 22:07:58.873333','2019-02-14 00:00:00.000000',1,42),('A968AD28-1F0C-4F57-BB59-794E43D70D52','2019-08-24.1.sql','2019-08-25 14:24:20.226666','2019-08-24 00:00:00.000000',1,119),('A9D7C9E8-B531-44A0-9FC7-04D5076812B4','2018-11-11.2.sql','2018-11-22 10:15:23.263333','2018-11-11 00:00:00.000000',2,2),('AA1F9F1A-138C-4895-B9B5-33D0720B2D5D','2019-01-09.1.sql','2019-01-10 16:46:56.660000','2019-01-09 00:00:00.000000',1,18),('ACDDEF25-7FF4-48C2-913C-2EF6E98C925B','2019-03-29.1.sql','2019-03-30 16:03:19.746666','2019-03-29 00:00:00.000000',1,17),('ACF8501C-B429-4FE8-8010-F83EF3ADDD5A','2019-06-24.1.sql','2019-07-09 02:34:37.963333','2019-06-24 00:00:00.000000',1,95),('AF26F50D-166B-45B9-B265-E0BE7E1E4ACC','2019-02-12.1.sql','2019-02-19 22:07:58.626666','2019-02-12 00:00:00.000000',1,83),('B2706D5B-161B-4CE5-8BFF-7B187EE8B71D','2018-11-19.2.sql','2018-11-22 10:15:23.866666','2018-11-19 00:00:00.000000',2,47),('B3711E19-4A7B-4C20-AC61-AFBF3E48DD2C','2019-08-17.1.sql','2019-08-22 17:31:42.730000','2019-08-17 00:00:00.000000',1,111),('B38825C3-474D-4647-9949-69CB845D51E1','2019-07-23.1.sql','2019-07-26 15:10:11.340000','2019-07-23 00:00:00.000000',1,106),('B6491439-1B3D-462A-8BAF-7AA5D91F5D60','2019-02-27.3.sql','2019-03-07 18:04:33.676666','2019-02-27 00:00:00.000000',3,46),('B89CD62F-52CE-40CA-889C-7572E22D77C2','2018-11-18.1.sql','2018-11-22 10:15:23.703333','2018-11-18 00:00:00.000000',1,45),('BD29193F-AC5F-4B0D-BEA4-C651E549D8CE','2019-08-18.1.sql','2019-08-22 17:31:42.750000','2019-08-18 00:00:00.000000',1,112),('BEEAE941-D1B2-453A-B2D4-2A492EDE001E','2018-11-25.1.sql','2018-11-24 19:36:37.346666','2018-11-25 00:00:00.000000',1,16),('C12C6E73-E326-4F85-96FC-616EF5994870','2019-07-18.2.sql','2019-07-19 19:18:19.953333','2019-07-18 00:00:00.000000',2,100),('C1952922-BAE7-477C-8EEE-BBE36171411D','2018-12-01.2.sql','2018-12-01 11:39:43.603333','2018-12-01 00:00:00.000000',2,69),('C5382D58-76CE-4115-9D3F-A1515094F525','2019-07-18.1.sql','2019-07-19 19:18:19.363333','2019-07-18 00:00:00.000000',1,99),('C5671A91-0F02-4E5C-B697-C863C4DFBCDE','2019-08-27.3.sql','2019-08-29 00:32:12.970000','2019-08-27 00:00:00.000000',3,126),('C59F5703-140C-4389-8D0B-080AB4AC4A3B','2018-12-02.1.sql','2018-12-03 16:29:50.953333','2018-12-02 00:00:00.000000',1,4),('C87CF1E6-1992-43B9-B4B3-43B4ACDAFF1B','2018-12-10.3.sql','2018-12-11 17:55:14.190000','2018-12-10 00:00:00.000000',3,24),('CB81C2F7-88AF-43FA-8195-16A28185A9C8','2018-11-19.1.sql','2018-11-22 10:15:23.793333','2018-11-19 00:00:00.000000',1,10),('CCDD4C04-2A59-4C76-9D65-BDDBC863B2C6','2018-12-04.1.sql','2018-12-06 06:33:13.526666','2018-12-04 00:00:00.000000',1,71),('CD850ECC-9411-4AD4-96D8-BF52C657092F','2019-03-29.2.sql','2019-03-30 16:04:03.463333','2019-03-29 00:00:00.000000',2,94),('D0ABB5B7-4794-4C66-BEAD-CE2C1C4A68D3','2019-07-13.1.sql','2019-07-17 14:47:20.310000','2019-07-13 00:00:00.000000',1,97),('D183A5DC-9212-4995-BDEF-ABD78E551AE2','2018-11-08.4.sql','2018-11-22 10:15:23.153333','2018-11-08 00:00:00.000000',4,63),('D1D93F59-7886-4713-9C3A-D5D3339ED92C','2018-11-11.1.sql','2018-11-22 10:15:23.233333','2018-11-11 00:00:00.000000',1,79),('D3619FCE-8CB9-4E8B-BA2F-A8F23BCC5F8F','2018-12-30.1.sql','2019-01-08 16:09:05.176666','2018-12-30 00:00:00.000000',1,61),('D3FB04CF-F448-4114-9694-C6D20C6C7D43','2019-08-18.3.sql','2019-08-22 17:31:42.856666','2019-08-18 00:00:00.000000',3,114),('D48A8E2C-3B1D-4078-A8B0-0433D66CBF6B','2019-01-18.1.sql','2019-01-19 17:00:43.350000','2019-01-18 00:00:00.000000',1,1),('D5A1B43B-303A-44C3-84DD-5988D142065C','2019-02-23.1.sql','2019-02-26 00:02:33.696666','2019-02-23 00:00:00.000000',1,35),('DA8DA62B-D239-4783-8BF0-40D81BFFAAF4','2019-08-26.3.sql','2019-08-29 00:32:12.706666','2019-08-26 00:00:00.000000',3,123),('E252695A-274E-4B2A-A83D-5862AB3B68A1','2018-11-25.2.sql','2018-11-25 13:25:44.683333','2018-11-25 00:00:00.000000',2,34),('E2EFBE1B-BF8B-4D09-AB6A-1D9AD63DB559','2019-08-27.1.sql','2019-08-29 00:32:12.813333','2019-08-27 00:00:00.000000',1,124),('E2FDBEF1-1DB9-4A6C-AFFD-D49E7B5CE8A1','2019-03-02.1.sql','2019-03-07 18:04:34.326666','2019-03-02 00:00:00.000000',1,78),('ED909D5D-2BED-4123-A84B-4A495F212331','2018-11-30.1.sql','2018-11-30 09:48:16.860000','2018-11-30 00:00:00.000000',1,29),('ED91DE01-9884-4E34-B1B3-863D30730BA5','2019-03-27.2.sql','2019-03-28 14:52:15.996666','2019-03-27 00:00:00.000000',2,52),('EE201B2F-A3B2-40E4-A02E-B0AD9A030BA5','2018-11-12.4.sql','2018-11-22 10:15:23.460000','2018-11-12 00:00:00.000000',4,65),('EED547F7-3DDE-412F-BCCF-AAA665A295E2','2019-02-05.1.sql','2019-02-10 16:12:28.443333','2019-02-05 00:00:00.000000',1,62),('F1EF25DA-E6E1-4437-8E4C-D38983FF5943','2019-08-07.1.sql','2019-08-22 17:31:42.196666','2019-08-07 00:00:00.000000',1,109),('F2C91F08-ABEE-439F-B3B7-809DA940E590','2018-11-08.2.sql','2018-11-22 10:15:23.036666','2018-11-08 00:00:00.000000',2,51),('F44C60D4-1586-489A-B019-E138AA8DD5A4','2018-11-17.2.sql','2018-11-22 10:15:23.690000','2018-11-17 00:00:00.000000',2,84),('F5F95B11-0789-4EAF-82EA-29ACD272EEC9','2019-07-17.1.sql','2019-07-18 03:13:18.293333','2019-07-17 00:00:00.000000',1,98),('F5FC9E89-7F9F-4D93-9B3A-8A2A43FC519A','2019-02-01.1.sql','2019-02-02 06:32:16.446666','2019-02-01 00:00:00.000000',1,54),('F64A0927-09CE-415D-8826-176321B65EE5','2019-08-25.1.sql','2019-08-26 13:47:03.283333','2019-08-25 00:00:00.000000',1,120),('FAFFAC63-40F4-4A7B-A0A3-5E8FB2563144','2018-11-13.1.sql','2018-11-22 10:15:23.516666','2018-11-13 00:00:00.000000',1,36),('FF1B24C9-D693-4862-A389-052B800E9598','2018-11-22.1.sql','2018-11-22 10:15:24.383333','2018-11-22 00:00:00.000000',1,3);
/*!40000 ALTER TABLE `DatabaseVersion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DMAction`
--

DROP TABLE IF EXISTS `DMAction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DMAction` (
  `ID` varchar(64) NOT NULL,
  `DMActionTypeID` int NOT NULL,
  `Name` varchar(128) NOT NULL,
  `CDKey` varchar(20) NOT NULL,
  `DateOfAction` datetime(6) NOT NULL,
  `Details` longtext NOT NULL,
  `ClusterID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CIX_DMAction_ID` (`ClusterID`),
  KEY `FK_DMAction_DMActionTypeID` (`DMActionTypeID`),
  CONSTRAINT `FK_DMAction_DMActionTypeID` FOREIGN KEY (`DMActionTypeID`) REFERENCES `DMActionType` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DMAction`
--

LOCK TABLES `DMAction` WRITE;
/*!40000 ALTER TABLE `DMAction` DISABLE KEYS */;
/*!40000 ALTER TABLE `DMAction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DMActionType`
--

DROP TABLE IF EXISTS `DMActionType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DMActionType` (
  `ID` int NOT NULL,
  `Name` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DMActionType`
--

LOCK TABLES `DMActionType` WRITE;
/*!40000 ALTER TABLE `DMActionType` DISABLE KEYS */;
INSERT INTO `DMActionType` VALUES (1,'Spawn Creature'),(2,'Spawn Item'),(3,'Spawn Trigger'),(4,'Spawn Waypoint'),(5,'Spawn Encounter'),(6,'Spawn Portal'),(7,'Spawn Placeable'),(8,'Change Difficulty'),(9,'Spawn Trap'),(10,'Heal'),(11,'Kill'),(12,'Jump'),(13,'Possess'),(14,'Toggle Immortal'),(15,'Force Rest'),(16,'Limbo'),(17,'Toggle AI'),(18,'Toggle Lock'),(19,'Disable Trap'),(20,'Appear'),(21,'Disappear'),(22,'Give XP'),(23,'Give Level'),(24,'Give Gold'),(25,'Give Item'),(26,'Take Item'),(27,'Jump Target to Point'),(28,'Jump All Players'),(29,'Set Stat'),(30,'Get Variable'),(31,'Set Variable'),(32,'Set Time'),(33,'Set Date');
/*!40000 ALTER TABLE `DMActionType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DMRole`
--

DROP TABLE IF EXISTS `DMRole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DMRole` (
  `ID` int NOT NULL,
  `Description` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DMRole`
--

LOCK TABLES `DMRole` WRITE;
/*!40000 ALTER TABLE `DMRole` DISABLE KEYS */;
INSERT INTO `DMRole` VALUES (1,'DM'),(2,'Admin'),(3,'Player');
/*!40000 ALTER TABLE `DMRole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Download`
--

DROP TABLE IF EXISTS `Download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Download` (
  `ID` int NOT NULL,
  `Name` varchar(50) NOT NULL DEFAULT '',
  `Description` varchar(1000) NOT NULL DEFAULT '',
  `IsActive` tinyint(1) NOT NULL DEFAULT '0',
  `LocalPath` varchar(64) NOT NULL,
  `FileName` varchar(64) NOT NULL,
  `ContentType` varchar(32) NOT NULL,
  `Instructions` varchar(1000) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Download`
--

LOCK TABLES `Download` WRITE;
/*!40000 ALTER TABLE `Download` DISABLE KEYS */;
INSERT INTO `Download` VALUES (1,'GUI Override','This overrides the graphics of your user interface. It will affect all servers do you will need to move it out of your override folder if you no longer wish to use it.',1,'/var/www/swlor_public_files/SWLOR GUI.rar','SWLORGUI.rar','application/octet-stream','Extract all files to your My Documents/Neverwinter Nights/override directory.'),(2,'SWLOR Music Package','This is all of the music we use on SWLOR. Because we cannot currently distribute music files via NWSync, you will need to Download this separately. We highly recommend it, but the Download is optional! File last updated 2019-03-03.',1,'/var/www/swlor_public_files/SWLOR_Music_v2.rar','SWLORMusic.rar','application/octet-stream','Extract all files to your My Documents/Neverwinter Nights/music directory.'),(3,'SWLOR Haks','These are the DEVELOPMENT-ONLY hakpaks. If you only want to play, you DO NOT need these. Simply connect to the server to get the files and start playing.',1,'/var/www/swlor_public_files/SWLOR Haks.rar','SWLORDevelopmentHaks.rar','application/octet-stream ','Extract all .hak files to your My Documents/Neverwinter Nights/hak directory. Extract the swlor_tlk.tlk file to your tlk directory. Make the tlk directory if it doesn\'t already exist.');
/*!40000 ALTER TABLE `Download` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EnmityAdjustmentRule`
--

DROP TABLE IF EXISTS `EnmityAdjustmentRule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EnmityAdjustmentRule` (
  `ID` int NOT NULL,
  `Name` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EnmityAdjustmentRule`
--

LOCK TABLES `EnmityAdjustmentRule` WRITE;
/*!40000 ALTER TABLE `EnmityAdjustmentRule` DISABLE KEYS */;
INSERT INTO `EnmityAdjustmentRule` VALUES (0,'None'),(1,'Target Only'),(2,'All Tagged Targets'),(3,'Custom');
/*!40000 ALTER TABLE `EnmityAdjustmentRule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Error`
--

DROP TABLE IF EXISTS `Error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Error` (
  `ID` varchar(64) NOT NULL,
  `DateCreated` datetime(6) NOT NULL,
  `Message` longtext NOT NULL,
  `StackTrace` longtext NOT NULL,
  `Caller` longtext NOT NULL,
  `ClusterID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CIX_Error_ID` (`ClusterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Error`
--

LOCK TABLES `Error` WRITE;
/*!40000 ALTER TABLE `Error` DISABLE KEYS */;
/*!40000 ALTER TABLE `Error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FameRegion`
--

DROP TABLE IF EXISTS `FameRegion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FameRegion` (
  `ID` int NOT NULL,
  `Name` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FameRegion`
--

LOCK TABLES `FameRegion` WRITE;
/*!40000 ALTER TABLE `FameRegion` DISABLE KEYS */;
INSERT INTO `FameRegion` VALUES (1,'Global'),(2,'CZ-220'),(3,'Veles Colony'),(4,'Coxxion Organization');
/*!40000 ALTER TABLE `FameRegion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ForceBalanceType`
--

DROP TABLE IF EXISTS `ForceBalanceType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ForceBalanceType` (
  `ID` int NOT NULL,
  `Name` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ForceBalanceType`
--

LOCK TABLES `ForceBalanceType` WRITE;
/*!40000 ALTER TABLE `ForceBalanceType` DISABLE KEYS */;
INSERT INTO `ForceBalanceType` VALUES (0,'Universal'),(1,'Light Side'),(2,'Dark Side');
/*!40000 ALTER TABLE `ForceBalanceType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GameTopic`
--

DROP TABLE IF EXISTS `GameTopic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GameTopic` (
  `ID` int NOT NULL,
  `Name` varchar(32) NOT NULL,
  `Text` longtext NOT NULL,
  `GameTopicCategoryID` int NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '0',
  `Sequence` int NOT NULL DEFAULT '0',
  `Icon` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `FK_GameTopic_GameTopicCategoryID` (`GameTopicCategoryID`),
  CONSTRAINT `FK_GameTopic_GameTopicCategoryID` FOREIGN KEY (`GameTopicCategoryID`) REFERENCES `GameTopicCategory` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GameTopic`
--

LOCK TABLES `GameTopic` WRITE;
/*!40000 ALTER TABLE `GameTopic` DISABLE KEYS */;
INSERT INTO `GameTopic` VALUES (1,'Why aren\'t there classes?','We made a deliberate design decision to make SWLOR a Skill-based game from the beginning. This was done so that players can feel like they have complete control over their character. We didn\'t want to force players into a specific archetype even though many other games do. Our approach is to give players the tools they need to play how they want and then let them decide on how to beat challenges.',4,1,1,''),(2,'Why isn\'t \"XYZ\" race available?','Race options are largely based on what models and content we have available. NWN is a fantasy game so the amount of Star Wars specific content can be lacking at times (though there\'s a lot more than one might think!). With all that said, if you come across content that would make a good fit for the server - and we don\'t already have it - then please be sure to let us know on Discord.',4,1,2,''),(3,'Is this server like \'ABC\' game?','We take a lot of inspiration from games like Star Wars Galaxies, Skyrim, Eve Online and Star Wars: The Old Republic. However, we have added our own spin on things to keep it interesting. You will most certainly find things we\'ve generously \"borrowed\" from other games, but you will also find a lot of unique things as well.',4,1,3,''),(4,'Is this a Roleplay server?','Yes. We are a roleplay server. This means you are expected to create a character and act as if you were him/her in the setting. This means leaving conversations like who won the football game, real-world politics, and other such topics out of public chat channels. If you need to speak \"out of character\" we recommend using Discord or the private \"tell\" chat in-game.',4,1,4,''),(5,'Where should I send suggestions?','We welcome all ideas and suggestions. We\'ll even be happy to take **constructive** criticism too! The best place to do this is on our Discord channel. Be sure to put it in the appropriate channel. Keep in mind that just because you suggest something doesn\'t mean it will be implemented. The best way to get your idea implemented is to do it yourself. Our code is open source and freely available. We can help you with forking the repository and submitting a pull request. Just ask us in Discord!',4,1,5,''),(6,'Where can I donate?','If you\'d like to donate money toward server costs please visit our Patreon here: https://www.patreon.com/swlor \\n\\nWe are committed to a fair gameplay experience for everyone. For that reason, donations will *never* give you in-game rewards. By donating, you understand you are simply helping us foot the bill for the monthly hosting costs.',4,1,6,''),(7,'How can I contribute?','We\'re really appreciative of all (non-monetary) donations. If you\'ve built a cool Area, or developed a neat feature or quest please consider donating it to the server. Our source code and module are open source and available on GitHub. If your contribution is code-related, simply create a pull request on GitHub. If your contribution is an Area, item, or something else module-based please get in touch with the DM team to see how you can add it. If you need help, please get in touch with us on Discord.',4,1,7,''),(8,'What if your mod gets stolen?','Some people question why we have chosen to make the project open source. We\'ve chosen this approach because we feel it actually enhances the server for everyone. There have been many enhancements and features created for the server because it\'s freely available. Although we\'d prefer everyone to play on our server and consider it the \"official\" version, we\'re more than happy to see our work used. If you make something cool on your version, consider contributing it to us - it will probably make its way in!',4,1,8,''),(9,'Jedi Padawan (Guardian)','Temporary Bonus: Basic Lightsaber\\nPermanent Bonus: +2 Base Attack Bonus when equipped with lightsabers',3,0,2,''),(10,'Jedi Padawan (Sentinel)','Temporary Bonus: Basic Saberstaff\\nPermanent Bonus: +2 Base Attack Bonus when equipped with saberstaffs',3,0,3,''),(11,'Rule #1 - Role Play','You are expected to role play in all interactions with players and DMs. You may not use famous characters, unearned titles or character concepts which are harmful to the world (e.g. Luke Skywalker, Revan or Darth Vader). Character concepts may be rejected at a DM’s discretion and you are expected to remake without complaint.',7,1,1,''),(12,'Jedi Padawan (Consular)','Temporary Bonus: Rank 1 of the Force Breach Perk\\nPermanent Bonus: +1 level to all Light Side ability checks',3,0,4,''),(13,'Sith Apprentice (Warrior)','Temporary Bonus: Basic Lightsaber\\nPermanent Bonus: +2 Base Attack Bonus when equipped with lightsabers',3,0,6,''),(14,'Sith Apprentice (Assassin)','Temporary Bonus: Basic Saberstaff\\nPermanent Bonus: +2 Base Attack Bonus when equipped with saberstaffs',3,0,7,''),(15,'Sith Apprentice (Sorcerer)','Temporary Bonus: Rank 1 of the Force Lightning Perk\\nPermanent Bonus: +1 level to all Dark Side ability checks',3,0,8,''),(16,'Sith Apprentice (Corrupter)','Temporary Bonus: Rank 1 of the Dark Heal Perk\\nPermanent Bonus: +1 level to all Dark Side ability checks',3,0,9,''),(17,'Jedi Padawan (Sage)','Temporary Bonus: Rank 1 of the Force Heal Perk\\nPermanent Bonus: +1 level to all Light Side ability checks',3,0,5,''),(18,'Smuggler','Temporary Bonus: Basic Blaster Pistol & Ammo\\nPermanent Bonus: +2 Base Attack Bonus when equipped with blaster pistols',3,1,10,''),(19,'Sharpshooter','Temporary Bonus: Basic Blaster Rifle & Ammo\\nPermanent Bonus: +2 Base Attack Bonus when equipped with blaster rifles',3,1,11,''),(20,'Teräs Käsi','Temporary Bonus: Basic Power Glove\\nPermanent Bonus: +2 Base Attack Bonus when unarmed or equipped with a martial arts weapon',3,1,12,''),(21,'Security Officer','Temporary Bonus: Basic Baton\\nPermanent Bonus: +2 Base Attack Bonus when equipped with a baton.',3,1,13,''),(22,'Berserker','Temporary Bonus: Basic Twin Vibroblade\\nPermanent Bonus: +2 Base Attack Bonus when equipped with twin vibroblades.',3,1,14,''),(23,'Duelist','Temporary Bonus: Basic Finesse Vibroblades\\nPermanent Bonus: +2 Base Attack Bonus when equipped with finesse vibroblades.',3,1,15,''),(24,'Soldier','Temporary Bonus: Basic Heavy Vibroblade\\nPermanent Bonus: +2 Base Attack Bonus when equipped with heavy vibroblades.',3,1,16,''),(25,'Armorsmith','Temporary Bonus: Rank 1 of the Armorsmith Blueprints Perk\\nPermanent Bonus: +1 level on all checks when crafting Armorsmith items',3,1,17,''),(26,'Weaponsmith','Temporary Bonus: Rank 1 of the Weaponsmith Blueprints Perk\\nPermanent Bonus: +1 level on all checks when crafting Weaponsmith items',3,1,18,''),(27,'Chef','Temporary Bonus: Rank 1 of the Cooking Blueprints Perk\\nPermanent Bonus: +1 level on all checks when crafting Cooking items',3,1,19,''),(28,'Engineer','Temporary Bonus: Rank 1 of the Engineering Blueprints Perk\\nPermanent Bonus: +1 level on all checks when crafting Engineering items',3,1,20,''),(29,'Fabricator','Temporary Bonus: Rank 1 of the Fabrication Blueprints Perk\\nPermanent Bonus: +1 level on all checks when crafting Fabrication items',3,1,21,''),(30,'Harvester','Temporary Bonus: Basic Scanner & Basic Harvester\\nPermanent Bonus: +1 level on all checks when harvesting raw materials.',3,1,22,''),(31,'Scavenger','Temporary Bonus: Rank 1 of the Scavenging Expert Perk\\nPermanent Bonus: +1 attempt to all scavenging.',3,1,23,''),(32,'Medic','Temporary Bonus: Rank 1 of the Immediate Improvement Perk\\nPermanent Bonus: Interval between first aid effects reduced by 50%. Also reduces chance to consume first aid items by 5%.',3,1,24,''),(33,'Human','Bonuses: +1 SP\\nPenalties: None\\nStarting Languages: Galactic Basic\\n\\nHumans are a bipedal sentient race whose primary language is Galactic Basic Standard. They are referred to as the galaxy\'s most numerous species, due to the fact that they can be born and live on almost all worlds. They have had a hand in the creation of many galactic factions, and are known as one of the oldest species next to the Duros.\\n\\nHumans are the galaxy\'s most numerous and politically dominant sentient species with millions of major and minor colonies galaxy-wide. Believed to have originated on the galactic capital of Coruscant, they can be found anywhere, engaged in many different pursuits: spacers, mercenaries, smugglers, merchants, soldiers, assassins, farmers, crime lords, laborers, slaves, slavers, and many others, including Jedi and Sith.\\n\\nThe human race has played a key role in the Unification Wars, and it is also responsible for the forming of the Galactic Republic.\\n\\nSince Humans are the most common sentient species, they are often considered to be a standard or average to which the biology, psychology, and culture of other species are compared. ',2,1,1,''),(34,'Bothan','Bonuses: +1 DEX, +1 INT\\nPenalties: -1 STR, -1 CHA\\nStarting Languages: Galactic Basic, Bothese\\n\\nA humanoid species identified by their short builds and fur-covered faces, Bothans are widely known as proficient and intrepid spies. However, members of the species have also become fearless leaders, relentless warriors, courageous pilots, and brilliant scientists\\n\\nDue largely to their reputation as spies, Bothans are often regarded as power hungry, manipulative, cunning and paranoid. But Bothans are also well-organized, keenly intelligent, and very loyal. They live orderly lives, place great emphasis on family bonds, and are extremely protective of their allies. In addition, Bothans can be passionate and surprisingly eloquent orators, poets, and politicians.\\n\\nBothans hail from Bothawui, a clean, cosmopolitan planet. They live in tight-knit clans and are ruled by a democratic Bothan Council. Bothans speak both Basic and their own native tongue. ',2,1,2,''),(35,'Chiss','Bonuses: +1 INT, +1 WIS\\nPenalties: -1 STR, -1 CON\\nStarting Languages: Galactic Basic, Cheunh\\n\\nChiss are blue-skinned humanoids from the planet Csilla in the Unknown Regions.\\n\\nThe Chiss are a proud and highly intelligent species, valuing a knack for strategy and subterfuge over brute force. Although isolated in the Unknown Regions of the galaxy within their so-called “Chiss Ascendency,” the Chiss were singled out by the Empire as potential servants and allies because of their outsider status and their relative lack of moral qualms. \\n\\nIt is not that Chiss are by nature evil, but that they value pragmatism and efficiency and recognize both those qualities reflected in the Empire. While as a nonhuman, non-Sith species, Chiss are regarded as second-class citizens within the Empire, the Chiss Ascendancy is permitted self-vernance and supporters of a more diverse Empire often use the Chiss as an example of what the Empire can accomplish by welcoming other species. A few rare Chiss have even achieved official rank in the Imperial military and Imperial Intelligence.',2,1,3,''),(36,'Zabrak','Bonuses: +1 STR, +1 CON\\nPenalties: -1 INT, -1 WIS\\nStarting Languages: Galactic Basic, Zabraki\\n\\nZabrak are near-human sentients from the planet Iridonia renowned for their independence and wandering spirit. \\n\\nThey have distinctive facial horns, whose number and pattern denote which subspecies an individual Zabrak belongs to. Most Zabrak wear ritual facial tattoos, which vary from simple lines to more elaborate patterns. The designs can mark significant events in their lives, or merely be a matter of personal preference. After discovering space travel early in their civilization, they quickly colonized worlds throughout the Mid Rim and gained a reputation as pioneers and explorers.\\n\\nZabrak are also skilled warriors, engaging in inter-clan competitions to hone their talents; their physiology, which includes a secondary heart and some resistance to pain, gives them surprising endurance in battle.',2,1,4,''),(37,'Twi\'lek','Bonuses: +1 CON, +1 CHA\\nPenalties: -1 STR, -1 INT\\nStarting Languages: Galactic Basic, Twi\'leki\\n\\nTwi’leks are a humanoid species with long, prehensile head-tails called lekku–organs housing sections of the Twi’lek brain and specialized for communication through subtle motion. \\n\\nTwi’leks are native to the harsh world of Ryloth, a planet that has suffered from occupation by the Hutt Cartel in recent years; Twi’leks on Ryloth not forced to work in the mines are often taken as slaves, exported to markets throughout the Outer Rim. Millennia of dispersion into the wider galaxy, however, means that many Twi’leks have little or no sense of connection with their beleaguered homeworld; Twi’leks may be second only to humans in their ubiquity throughout known space. \\n\\nNonetheless, many Twi’leks can’t escape the shadows of slavery and the underworld–often, they find work with the same pirates, slavers and spice dealers who have traditionally oppressed their species. Twi’lek names vary dramatically, depending on whether the parents follow the old Twi’lek tradition of combining given and family name, or use the more common approach (separating first name and surname) used by many other species. Some Twi’leks eschew any surname altogether',2,1,5,''),(38,'Cathar','Bonuses: +1 DEX, +1 CON\\nPenalties: -1 INT, -1 CHA\\nStarting Languages: Galactic Basic, Catharese\\n\\nCathar are a feline humanoid species native to the planet of the same name. They are normally covered in fur, although variations in the genetic baseline have expressed themselves as at least two distinct subspecies. \\n\\nCathar are noteworthy hand-to-hand combatants, possessing retractable claws, strong physiques and natural agility. It was the Cathar reputation for martial prowess that drew the Mandalorians to besiege their homeworld several centuries a. Despite their valiant resistance against the remorseless invaders, the native Cathar were virtually exterminated. \\n\\nOut of millions, only a few hundred escaped the Mandalorians’ attack and fled to Republic space. In the time since their near-extinction, the Cathar have rebuilt their numbers to become common faces on Republic worlds. The Jedi Order, Galactic Senate and Republic military all claim numerous proud and loyal Cathar among their ranks. It is rare to encounter a Cathar who doesn’t actively despise the Sith Empire–and especially its Mandalorian allies.',2,1,6,''),(39,'Cyborg','Bonuses: None\\nPenalties: None\\nStarting Languages: Galactic Basic, Droidspeak\\n\\nCyborgs are individuals who have undergone surgery to either replace or enhance parts of their natural bodies. Augmentations can range anywhere from simple subdermal implants, to full body prosthesis.',2,1,7,''),(40,'General Overview','Crafting in SWLOR is very extensive but easy to learn. The first step is to purchase a Perk for the crafting you would like to do. For example, if you want to do Engineering you would purchase the \"Engineering Blueprints\" Perk. After you have that, you can use any crafting workbench to select a blueprint, add components, and begin to craft the item. What\'s unique about this is that every component you use for construction of the item affects the end product. For example, if you use high quality metal then any bonuses on the components get transferred to the item. In this way, items can vary greatly depending on the person making them.',5,1,1,''),(41,'What crafts are available?','The crafting skills available are: Weaponsmith, Armorsmith, Engineering, Cooking, and Fabrication. The gathering skills available are: Harvesting and Scavenging.\\n\\nAs the name implies, Weaponsmith and Armorsmith create weapons and armors. Engineering focuses on creating item mods and mechanical/electronic devices like firearms.\\n\\nYou can use the Cooking Skill to create new dishes that grant your character long-term status buffs. These last for a limited time, depending on the quality of item consumed. Their effects are modified based on the chef\'s crafting ability.\\n\\nFabrication involves creating structures like control towers, drills, silos, furniture, buildings, and Player homes.\\n\\nHarvesting can be performed by using a \"Resource Harvester\" on any raw resource - such as ore veins and trees. You can also scan the resources use a \"Resource Scanner\" to identify the type of material, the quality, and other useful information. They also grant bonuses to your harvesting ability.\\n\\nFinally, Scavenging involves sifting through junk piles for scrap metal and electronics. It also is used for collecting items like Fiberplast from plants and fauna.',5,1,2,''),(42,'How many crafts can I learn?','You can learn and use as many crafts as you want. There\'s no restriction on how you focus your character. The only limitation is that your character can only have a maximum of 500 Skill points across all skills at one time. After you reach the cap, you will be subject to Skill decay (refer to the \"Other Gameplay Information\" section for more details on that).',5,1,3,''),(43,'Can I solely be a crafter?','Yes, absolutely! If you want to create a character entirely focused on crafting you are more than welcome to. SWLOR is about giving you options and letting you decide what you want to do with them. If you decide to  down this path, keep in mind you will need some combat friends to help you obtain materials.',5,1,4,''),(44,'How does equipment help?','Equipment which adds bonuses to a particular craft - for example, Armorsmithing - enable you to do a couple things. First, it reduces the difficulty of a blueprint. This means you will be more successful at creating the item. Secondly, it increases the likelihood that bonuses from the components you used will transfer to the final item successfully. For this reason, it is highly recommended to work on getting a set of crafting gear so you can produce better items.',5,1,5,''),(45,'What are components?','Components are items required by the blueprint. These are general requirements such as \"metal\" or \"organic material\". They don\'t call for specific items - only general item types. What components you choose to use is entirely up to you as long as it meets the item type requirement.\\n\\nAll blueprints have a minimum and maximum component number. The number of components you use must fall within this range.',5,1,6,''),(46,'What are enhancements?','Enhancements are OPTIONAL items you may use for a blueprint. These are usually obtained from completing quests or looting defeated enemies. Enhancements can be added as part of the crafting process as long as two requirements are met:\\n\\n1.) The blueprint allows for enhancement slots.\\n2.) You have the necessary Skill rank and Perk level to use the enhancement slot.\\n\\nIf both requirements are met, an option will appear on the crafting menu allowing you to do so.',5,1,7,''),(47,'What are mods?','Mods, often called \"sockets\" in other games, are a way to customize your equipment further after it\'s already been created. There are four colored slots available: Red, Blue, Green, and Yellow. There is also a fifth type called Prismatic which enables any type of color mod to be inserted.\\n\\nIn order to attach a mod to an item you must first have an available slot on the item. These slots comes standard with higher tier items but they can also be added during the crafting process. The type of benefits are identified by the color of the mod.\\n\\nRed - Combat related upgrades like +HP, +STR, and +Damage.\\nBlue - Force related upgrades like +FP, +CHA, and +Force.\\nGreen - Crafting related upgrades like +Weaponsmith and +Harvesting.\\nYellow - \"Special\" mods like +Sneak Attack, +Meditate, and +Durability.\\n\\nAttaching mods requires the appropriate perks in Weaponsmith and Armorsmith, depending on the item.',5,1,8,''),(48,'What is Recommended Level?','Recommended Level (RL) is a property on items which determine the Skill level required to fully utilize its features. As an example, if you use a lightsaber with RL20, but your Skill rank in One-Handed is 15 you will suffer some penalties such as reduced damage and accuracy.\\n\\nThis comes into play with crafting because every component you add to an item increases the RL on the finished product. If you add a bunch of high-quality components to an item, it may put the item\'s RL beyond your Skill level. You need to carefully balance for the intended outcome.\\n\\nThe only way to reduce the level on an item (aside from using lower-level components) is by attaching a yellow \"Level Down\" mod to the item.',5,1,9,''),(49,'How does resting work?','Unlike vanilla NWN, there is no \"rest mechanic\". Players naturally recover HP and FP over time. These can also be recovered by using the appropriate first aid items, force abilities, and so on. This was a deliberate decision because we felt that normal NWN mechanics detract from both the role-play and game-play aspects.\\n\\nThe rest button has been repurposed for opening your main menu. Many options like looking at your Skill levels, purchasing perks, and adjusting character settings can be found here.',6,1,1,''),(50,'What happens if I die?','Players who die through normal gameplay will return to their respawn point. This respawn point can be changed by talking to the appropriate person in a medical facility. These are usually found in NPC-run cities.\\n\\nYou will also lose some durability points on all items you\'re carrying. If an item\'s durability reaches 0, it will be permanently destroyed.\\n\\nIf a Player dies during a DM-run event, there may be a possibility for permanent death depending on the outcome. This is left to the individual DM to decide.',6,1,2,''),(51,'What are Force Points?','Force Points, or FP, represent your ability to perform force-related abilities. This is similar to mana or MP in other games. FP naturally regenerates over time but can also be recovered by using items or using the \"Meditate\" Perk ability.',6,1,3,''),(52,'Can I be a non-force character?','Within the context of the server, all players have \"force potential\". This is because we use a freeform system for character building. With that said, you aren\'t required to use force abilities. If you want to play a non-force character then you simply need to not purchase force-related perks. It\'s entirely up to you to decide where to take your character.',6,1,4,''),(53,'Can I change the world?','We encourage players to make their mark on the game world and we will do our best to provide everything you need to do so. However, we must still abide by established Star Wars lore as best we can. Some examples:\\n\\n1.) You can\'t play well-known and established characters like Darth Vader, Malak, and so on. The character you play must be unique but you\'re welcome to draw upon outside sources.\\n2.)Events which would impact the overarching story for the point of time we\'re in (the Mandalorian Wars) cannot be accommodated. This means you can\'t blow up planets or kill key characters.\\n3.) Any plot which would require substantial development effort or change the nature of the server can\'t be accommodated. For example, you can\'t execute Order 66 to kill off all the Jedis.\\n\\nOther than those guidelines, we don\'t have any other restrictions. We hope you\'ll make your own unique mark on the galaxy!',6,1,5,''),(54,'Where can I report issues?','If your problem is with another Player, please consider ignoring the Player with the /ignore chat command. However, if it escalates please contact one of the DM staff and we will assist you.\\n\\nIf your problem is with a member of the staff please get in touch with an admin on Discord.',6,1,6,''),(55,'Where can I report bugs?','We track all development issues on GitHub. You\'ll find a link up above. Simply  to the appropriate repository (game or website) and click on the issues tab. Be sure to include as much detail as you can - where you were, what you were doing, your character name, your account name, and any other pertinent information. This es a long way to resolving bugs.\\n\\nIf you are reporting an exploit please contact a member of staff privately on Discord. Please don\'t abuse or share this information with other players. We track this information and will take action - including bans - if necessary.',6,1,7,''),(56,'Setting & Background','Star Wars: Legends of the Old Republic takes place in the year 3959 BBY. The Mandalorian Wars have recently ended and Revan has begun building his army. We take place several years before the events of Knight of the Old Republic 1.',1,1,2,''),(57,'Locations','The server initially takes place on CZ-220, an asteroid base owned and operated by Czerka Corporation. This serves as a tutorial to the server, setting, and gameplay. Players will travel to planet Viscara after completing the tutorial.\\n\\nViscara is a partially developed world with rare resources ripe for the taking. Several different factions compete over the resources and fight to claim territory over the planet. There are numerous ruins and places to discover from ages past.\\n\\nWe intend to offer additional planets for play after the initial launch.',1,1,3,''),(58,'Freelancer','Temporary Bonus: None\\nPermanent Bonus: +3 SP to distribute however you want.',3,1,1,''),(59,'Trandoshan','Bonuses: +1 STR, +1 CON\\nPenalties: -1 INT, -1 CHA\\nStarting Languages: Galactic Basic, Dosh\\n\\nTrandoshans are a large, bipedal sentient species, with scaly skin which range in color from sandy brown to glossy green. Their skin sheds roughly once every standard year and is extremely durable.\\n\\nCold-blooded reptiles, Trandoshans have two super-sensitive varied color eyes with horizontal black pupils, which can see far into the infrared range.\\n\\nTrandoshans can regenerate lost limbs and skin until they reach their Middle Ages — around fifty-four standard years. Each of their four limbs end in three razor sharp claws. ',2,1,8,''),(60,'How do attributes work?','Your Strength and Dexterity attributes work generally the same as they do in vanilla NWN. The only difference is that these may be used when calculating Perk efficiency, like how much damage the ability does to a target.\\n\\nConstitution will increase your HP at a much higher rate than normal NWN. It also improves how much HP you naturally recover over time.\\n\\nWisdom and Intelligence are used for light-side and dark-side abilities, respectively. They also boost your maximum Force Points (FP).\\n\\nCharisma dictates your communion with the Force. It increases your maximum FP and also improves your natural FP regeneration.',6,1,8,''),(61,'What is Skill decay?','Skill decay occurs after you reach the maximum number of cumulative Skill points. This cap is currently 500 but may change in future updates as needed.\\n\\nThis means the total sum of all your Skill points must be under 500 or else you will encounter decay. These can be distributed anyway you want - 40 Dark-side, 20 Light-side, 100 One-Handed, etc... The sum of all these is your cumulative Skill point count.\\n\\nOnce you reach the Skill cap you are still able to increase your skills, but an existing Skill will lose experience. In this way, you are able to rebuild your character over time if you decide you want to play a different way.\\n\\nKeep in mind that you won\'t lose perks you purchased, but you must be at the prerequisite Skill level in order to use them. If you no longer want a Perk, you may purchase a Tome of Retraining to refund the Perk.\\n\\nIt is also possible to \"Lock\" a Skill from decaying. You can do this from your Skill menu.\\n\\nSkills that are locked won\'t lose EXP from decay but if all of your skills are locked you cannot gain any new experience.',6,1,8,''),(62,'Introduction','This is a time of despair.\\n\\nAfter more than a decade of conflict, the Mandalorian Wars have finally ended. The Mandalorian clans are now scattered across the Outer Rim. They patiently wait for the right time to reunite and rise again.\\n\\nThis is a time of uncertainty.\\n\\nMillions died during the conflict and the Republic has begun to rebuild. Their stability is threatened by the numerous criminal groups and bounty hunters who aim to extend their control throughout the Outer Rim. The Republic struggles to preserve its order.\\n\\nThis is a time of disturbance.\\n\\nThe Sith Empire, secretly involved in the Mandalorian Wars, has risen again. Darth Revan and Darth Malak, former members of the Jedi Order, have turned to the Dark Side. With the help of the Star Forge, an automated factory and battle dreadnought, they have assembled a powerful army and taken control of Korriban. The Sith aim to conquer the galaxy.\\n\\nThis is a time of choice.\\n\\nWill you join the Jedi Order and attempt to preserve peace and balance in the galaxy? Or will you side with the Sith and harness the powers of the Dark Side? Perhaps you\'ll play both sides as a smuggler working with the Hutt Cartel? Or maybe you\'ll work as a freelancer, serving no one but yourself.\\n\\nIt\'s time to make a choice and navigate your own way through the galaxy...',1,1,1,''),(63,'Rule #2 - Play Respectfully','Cybering and erotic role play (ERP) is NOT PERMITTED on this server. Our doors are open to a vast number of age ranges and, for this reason, restrict you to a “PG-13” level of interaction. Unwarranted rudeness, potentially offensive role play, inappropriate sexual references, harassment, exploiting known or unknown bugs, logging to avoid consequences, etc are prohibited.',7,1,2,''),(64,'Rule #3 - Listen to the DMs','Dungeon Masters are to be considered the final authority in any dispute, question, or issue that comes up. By playing Star Wars: Legends of the Old Republic you agree to abide by their decisions. If there is a dispute with a DM ruling or you feel you’ve been dealt with unfairly, OBEY THE RULING at the time and then contact the admin staff. You may reach us through Discord or in a private Message on the forums.',7,1,3,''),(65,'Rule #4 - PvP','Combat actions against other PCs (PvP) must be interactively role played. This means: you interact, they interact, BEFORE any battle occurs. You are expected to wait one real-world day before participating in PvP or interacting in any way with that PC or other hostile PCs from the battle unless both sides explicitly agree otherwise. Having an opposing character type (i.e Jedi vs Sith) is not a sufficient reason for a PvP action.',7,1,4,''),(66,'Reserved Names/Words','The following names/words are reserved. Any characters containing them will be immediately deleted on entry to the server.\\n\\n\"darth\", \"malak\", \"revan\", \"jedi\", \"sith\", \"yoda\", \"luke\", \"skywalker\", \"starkiller\", \"vader\", \"han\", \"solo\", \"boba\", \"bobba\", \"fett\", \"admiral\", \"ackbar\", \"c-3p0\", \"c3p0\", \"c-3po\", \"r2d2\", \"r2-d2\", \"qui-gon\", \"jinn\", \"greedo\", \"hutt\", \"the\", \"jabba\", \"mace\", \"windu\", \"padme\", \"padmé\", \"amidala\", \"poe\", \"dameron\", \"tarkin\", \"moff\", \"anakin\", \"lando\", \"calrissian\", \"leia\", \"finn\", \"maul\", \"emperor\", \"palpatine\", \"rey\", \"obi-wan\", \"kenobi\", \"kylo\", \"ren\", \"bb-8\", \"bb8\", \"chewbacca\", \"princess\", \"canderous\", \"ordo\", \"t3-m4\", \"hk-47\", \"carth\", \"onasi\", \"mission\", \"vao\", \"zaalbar\", \"bastila\", \"shan\", \"juhani\", \"jolee\", \"bindo\", \"atton\", \"rand\", \"bao\", \"dur\", \"bao-dur\", \"mical\", \"mira\", \"hanharr\", \"brianna\", \"visas\", \"marr\", \"g0-t0\", \"go-to\", \"goto\", \"zayne\", \"carrick\", \"marn\", \"hierogryph\", \"jarael\", \"gorman\", \"vandrayk\", \"elbee\", \"rohlan\", \"dyre\", \"slyssk\", \"sion\", \"nihilus\", \"general\", \"zunath\", \"xephnin\", \"taelon\", \"lestat\", \"dm\", \"gm\"',7,1,5,''),(67,'Mandalorian','Temporary Bonus: Mandalorian Armor\\nPermanent Bonus: +1 Base Attack Bonus when equipped with blaster rifles and you learn the Mandoa language.',3,1,33,''),(68,'Wookiee','Bonuses: +1 STR, +1 CON\\nPenalties: -1 DEX, -1 CHA\\nStarting Languages: Galactic Basic, Shyriiwook\\nNOTE: Wookiees may only speak in their native language, Shyriiwook.\\n\\nThe Wookiees, whose name for themselves translates to the People of the Trees, are a species of hairy bipedal humanoids that were inhabitants of the planet Kashyyyk. They have the ability to easily learn most languages. However, Wookiees lack the vocal structure to speak anything other than their own languages. The Wookiees spoke an array of dialects collectively known as Wookiee language, all of which consisted in a combination of barks, roars, moans and growls.\\n\\nAs their name implies, Wookiees live in tree-houses in their forested planet. Their community is led by a chieftain. Wookie society is generally peaceful, and the Holder of Laws oversees Wookiee trials and judges offenses. Murder is not permitted and is punishable by death.\\n\\nAlthough their culture may seem primitive, they are surprisingly capable warriors. They are strong enough to rip off the limbs of their foes with their bare hands, and can pick up combat techniques pretty quickly. This legendary strength has made them prized quarry for slavers and hunters looking to use that strength for manual labor, entertainment in gladiatorial combat, or just to test their mettle against the Wookiees\' combat prowess. Some Wookiees branch out and make names for themselves in the galaxy as hired muscle, pirates, smugglers, pilots, or mechanics.',2,1,9,''),(69,'Mirialan','Bonuses: +1 DEX, +1 WIS\\nPenalties: -1 STR, -1 CON\\nStarting Languages: Galactic Basic, Mirialan\\n\nThe Mirialan people are deeply religious and practice a primitive understanding of the Force. They believe each individual\'s actions contribute to their destiny, building upon past successes and failures to drive them towards their fates.\\n\\nMirialans place a unique, often geometrically repeated tattoo on their face and hands to signify that they have completed a certain test or task, or achieved sufficient aptitude for a certain Skill. The number of tattoos thus often act as a good indicator of how mature and/or skilled a Mirialan is.\\n\\nBecause the more markings bring about a form of status, Mirialan society is stratified and allows the heavily marked citizens to access greater opportunities. Despite its importance, most Mirialans do not know the entirety of the tattoo lexicon due to its complexity. The interaction between placement and positioning of the shapes is incredibly subtle and changes meaning greatly.\\n\\nWithin their belief system is the view that individual actions ripple through the Force, also affecting the destiny of the species as a whole. Because the Force is understood through the notion of the Cosmic Force on a basic level, the cultural significance of the energy is defined as fate. Those who are not sensitive to its call still have faith in fate, and feel that it guides their lives.',2,1,10,''),(70,'Echani','Bonuses: +1 DEX, +1 CON\\nPenalties: -1 WIS, -1 CHA\\nStarting Languages: Galactic Basic\\n\\nThe Echani are a matriarchal caste-based society originating from the Inner Rim world of Eshan.\\n\\nThe Echani have similar anatomy to that of humans, but are physically distinct due to their light skin, white hair and silver eyes. They exhibit among themselves a remarkable similarity to each other in their body type and facial features, with close family members such as siblings often appearing indistinguishable to an outside observer.\\n\\nIt\'s believed that the Echani are a result of a Arkanian experimentation with the Human genome, a theory which could explain the resemblance among these members of their species.\\n\\nDue to the all-encompassing use of combat in all levels of their culture, Echani Generals are typically seen by others as having the ability to predict their opponent\'s next move. This is not a biological trait inherent to the Echani. Instead, it arose from a culture where combat is seen as the truest form of communication.',2,1,11,''),(71,'Mon Calamari','Bonuses: +1 WIS, +1 CON\\nPenalties: -1 INT, -1 CHA\\nStarting Languages: Galactic Basic, Mon Calamarian\\n\\nThe Mon Calamari are a fish-like amphibious humanoid species with salmon-colored skin, webbed hands, high domed heads and huge, fish-like eyes. They are equally capable of breathing both on land and in water with them being at home in either environment. \\n\\nThe Mon Calamari have developed a very advanced and civilized culture. Art, music, literature and science show a creativity surpassed by by few in the galaxy. In addition to this, they have developed a reputation for being one of the most skilled starship designers in the galaxy. This partly stemmed from the fact that they see everything as a work of art rather than being a simple tool or weapon.\\n\\nTheir species has long been recognized for their organizational and analytical skills. It\'s this trait that make them brilliant strategists and tacticians.\\n\\nIn terms of governance, the Mon Calamari make use of a highly efficient representative form of government. They tend to be lawful and an organized people with little tolerance for those that operate outside the status quo. As such, Mon Calamari tend to dislike and mistrust smugglers.',2,1,12,'');
/*!40000 ALTER TABLE `GameTopic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GameTopicCategory`
--

DROP TABLE IF EXISTS `GameTopicCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GameTopicCategory` (
  `ID` int NOT NULL,
  `Name` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GameTopicCategory`
--

LOCK TABLES `GameTopicCategory` WRITE;
/*!40000 ALTER TABLE `GameTopicCategory` DISABLE KEYS */;
INSERT INTO `GameTopicCategory` VALUES (1,'Setting'),(2,'Species'),(3,'Character Backgrounds'),(4,'FAQ'),(5,'Crafting'),(6,'Other Gameplay Info'),(7,'Rules');
/*!40000 ALTER TABLE `GameTopicCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GrowingPlant`
--

DROP TABLE IF EXISTS `GrowingPlant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GrowingPlant` (
  `ID` varchar(64) NOT NULL,
  `PlantID` int NOT NULL,
  `RemainingTicks` int NOT NULL DEFAULT '0',
  `LocationAreaTag` varchar(64) NOT NULL DEFAULT '',
  `LocationX` double NOT NULL DEFAULT '0',
  `LocationY` double NOT NULL DEFAULT '0',
  `LocationZ` double NOT NULL DEFAULT '0',
  `LocationOrientation` double NOT NULL DEFAULT '0',
  `DateCreated` datetime(6) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  `TotalTicks` int NOT NULL DEFAULT '0',
  `WaterStatus` int NOT NULL DEFAULT '0',
  `LongevityBonus` int NOT NULL DEFAULT '0',
  `ClusterID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CIX_GrowingPlant_ID` (`ClusterID`),
  KEY `FK_GrowingPlant_PlantID` (`PlantID`),
  CONSTRAINT `FK_GrowingPlant_PlantID` FOREIGN KEY (`PlantID`) REFERENCES `Plant` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GrowingPlant`
--

LOCK TABLES `GrowingPlant` WRITE;
/*!40000 ALTER TABLE `GrowingPlant` DISABLE KEYS */;
/*!40000 ALTER TABLE `GrowingPlant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Guild`
--

DROP TABLE IF EXISTS `Guild`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Guild` (
  `ID` int NOT NULL,
  `Name` varchar(64) NOT NULL,
  `Description` varchar(1000) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Guild`
--

LOCK TABLES `Guild` WRITE;
/*!40000 ALTER TABLE `Guild` DISABLE KEYS */;
INSERT INTO `Guild` VALUES (1,'Hunter\'s Guild','Specializes in the detection and removal of threats across the galaxy.'),(2,'Engineering Guild','Specializes in the construction of engineering and electronic items.'),(3,'Weaponsmith Guild','Specializes in the construction of weaponry.'),(4,'Armorsmith Guild','Specializes in the construction of armor.');
/*!40000 ALTER TABLE `Guild` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GuildTask`
--

DROP TABLE IF EXISTS `GuildTask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GuildTask` (
  `ID` int NOT NULL,
  `GuildID` int NOT NULL,
  `QuestID` int NOT NULL,
  `RequiredRank` int NOT NULL,
  `IsCurrentlyOffered` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_GuildTask_GuildID` (`GuildID`),
  CONSTRAINT `FK_GuildTask_GuildID` FOREIGN KEY (`GuildID`) REFERENCES `Guild` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GuildTask`
--

LOCK TABLES `GuildTask` WRITE;
/*!40000 ALTER TABLE `GuildTask` DISABLE KEYS */;
INSERT INTO `GuildTask` VALUES (1,4,101,0,0),(2,4,102,0,1),(3,4,103,0,0),(4,4,104,0,1),(5,4,105,0,1),(6,4,106,0,0),(7,4,107,0,1),(8,4,108,0,1),(9,4,109,0,1),(10,4,110,0,0),(11,4,111,0,1),(12,4,112,0,0),(13,4,113,0,0),(14,4,114,0,0),(15,4,115,0,0),(16,4,116,0,1),(17,4,117,0,1),(18,4,118,0,0),(19,4,119,0,0),(20,4,120,0,1),(21,4,121,0,0),(22,4,122,1,1),(23,4,123,1,0),(24,4,124,1,1),(25,4,125,1,1),(26,4,126,1,1),(27,4,127,1,0),(28,4,128,1,0),(29,4,129,1,0),(30,4,130,1,0),(31,4,131,1,0),(32,4,132,1,1),(33,4,133,1,0),(34,4,134,1,1),(35,4,135,1,0),(36,4,136,1,1),(37,4,137,1,0),(38,4,138,1,1),(39,4,139,1,1),(40,4,140,1,0),(41,4,141,1,0),(42,4,142,1,0),(43,4,143,1,1),(44,4,144,1,0),(45,4,145,2,0),(46,4,146,2,0),(47,4,147,2,0),(48,4,148,2,0),(49,4,149,2,1),(50,4,150,2,0),(51,4,151,2,1),(52,4,152,2,0),(53,4,153,2,1),(54,4,154,2,1),(55,4,155,2,0),(56,4,156,2,0),(57,4,157,2,0),(58,4,158,2,0),(59,4,159,2,1),(60,4,160,2,0),(61,4,161,2,1),(62,4,162,2,1),(63,4,163,2,0),(64,4,164,2,0),(65,4,165,2,1),(66,4,166,2,1),(67,4,167,2,0),(68,4,168,2,1),(69,4,169,3,1),(70,4,170,3,0),(71,4,171,3,1),(72,4,172,3,1),(73,4,173,3,0),(74,4,174,3,0),(75,4,175,3,0),(76,4,176,3,0),(77,4,177,3,1),(78,4,178,3,1),(79,4,179,3,1),(80,4,180,3,1),(81,4,181,3,0),(82,4,182,3,0),(83,4,183,3,0),(84,4,184,3,1),(85,4,185,3,0),(86,4,186,3,0),(87,4,187,3,1),(88,4,188,3,0),(89,4,189,3,0),(90,4,190,3,0),(91,4,191,3,0),(92,4,192,3,1),(93,4,193,4,0),(94,4,194,4,0),(95,4,195,4,0),(96,4,196,4,0),(97,4,197,4,1),(98,4,198,4,0),(99,4,199,4,0),(100,4,200,4,0),(101,4,201,4,1),(102,4,202,4,1),(103,4,203,4,0),(104,4,204,4,0),(105,4,205,4,1),(106,4,206,4,0),(107,4,207,4,0),(108,4,208,4,0),(109,4,209,4,0),(110,4,210,4,0),(111,4,211,4,0),(112,4,212,4,1),(113,4,213,4,0),(114,4,214,4,1),(115,4,215,4,1),(116,4,216,4,0),(117,4,217,4,0),(118,4,218,4,0),(119,4,219,4,1),(120,4,220,4,1),(121,4,221,4,1),(122,3,222,0,0),(123,3,223,0,0),(124,3,224,0,0),(125,3,225,0,0),(126,3,226,0,0),(127,3,227,0,1),(128,3,228,0,0),(129,3,229,0,0),(130,3,230,0,0),(131,3,231,0,0),(132,3,232,0,1),(133,3,233,0,1),(134,3,234,0,0),(135,3,235,0,1),(136,3,236,0,0),(137,3,237,0,0),(138,3,238,0,1),(139,3,239,0,1),(140,3,240,0,0),(141,3,241,0,0),(142,3,242,0,0),(143,3,243,0,0),(144,3,244,0,0),(145,3,245,0,1),(146,3,246,0,1),(147,3,247,0,1),(148,3,248,0,1),(149,3,249,1,0),(150,3,250,1,0),(151,3,251,1,0),(152,3,252,1,1),(153,3,253,1,0),(154,3,254,1,1),(155,3,255,1,1),(156,3,256,1,0),(157,3,257,1,1),(158,3,258,1,1),(159,3,259,1,1),(160,3,260,1,0),(161,3,261,1,0),(162,3,262,1,0),(163,3,263,1,0),(164,3,264,1,1),(165,3,265,1,1),(166,3,266,1,0),(167,3,267,1,0),(168,3,268,1,0),(169,3,269,1,1),(170,3,270,1,0),(171,3,271,1,0),(172,3,272,1,0),(173,3,273,1,1),(174,3,274,2,0),(175,3,275,2,1),(176,3,276,2,0),(177,3,277,2,1),(178,3,278,2,0),(179,3,279,2,0),(180,3,280,2,0),(181,3,281,2,0),(182,3,282,2,1),(183,3,283,2,1),(184,3,284,2,0),(185,3,285,2,0),(186,3,286,2,1),(187,3,287,2,1),(188,3,288,2,0),(189,3,289,2,1),(190,3,290,2,1),(191,3,291,2,0),(192,3,292,2,0),(193,3,293,2,0),(194,3,294,2,0),(195,3,295,2,1),(196,3,296,2,0),(197,3,297,2,1),(198,3,298,2,0),(199,3,299,3,1),(200,3,300,3,1),(201,3,301,3,0),(202,3,302,3,1),(203,3,303,3,0),(204,3,304,3,1),(205,3,305,3,0),(206,3,306,3,0),(207,3,307,3,1),(208,3,308,3,1),(209,3,309,3,0),(210,3,310,3,1),(211,3,311,3,0),(212,3,312,3,0),(213,3,313,3,1),(214,3,314,3,0),(215,3,315,3,0),(216,3,316,3,0),(217,3,317,3,0),(218,3,318,3,0),(219,3,319,3,1),(220,3,320,3,0),(221,3,321,3,0),(222,3,322,3,1),(223,3,323,3,0),(224,3,324,4,1),(225,3,325,4,0),(226,3,326,4,1),(227,3,327,4,1),(228,3,328,4,0),(229,3,329,4,0),(230,3,330,4,0),(231,3,331,4,0),(232,3,332,4,0),(233,3,333,4,1),(234,3,334,4,0),(235,3,335,4,1),(236,3,336,4,0),(237,3,337,4,1),(238,3,338,4,0),(239,3,339,4,0),(240,3,340,4,1),(241,3,341,4,1),(242,3,342,4,0),(243,3,343,4,0),(244,3,344,4,0),(245,3,345,4,0),(246,3,346,4,0),(247,3,347,4,1),(248,3,348,4,1),(249,2,349,0,1),(250,2,350,0,1),(251,2,351,0,1),(252,2,352,0,1),(253,2,353,0,1),(254,2,354,0,1),(256,2,356,0,1),(257,2,357,0,1),(258,2,358,0,1),(259,2,359,0,0),(260,2,360,0,0),(261,2,361,0,1),(262,2,362,0,0),(263,2,363,1,0),(264,2,364,1,1),(265,2,365,1,0),(266,2,366,1,1),(267,2,367,99,0),(268,2,368,99,0),(269,2,369,99,0),(270,2,370,99,0),(271,2,371,1,1),(272,2,372,99,0),(273,2,373,99,0),(274,2,374,99,0),(275,2,375,1,1),(276,2,376,1,0),(277,2,377,1,0),(278,2,378,1,0),(279,2,379,1,0),(280,2,380,1,1),(281,2,381,1,1),(282,2,382,1,0),(285,2,385,1,0),(288,2,388,1,0),(289,2,389,1,0),(290,2,390,1,0),(291,2,391,1,0),(292,2,392,1,1),(294,2,394,1,0),(295,2,395,1,0),(296,2,396,1,0),(297,2,397,1,1),(300,2,400,1,1),(303,2,403,1,1),(304,2,404,1,0),(305,2,405,1,0),(306,2,406,1,0),(307,2,407,1,0),(308,2,408,1,0),(309,2,409,1,0),(310,2,410,1,0),(311,2,411,2,0),(312,2,412,2,1),(313,2,413,2,0),(314,2,414,2,1),(315,2,415,2,0),(316,2,416,2,0),(317,2,417,2,0),(318,2,418,2,1),(319,2,419,2,0),(320,2,420,2,1),(321,2,421,2,0),(322,2,422,2,1),(323,2,423,2,1),(325,2,425,2,0),(326,2,426,2,0),(327,2,427,2,0),(328,2,428,2,1),(329,2,429,99,0),(330,2,430,99,0),(331,2,431,99,0),(332,2,432,99,0),(333,2,433,2,0),(334,2,434,2,0),(335,2,435,2,1),(336,2,436,2,0),(337,2,437,2,0),(338,2,438,2,0),(339,2,439,2,0),(340,2,440,2,1),(341,2,441,99,0),(342,2,442,99,0),(343,2,443,99,0),(344,2,444,99,0),(345,2,445,2,0),(346,2,446,2,1),(347,2,447,2,0),(348,2,448,3,1),(349,2,449,3,0),(350,2,450,3,1),(351,2,451,3,0),(352,2,452,3,0),(354,2,454,3,0),(355,2,455,3,0),(356,2,456,3,1),(357,2,457,3,0),(358,2,458,3,0),(359,2,459,3,0),(360,2,460,3,1),(363,2,463,3,0),(366,2,466,3,0),(367,2,467,3,1),(368,2,468,3,0),(369,2,469,3,1),(370,2,470,3,1),(371,2,471,3,1),(373,2,473,3,0),(374,2,474,3,0),(375,2,475,3,0),(376,2,476,3,0),(379,2,479,99,0),(380,2,480,99,0),(381,2,481,99,0),(382,2,482,99,0),(383,2,483,3,1),(386,2,486,3,0),(387,2,487,3,0),(388,2,488,3,0),(389,2,489,99,0),(390,2,490,99,0),(391,2,491,99,0),(392,2,492,99,0),(393,2,493,3,1),(394,2,494,3,0),(395,2,495,3,0),(396,2,496,3,0),(397,2,497,3,0),(398,2,498,4,0),(399,2,499,4,0),(400,2,500,4,1),(401,2,501,4,0),(402,2,502,4,1),(403,2,503,4,0),(404,2,504,4,0),(406,2,506,4,0),(407,2,507,4,0),(408,2,508,4,0),(409,2,509,4,1),(410,2,510,4,0),(411,2,511,4,0),(412,2,512,4,0),(413,2,513,4,0),(414,2,514,4,0),(417,2,517,4,0),(418,2,518,4,0),(421,2,521,4,0),(422,2,522,4,1),(423,2,523,4,0),(424,2,524,4,0),(425,2,525,4,0),(426,2,526,4,1),(428,2,528,4,0),(429,2,529,4,1),(430,2,530,4,1),(431,2,531,4,0),(432,2,532,4,1),(433,2,533,4,0),(436,2,536,4,0),(437,2,537,99,0),(438,2,538,99,0),(439,2,539,99,0),(440,2,540,99,0),(441,2,541,4,1),(444,2,544,4,0),(445,2,545,4,0),(446,2,546,4,0),(447,2,547,99,0),(448,2,548,99,0),(449,2,549,99,0),(450,2,550,99,0),(451,2,551,4,1),(452,2,552,4,0),(453,2,553,4,0),(454,2,554,4,0),(455,2,555,4,0),(456,2,556,4,0),(457,2,557,4,0),(458,2,558,99,0),(459,2,559,99,0),(460,2,560,99,0),(461,2,561,99,0),(462,2,562,99,0),(463,2,563,99,0),(464,2,564,99,0),(465,2,565,99,0),(466,1,567,0,1),(467,1,568,0,0),(468,1,569,0,0),(469,1,570,0,1),(470,1,571,0,0),(471,1,572,0,1),(472,1,573,0,1),(473,1,574,0,0),(474,1,575,0,1),(475,1,576,0,1),(478,1,579,0,0),(479,1,580,0,1),(480,1,581,0,1),(481,1,582,0,0),(482,1,583,0,1),(483,1,584,0,1),(484,1,585,1,0),(485,1,586,1,1),(486,1,587,1,1),(487,1,588,1,1),(488,1,589,1,1),(489,1,590,1,0),(490,1,591,1,1),(491,1,592,1,1),(492,1,593,1,1),(493,1,594,1,0),(494,1,595,1,1),(495,1,596,1,1),(496,1,597,1,0),(497,1,598,1,1),(498,1,599,2,1),(499,1,600,2,1),(500,1,601,2,1),(501,1,602,2,1),(502,1,603,2,1),(503,1,604,2,1),(504,1,605,2,1),(505,1,606,2,1),(506,1,607,2,0),(507,1,608,2,1),(508,1,609,2,1),(509,1,610,2,0);
/*!40000 ALTER TABLE `GuildTask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ItemType`
--

DROP TABLE IF EXISTS `ItemType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ItemType` (
  `ID` int NOT NULL,
  `Name` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ItemType`
--

LOCK TABLES `ItemType` WRITE;
/*!40000 ALTER TABLE `ItemType` DISABLE KEYS */;
INSERT INTO `ItemType` VALUES (1,'Light Armor'),(2,'Heavy Armor'),(3,'Medical Supplies'),(4,'Vibroblade'),(5,'Finesse Vibroblade'),(6,'Baton'),(7,'Heavy Vibroblade'),(8,'Saberstaff'),(9,'Polearm'),(10,'Twin Blade'),(11,'Martial Art Weapon'),(12,'Blaster Pistol'),(13,'Blaster Rifle'),(14,'Throwing'),(15,'Shield'),(16,'Ammunition'),(17,'Crafting Tool'),(18,'Component'),(19,'Jewelry'),(20,'Force Armor'),(21,'Lightsaber');
/*!40000 ALTER TABLE `ItemType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JukeboxSong`
--

DROP TABLE IF EXISTS `JukeboxSong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JukeboxSong` (
  `ID` int NOT NULL,
  `AmbientMusicID` int NOT NULL,
  `FileName` varchar(32) NOT NULL,
  `DisplayName` varchar(64) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JukeboxSong`
--

LOCK TABLES `JukeboxSong` WRITE;
/*!40000 ALTER TABLE `JukeboxSong` DISABLE KEYS */;
INSERT INTO `JukeboxSong` VALUES (1,538,'mus_alliance','DT Alliance Rebelle',1),(2,345,'mus_area_anint','Anchorhead',1),(3,433,'mus_area_bespin','Theme, Bespin',1),(4,342,'mus_area_cakr','Korriban Cave 1',1),(5,343,'mus_area_cita1','Citadel Station 1',1),(6,344,'mus_area_cita2','Citadel Station 2',1),(7,434,'mus_area_corel','Theme, Corellia',1),(8,435,'mus_area_creepy','Ambience, Creepy',1),(9,346,'mus_area_daen1','Jedi Enclave K1',1),(10,347,'mus_area_daen2','Jedi Enclave K2',1),(11,348,'mus_area_daex1','Dantooine K1',1),(12,349,'mus_area_daex2','Dantooine K2',1),(13,379,'mus_area_dasu1','Jedi Enclave Sub',1),(14,436,'mus_area_dath','Theme, Dathomir',1),(15,350,'mus_area_desert','Dune Sea',1),(16,351,'mus_area_dxun01','Dxun Ext 1',1),(17,352,'mus_area_dxun02','Dxun Ext 2',1),(18,353,'mus_area_ebonh01','Ebon Hawk K2',1),(19,354,'mus_area_harbin','Harbinger Int 1',1),(20,355,'mus_area_harlo','Harbinger Int 2',1),(21,356,'mus_area_hrakert','Hrakert Facility',1),(22,437,'mus_area_idtent1','Design Salon 1',1),(23,438,'mus_area_idtent2','Design Salon 2',1),(24,439,'mus_area_idtent3','Design Salon 3',1),(25,357,'mus_area_jekt','Jek Jek Tar',1),(26,440,'mus_area_jungle1','Jungle 1',1),(27,441,'mus_area_jungle2','Jungle 2',1),(28,358,'mus_area_kashy','Kashyyyk Canopy',1),(29,374,'mus_area_koad1','Sith Academy K1',1),(30,375,'mus_area_koad2','Sith Academy K2',1),(31,360,'mus_area_koex1','Korriban Ext K1',1),(32,361,'mus_area_koex2','Korriban Ext K2',1),(33,362,'mus_area_kotri','Korriban Visions',1),(34,359,'mus_area_ksha','Kashyyyk Shadow',1),(35,363,'mus_area_leheon','Lehon Ext 1',1),(36,364,'mus_area_manaan','Manaan Ext 1',1),(37,365,'mus_area_mand','Mandalorian Camp',1),(38,366,'mus_area_narshad','Nar Shaddaa Ext',1),(39,367,'mus_area_ondiziz','Onderon Ext 1',1),(40,368,'mus_area_ondpal','Onderon Palace',1),(41,369,'mus_area_rktr1','Strange K1',1),(42,370,'mus_area_rktr2','Strange K2',1),(43,371,'mus_area_ruins1','Rakatan Ruins',1),(44,372,'mus_area_sandppl','Sand People Int 1',1),(45,378,'mus_area_sf','Theme Starforge',1),(46,377,'mus_area_slehey','Sleheyron Ext 1',1),(47,376,'mus_area_sshp1','Theme Sith Ship',1),(48,442,'mus_area_swmp1','Swamp 1',1),(49,443,'mus_area_swmp2','Swamp 2',1),(50,380,'mus_area_taap1','Taris Apartments',1),(51,381,'mus_area_talo1','Taris Lower City',1),(52,382,'mus_area_tase1','Taris Sewer',1),(53,383,'mus_area_taup1','Taris Upper City',1),(54,339,'mus_area_tav1','Cantina Iziz',1),(55,340,'mus_area_tav2','Cantina Pazaak',1),(56,341,'mus_area_tav3','Cantina Javyars',1),(57,384,'mus_area_teacd','Telos Academy',1),(58,385,'mus_area_trayus','Trayus Academy',1),(59,386,'mus_area_yacht','Goto\'s Yacht',1),(60,537,'mus_as_love','DT Across the Stars',1),(61,526,'mus_base_1','DT Base Imp?riale',1),(62,511,'mus_bat_1','DT Bataille 1',1),(63,512,'mus_bat_2','DT Bataille 2',1),(64,513,'mus_bat_3','DT Bataille 3',1),(65,514,'mus_bat_4','DT Bataille 4',1),(66,520,'mus_bat_5','DT Bataille 5',1),(67,524,'mus_bat_6','DT Bataille 6',1),(68,527,'mus_bat_7','DT Bataille 7',1),(69,403,'mus_bat_anchor','Anchorhead Battle',1),(71,404,'mus_bat_base','Base Battle',1),(73,571,'mus_bat_carkoon','DT Bataille de Carkoon',1),(74,515,'mus_bat_chase','DT Poursuite',1),(79,191,'mus_bat_Contact','d20 Batl Contact, DJohn (0:51)',1),(80,201,'mus_bat_d20_1','d20 Batl 1 (1:01)',1),(81,202,'mus_bat_d20_2','d20 Batl 2 (0:03)',1),(82,203,'mus_bat_d20_3','d20 Batl 3 (0:13)',1),(83,204,'mus_bat_d20_4','d20 Batl 4 (0:03)',1),(84,205,'mus_bat_d20_5','d20 Batl 5 (2:00)',1),(85,299,'mus_bat_d20_ccg1','d20 Batl C&C Generals (1:31)',1),(86,304,'mus_bat_d20_frnq','d20 Batl Fr Quarter Chase (1:27)',1),(87,307,'mus_bat_d20_hlk1','d20 Batl Hulk Crossroads (2:26)',1),(88,308,'mus_bat_d20_hlk2','d20 Batl Hulk Destruction (2:32)',1),(89,309,'mus_bat_d20_hlk3','d20 Batl Hulk Turning (2:32)',1),(90,310,'mus_bat_d20_ldw','d20 Batl Lady Death War (2:45)',1),(91,311,'mus_bat_d20_lin1','d20 Batl Lineage Conflict (2:06)',1),(92,319,'mus_bat_d20_swmp','d20 Batl Swamp (1:48)',1),(93,322,'mus_bat_d20_tlj1','d20 Batl TLJ Danger (1:32)',1),(94,337,'mus_bat_d20_zero','d20 Batl Zero Hour Theme (3:10)',1),(95,405,'mus_bat_daex1','Dantooine K1 Battle',1),(96,270,'mus_bat_dobcrusa','d20 Batl Crusader (1:31)',1),(97,269,'mus_bat_dob_keuf','d20 Batl Keufs (1:41)',1),(99,525,'mus_bat_ds_chase','DT Poursuite Death Star',1),(100,406,'mus_bat_dunesea','Dune Sea Battle',1),(104,407,'mus_bat_dxun','Dxun Battle',1),(106,572,'mus_bat_endor','DT Bataille Endor',1),(107,408,'mus_bat_fast01','Battle Fast 1 K2',1),(108,409,'mus_bat_fast02','Battle Fast 2 K2',1),(109,531,'mus_bat_fate','DT Dual of the fate',1),(113,211,'mus_bat_fot_grov','d20 Batl FOT Groove (2:46)',1),(114,206,'mus_bat_f_rave','d20 Batl Oakenfold (4:48)',1),(115,266,'mus_bat_f_st_1','d20 Batl ST Khan (5:08)',1),(116,267,'mus_bat_f_st_2','d20 Batl ST Borg (3:57)',1),(117,207,'mus_bat_f_st_3','d20 Batl ST Kirk (1:48)',1),(118,208,'mus_bat_f_tech1','d20 Batl Techno 1 (0:13)',1),(119,209,'mus_bat_f_tech2','d20 Batl Techno 2 (0:17)',1),(120,210,'mus_bat_f_tense','d20 Batl FF Fight (0:25)',1),(121,410,'mus_bat_gen1','Battle Generic 1 K2',1),(122,411,'mus_bat_gen2','Battle Generic 2 K2',1),(123,412,'mus_bat_gen3','Battle Generic 3 K2',1),(124,532,'mus_bat_hoth','DT Bataille Hoth',1),(125,413,'mus_bat_hrakert','Hrakert Facility Battle',1),(126,533,'mus_bat_jedi_1','DT Bataille Jedi 1',1),(127,414,'mus_bat_kashshad','Kashyyyk Shadow Battle',1),(128,415,'mus_bat_kfin','Theme Malak Battle',1),(129,523,'mus_bat_lair','DT Poursuite Etoile Noire',1),(130,416,'mus_bat_large','Battle Large 1 K2',1),(132,417,'mus_bat_manaan','Manaan Ext Battle',1),(133,418,'mus_bat_med','Battle Medium 1 K2',1),(134,271,'mus_bat_mongoose','d20 Batl Mongoose (1:16)',1),(135,573,'mus_bat_nar','DT Bataille Nar Shaddaa',1),(136,419,'mus_bat_narsha','Nar Shaddaa Ext Battle',1),(137,421,'mus_bat_ondi2','Onderon Ext Battle 2',1),(138,420,'mus_bat_ondiziz','Onderon Ext Battle 1',1),(139,422,'mus_bat_peragus','Peragus Battle',1),(140,424,'mus_bat_rakatemp','Lehon Int Battle',1),(141,423,'mus_bat_ruin1','Lehon Ext Battle',1),(142,425,'mus_bat_ruin2','Rakata Ruins Battle',1),(144,426,'mus_bat_sandppl','Sand People Battle',1),(145,574,'mus_bat_sith','DT Bataille Sith',1),(146,427,'mus_bat_small','Battle Small 1 K2',1),(147,534,'mus_bat_space_1','DT Bataille spatiale',1),(148,429,'mus_bat_tarsewer','Taris Sewer Battle',1),(149,428,'mus_bat_taup1','Tarris Upper City Battle',1),(150,430,'mus_bat_urban01','Battle Urban 1 K2',1),(151,431,'mus_bat_urban02','Battle Urban 2 K2',1),(152,432,'mus_bat_urban03','Battle Urban 3 K2',1),(163,530,'mus_bat_yavin','DT Bataille Yavin',1),(165,190,'mus_Caves','d20 Caves, DJohn (1:27)',1),(175,272,'mus_ctrlfreak','d20 Control Freak (3:32)',1),(176,333,'mus_d20_airvent','d20 Trapped Air Vent (3:48)',1),(177,300,'mus_d20_ccg_usa4','d20 C&C Generals USA 4 (3:05)',1),(178,301,'mus_d20_ccg_usa8','d20 C&C Generals USA 8 (3:13)',1),(179,303,'mus_d20_deserted','d20 Deserted TV Station (3:15)',1),(180,302,'mus_d20_destiny','d20 Call of Destiny (2:37)',1),(181,212,'mus_d20_drums01','d20 Drums 1 (0:19)',1),(182,213,'mus_d20_drums02','d20 Drums 2 (0:24)',1),(183,214,'mus_d20_drums03','d20 Drums 3 (0:28)',1),(184,215,'mus_d20_drums04','d20 Drums 4 (2:05)',1),(185,216,'mus_d20_hvykey01','d20 Hvy Keys 1 (1:53)',1),(186,217,'mus_d20_hvykey02','d20 Hvy Keys 2 (0:43)',1),(187,218,'mus_d20_hvykey03','d20 Hvy Keys 3 (0:41)',1),(188,219,'mus_d20_indust01','d20 Industrial 1 (0:43)',1),(189,220,'mus_d20_indust02','d20 Industrial 2 (0:13)',1),(190,221,'mus_d20_indust03','d20 Industrial 3 (0:08)',1),(191,312,'mus_d20_lineage1','d20 Lineage Ominous Vis  (3:00)',1),(192,313,'mus_d20_lineage2','d20 Lineage Trailer (3:17)',1),(193,334,'mus_d20_mellow','d20 Win Melodious(1:31)',1),(194,314,'mus_d20_nagasaki','d20 Nagasaki Dust (1:18)',1),(195,298,'mus_d20_newworld','d20 A New World (1:47)',1),(196,222,'mus_d20_piano01','d20 Piano (0:26)',1),(197,305,'mus_d20_recon1','d20 Ghost Recon Anthem (2:24)',1),(198,306,'mus_d20_recon2','d20 Ghost Recon Outro (1:10)',1),(199,318,'mus_d20_rio','d20 Rio (2:03)',1),(200,315,'mus_d20_rsix1','d20 Rainbow Six Bank (0:46)',1),(201,316,'mus_d20_rsix2','d20 Rainbow Six Intro (2:43)',1),(202,317,'mus_d20_rsix3','d20 Rainbow Six Remix (2:49)',1),(203,223,'mus_d20_sofkey01','d20 Soft Keys 1 (1:09)',1),(204,224,'mus_d20_sofkey02','d20 Soft Keys 2 (1:36)',1),(205,225,'mus_d20_sofkey03','d20 Soft Keys 3 (0:27)',1),(206,226,'mus_d20_sofkey04','d20 Soft Keys 4 (0:27)',1),(207,227,'mus_d20_sofkey05','d20 Soft Keys 5 (0:15)',1),(208,320,'mus_d20_temple','d20 Temple of the Moon (3:05)',1),(209,321,'mus_d20_tlj_alas','d20 TLJ Alais (1:40)',1),(210,329,'mus_d20_tlj_dolp','d20 TLJ Techno Dolphin (6:36)',1),(211,330,'mus_d20_tlj_drag','d20 TLJ Techno Dragon (5:06)',1),(212,323,'mus_d20_tlj_drum','d20 TLJ Keys & Drums (2:03)',1),(213,331,'mus_d20_tlj_eagl','d20 TLJ Techno Eagle (3:32)',1),(214,324,'mus_d20_tlj_eplg','d20 TLJ Epilogue (1:43)',1),(215,325,'mus_d20_tlj_orgn','d20 TLJ Organ (4:30)',1),(216,326,'mus_d20_tlj_pian','d20 TLJ Piano (0:41)',1),(217,327,'mus_d20_tlj_prlg','d20 TLJ Prologue (1:35)',1),(218,332,'mus_d20_tlj_shrk','d20 TLJ Techno Shark (7:34)',1),(219,328,'mus_d20_tlj_subw','d20 TLJ Subway (0:49)',1),(220,335,'mus_d20_wolfen1','d20 Wolfenstein Intro (2:53)',1),(221,336,'mus_d20_wolfen2','d20 Wolfenstein Main (1:05)',1),(222,562,'mus_dagobah','DT Dagobah',1),(223,552,'mus_dark_deeds','DT Marche Obscure',1),(224,554,'mus_dark_kreia','DT Dark Kreia',1),(225,555,'mus_dark_maul','DT Dark Maul',1),(226,556,'mus_dark_nihilus','DT Dark Nihilus',1),(227,557,'mus_dark_sion','DT Dark Sion',1),(228,558,'mus_dark_traya','DT Dark Traya',1),(235,517,'mus_death','DT Mort',1),(236,273,'mus_dob_bang','d20 Tense Bang (1:33)',1),(237,274,'mus_dob_bapteme','d20 Religious Choir (1:24)',1),(238,275,'mus_dob_btbdead','d20 Better Be Dead (1:35)',1),(239,276,'mus_dob_drunk','d20 Drunk (3:47)',1),(240,277,'mus_dob_feel_hot','d20 Feel Hot Nightclub (5:07)',1),(241,278,'mus_dob_higher','d20 Higher Mood (5:01)',1),(242,279,'mus_dob_musikbox','d20 Musik Box Nightclub (4:55)',1),(243,518,'mus_dyson','DT Drame',1),(244,280,'mus_em_cheyenne','d20 Cheyenne (2:39)',1),(245,551,'mus_enter_vador','DT Ombre de Vador',1),(248,281,'mus_fo1_birth','d20 FO1 Birth (3:24)',1),(249,282,'mus_fo1_cavern','d20 FO1 Cavern (3:53)',1),(250,283,'mus_fo1_children','d20 FO1 Children (3:17)',1),(251,284,'mus_fo1_desert','d20 FO1 Desert (3:20)',1),(252,285,'mus_fo1_follow','d20 FO1 Follow (2:59)',1),(253,286,'mus_fo1_glow','d20 FO1 Glow (3:57)',1),(254,288,'mus_fo1_hub','d20 FO1 Hub (4:03)',1),(255,287,'mus_fo1_junk','d20 FO1 Junk (3:24)',1),(256,289,'mus_fo1_labone','d20 FO1 LA Bone (3:46)',1),(257,290,'mus_fo1_master','d20 FO1 Masters (3:07)',1),(258,291,'mus_fo1_necro','d20 FO1 Necro (3:24)',1),(259,292,'mus_fo1_raider','d20 FO1 Raiders (3:18)',1),(260,293,'mus_fo1_shady','d20 FO1 Shady (4:04)',1),(261,294,'mus_fo1_vats','d20 FO1 Vats (3:18)',1),(262,295,'mus_fo1_vault','d20 FO1 Vault (4:01)',1),(263,296,'mus_fo1_wind','d20 FO1 Wind sound (0:05)',1),(264,297,'mus_fo1_wrldmap','d20 FO1 Worldmap (3:03)',1),(265,542,'mus_force','DT La Force',1),(266,541,'mus_force_learn','DT Apprentissage Jedi',1),(270,228,'mus_fot_moanlady','d20 FOT Moan Lady (2:16)',1),(271,229,'mus_fot_mystry01','d20 FOT Mystery 1 (1:33)',1),(272,230,'mus_fot_mystry02','d20 FOT Mystery 2 (0:24)',1),(273,231,'mus_fot_olcity01','d20 FOT Old City 1 (1:59)',1),(274,232,'mus_fot_olcity02','d20 FOT Old City 2 (1:12)',1),(275,233,'mus_fot_olcity03','d20 FOT Old City 3 (1:22)',1),(276,234,'mus_fot_olcity04','d20 FOT Old City 4 (1:31)',1),(277,235,'mus_fot_olcity05','d20 FOT Old City 5 (1:28)',1),(278,236,'mus_fot_olcity06','d20 FOT Old City 6 (1:22)',1),(279,237,'mus_fot_sht_bnyd','d20 FOT Boneyard (0:20)',1),(280,238,'mus_fot_sht_cave','d20 FOT Cave (0:22)',1),(281,239,'mus_fot_sht_dung','d20 FOT Dungeon (0:23)',1),(282,240,'mus_fot_sht_milt','d20 FOT Military (0:46)',1),(283,241,'mus_fot_sht_susp','d20 FOT Suspense (0:49)',1),(284,242,'mus_fot_susp01','d20 FOT Suspense 1 (2:06)',1),(285,243,'mus_fot_susp02','d20 FOT Suspense 2 (2:03)',1),(286,244,'mus_fot_susp03','d20 FOT Suspense 3 (0:24)',1),(287,245,'mus_fot_travel01','d20 FOT Travel 1 (0:49)',1),(288,246,'mus_fot_travel02','d20 FOT Travel 2 (0:49)',1),(289,247,'mus_fot_tribal01','d20 FOT Tribal 1 (1:39)',1),(290,248,'mus_fot_tribal02','d20 FOT Tribal 2 (1:37)',1),(291,249,'mus_fot_ugbase01','d20 FOT UG Base 1 (1:21)',1),(292,250,'mus_fot_ugbase02','d20 FOT UG Base 2 (1:18)',1),(293,251,'mus_fot_wastes01','d20 FOT Wastes 1 (1:22)',1),(294,252,'mus_fot_wastes02','d20 FOT Wastes 2 (1:25)',1),(295,253,'mus_fot_wastes03','d20 FOT Wastes 3 (1:30)',1),(296,254,'mus_fot_wastes04','d20 FOT Wastes 4 (1:21)',1),(297,255,'mus_fot_wastes05','d20 FOT Wastes 5 (1:25)',1),(298,256,'mus_fot_wastes06','d20 FOT Wastes 6 (1:22)',1),(299,257,'mus_f_fiddle','d20 FF Fiddle (2:26)',1),(300,258,'mus_f_ser_fables','d20 Space Fables (21:31)',1),(301,259,'mus_f_ser_muroc','d20 Space Muroc (6:31)',1),(302,260,'mus_f_ser_river','d20 Space River (10:02)',1),(303,261,'mus_f_st_doom','d20 ST Doom (1:36)',1),(304,262,'mus_f_st_sad','d20 ST Sad (1:13)',1),(305,263,'mus_f_st_susp_01','d20 ST Suspense 1 (4:19)',1),(306,264,'mus_f_st_susp_02','d20 ST Suspense 2 (0:57)',1),(307,265,'mus_f_susp_trap','d20 FF Suspense Trap (1:06)',1),(308,268,'mus_f_sw_trash','d20 SW Trash Mash (4:36)',1),(310,192,'mus_HonorBound','d20 Honor Bound, DJohn (2:14)',1),(311,563,'mus_hoth','DT Hoth',1),(312,492,'mus_imp_march','*Imperial March',1),(313,540,'mus_jedi_train','DT Entrainement Jedi',1),(314,480,'mus_jk_atl1','Atlantica 1',1),(315,481,'mus_jk_atl2','Atlantica 2',1),(316,482,'mus_jk_bit','Blue Ice',1),(317,561,'mus_jungle','DT Jungle',1),(318,539,'mus_lando','DT Lando Calrissian',1),(319,546,'mus_leia','DT Leia Organa',1),(320,547,'mus_luke','DT Luke Skywalker',1),(321,545,'mus_luke_leia','DT Luke et Leia',1),(324,193,'mus_moondepths','d20 MoonseaDepths, DJohn (1:39)',1),(325,565,'mus_mos_eisley','DT Mos Eisley',1),(326,564,'mus_nar','DT Nar Shaddaa',1),(327,522,'mus_nebula','DT Nebula',1),(328,194,'mus_ponr','d20 PointOfNoReturn, DJohn (2:05)',1),(334,550,'mus_sith_teach','DT Apprentissage Sith',1),(336,444,'mus_sunrise_a','Sunrise 1',1),(337,445,'mus_sunrise_b','Sunrise 2',1),(338,446,'mus_sunset_a','Sunset 1',1),(339,447,'mus_sunset_b','Sunset 2',1),(340,448,'mus_sw_area1','Explore 1',1),(341,509,'mus_sw_bar1','DT Cantina 1',1),(342,510,'mus_sw_bar2','DT Cantina 2',1),(343,559,'mus_sw_bar3','DT Cantina 3',1),(344,560,'mus_sw_bar4','DT Cantina 4',1),(345,575,'mus_sw_bar5','DT Cantina 5',1),(346,576,'mus_sw_bar6','DT Cantina 6',1),(347,577,'mus_sw_bar7','DT Cantina 7',1),(348,449,'mus_sw_baroq','Baroque Recital',1),(349,450,'mus_sw_celeb','Celebration',1),(350,451,'mus_sw_gen1','Generic 1',1),(351,452,'mus_sw_gen2','Generic 2',1),(352,453,'mus_sw_gen3','Generic 3',1),(353,454,'mus_sw_gloom1','Gloom 1',1),(354,455,'mus_sw_gloom2','Gloom 2',1),(355,456,'mus_sw_humor1','Humor 1',1),(356,578,'mus_sw_race1','DT Race 1',1),(357,579,'mus_sw_race2','DT Race 2',1),(358,580,'mus_sw_race3','DT Race 3',1),(359,581,'mus_sw_race4','DT Race 4',1),(360,582,'mus_sw_race5','DT Race 5',1),(361,583,'mus_sw_race6','DT Race 6',1),(362,457,'mus_sw_rebo1','Max Rebo 1',1),(363,458,'mus_sw_rebo2','Max Rebo 2',1),(364,459,'mus_sw_xmas1','Holidays 1',1),(365,460,'mus_sw_xmas2','Holidays 2',1),(366,461,'mus_sw_zombi','Theme, Zombie',1),(367,568,'mus_tatooine1','DT Tatooine 1',1),(368,569,'mus_tatooine2','DT Tatooine 2',1),(369,570,'mus_tatooine3','DT Tatooine 3',1),(370,535,'mus_tat_town','DT Tatooine Ville',1),(385,390,'mus_theme_czerka','Theme Czerka',1),(386,462,'mus_theme_dotf','Duel of the Fates',1),(387,463,'mus_theme_emp','Theme, Emperor',1),(388,464,'mus_theme_endor','Theme, Endor',1),(389,465,'mus_theme_exar','Theme, Exar',1),(390,466,'mus_theme_fevil','Theme, Force Evil',1),(391,467,'mus_theme_fgood','Theme, Force Good',1),(392,468,'mus_theme_fneut','Theme, Force Neutral',1),(393,469,'mus_theme_force','Theme, Force',1),(394,470,'mus_theme_griev','Theme, Grievous',1),(395,471,'mus_theme_hk47','Theme, HK-47',1),(396,391,'mus_theme_kreia','Theme Kreia',1),(397,472,'mus_theme_lando','Theme, Lando',1),(398,338,'mus_theme_main','NWN Main Theme (2:29)',1),(399,394,'mus_theme_malak','Theme Malak',1),(401,473,'mus_theme_mnda','Mando\'a Chant',1),(403,474,'mus_theme_myst','Mystery 1',1),(405,475,'mus_theme_opra','Opera 1',1),(406,476,'mus_theme_palp','Theme, Palpatine',1),(407,396,'mus_theme_rep','Theme Republic',1),(408,477,'mus_theme_sad','Tragic 1',1),(409,397,'mus_theme_sion','Theme Sion',1),(410,398,'mus_theme_sith','Theme Sith',1),(411,478,'mus_theme_trail','Ryyatt Trail',1),(412,401,'mus_theme_traya','Theme Traya',1),(413,479,'mus_theme_trgc','Tragic 2',1),(414,402,'mus_theme_tyrus','Theme Tyrus',1),(415,400,'mus_thme_andw','Theme March',1),(416,387,'mus_thme_bast','Theme Bastila',1),(417,388,'mus_thme_carth','Theme Carth',1),(418,389,'mus_thme_coun1','Theme Council',1),(419,393,'mus_thme_kass1','Theme Assassins',1),(420,392,'mus_thme_lend1','Theme Lightside',1),(421,395,'mus_thme_nih','Theme Nihilus',1),(422,399,'mus_thme_tele1','Theme Telepathy',1),(423,483,'mus_thm_rc1','Mando\'a 1',1),(424,484,'mus_thm_rc2','Mando\'a 2',1),(425,521,'mus_title','DT SW Title',1),(426,536,'mus_tore','DT Tore Mandalorien',1),(427,549,'mus_troopers','DT Stormtroopers',1),(428,566,'mus_tusken_at','DT Camp Tusken',1),(429,567,'mus_tusken_land','DT Tusken',1),(430,553,'mus_vador_rise','DT Dark Vador',1),(431,528,'mus_vict_long','DT Fanfare C?r?monie',1),(432,529,'mus_vict_short','DT Victoire',1),(456,544,'mus_yan_and_leia','DT Yan Solo et Leia',1),(457,548,'mus_yoda','DT Yoda',1),(458,543,'mus_yoda_force','DT Yoda et la Force',1);
/*!40000 ALTER TABLE `JukeboxSong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KeyItem`
--

DROP TABLE IF EXISTS `KeyItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KeyItem` (
  `ID` int NOT NULL,
  `KeyItemCategoryID` int NOT NULL,
  `Name` varchar(64) NOT NULL,
  `Description` varchar(1000) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_KeyItem_KeyItemCategoryID` (`KeyItemCategoryID`),
  CONSTRAINT `fk_KeyItem_KeyItemCategoryID` FOREIGN KEY (`KeyItemCategoryID`) REFERENCES `KeyItemCategory` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KeyItem`
--

LOCK TABLES `KeyItem` WRITE;
/*!40000 ALTER TABLE `KeyItem` DISABLE KEYS */;
INSERT INTO `KeyItem` VALUES (1,2,'Avix Tatham\'s Work Receipt','You received this work receipt from Avix Tatham, mining coordinator on CZ-220.'),(2,2,'Halron Linth\'s Work Receipt','You received this work receipt from Halron Linth, security officer on CZ-220.'),(3,2,'Crafting Terminal Droid Operator\'s Work Receipt','You received this work receipt from the Crafting Terminal Droid Operator on CZ-220.'),(4,2,'Crafting Terminal Droid Operator\'s Work Order','This is a work order you received from the droid responsible for item construction on CZ-220. Obtain the item(s) requested and return them to him.'),(5,2,'CZ-220 Shuttle Pass','This shuttle pass enables you to travel between CZ-220 and planet Viscara.'),(6,5,'CZ-220 Experiment Room Key','This unlocks the door leading to the experiment room, where the Colicoid should be located.'),(7,5,'Mandalorian Facility Key','This key unlocks the door to the Mandalorian facility in the Viscara Wildlands.'),(8,5,'Yellow Key Card','This yellow key card can be used somewhere in the Mandalorian facility on Viscara.'),(9,5,'Red Key Card','This red key card can be used somewhere in the Mandalorian facility on Viscara.'),(10,5,'Blue Key Card','This blue key card can be used somewhere in the Mandalorian facility on Viscara.'),(11,2,'Slicing Program','A data disc with a program used to slice the terminals in the Mandalorian facility.'),(12,2,'Data Disc #1','The first disc containing data on the Mandalorian Facility.'),(13,2,'Data Disc #2','The second disc containing data on the Mandalorian Facility.'),(14,2,'Data Disc #3','The third disc containing data on the Mandalorian Facility.'),(15,2,'Data Disc #4','The fourth disc containing data on the Mandalorian Facility.'),(16,2,'Data Disc #5','The fifth disc containing data on the Mandalorian Facility.'),(17,2,'Data Disc #6','The sixth disc containing data on the Mandalorian Facility.'),(18,2,'Package for Denam Reyholm','Roy Moss gave you this package to deliver to Denam Reyholm.'),(19,3,'Old Tome','A man known only as \"L\" gave you this tome. It\'s very old and the words have faded.'),(20,5,'Coxxion Base Key','This key will unlock the doors to the Coxxion base located in the deep mountains of Viscara.');
/*!40000 ALTER TABLE `KeyItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KeyItemCategory`
--

DROP TABLE IF EXISTS `KeyItemCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KeyItemCategory` (
  `ID` int NOT NULL,
  `Name` varchar(32) NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KeyItemCategory`
--

LOCK TABLES `KeyItemCategory` WRITE;
/*!40000 ALTER TABLE `KeyItemCategory` DISABLE KEYS */;
INSERT INTO `KeyItemCategory` VALUES (0,'Unknown',0),(1,'Maps',1),(2,'Quest Items',1),(3,'Documents',1),(4,'Blueprints',1),(5,'Keys',1);
/*!40000 ALTER TABLE `KeyItemCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LootTable`
--

DROP TABLE IF EXISTS `LootTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LootTable` (
  `ID` int NOT NULL,
  `Name` varchar(64) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LootTable`
--

LOCK TABLES `LootTable` WRITE;
/*!40000 ALTER TABLE `LootTable` DISABLE KEYS */;
INSERT INTO `LootTable` VALUES (0,'Invalid'),(1,'Fiberplast - Tier 1'),(2,'Fiberplast - Tier 2'),(3,'Fiberplast - Tier 3'),(4,'Fiberplast - Tier 4'),(5,'Fiberplast - Tier 5'),(6,'Fiberplast - Tier 6'),(7,'Fiberplast - Tier 7'),(8,'Fiberplast - Tier 8'),(9,'Fiberplast - Tier 9'),(10,'Fiberplast - Tier 10'),(11,'CZ-220 Scavenge - Scrap Metal'),(12,'CZ-220 Mynocks'),(13,'CZ-220 Malfunctioning Droids'),(14,'CZ-220 Colicoid Experiment'),(15,'Base Drill - Viscara Wildlands NE'),(16,'Kath Hounds - Viscara'),(17,'Base Drill - Viscara Wildlands NW'),(18,'Base Drill - Viscara Wildlands SE'),(19,'Base Drill - Viscara Wildlands SW'),(20,'Mandalorian Facility'),(21,'Mandalorian Facility Scavenge Sites'),(22,'Mandalorian Leader'),(23,'Viscara - Wildwoods Looters'),(24,'Viscara - Wildwoods Gimpassa'),(25,'Viscara - Wildwoods Kinrath'),(26,'Viscara - Valley Cairnmog'),(27,'Base Drill - Viscara Wildwoods NE'),(28,'Base Drill - Viscara Wildwoods NW'),(29,'Base Drill - Viscara Wildwoods SE'),(30,'Base Drill - Viscara Wildwoods SW'),(31,'Viscara - Mountain Valley NE'),(32,'Viscara - Mountain Valley NW'),(33,'Viscara - Mountain Valley SE'),(34,'Viscara - Mountain Valley SW'),(35,'Viscara - Deep Mountains NE'),(36,'Viscara - Deep Mountains NW'),(37,'Viscara - Deep Mountains SE'),(38,'Viscara - Deep Mountains SW'),(39,'Viscara - Coxxion Base (Instance)'),(40,'Viscara - Coxxion Base Scavenge Points'),(41,'Viscara - Coxxion Base Leader 1'),(42,'Viscara - Coxxion Base Leader 2'),(43,'Viscara - Deep Mountains Raivors'),(44,'Kath Hounds 2 - Viscara'),(45,'CZ-220 Scavenge - Fiberplast'),(46,'Viscara - Crystal Cavern Spiders'),(47,'Viscara - Herb Patch'),(48,'Viscara - Warocas'),(49,'Viscara - Warocas (Rares)'),(50,'Viscara - Valley Nashtah'),(51,'Space - Basic Loot'),(52,'Starship Pirates - Basic'),(53,'Starship Pirates - Rare'),(54,'Reassembly Fuel Cell'),(90,'Mon Cala Coral Isles 1 - Northeast'),(91,'Mon Cala Coral Isles 1 - Northwest'),(92,'Mon Cala Coral Isles 1 - Southeast'),(93,'Mon Cala Coral Isles 1 - Southwest'),(94,'Mon Cala Coral Isles 2 - Northeast'),(95,'Mon Cala Coral Isles 2 - Northwest'),(96,'Mon Cala Coral Isles 2 - Southeast'),(97,'Mon Cala Coral Isles 2 - Southwest'),(98,'Mon Cala Eco Terrorists'),(99,'Mon Cala Fauna'),(100,'Mon Cala AmphiHydrus'),(101,'Mon Cala Eco Terrorist Leader'),(102,'Tatooine Womprat'),(103,'Tatooine Sandswimmer'),(104,'Tatooine Wraid'),(105,'Tatooine Sand Demon'),(106,'Tatooine Tusken Raider'),(107,'Tatooine Tusken Camp Scavenge Points'),(110,'Hutlar - Byysk'),(111,'Qion Tundra - Northeast'),(112,'Qion Tundra - Northwest'),(113,'Qion Tundra - Southeast'),(114,'Qion Tundra - Southwest'),(115,'Hutlar - Byysk Rare Items'),(116,'Hutlar - Qion Slugs'),(117,'Hutlar - Qion Tigers');
/*!40000 ALTER TABLE `LootTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LootTableItem`
--

DROP TABLE IF EXISTS `LootTableItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LootTableItem` (
  `ID` int NOT NULL,
  `LootTableID` int NOT NULL,
  `Resref` varchar(16) NOT NULL,
  `MaxQuantity` int NOT NULL,
  `Weight` tinyint unsigned NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `SpawnRule` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `fk_LootTableItem_LootTableID` (`LootTableID`),
  CONSTRAINT `fk_LootTableItem_LootTableID` FOREIGN KEY (`LootTableID`) REFERENCES `LootTable` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LootTableItem`
--

LOCK TABLES `LootTableItem` WRITE;
/*!40000 ALTER TABLE `LootTableItem` DISABLE KEYS */;
INSERT INTO `LootTableItem` VALUES (579,1,'fiberp_ruined',1,70,1,''),(580,1,'fiberp_flawed',1,30,1,''),(581,2,'fiberp_flawed',1,70,1,''),(582,2,'fiberp_poor',1,30,1,''),(583,3,'fiberp_poor',1,70,1,''),(584,3,'fiberp_quality',1,30,1,''),(585,4,'fiberp_quality',1,70,1,''),(586,4,'fiberp_od',1,30,1,''),(587,5,'fiberp_od',1,70,1,''),(588,5,'fiberp_imperfect',1,30,1,''),(589,6,'fiberp_imperfect',1,70,1,''),(590,6,'fiberp_high',1,30,1,''),(591,7,'fiberp_high',1,70,1,''),(592,7,'fiberp_premium',1,30,1,''),(593,8,'fiberp_premium',1,70,1,''),(594,8,'fiberp_flawless',1,30,1,''),(595,9,'fiberp_flawless',1,70,1,''),(596,9,'fiberp_perfect',1,30,1,''),(597,10,'fiberp_perfect',1,50,1,''),(598,10,'fiberp_flawless',1,50,1,''),(612,14,'colicoid_leg_a',1,10,1,''),(613,14,'colicoid_leg_w',1,10,1,''),(614,14,'colicoid_leg_e',1,10,1,''),(615,14,'colicoid_leg_f',1,10,1,''),(616,14,'colicoid_leg_c',1,10,1,''),(787,15,'c_cluster_power',1,15,1,''),(788,15,'raw_plagionite',1,10,1,''),(789,15,'raw_scordspar',1,30,1,''),(790,15,'plexite_gem',1,8,1,''),(791,15,'raw_veldite',1,70,1,''),(792,15,'corylus',1,6,1,''),(793,15,'omedia',1,8,1,''),(794,15,'pawisis',1,8,1,''),(795,15,'pefoate',1,8,1,''),(796,15,'sygium_gem',1,2,1,''),(797,15,'regvis_gem',1,2,1,''),(798,15,'vendusii_gem',1,1,1,''),(799,15,'hollinium',1,15,1,''),(800,15,'rruchi',1,5,1,''),(801,17,'raw_scordspar',1,30,1,''),(802,17,'plexite_gem',1,8,1,''),(803,17,'raw_veldite',1,70,1,''),(804,17,'corylus',1,6,1,''),(805,17,'omedia',1,8,1,''),(806,17,'pawisis',1,8,1,''),(807,17,'tinnuchi',1,5,1,''),(808,17,'sygium_gem',1,2,1,''),(809,17,'regvis_gem',1,2,1,''),(810,17,'vendusii_gem',1,1,1,''),(811,17,'c_cluster_power',1,15,1,''),(812,17,'raw_plagionite',1,10,1,''),(813,17,'pefoate',1,8,1,''),(814,17,'hollinium',1,15,1,''),(815,18,'vendusii_gem',1,1,1,''),(816,18,'regvis_gem',1,2,1,''),(817,18,'sygium_gem',1,2,1,''),(818,18,'pefoate',1,8,1,''),(819,18,'pawisis',1,8,1,''),(820,18,'omedia',1,8,1,''),(821,18,'hollinium',1,15,1,''),(822,18,'raw_veldite',1,70,1,''),(823,18,'plexite_gem',1,8,1,''),(824,18,'raw_scordspar',1,30,1,''),(825,18,'raw_plagionite',1,10,1,''),(826,18,'c_cluster_power',1,15,1,''),(827,18,'corylus',1,6,1,''),(828,18,'stalluchi',1,5,1,''),(829,19,'vendusii_gem',1,1,1,''),(830,19,'regvis_gem',1,2,1,''),(831,19,'sygium_gem',1,2,1,''),(832,19,'pefoate',1,8,1,''),(833,19,'pawisis',1,8,1,''),(834,19,'omedia',1,8,1,''),(835,19,'hollinium',1,15,1,''),(836,19,'raw_veldite',1,70,1,''),(837,19,'plexite_gem',1,8,1,''),(838,19,'raw_scordspar',1,30,1,''),(839,19,'raw_plagionite',1,10,1,''),(840,19,'c_cluster_power',1,15,1,''),(841,19,'corylus',1,6,1,''),(842,19,'uunuchi',1,5,1,''),(875,21,'force_pack_1',1,2,1,''),(876,21,'m_electronics',1,6,1,''),(877,21,'power_crystal_fa',1,5,1,''),(878,21,'man_tags',1,10,1,''),(879,21,'man_metal',1,5,1,''),(880,21,'healing_kit',1,2,1,''),(881,21,'bandages',1,5,1,''),(947,22,'stim_dex1',1,2,1,''),(948,22,'stim_str1',1,2,1,''),(949,22,'stim_wis1',1,2,1,''),(950,22,'stim_cha1',1,2,1,''),(951,22,'man_helm',1,3,1,''),(952,22,'m_plexiplate',1,10,1,''),(953,22,'m_ls_parts',1,10,1,''),(954,22,'m_polearm_parts',1,10,1,''),(955,22,'v_power_cell',1,1,1,''),(956,22,'herb_m',1,5,1,''),(957,22,'stim_con1',1,2,1,''),(958,22,'stim_int1',1,2,1,''),(962,25,'kinrath_limb',1,5,1,''),(963,25,'kinrath_meat',1,10,1,''),(964,25,'kinrath_silk',1,20,1,''),(971,24,'lth_flawed',1,10,1,''),(972,24,'gimp_shell',1,2,1,''),(973,24,'lth_poor',1,3,1,''),(974,24,'gimp_tooth',1,5,1,''),(979,23,'nw_it_gold001',5,25,1,''),(980,23,'nw_it_gold001',10,10,1,''),(981,23,'nw_it_gold001',15,5,1,''),(982,23,'nw_it_gold001',20,1,1,''),(983,23,'elec_flawed',1,50,1,''),(984,23,'elec_poor',1,40,1,''),(996,26,'cairnmog_meat',1,7,1,''),(997,26,'lth_quality',1,3,1,''),(998,26,'lth_poor',1,10,1,''),(999,26,'cairnmog_spine',1,9,1,''),(1000,26,'cairnmog_blood',1,5,1,''),(1139,27,'c_cluster_power',1,4,1,''),(1140,27,'medcina',1,8,1,''),(1141,27,'fabrino',1,8,1,''),(1142,27,'coqina',1,8,1,''),(1143,27,'engina',1,8,1,''),(1144,27,'arvvina',1,8,1,''),(1145,27,'weevina',1,8,1,''),(1146,27,'plexite_gem',1,8,1,''),(1147,27,'nibullan',1,4,1,''),(1148,27,'harvino',1,8,1,''),(1149,27,'corylus',1,9,1,''),(1150,27,'porlang',1,1,1,''),(1151,27,'raw_plagionite',1,10,1,''),(1152,27,'raw_veldite',1,2,1,''),(1153,27,'raw_scordspar',1,20,1,''),(1154,27,'hzzuntil',1,4,1,''),(1155,27,'ultranio',1,1,1,''),(1156,28,'c_cluster_power',1,4,1,''),(1157,28,'medcina',1,8,1,''),(1158,28,'fabrino',1,8,1,''),(1159,28,'coqina',1,8,1,''),(1160,28,'engina',1,8,1,''),(1161,28,'arvvina',1,8,1,''),(1162,28,'weevina',1,8,1,''),(1163,28,'plexite_gem',1,8,1,''),(1164,28,'nibullan',1,4,1,''),(1165,28,'harvino',1,8,1,''),(1166,28,'corylus',1,9,1,''),(1167,28,'porlang',1,1,1,''),(1168,28,'raw_plagionite',1,10,1,''),(1169,28,'raw_veldite',1,2,1,''),(1170,28,'raw_scordspar',1,20,1,''),(1171,28,'hzzuntil',1,4,1,''),(1172,28,'ultranio',1,1,1,''),(1173,29,'c_cluster_power',1,4,1,''),(1174,29,'medcina',1,8,1,''),(1175,29,'fabrino',1,8,1,''),(1176,29,'coqina',1,8,1,''),(1177,29,'engina',1,8,1,''),(1178,29,'arvvina',1,8,1,''),(1179,29,'weevina',1,8,1,''),(1180,29,'plexite_gem',1,8,1,''),(1181,29,'nibullan',1,4,1,''),(1182,29,'harvino',1,8,1,''),(1183,29,'corylus',1,9,1,''),(1184,29,'porlang',1,1,1,''),(1185,29,'raw_plagionite',1,10,1,''),(1186,29,'raw_veldite',1,2,1,''),(1187,29,'raw_scordspar',1,20,1,''),(1188,29,'hzzuntil',1,4,1,''),(1189,29,'ultranio',1,1,1,''),(1190,30,'c_cluster_power',1,4,1,''),(1191,30,'medcina',1,8,1,''),(1192,30,'fabrino',1,8,1,''),(1193,30,'coqina',1,8,1,''),(1194,30,'engina',1,8,1,''),(1195,30,'arvvina',1,8,1,''),(1196,30,'weevina',1,8,1,''),(1197,30,'plexite_gem',1,8,1,''),(1198,30,'nibullan',1,4,1,''),(1199,30,'harvino',1,8,1,''),(1200,30,'corylus',1,9,1,''),(1201,30,'porlang',1,1,1,''),(1202,30,'raw_plagionite',1,10,1,''),(1203,30,'raw_veldite',1,2,1,''),(1204,30,'raw_scordspar',1,20,1,''),(1205,30,'hzzuntil',1,4,1,''),(1206,30,'ultranio',1,1,1,''),(1218,31,'stalluchi',1,6,1,''),(1219,31,'vendusii_gem',1,4,1,''),(1220,31,'ultranio',1,3,1,''),(1221,31,'raw_keromber',1,10,1,''),(1222,31,'c_cluster_power',1,5,1,''),(1223,31,'raw_scordspar',1,30,1,''),(1224,31,'raw_plagionite',1,20,1,''),(1225,31,'plexite_gem',1,6,1,''),(1226,31,'tinnuchi',1,1,1,''),(1227,32,'stalluchi',1,6,1,''),(1228,32,'vendusii_gem',1,4,1,''),(1229,32,'ultranio',1,3,1,''),(1230,32,'raw_keromber',1,10,1,''),(1231,32,'c_cluster_power',1,5,1,''),(1232,32,'raw_scordspar',1,30,1,''),(1233,32,'raw_plagionite',1,20,1,''),(1234,32,'plexite_gem',1,6,1,''),(1235,32,'tinnuchi',1,1,1,''),(1236,33,'stalluchi',1,6,1,''),(1237,33,'vendusii_gem',1,4,1,''),(1238,33,'ultranio',1,3,1,''),(1239,33,'raw_keromber',1,10,1,''),(1240,33,'c_cluster_power',1,5,1,''),(1241,33,'raw_scordspar',1,30,1,''),(1242,33,'raw_plagionite',1,20,1,''),(1243,33,'plexite_gem',1,6,1,''),(1244,33,'tinnuchi',1,1,1,''),(1245,34,'stalluchi',1,6,1,''),(1246,34,'vendusii_gem',1,4,1,''),(1247,34,'ultranio',1,3,1,''),(1248,34,'raw_keromber',1,10,1,''),(1249,34,'c_cluster_power',1,5,1,''),(1250,34,'raw_scordspar',1,30,1,''),(1251,34,'raw_plagionite',1,20,1,''),(1252,34,'plexite_gem',1,6,1,''),(1253,34,'tinnuchi',1,1,1,''),(1299,35,'tinnuchi',1,1,1,''),(1300,35,'plexite_gem',1,6,1,''),(1301,35,'raw_plagionite',1,30,1,''),(1302,35,'c_cluster_power',1,5,1,''),(1303,35,'stalluchi',1,6,1,''),(1304,35,'ultranio',1,3,1,''),(1305,35,'vendusii_gem',1,4,1,''),(1306,35,'raw_jasioclase',1,5,1,''),(1307,35,'raw_keromber',1,20,1,''),(1308,35,'coonlank_blue',1,1,1,''),(1309,36,'raw_jasioclase',1,5,1,''),(1310,36,'vendusii_gem',1,4,1,''),(1311,36,'ultranio',1,3,1,''),(1312,36,'raw_keromber',1,20,1,''),(1313,36,'c_cluster_power',1,5,1,''),(1314,36,'raw_plagionite',1,30,1,''),(1315,36,'plexite_gem',1,6,1,''),(1316,36,'tinnuchi',1,1,1,''),(1317,36,'stalluchi',1,6,1,''),(1318,36,'coonlank_red',1,1,1,''),(1319,37,'vendusii_gem',1,4,1,''),(1320,37,'ultranio',1,3,1,''),(1321,37,'raw_keromber',1,20,1,''),(1322,37,'c_cluster_power',1,5,1,''),(1323,37,'raw_jasioclase',1,5,1,''),(1324,37,'plexite_gem',1,6,1,''),(1325,37,'tinnuchi',1,1,1,''),(1326,37,'stalluchi',1,6,1,''),(1327,37,'raw_plagionite',1,30,1,''),(1328,37,'coonlank_yellow',1,1,1,''),(1329,38,'raw_jasioclase',1,5,1,''),(1330,38,'vendusii_gem',1,4,1,''),(1331,38,'ultranio',1,3,1,''),(1332,38,'raw_keromber',1,20,1,''),(1333,38,'c_cluster_power',1,5,1,''),(1334,38,'raw_plagionite',1,30,1,''),(1335,38,'plexite_gem',1,6,1,''),(1336,38,'tinnuchi',1,1,1,''),(1337,38,'stalluchi',1,6,1,''),(1338,38,'coonlank_green',1,1,1,''),(1344,20,'healing_kit',1,1,1,''),(1345,20,'bandages',1,8,1,''),(1346,20,'m_lvibro_parts',1,5,1,''),(1347,20,'m_vibro_parts',1,5,1,''),(1348,20,'man_tags',1,10,1,''),(1349,20,'m_plexiplate',1,2,1,''),(1350,20,'m_e_cell',1,6,1,''),(1351,20,'m_plate',1,5,1,''),(1352,20,'nw_it_gold001',17,5,1,''),(1353,20,'m_blast_parts',1,5,1,''),(1354,20,'nw_it_gold001',25,2,1,''),(1357,41,'ls_parts_dest',1,10,1,''),(1413,40,'p_crystal_yellow',1,10,1,''),(1414,40,'p_crystal_blue',1,10,1,''),(1415,40,'p_crystal_red',1,10,1,''),(1416,40,'nw_it_gold001',15,10,1,''),(1417,40,'const_parts_cox',1,5,1,''),(1418,40,'cosian_wood',1,6,1,''),(1419,40,'p_crystal_green',1,10,1,''),(1420,40,'cox_electronics',1,4,1,''),(1421,40,'rruchi',1,1,1,''),(1422,42,'rruchi',1,1,1,''),(1423,42,'morningstar_cox',1,2,1,''),(1424,42,'cox_visor',1,10,1,''),(1425,42,'small_shield_fle',1,10,1,''),(1426,42,'cox_electronics',1,1,1,''),(1427,42,'power_crystal_fl',1,5,1,''),(1428,42,'cox_metal',1,2,1,''),(1450,39,'nw_it_gold001',30,10,1,''),(1451,39,'cox_meat',1,7,1,''),(1452,39,'fiberp_flawed',1,3,1,''),(1453,39,'club_cox',1,1,1,''),(1454,39,'spear_cox',1,1,1,''),(1455,39,'herb_question',1,10,1,''),(1456,39,'power_crystal_po',1,4,1,''),(1457,39,'const_parts_cox',1,5,1,''),(1458,39,'power_crystal_fa',1,1,1,''),(1462,43,'raivor_meat',1,10,1,''),(1463,43,'raivor_claw',1,10,1,''),(1464,43,'raivor_tail_bone',1,10,1,''),(1465,11,'scrap_metal',1,10,1,''),(1467,12,'mynock_wing',1,3,1,''),(1468,12,'lth_destroyed',1,10,1,''),(1469,12,'mynock_meat',1,10,1,''),(1470,13,'scrap_metal',1,10,1,''),(1471,13,'elec_destroyed',1,6,1,''),(1472,13,'power_crystal_po',1,6,1,''),(1477,16,'k_hound_fur',1,5,1,''),(1478,16,'k_hound_tooth',1,5,1,''),(1479,16,'lth_flawed',1,7,1,''),(1480,16,'lth_ruined',1,15,1,''),(1481,45,'fiberp_destroyed',1,10,1,''),(1482,46,'p_crystal_blue',1,10,1,''),(1483,46,'p_crystal_red',1,10,1,''),(1484,46,'p_crystal_green',1,10,1,''),(1485,46,'p_crystal_yellow',1,10,1,''),(1486,47,'herb_v',1,30,1,''),(1487,48,'warocas_beak',1,20,1,''),(1488,48,'waro_feathers',1,5,1,''),(1489,49,'waro_leg',1,20,1,''),(1490,50,'nashtah_meat',1,30,1,''),(1491,50,'nash_scale',1,10,1,''),(1492,50,'nash_tail',1,2,1,''),(1493,48,'lth_ruined',1,15,1,''),(1494,49,'lth_flawed',1,30,1,''),(1495,12,'mynock_tooth',1,12,1,''),(1496,15,'f_crystal_blue',1,2,1,''),(1497,27,'f_crystal_blue',1,2,1,''),(1498,31,'f_crystal_blue',1,2,1,''),(1499,35,'f_crystal_blue',1,2,1,''),(1500,17,'f_crystal_red',1,2,1,''),(1501,28,'f_crystal_red',1,2,1,''),(1502,32,'f_crystal_red',1,2,1,''),(1503,36,'f_crystal_red',1,2,1,''),(1504,19,'f_crystal_green',1,2,1,''),(1505,30,'f_crystal_green',1,2,1,''),(1506,34,'f_crystal_green',1,2,1,''),(1507,38,'f_crystal_green',1,2,1,''),(1508,18,'f_crystal_yellow',1,2,1,''),(1509,29,'f_crystal_yellow',1,2,1,''),(1510,33,'f_crystal_yellow',1,2,1,''),(1511,37,'f_crystal_yellow',1,2,1,''),(1512,48,'warocas_meat',1,25,1,''),(1513,42,'cox_helmlight',1,10,1,''),(1514,42,'cox_hood001',1,1,1,''),(1515,51,'rruchi',1,3,1,''),(1516,51,'stalluchi',1,3,1,''),(1517,51,'tinnuchi',1,3,1,''),(1518,51,'plexite_gem',1,2,1,''),(1519,51,'ultranio',1,1,1,''),(1520,51,'coonlank_yellow',1,1,1,''),(1521,51,'coonlank_red',1,1,1,''),(1522,51,'coonlank_blue',1,1,1,''),(1523,51,'coonlank_green',1,1,1,''),(1524,51,'vendusii_gem',1,1,1,''),(1525,51,'hzzuntil',1,1,1,''),(1526,51,'corylus',1,2,1,''),(1527,51,'porlang',1,3,1,''),(1528,51,'harvino',1,3,1,''),(1529,51,'arvvina',1,2,1,''),(1530,51,'engina',1,2,1,''),(1531,51,'fabrina',1,2,1,''),(1532,51,'coqina',1,2,1,''),(1533,51,'weevina',1,2,1,''),(1534,51,'medcina',1,2,1,''),(1535,51,'uunichi',1,3,1,''),(1536,51,'pawisis',1,5,1,''),(1537,51,'pefoate',1,5,1,''),(1538,51,'sygium_gem',1,1,1,''),(1539,51,'regvis_gem',1,1,1,''),(1540,51,'hollinium',1,3,1,''),(1541,51,'omedia',1,5,1,''),(1542,51,'nibullan',1,3,1,''),(1543,52,'stronidium',20,20,1,''),(1544,52,'fuel_cell',5,20,1,''),(1545,53,'sswpn1',1,10,1,''),(1546,53,'ssshld1',1,10,1,''),(1547,53,'ssspd1',1,10,1,''),(1548,53,'ssrang1',1,10,1,''),(1549,53,'ssfuel1',1,10,1,''),(1550,53,'ssstron1',1,10,1,''),(1551,53,'ssstlth1',1,10,1,''),(1552,53,'ssscan1',1,10,1,''),(1553,53,'sswpn2',1,1,1,''),(1554,53,'ssshld2',1,1,1,''),(1555,53,'ssspd2',1,1,1,''),(1556,53,'ssrang2',1,1,1,''),(1557,53,'ssfuel2',1,1,1,''),(1558,53,'ssstron2',1,1,1,''),(1559,53,'ssstlth2',1,1,1,''),(1560,53,'ssscan2',1,1,1,''),(1561,90,'raw_veldite',1,5,1,''),(1562,90,'raw_scordspar',1,5,1,''),(1563,90,'raw_keromber',1,20,1,''),(1564,90,'raw_plagionite',1,20,1,''),(1565,90,'raw_jasioclase',1,40,1,''),(1566,90,'raw_hemorgite',1,40,1,''),(1567,90,'hollinium',1,3,1,''),(1568,90,'harvino',1,3,1,''),(1569,90,'stalluchi',1,3,1,''),(1570,90,'engina',1,3,1,''),(1571,90,'f_crystal_green',1,3,1,''),(1572,90,'corylus',1,3,1,''),(1573,90,'coonlank_green',1,3,1,''),(1574,91,'raw_veldite',1,5,1,''),(1575,91,'raw_scordspar',1,5,1,''),(1576,91,'raw_keromber',1,20,1,''),(1577,91,'raw_plagionite',1,20,1,''),(1578,91,'raw_jasioclase',1,40,1,''),(1579,91,'raw_hemorgite',1,40,1,''),(1580,91,'hollinium',1,3,1,''),(1581,91,'harvino',1,3,1,''),(1582,91,'gorruchi',1,3,1,''),(1583,91,'fabrino',1,3,1,''),(1584,91,'f_crystal_yellow',1,3,1,''),(1585,91,'corylus',1,3,1,''),(1586,91,'coonlank_yellow',1,3,1,''),(1587,92,'raw_veldite',1,5,1,''),(1588,92,'raw_scordspar',1,5,1,''),(1589,92,'raw_keromber',1,20,1,''),(1590,92,'raw_plagionite',1,20,1,''),(1591,92,'raw_jasioclase',1,40,1,''),(1592,92,'raw_hemorgite',1,40,1,''),(1593,92,'hollinium',1,3,1,''),(1594,92,'harvino',1,3,1,''),(1595,92,'gorruchi',1,3,1,''),(1596,92,'weevina',1,3,1,''),(1597,92,'f_crystal_red',1,3,1,''),(1598,92,'corylus',1,3,1,''),(1599,92,'coonlank_red',1,3,1,''),(1600,93,'raw_veldite',1,5,1,''),(1601,93,'raw_scordspar',1,5,1,''),(1602,93,'raw_keromber',1,20,1,''),(1603,93,'raw_plagionite',1,20,1,''),(1604,93,'raw_jasioclase',1,40,1,''),(1605,93,'raw_hemorgite',1,40,1,''),(1606,93,'hollinium',1,3,1,''),(1607,93,'harvino',1,3,1,''),(1608,93,'gorruchi',1,3,1,''),(1609,93,'arvvina',1,3,1,''),(1610,93,'f_crystal_blue',1,3,1,''),(1611,93,'porlang',1,3,1,''),(1612,93,'coonlank_blue',1,3,1,''),(1613,94,'raw_veldite',1,5,1,''),(1614,94,'raw_scordspar',1,5,1,''),(1615,94,'raw_keromber',1,20,1,''),(1616,94,'raw_plagionite',1,20,1,''),(1617,94,'raw_jasioclase',1,40,1,''),(1618,94,'raw_hemorgite',1,40,1,''),(1619,94,'hollinium',1,3,1,''),(1620,94,'harvino',1,3,1,''),(1621,94,'stalluchi',1,3,1,''),(1622,94,'medcina',1,3,1,''),(1623,94,'f_crystal_green',1,3,1,''),(1624,94,'sygium_gem',1,3,1,''),(1625,94,'coonlank_green',1,3,1,''),(1626,95,'raw_veldite',1,5,1,''),(1627,95,'raw_scordspar',1,5,1,''),(1628,95,'raw_keromber',1,20,1,''),(1629,95,'raw_plagionite',1,20,1,''),(1630,95,'raw_jasioclase',1,40,1,''),(1631,95,'raw_hemorgite',1,40,1,''),(1632,95,'hollinium',1,3,1,''),(1633,95,'harvino',1,3,1,''),(1634,95,'gorruchi',1,3,1,''),(1635,95,'engina',1,3,1,''),(1636,95,'f_crystal_yellow',1,3,1,''),(1637,95,'corylus',1,3,1,''),(1638,95,'coonlank_yellow',1,3,1,''),(1639,96,'raw_veldite',1,5,1,''),(1640,96,'raw_scordspar',1,5,1,''),(1641,96,'raw_keromber',1,20,1,''),(1642,96,'raw_plagionite',1,20,1,''),(1643,96,'raw_jasioclase',1,40,1,''),(1644,96,'raw_hemorgite',1,40,1,''),(1645,96,'hollinium',1,3,1,''),(1646,96,'harvino',1,3,1,''),(1647,96,'pefoate',1,3,1,''),(1648,96,'pawisis',1,3,1,''),(1649,96,'f_crystal_red',1,3,1,''),(1650,96,'corylus',1,3,1,''),(1651,96,'coonlank_red',1,3,1,''),(1652,97,'raw_veldite',1,5,1,''),(1653,97,'raw_scordspar',1,5,1,''),(1654,97,'raw_keromber',1,20,1,''),(1655,97,'raw_plagionite',1,20,1,''),(1656,97,'raw_jasioclase',1,40,1,''),(1657,97,'raw_hemorgite',1,40,1,''),(1658,97,'hollinium',1,3,1,''),(1659,97,'harvino',1,3,1,''),(1660,97,'pawisis',1,3,1,''),(1661,97,'pefoate',1,3,1,''),(1662,97,'f_crystal_blue',1,3,1,''),(1663,97,'porlang',1,3,1,''),(1664,97,'coonlank_blue',1,3,1,''),(1665,98,'nw_it_gold001',30,20,1,''),(1666,98,'nw_it_gold001',50,5,1,''),(1667,98,'elec_imperfect',1,20,1,''),(1668,98,'elec_good',1,5,1,''),(1669,99,'cox_meat',1,50,1,''),(1670,99,'lth_good',1,20,1,''),(1671,99,'lth_imperfect',1,30,1,''),(1672,100,'amphi_brain',1,10,1,''),(1673,100,'amphi_brain2',1,10,1,''),(1674,101,'nw_it_gold001',60,20,1,''),(1675,101,'nw_it_gold001',100,5,1,''),(1676,101,'elec_imperfect',1,5,1,''),(1677,101,'elec_good',1,10,1,''),(1678,101,'c_cluster_green',1,10,1,''),(1679,101,'ecot_lthr_drop',1,1,1,''),(1680,54,'ass_power',1,10,1,''),(1681,51,'ass_power',1,1,1,''),(1682,52,'ass_power',1,1,1,''),(1683,53,'ass_power',1,1,1,''),(1684,22,'greatsword_mando',1,1,1,''),(1685,44,'kath_meat_1',1,10,1,''),(1686,102,'womprathide',1,5,1,''),(1687,102,'womprattooth',1,5,1,''),(1688,102,'wompratclaw',1,5,1,''),(1689,102,'wompratmeat',1,5,1,''),(1690,103,'sandswimmerfin',1,5,1,''),(1691,103,'sandswimmerh',1,5,1,''),(1692,103,'sandswimmerleg',1,5,1,''),(1693,104,'wraidskin',1,5,1,''),(1694,104,'wraidtooth',1,5,1,''),(1695,105,'sanddemonclaw',1,10,1,''),(1696,105,'sanddemonhide',1,10,1,''),(1697,106,'tusk_highe',1,5,1,''),(1698,106,'tusk_leather',1,5,1,''),(1699,106,'t_blast_parts',1,5,1,''),(1700,107,'const_parts_tsk',1,10,1,''),(1701,107,'tsk_electronics',1,5,1,''),(1702,107,'tsk_metal',1,1,1,''),(1703,110,'spear_byssk',1,10,1,''),(1704,110,'quarterstaff_byy',1,10,1,''),(1705,110,'longsword_byysk',1,10,1,''),(1706,110,'dart_byysk',1,10,1,''),(1707,110,'axe_byysk',1,10,1,''),(1708,110,'force_robe_byysk',1,3,1,''),(1709,110,'breastplate_byys',1,1,1,''),(1710,110,'tunic_byysk',1,2,1,''),(1711,115,'byysk_def_ring',1,5,1,''),(1712,115,'bag_byysk',1,5,1,''),(1713,110,'byysk_shield',1,1,1,''),(1714,110,'powerglove_byysk',1,4,1,''),(1715,110,'stim_cha1',1,2,1,''),(1716,110,'stim_dex1',1,2,1,''),(1717,110,'stim_wis1',1,2,1,''),(1718,117,'lth_imperfect',1,20,1,''),(1719,117,'lth_high',1,30,1,''),(1720,117,'qion_tiger_fang',1,10,1,''),(1721,117,'tiger_blood',1,8,1,''),(1722,111,'p_crystal_blue',1,40,1,''),(1723,111,'p_crystal_red',1,40,1,''),(1724,111,'p_crystal_green',1,40,1,''),(1725,111,'p_crystal_yellow',1,40,1,''),(1726,111,'c_cluster_blue',1,5,1,''),(1727,111,'power_crystal_im',1,10,1,''),(1728,111,'raw_croknor',1,20,1,''),(1729,111,'raw_hemorgite',1,15,1,''),(1730,111,'corylus',1,5,1,''),(1731,111,'coonlank_blue',1,5,1,''),(1732,113,'p_crystal_blue',1,40,1,''),(1733,113,'p_crystal_red',1,40,1,''),(1734,113,'p_crystal_green',1,40,1,''),(1735,113,'p_crystal_yellow',1,40,1,''),(1736,113,'c_cluster_red',1,5,1,''),(1737,113,'power_crystal_im',1,10,1,''),(1738,113,'raw_croknor',1,20,1,''),(1739,113,'raw_hemorgite',1,15,1,''),(1740,113,'corylus',1,5,1,''),(1741,113,'coonlank_red',1,5,1,''),(1742,112,'p_crystal_blue',1,40,1,''),(1743,112,'p_crystal_red',1,40,1,''),(1744,112,'p_crystal_green',1,40,1,''),(1745,112,'p_crystal_yellow',1,40,1,''),(1746,112,'c_cluster_yellow',1,5,1,''),(1747,112,'power_crystal_im',1,10,1,''),(1748,112,'raw_croknor',1,20,1,''),(1749,112,'raw_hemorgite',1,15,1,''),(1750,112,'corylus',1,5,1,''),(1751,112,'coonlank_yellow',1,5,1,''),(1752,114,'p_crystal_blue',1,40,1,''),(1753,114,'p_crystal_red',1,40,1,''),(1754,114,'p_crystal_green',1,40,1,''),(1755,114,'p_crystal_yellow',1,40,1,''),(1756,114,'c_cluster_green',1,5,1,''),(1757,114,'power_crystal_im',1,10,1,''),(1758,114,'raw_croknor',1,20,1,''),(1759,114,'raw_hemorgite',1,15,1,''),(1760,114,'corylus',1,5,1,''),(1761,114,'coonlank_green',1,5,1,''),(1762,116,'elec_slime',1,10,1,''),(1763,116,'slug_bile',1,6,1,''),(1764,116,'slug_tooth',1,8,1,''),(1765,23,'des_light_chest',1,5,1,''),(1766,23,'des_light_boots',1,10,1,''),(1767,23,'des_light_belt',1,10,1,''),(1768,23,'des_light_amm',1,4,1,''),(1769,23,'des_light_helm',1,8,1,''),(1770,23,'des_force_chest',1,5,1,''),(1771,23,'des_force_boots',1,10,1,''),(1772,23,'des_force_belt',1,10,1,''),(1773,23,'des_force_amm',1,4,1,''),(1774,23,'des_force_helm',1,8,1,''),(1775,23,'des_heavy_chest',1,5,1,''),(1776,23,'des_heavy_boots',1,10,1,''),(1777,23,'des_heavy_belt',1,10,1,''),(1778,23,'des_heavy_amm',1,4,1,''),(1779,39,'r_light_chest',1,5,1,''),(1780,39,'r_light_boots',1,10,1,''),(1781,39,'r_light_belt',1,10,1,''),(1782,39,'r_light_amm',1,4,1,''),(1783,39,'r_light_helm',1,8,1,''),(1784,39,'r_force_chest',1,5,1,''),(1785,39,'r_force_boots',1,10,1,''),(1786,39,'r_force_belt',1,10,1,''),(1787,39,'r_force_amm',1,4,1,''),(1788,39,'r_force_helm',1,8,1,''),(1789,39,'r_heavy_chest',1,5,1,''),(1790,39,'r_heavy_boots',1,10,1,''),(1791,39,'r_heavy_belt',1,10,1,''),(1792,39,'r_heavy_amm',1,4,1,''),(1793,39,'r_heavy_helm',1,8,1,''),(1794,98,'pr_light_chest',1,5,1,''),(1795,98,'pr_light_boots',1,10,1,''),(1796,98,'pr_light_belt',1,10,1,''),(1797,98,'pr_light_amm',1,4,1,''),(1798,98,'pr_light_helm',1,8,1,''),(1799,98,'pr_force_chest',1,5,1,''),(1800,98,'pr_force_boots',1,10,1,''),(1801,98,'pr_force_belt',1,10,1,''),(1802,98,'pr_force_amm',1,4,1,''),(1803,98,'pr_force_helm',1,8,1,''),(1804,98,'pr_heavy_chest',1,5,1,''),(1805,98,'pr_heavy_boots',1,10,1,''),(1806,98,'pr_heavy_belt',1,10,1,''),(1807,98,'pr_heavy_amm',1,4,1,''),(1808,98,'pr_heavy_helm',1,8,1,''),(1809,110,'qa_light_chest',1,5,1,''),(1810,110,'qa_light_boots',1,10,1,''),(1811,110,'qa_light_belt',1,10,1,''),(1812,110,'qa_light_amm',1,4,1,''),(1813,110,'qa_light_helm',1,8,1,''),(1814,110,'qa_force_chest',1,5,1,''),(1815,110,'qa_force_boots',1,10,1,''),(1816,110,'qa_force_belt',1,10,1,''),(1817,110,'qa_force_amm',1,4,1,''),(1818,110,'qa_force_helm',1,8,1,''),(1819,110,'qa_heavy_chest',1,5,1,''),(1820,110,'qa_heavy_boots',1,10,1,''),(1821,110,'qa_heavy_belt',1,10,1,''),(1822,110,'qa_heavy_amm',1,4,1,''),(1823,110,'qa_heavy_helm',1,8,1,'');
/*!40000 ALTER TABLE `LootTableItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MarketCategory`
--

DROP TABLE IF EXISTS `MarketCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MarketCategory` (
  `ID` int NOT NULL,
  `Name` varchar(64) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MarketCategory`
--

LOCK TABLES `MarketCategory` WRITE;
/*!40000 ALTER TABLE `MarketCategory` DISABLE KEYS */;
INSERT INTO `MarketCategory` VALUES (1,'Heavy Vibroblade GA',1),(2,'Vibroblade BA',1),(3,'Vibroblade BS',1),(4,'Finesse Vibroblade D',1),(5,'Heavy Vibroblade GS',1),(6,'Lightsaber',1),(7,'Vibroblade LS',1),(8,'Finesse Vibroblade R',1),(9,'Vibroblade K',1),(10,'Vibroblade SS',1),(11,'Baton C',1),(12,'Baton M',1),(13,'Baton MS',1),(14,'Saberstaff',1),(15,'Quarterstaff',1),(16,'Twin Vibroblade DA',1),(17,'Twin Vibroblade TS',1),(18,'Finesse Vibroblade K',1),(19,'Polearm H',1),(20,'Polearm S',1),(21,'Blaster Rifle',1),(22,'Blaster Pistol',1),(23,'Clothing',1),(24,'Light Armor',1),(25,'Force Armor',1),(26,'Heavy Armor',1),(27,'Helmet',1),(28,'Shield',1),(29,'Book',1),(30,'Power Glove',1),(31,'Scanner',1),(32,'Harvester',1),(33,'Component (Raw Ore)',1),(34,'Component (Metal)',1),(35,'Component (Organic)',1),(36,'Component (Small Blade)',1),(37,'Component (Medium Blade)',1),(38,'Component (Large Blade)',1),(39,'Component (Shaft)',1),(40,'Component (Small Handle)',1),(41,'Component (Medium Handle)',1),(42,'Component (Large Handle)',1),(43,'Component (Enhancement)',1),(44,'Component (Fiberplast)',1),(45,'Component (Leather)',1),(46,'Component (Padding)',1),(47,'Component (Electronics)',1),(48,'Component (Wood Baton Frame)',1),(49,'Component (Metal Baton Frame)',1),(50,'Component (Ranged Weapon Core)',1),(51,'Component (Rifle Barrel)',1),(52,'Component (Pistol Barrel)',1),(53,'Component (Power Crystal)',1),(54,'Component (Saber Hilt)',1),(55,'Component (Seeds)',1),(56,'Component (Blue Crystal)',1),(57,'Component (Red Crystal)',1),(58,'Component (Green Crystal)',1),(59,'Component (Yellow Crystal)',1),(60,'Component (Blue Crystal Cluster)',1),(61,'Component (Red Crystal Cluster)',1),(62,'Component (Green Crystal Cluster)',1),(63,'Component (Yellow Crystal Cluster)',1),(64,'Component (Power Crystal Cluster)',1),(65,'Component (Heavy Armor Core)',1),(66,'Component (Light Armor Core)',1),(67,'Component (Force Armor Core)',1),(68,'Component (Heavy Armor Segment)',1),(69,'Component (Light Armor Segment)',1),(70,'Component (Force Armor Segment)',1),(71,'Component (Small Structure Frame)',1),(72,'Component (Medium Structure Frame)',1),(73,'Component (Large Structure Frame)',1),(74,'Component (Computing Module)',1),(75,'Component (Construction Parts)',1),(76,'Component (Mainframe)',1),(77,'Component (Power Relay)',1),(78,'Component (Power Core)',1),(79,'Component (Ingredient)',1),(80,'Component (Herb)',1),(81,'Component (Carbosyrup)',1),(82,'Component (Meat)',1),(83,'Component (Cereal)',1),(84,'Component (Grain)',1),(85,'Component (Vegetable)',1),(86,'Component (Water)',1),(87,'Component (Curry Paste)',1),(88,'Component (Soup)',1),(89,'Component (Spiced Milk)',1),(90,'Component (Dough)',1),(91,'Component (Butter)',1),(92,'Component (Noodles)',1),(93,'Component (Eggs)',1),(94,'Component (Emitter)',1),(95,'Component (Hyperdrive)',1),(96,'Component (Hull Plating)',1),(97,'Component (Starship Weapon)',1),(98,'Blue Mod',1),(99,'Green Mod',1),(100,'Red Mod',1),(101,'Yellow Mod',1),(102,'Necklace',1),(103,'Ring',1),(104,'Repair Kit',1),(105,'Stim Pack',1),(106,'Force Pack',1),(107,'Healing Kit',1),(108,'Resuscitation Device',1),(109,'Starchart',1),(110,'Fuel',1),(111,'Control Tower',1),(112,'Drill',1),(113,'Resource Silo',1),(114,'Turret',1),(115,'Building',1),(116,'Mass Production',1),(117,'Starship Production',1),(118,'Furniture',1),(119,'Stronidium Silo',1),(120,'Fuel Silo',1),(121,'Crafting Device',1),(122,'Persistent Storage',1),(123,'Starship',1),(124,'Starship Equipment',1);
/*!40000 ALTER TABLE `MarketCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MarketRegion`
--

DROP TABLE IF EXISTS `MarketRegion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MarketRegion` (
  `ID` int NOT NULL,
  `Name` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MarketRegion`
--

LOCK TABLES `MarketRegion` WRITE;
/*!40000 ALTER TABLE `MarketRegion` DISABLE KEYS */;
INSERT INTO `MarketRegion` VALUES (1,'Viscara'),(2,'Tatooine');
/*!40000 ALTER TABLE `MarketRegion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Message`
--

DROP TABLE IF EXISTS `Message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Message` (
  `ID` varchar(64) NOT NULL,
  `BoardID` varchar(64) NOT NULL,
  `PlayerID` varchar(64) NOT NULL,
  `Title` varchar(256) NOT NULL,
  `Text` varchar(4000) NOT NULL,
  `DatePosted` datetime(6) NOT NULL,
  `DateExpires` datetime(6) NOT NULL,
  `DateRemoved` datetime(6) DEFAULT NULL,
  `ClusterID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CIX_Message_ID` (`ClusterID`),
  KEY `FK_Message_PlayerID` (`PlayerID`),
  CONSTRAINT `FK_Message_PlayerID` FOREIGN KEY (`PlayerID`) REFERENCES `Player` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Message`
--

LOCK TABLES `Message` WRITE;
/*!40000 ALTER TABLE `Message` DISABLE KEYS */;
/*!40000 ALTER TABLE `Message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ModuleEvent`
--

DROP TABLE IF EXISTS `ModuleEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ModuleEvent` (
  `ID` varchar(64) NOT NULL,
  `ModuleEventTypeID` int NOT NULL,
  `PlayerID` varchar(64) DEFAULT NULL,
  `CDKey` varchar(20) NOT NULL,
  `AccountName` varchar(1024) NOT NULL,
  `DateOfEvent` datetime(6) NOT NULL,
  `ClusterID` int NOT NULL AUTO_INCREMENT,
  `BankID` int DEFAULT NULL,
  `ItemID` varchar(64) DEFAULT NULL,
  `ItemName` longtext ,
  `ItemTag` varchar(64) DEFAULT NULL,
  `ItemResref` varchar(16) DEFAULT NULL,
  `PCBaseID` varchar(64) DEFAULT NULL,
  `PCBaseStructureID` varchar(64) DEFAULT NULL,
  `BaseStructureID` int DEFAULT NULL,
  `CustomName` varchar(64) DEFAULT NULL,
  `AreaSector` char(2) DEFAULT NULL,
  `AreaName` varchar(128) DEFAULT NULL,
  `AreaTag` varchar(32) DEFAULT NULL,
  `AreaResref` varchar(32) DEFAULT NULL,
  `PCBaseTypeID` int DEFAULT NULL,
  `DateRentDue` datetime(6) DEFAULT NULL,
  `AttackerPlayerID` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CIX_ClientLogEvent_ID` (`ClusterID`),
  KEY `FK_ClientLogEvent_ClientLogEventTypeID` (`ModuleEventTypeID`),
  KEY `FK_ClientLogEvent_PlayerID` (`PlayerID`),
  CONSTRAINT `FK_ClientLogEvent_ClientLogEventTypeID` FOREIGN KEY (`ModuleEventTypeID`) REFERENCES `ModuleEventType` (`ID`),
  CONSTRAINT `FK_ClientLogEvent_PlayerID` FOREIGN KEY (`PlayerID`) REFERENCES `Player` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ModuleEvent`
--

LOCK TABLES `ModuleEvent` WRITE;
/*!40000 ALTER TABLE `ModuleEvent` DISABLE KEYS */;
/*!40000 ALTER TABLE `ModuleEvent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ModuleEventType`
--

DROP TABLE IF EXISTS `ModuleEventType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ModuleEventType` (
  `ID` int NOT NULL,
  `Name` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ModuleEventType`
--

LOCK TABLES `ModuleEventType` WRITE;
/*!40000 ALTER TABLE `ModuleEventType` DISABLE KEYS */;
INSERT INTO `ModuleEventType` VALUES (1,'Player Log In'),(2,'Player Log Out'),(3,'Player Death'),(4,'Player Respawn'),(5,'Bank Item Stored'),(6,'Bank Item Retrieved'),(7,'Structure Item Stored'),(8,'Structure Item Retrieved'),(9,'Land Purchase'),(10,'Base Lease Expired'),(11,'Base Destroyed'),(12,'Base Lease Cancelled'),(13,'DM Authorization Success'),(14,'DM Authorization Failure');
/*!40000 ALTER TABLE `ModuleEventType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NPCGroup`
--

DROP TABLE IF EXISTS `NPCGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NPCGroup` (
  `ID` int NOT NULL,
  `Name` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NPCGroup`
--

LOCK TABLES `NPCGroup` WRITE;
/*!40000 ALTER TABLE `NPCGroup` DISABLE KEYS */;
INSERT INTO `NPCGroup` VALUES (1,'CZ-220 Mynocks'),(2,'CZ-220 Malfunctioning Droids'),(3,'CZ-220 Colicoid Experiment'),(4,'Viscara Wildland Kath Hounds'),(5,'Mandalorian Leader'),(6,'Mandalorian Warriors'),(7,'Mandalorian Rangers'),(8,'Wildwoods Looters'),(9,'Wildwoods Gimpassas'),(10,'Wildwoods Kinraths'),(11,'Valley Cairnmogs'),(12,'Vellen Fleshleader'),(13,'Viscara Deep Mountain Raivors'),(14,'Viscara Warocas'),(15,'Valley Nashtah'),(16,'Viscara Crystal Spider'),(17,'Mon Cala Aradile'),(18,'Mon Cala Viper'),(19,'Mon Cala Amphi-Hydrus'),(20,'Mon Cala Eco Terrorist'),(21,'Vellen Flesheater'),(22,'Abandoned Station Boss'),(23,'Womprat'),(24,'Sandswimmer'),(25,'Wraid'),(26,'Sand Demon'),(27,'Tusken Raider'),(28,'Hutlar - Byysk'),(29,'Hutlar - Qion Slugs'),(30,'Qion Tiger');
/*!40000 ALTER TABLE `NPCGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PCBase`
--

DROP TABLE IF EXISTS `PCBase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PCBase` (
  `ID` varchar(64) NOT NULL,
  `PlayerID` varchar(64) NOT NULL,
  `AreaResref` varchar(16) NOT NULL,
  `Sector` char(2) NOT NULL,
  `DateInitialPurchase` datetime(6) NOT NULL,
  `DateRentDue` datetime(6) NOT NULL,
  `ShieldHP` int NOT NULL DEFAULT '0',
  `IsInReinforcedMode` tinyint(1) NOT NULL DEFAULT '0',
  `Fuel` int NOT NULL DEFAULT '0',
  `ReinforcedFuel` int NOT NULL DEFAULT '0',
  `DateFuelEnds` datetime(6) NOT NULL,
  `PCBaseTypeID` int NOT NULL,
  `ApartmentBuildingID` int DEFAULT NULL,
  `CustomName` varchar(64) NOT NULL DEFAULT '',
  `BuildingStyleID` int DEFAULT NULL,
  `ShipLocation` varchar(64) DEFAULT NULL,
  `Starcharts` int DEFAULT NULL,
  `ClusterID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CIX_PCBase_ID` (`ClusterID`),
  KEY `FK_PCBase_ApartmentBuildingID` (`ApartmentBuildingID`),
  KEY `FK_PCBase_AreaResref` (`AreaResref`),
  KEY `FK_PCBase_BuildingStyleID` (`BuildingStyleID`),
  KEY `FK_PCBase_PCBaseTypeID` (`PCBaseTypeID`),
  KEY `FK_PCBase_PlayerID` (`PlayerID`),
  CONSTRAINT `FK_PCBase_ApartmentBuildingID` FOREIGN KEY (`ApartmentBuildingID`) REFERENCES `ApartmentBuilding` (`ID`),
  CONSTRAINT `FK_PCBase_AreaResref` FOREIGN KEY (`AreaResref`) REFERENCES `Area` (`Resref`),
  CONSTRAINT `FK_PCBase_BuildingStyleID` FOREIGN KEY (`BuildingStyleID`) REFERENCES `BuildingStyle` (`ID`),
  CONSTRAINT `FK_PCBase_PCBaseTypeID` FOREIGN KEY (`PCBaseTypeID`) REFERENCES `PCBaseType` (`ID`),
  CONSTRAINT `FK_PCBase_PlayerID` FOREIGN KEY (`PlayerID`) REFERENCES `Player` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PCBase`
--

LOCK TABLES `PCBase` WRITE;
/*!40000 ALTER TABLE `PCBase` DISABLE KEYS */;
/*!40000 ALTER TABLE `PCBase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PCBasePermission`
--

DROP TABLE IF EXISTS `PCBasePermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PCBasePermission` (
  `ID` varchar(64) NOT NULL,
  `PCBaseID` varchar(64) NOT NULL,
  `PlayerID` varchar(64) NOT NULL,
  `CanPlaceEditStructures` tinyint(1) NOT NULL DEFAULT '0',
  `CanAccessStructureInventory` tinyint(1) NOT NULL DEFAULT '0',
  `CanManageBaseFuel` tinyint(1) NOT NULL DEFAULT '0',
  `CanExtendLease` tinyint(1) NOT NULL DEFAULT '0',
  `CanAdjustPermissions` tinyint(1) NOT NULL DEFAULT '0',
  `CanEnterBuildings` tinyint(1) NOT NULL DEFAULT '0',
  `CanRetrieveStructures` tinyint(1) NOT NULL DEFAULT '0',
  `CanCancelLease` tinyint(1) NOT NULL DEFAULT '0',
  `CanRenameStructures` tinyint(1) NOT NULL DEFAULT '0',
  `CanEditPrimaryResidence` tinyint(1) NOT NULL DEFAULT '0',
  `CanRemovePrimaryResidence` tinyint(1) NOT NULL DEFAULT '0',
  `CanChangeStructureMode` tinyint(1) NOT NULL DEFAULT '0',
  `IsPublicPermission` tinyint(1) NOT NULL DEFAULT '0',
  `CanAdjustPublicPermissions` tinyint(1) NOT NULL DEFAULT '0',
  `CanDockStarship` tinyint(1) NOT NULL DEFAULT '0',
  `CanFlyStarship` tinyint(1) NOT NULL DEFAULT '0',
  `ClusterID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CIX_PCBasePermission_ID` (`ClusterID`),
  KEY `FK_PCBasePermission_PCBaseID` (`PCBaseID`),
  KEY `FK_PCBasePermission_PlayerID` (`PlayerID`),
  CONSTRAINT `FK_PCBasePermission_PCBaseID` FOREIGN KEY (`PCBaseID`) REFERENCES `PCBase` (`ID`),
  CONSTRAINT `FK_PCBasePermission_PlayerID` FOREIGN KEY (`PlayerID`) REFERENCES `Player` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PCBasePermission`
--

LOCK TABLES `PCBasePermission` WRITE;
/*!40000 ALTER TABLE `PCBasePermission` DISABLE KEYS */;
/*!40000 ALTER TABLE `PCBasePermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PCBaseStructure`
--

DROP TABLE IF EXISTS `PCBaseStructure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PCBaseStructure` (
  `ID` varchar(64) NOT NULL,
  `PCBaseID` varchar(64) NOT NULL,
  `BaseStructureID` int NOT NULL,
  `LocationX` double NOT NULL,
  `LocationY` double NOT NULL,
  `LocationZ` double NOT NULL,
  `LocationOrientation` double NOT NULL,
  `Durability` double NOT NULL DEFAULT '0',
  `InteriorStyleID` int DEFAULT NULL,
  `ExteriorStyleID` int DEFAULT NULL,
  `ParentPCBaseStructureID` varchar(64) DEFAULT NULL,
  `CustomName` varchar(64) NOT NULL DEFAULT '',
  `StructureBonus` int NOT NULL DEFAULT '0',
  `DateNextActivity` datetime(6) DEFAULT NULL,
  `StructureModeID` int NOT NULL DEFAULT '0',
  `ClusterID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CIX_PCBaseStructure_ID` (`ClusterID`),
  KEY `FK_PCBaseStructure_BaseStructureID` (`BaseStructureID`),
  KEY `FK_PCBaseStructure_ExteriorStyleID` (`ExteriorStyleID`),
  KEY `FK_PCBaseStructure_InteriorStyleID` (`InteriorStyleID`),
  KEY `FK_PCBaseStructure_ParentPCBaseStructureID` (`ParentPCBaseStructureID`),
  KEY `FK_PCBaseStructure_PCBaseID` (`PCBaseID`),
  KEY `FK_PCBaseStructure_StructureModeID` (`StructureModeID`),
  CONSTRAINT `FK_PCBaseStructure_BaseStructureID` FOREIGN KEY (`BaseStructureID`) REFERENCES `BaseStructure` (`ID`),
  CONSTRAINT `FK_PCBaseStructure_ExteriorStyleID` FOREIGN KEY (`ExteriorStyleID`) REFERENCES `BuildingStyle` (`ID`),
  CONSTRAINT `FK_PCBaseStructure_InteriorStyleID` FOREIGN KEY (`InteriorStyleID`) REFERENCES `BuildingStyle` (`ID`),
  CONSTRAINT `FK_PCBaseStructure_ParentPCBaseStructureID` FOREIGN KEY (`ParentPCBaseStructureID`) REFERENCES `PCBaseStructure` (`ID`),
  CONSTRAINT `FK_PCBaseStructure_PCBaseID` FOREIGN KEY (`PCBaseID`) REFERENCES `PCBase` (`ID`),
  CONSTRAINT `FK_PCBaseStructure_StructureModeID` FOREIGN KEY (`StructureModeID`) REFERENCES `StructureMode` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PCBaseStructure`
--

LOCK TABLES `PCBaseStructure` WRITE;
/*!40000 ALTER TABLE `PCBaseStructure` DISABLE KEYS */;
/*!40000 ALTER TABLE `PCBaseStructure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PCBaseStructureItem`
--

DROP TABLE IF EXISTS `PCBaseStructureItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PCBaseStructureItem` (
  `ID` varchar(64) NOT NULL,
  `PCBaseStructureID` varchar(64) NOT NULL,
  `ItemGlobalID` varchar(60) NOT NULL,
  `ItemName` longtext NOT NULL,
  `ItemTag` varchar(64) NOT NULL,
  `ItemResref` varchar(16) NOT NULL,
  `ItemObject` longtext NOT NULL,
  `ClusterID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CIX_PCBaseStructureItem_ID` (`ClusterID`),
  UNIQUE KEY `UQ_PCBaseStructureItem_ItemGlobalID` (`ItemGlobalID`),
  KEY `FK_PCBaseStructureItem_PCBaseStructureID` (`PCBaseStructureID`),
  CONSTRAINT `FK_PCBaseStructureItem_PCBaseStructureID` FOREIGN KEY (`PCBaseStructureID`) REFERENCES `PCBaseStructure` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PCBaseStructureItem`
--

LOCK TABLES `PCBaseStructureItem` WRITE;
/*!40000 ALTER TABLE `PCBaseStructureItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `PCBaseStructureItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PCBaseStructurePermission`
--

DROP TABLE IF EXISTS `PCBaseStructurePermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PCBaseStructurePermission` (
  `ID` varchar(64) NOT NULL,
  `PCBaseStructureID` varchar(64) NOT NULL,
  `PlayerID` varchar(64) NOT NULL,
  `CanPlaceEditStructures` tinyint(1) NOT NULL DEFAULT '0',
  `CanAccessStructureInventory` tinyint(1) NOT NULL DEFAULT '0',
  `CanEnterBuilding` tinyint(1) NOT NULL DEFAULT '0',
  `CanRetrieveStructures` tinyint(1) NOT NULL DEFAULT '0',
  `CanAdjustPermissions` tinyint(1) NOT NULL DEFAULT '0',
  `CanRenameStructures` tinyint(1) NOT NULL DEFAULT '0',
  `CanEditPrimaryResidence` tinyint(1) NOT NULL DEFAULT '0',
  `CanRemovePrimaryResidence` tinyint(1) NOT NULL DEFAULT '0',
  `CanChangeStructureMode` tinyint(1) NOT NULL DEFAULT '0',
  `IsPublicPermission` tinyint(1) NOT NULL DEFAULT '0',
  `CanAdjustPublicPermissions` tinyint(1) NOT NULL DEFAULT '0',
  `CanFlyStarship` tinyint(1) NOT NULL DEFAULT '0',
  `ClusterID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CIX_PCBaseStructurePermission_ID` (`ClusterID`),
  KEY `FK_PCBaseStructurePermissions_PCBaseStructureID` (`PCBaseStructureID`),
  KEY `FK_PCBaseStructurePermissions_PlayerID` (`PlayerID`),
  CONSTRAINT `FK_PCBaseStructurePermissions_PCBaseStructureID` FOREIGN KEY (`PCBaseStructureID`) REFERENCES `PCBaseStructure` (`ID`),
  CONSTRAINT `FK_PCBaseStructurePermissions_PlayerID` FOREIGN KEY (`PlayerID`) REFERENCES `Player` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PCBaseStructurePermission`
--

LOCK TABLES `PCBaseStructurePermission` WRITE;
/*!40000 ALTER TABLE `PCBaseStructurePermission` DISABLE KEYS */;
/*!40000 ALTER TABLE `PCBaseStructurePermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PCBaseType`
--

DROP TABLE IF EXISTS `PCBaseType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PCBaseType` (
  `ID` int NOT NULL,
  `Name` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PCBaseType`
--

LOCK TABLES `PCBaseType` WRITE;
/*!40000 ALTER TABLE `PCBaseType` DISABLE KEYS */;
INSERT INTO `PCBaseType` VALUES (1,'Regular Base'),(2,'Apartment'),(3,'Starship');
/*!40000 ALTER TABLE `PCBaseType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PCCooldown`
--

DROP TABLE IF EXISTS `PCCooldown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PCCooldown` (
  `ID` varchar(64) NOT NULL,
  `PlayerID` varchar(64) NOT NULL,
  `CooldownCategoryID` int NOT NULL,
  `DateUnlocked` datetime(6) NOT NULL,
  `ClusterID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CIX_PCCooldown_ID` (`ClusterID`),
  KEY `IX_PCCooldown_PlayerID` (`PlayerID`,`CooldownCategoryID`,`DateUnlocked`),
  KEY `fk_PCCooldown_CooldownCategoryID` (`CooldownCategoryID`),
  CONSTRAINT `fk_PCCooldown_CooldownCategoryID` FOREIGN KEY (`CooldownCategoryID`) REFERENCES `CooldownCategory` (`ID`),
  CONSTRAINT `fk_PCCooldown_PlayerID` FOREIGN KEY (`PlayerID`) REFERENCES `Player` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PCCooldown`
--

LOCK TABLES `PCCooldown` WRITE;
/*!40000 ALTER TABLE `PCCooldown` DISABLE KEYS */;
/*!40000 ALTER TABLE `PCCooldown` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PCCraftedBlueprint`
--

DROP TABLE IF EXISTS `PCCraftedBlueprint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PCCraftedBlueprint` (
  `ID` varchar(64) NOT NULL,
  `PlayerID` varchar(64) NOT NULL,
  `CraftBlueprintID` int NOT NULL,
  `DateFirstCrafted` datetime(6) NOT NULL,
  `ClusterID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CIX_PCCraftedBlueprint_ID` (`ClusterID`),
  KEY `IX_PCCraftedBlueprint_PlayerID` (`PlayerID`,`CraftBlueprintID`,`DateFirstCrafted`),
  KEY `FK_PCCraftedBlueprint_CraftBlueprintID` (`CraftBlueprintID`),
  CONSTRAINT `FK_PCCraftedBlueprint_CraftBlueprintID` FOREIGN KEY (`CraftBlueprintID`) REFERENCES `CraftBlueprint` (`ID`),
  CONSTRAINT `FK_PCCraftedBlueprint_PlayerID` FOREIGN KEY (`PlayerID`) REFERENCES `Player` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PCCraftedBlueprint`
--

LOCK TABLES `PCCraftedBlueprint` WRITE;
/*!40000 ALTER TABLE `PCCraftedBlueprint` DISABLE KEYS */;
/*!40000 ALTER TABLE `PCCraftedBlueprint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PCCustomEffect`
--

DROP TABLE IF EXISTS `PCCustomEffect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PCCustomEffect` (
  `ID` varchar(64) NOT NULL,
  `PlayerID` varchar(64) NOT NULL,
  `CustomEffectID` int NOT NULL,
  `Ticks` int NOT NULL,
  `EffectiveLevel` int NOT NULL DEFAULT '0',
  `Data` longtext NOT NULL,
  `CasterNWNObjectID` varchar(10) NOT NULL DEFAULT '',
  `StancePerkID` int DEFAULT NULL,
  `ClusterID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CIX_PCCustomEffect_ID` (`ClusterID`),
  KEY `IX_PCCustomEffect_PlayerID` (`PlayerID`,`CasterNWNObjectID`,`CustomEffectID`,`Data`(255),`EffectiveLevel`,`StancePerkID`,`Ticks`),
  KEY `fk_PCCustomEffect_CustomEffectID` (`CustomEffectID`),
  CONSTRAINT `fk_PCCustomEffect_CustomEffectID` FOREIGN KEY (`CustomEffectID`) REFERENCES `CustomEffect` (`ID`),
  CONSTRAINT `fk_PCCustomEffect_PlayerID` FOREIGN KEY (`PlayerID`) REFERENCES `Player` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PCCustomEffect`
--

LOCK TABLES `PCCustomEffect` WRITE;
/*!40000 ALTER TABLE `PCCustomEffect` DISABLE KEYS */;
/*!40000 ALTER TABLE `PCCustomEffect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PCGuildPoint`
--

DROP TABLE IF EXISTS `PCGuildPoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PCGuildPoint` (
  `ID` varchar(64) NOT NULL,
  `PlayerID` varchar(64) NOT NULL,
  `GuildID` int NOT NULL,
  `Rank` int NOT NULL,
  `Points` int NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UQ_PCGuildPoint_PlayerIDGuildID` (`PlayerID`,`GuildID`),
  KEY `FK_PCGuildPoint_GuildID` (`GuildID`),
  CONSTRAINT `FK_PCGuildPoint_GuildID` FOREIGN KEY (`GuildID`) REFERENCES `Guild` (`ID`),
  CONSTRAINT `FK_PCGuildPoint_PlayerID` FOREIGN KEY (`PlayerID`) REFERENCES `Player` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PCGuildPoint`
--

LOCK TABLES `PCGuildPoint` WRITE;
/*!40000 ALTER TABLE `PCGuildPoint` DISABLE KEYS */;
/*!40000 ALTER TABLE `PCGuildPoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PCImpoundedItem`
--

DROP TABLE IF EXISTS `PCImpoundedItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PCImpoundedItem` (
  `ID` varchar(64) NOT NULL,
  `PlayerID` varchar(64) NOT NULL,
  `ItemName` varchar(64) NOT NULL,
  `ItemTag` varchar(32) NOT NULL,
  `ItemResref` varchar(16) NOT NULL,
  `ItemObject` longtext NOT NULL,
  `DateImpounded` datetime(6) NOT NULL,
  `DateRetrieved` datetime(6) DEFAULT NULL,
  `ClusterID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CIX_PCImpoundedItem_ID` (`ClusterID`),
  KEY `IX_PCImpoundedItem_DateImpounded` (`DateImpounded`,`DateRetrieved`,`ItemName`,`ItemObject`(255),`ItemResref`,`ItemTag`,`PlayerID`),
  KEY `IX_PCImpoundedItem_DateRetrieved` (`DateRetrieved`,`DateImpounded`,`ItemName`,`ItemObject`(255),`ItemResref`,`ItemTag`,`PlayerID`),
  KEY `IX_PCImpoundedItem_PlayerID` (`PlayerID`,`DateImpounded`,`DateRetrieved`,`ItemName`,`ItemObject`(255),`ItemResref`,`ItemTag`),
  KEY `IX_PCImpoundedItem_PlayerID_DateRetrieved` (`PlayerID`,`DateRetrieved`),
  CONSTRAINT `FK_PCItemImpound_PlayerID` FOREIGN KEY (`PlayerID`) REFERENCES `Player` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PCImpoundedItem`
--

LOCK TABLES `PCImpoundedItem` WRITE;
/*!40000 ALTER TABLE `PCImpoundedItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `PCImpoundedItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PCKeyItem`
--

DROP TABLE IF EXISTS `PCKeyItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PCKeyItem` (
  `ID` varchar(64) NOT NULL,
  `PlayerID` varchar(64) NOT NULL,
  `KeyItemID` int NOT NULL,
  `AcquiredDate` datetime(6) NOT NULL,
  `ClusterID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CIX_PCKeyItem_ID` (`ClusterID`),
  KEY `IX_PCKeyItem_PlayerID` (`PlayerID`,`AcquiredDate`,`KeyItemID`),
  KEY `fk_PCKeyItem_KeyItemID` (`KeyItemID`),
  CONSTRAINT `fk_PCKeyItem_KeyItemID` FOREIGN KEY (`KeyItemID`) REFERENCES `KeyItem` (`ID`),
  CONSTRAINT `fk_PCKeyItem_PlayerID` FOREIGN KEY (`PlayerID`) REFERENCES `Player` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PCKeyItem`
--

LOCK TABLES `PCKeyItem` WRITE;
/*!40000 ALTER TABLE `PCKeyItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `PCKeyItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PCMapPin`
--

DROP TABLE IF EXISTS `PCMapPin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PCMapPin` (
  `ID` varchar(64) NOT NULL,
  `PlayerID` varchar(64) NOT NULL,
  `AreaTag` varchar(32) NOT NULL,
  `PositionX` double NOT NULL,
  `PositionY` double NOT NULL,
  `NoteText` varchar(1024) NOT NULL,
  `ClusterID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CIX_PCMapPin_ID` (`ClusterID`),
  KEY `IX_PCMapPin_PlayerID` (`PlayerID`,`AreaTag`,`NoteText`(255),`PositionX`,`PositionY`),
  CONSTRAINT `FK_PCMapPin_PlayerID` FOREIGN KEY (`PlayerID`) REFERENCES `Player` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PCMapPin`
--

LOCK TABLES `PCMapPin` WRITE;
/*!40000 ALTER TABLE `PCMapPin` DISABLE KEYS */;
/*!40000 ALTER TABLE `PCMapPin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PCMapProgression`
--

DROP TABLE IF EXISTS `PCMapProgression`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PCMapProgression` (
  `ID` varchar(64) NOT NULL,
  `PlayerID` varchar(64) NOT NULL,
  `AreaResref` varchar(16) NOT NULL,
  `Progression` varchar(1024) NOT NULL,
  `ClusterID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CIX_PCMapProgression_ID` (`ClusterID`),
  KEY `IX_PCMapProgression_PlayerID` (`PlayerID`,`AreaResref`,`Progression`(255)),
  CONSTRAINT `FK_PCMapProgression_PlayerID` FOREIGN KEY (`PlayerID`) REFERENCES `Player` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PCMapProgression`
--

LOCK TABLES `PCMapProgression` WRITE;
/*!40000 ALTER TABLE `PCMapProgression` DISABLE KEYS */;
/*!40000 ALTER TABLE `PCMapProgression` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PCMarketListing`
--

DROP TABLE IF EXISTS `PCMarketListing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PCMarketListing` (
  `ID` varchar(64) NOT NULL,
  `SellerPlayerID` varchar(64) NOT NULL,
  `Note` varchar(1024) NOT NULL DEFAULT '',
  `Price` int NOT NULL DEFAULT '0',
  `MarketRegionID` int NOT NULL,
  `MarketCategoryID` int NOT NULL,
  `DatePosted` datetime(6) NOT NULL,
  `DateExpires` datetime(6) NOT NULL,
  `DateSold` datetime(6) DEFAULT NULL,
  `DateRemoved` datetime(6) DEFAULT NULL,
  `BuyerPlayerID` varchar(64) DEFAULT NULL,
  `ItemID` varchar(60) NOT NULL,
  `ItemName` longtext NOT NULL,
  `ItemTag` varchar(32) NOT NULL,
  `ItemResref` varchar(16) NOT NULL,
  `ItemObject` longtext NOT NULL,
  `ItemRecommendedLevel` int NOT NULL DEFAULT '0',
  `ItemStackSize` int NOT NULL,
  `ClusterID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CIX_PCMarketListing_ID` (`ClusterID`),
  KEY `FK_PCMarketListing_MarketCategoryID` (`MarketCategoryID`),
  KEY `FK_PCMarketListing_MarketRegionID` (`MarketRegionID`),
  KEY `FK_PCMarketListing_PlayerID` (`SellerPlayerID`),
  KEY `FK_PCMarketListing_BuyerPlayerID` (`BuyerPlayerID`),
  CONSTRAINT `FK_PCMarketListing_BuyerPlayerID` FOREIGN KEY (`BuyerPlayerID`) REFERENCES `Player` (`ID`),
  CONSTRAINT `FK_PCMarketListing_MarketCategoryID` FOREIGN KEY (`MarketCategoryID`) REFERENCES `MarketCategory` (`ID`),
  CONSTRAINT `FK_PCMarketListing_MarketRegionID` FOREIGN KEY (`MarketRegionID`) REFERENCES `MarketRegion` (`ID`),
  CONSTRAINT `FK_PCMarketListing_PlayerID` FOREIGN KEY (`SellerPlayerID`) REFERENCES `Player` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PCMarketListing`
--

LOCK TABLES `PCMarketListing` WRITE;
/*!40000 ALTER TABLE `PCMarketListing` DISABLE KEYS */;
/*!40000 ALTER TABLE `PCMarketListing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PCObjectVisibility`
--

DROP TABLE IF EXISTS `PCObjectVisibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PCObjectVisibility` (
  `ID` varchar(64) NOT NULL,
  `PlayerID` varchar(64) NOT NULL,
  `VisibilityObjectID` varchar(200) NOT NULL,
  `IsVisible` tinyint(1) NOT NULL DEFAULT '0',
  `ClusterID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CIX_PCObjectVisibility_ID` (`ClusterID`),
  KEY `IX_PCObjectVisibility_PlayerID` (`PlayerID`,`IsVisible`,`VisibilityObjectID`),
  CONSTRAINT `FK_PCObjectVisibility_PlayerID` FOREIGN KEY (`PlayerID`) REFERENCES `Player` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PCObjectVisibility`
--

LOCK TABLES `PCObjectVisibility` WRITE;
/*!40000 ALTER TABLE `PCObjectVisibility` DISABLE KEYS */;
/*!40000 ALTER TABLE `PCObjectVisibility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PCOutfit`
--

DROP TABLE IF EXISTS `PCOutfit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PCOutfit` (
  `PlayerID` varchar(64) NOT NULL,
  `Outfit1` longtext,
  `Outfit2` longtext,
  `Outfit3` longtext,
  `Outfit4` longtext,
  `Outfit5` longtext,
  `Outfit6` longtext,
  `Outfit7` longtext,
  `Outfit8` longtext,
  `Outfit9` longtext,
  `Outfit10` longtext,
  `ClusterID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`PlayerID`),
  UNIQUE KEY `CIX_PCOutfit_PlayerID` (`ClusterID`),
  CONSTRAINT `fk_PCOutfit_PlayerID` FOREIGN KEY (`PlayerID`) REFERENCES `Player` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PCOutfit`
--

LOCK TABLES `PCOutfit` WRITE;
/*!40000 ALTER TABLE `PCOutfit` DISABLE KEYS */;
/*!40000 ALTER TABLE `PCOutfit` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `PCHelmet`
--

DROP TABLE IF EXISTS `PCHelmet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PCHelmet` (
  `PlayerID` varchar(64) NOT NULL,
  `Helmet1` longtext,
  `Helmet2` longtext,
  `Helmet3` longtext,
  `Helmet4` longtext,
  `Helmet5` longtext,
  `Helmet6` longtext,
  `Helmet7` longtext,
  `Helmet8` longtext,
  `Helmet9` longtext,
  `Helmet10` longtext,
  `ClusterID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`PlayerID`),
  UNIQUE KEY `CIX_PCHelmet_PlayerID` (`ClusterID`),
  CONSTRAINT `fk_PCHelmet_PlayerID` FOREIGN KEY (`PlayerID`) REFERENCES `Player` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PCHelmet`
--

LOCK TABLES `PCHelmet` WRITE;
/*!40000 ALTER TABLE `PCHelmet` DISABLE KEYS */;
/*!40000 ALTER TABLE `PCHelmet` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `PCWeapon`
--

DROP TABLE IF EXISTS `PCWeapon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PCWeapon` (
  `PlayerID` varchar(64) NOT NULL,
  `Weapon1` longtext,
  `Weapon2` longtext,
  `Weapon3` longtext,
  `Weapon4` longtext,
  `Weapon5` longtext,
  `Weapon6` longtext,
  `Weapon7` longtext,
  `Weapon8` longtext,
  `Weapon9` longtext,
  `Weapon10` longtext,
  `ClusterID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`PlayerID`),
  UNIQUE KEY `CIX_PCWeapon_PlayerID` (`ClusterID`),
  CONSTRAINT `fk_PCWeapon_PlayerID` FOREIGN KEY (`PlayerID`) REFERENCES `Player` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PCWeapon`
--

LOCK TABLES `PCWeapon` WRITE;
/*!40000 ALTER TABLE `PCWeapon` DISABLE KEYS */;
/*!40000 ALTER TABLE `PCWeapon` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `PCOverflowItem`
--

DROP TABLE IF EXISTS `PCOverflowItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PCOverflowItem` (
  `ID` varchar(64) NOT NULL,
  `PlayerID` varchar(64) NOT NULL,
  `ItemName` longtext NOT NULL,
  `ItemTag` varchar(64) NOT NULL,
  `ItemResref` varchar(16) NOT NULL,
  `ItemObject` longtext,
  `ClusterID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CIX_PCOverflowItem_ID` (`ClusterID`),
  KEY `IX_PCOverflowItem_PlayerID` (`PlayerID`,`ItemName`(255),`ItemObject`(255),`ItemResref`,`ItemTag`),
  CONSTRAINT `fk_PCOverflowItem_PlayerID` FOREIGN KEY (`PlayerID`) REFERENCES `Player` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PCOverflowItem`
--

LOCK TABLES `PCOverflowItem` WRITE;
/*!40000 ALTER TABLE `PCOverflowItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `PCOverflowItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PCPerk`
--

DROP TABLE IF EXISTS `PCPerk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PCPerk` (
  `ID` varchar(64) NOT NULL,
  `PlayerID` varchar(64) NOT NULL,
  `AcquiredDate` datetime(6) NOT NULL,
  `PerkID` int NOT NULL,
  `PerkLevel` int NOT NULL DEFAULT '0',
  `ClusterID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CIX_PCPerk_ID` (`ClusterID`),
  KEY `IX_PCPerk_PlayerID` (`PlayerID`,`AcquiredDate`,`PerkID`,`PerkLevel`),
  KEY `fk_PCPerk_PerkID` (`PerkID`),
  CONSTRAINT `fk_PCPerk_PerkID` FOREIGN KEY (`PerkID`) REFERENCES `Perk` (`ID`),
  CONSTRAINT `fk_PCPerk_PlayerID` FOREIGN KEY (`PlayerID`) REFERENCES `Player` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PCPerk`
--

LOCK TABLES `PCPerk` WRITE;
/*!40000 ALTER TABLE `PCPerk` DISABLE KEYS */;
/*!40000 ALTER TABLE `PCPerk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PCPerkRefund`
--

DROP TABLE IF EXISTS `PCPerkRefund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PCPerkRefund` (
  `ID` varchar(64) NOT NULL,
  `PlayerID` varchar(64) NOT NULL,
  `PerkID` int NOT NULL,
  `Level` int NOT NULL,
  `DateAcquired` datetime(6) NOT NULL,
  `DateRefunded` datetime(6) NOT NULL,
  `ClusterID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CIX_PCPerkRefund_ID` (`ClusterID`),
  KEY `FK_PCPerkRefund_PlayerID` (`PlayerID`),
  KEY `FK_PCPerkRefund_PerkID` (`PerkID`),
  CONSTRAINT `FK_PCPerkRefund_PerkID` FOREIGN KEY (`PerkID`) REFERENCES `Perk` (`ID`),
  CONSTRAINT `FK_PCPerkRefund_PlayerID` FOREIGN KEY (`PlayerID`) REFERENCES `Player` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PCPerkRefund`
--

LOCK TABLES `PCPerkRefund` WRITE;
/*!40000 ALTER TABLE `PCPerkRefund` DISABLE KEYS */;
/*!40000 ALTER TABLE `PCPerkRefund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PCQuestItemProgress`
--

DROP TABLE IF EXISTS `PCQuestItemProgress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PCQuestItemProgress` (
  `ID` varchar(64) NOT NULL,
  `PlayerID` varchar(64) NOT NULL,
  `PCQuestStatusID` varchar(64) NOT NULL,
  `Resref` varchar(16) NOT NULL,
  `Remaining` int NOT NULL DEFAULT '0',
  `MustBeCraftedByPlayer` tinyint(1) NOT NULL DEFAULT '0',
  `ClusterID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CIX_PCQuestItemProgress_ID` (`ClusterID`),
  KEY `IX_PCQuestItemProgress_PlayerID` (`PlayerID`,`MustBeCraftedByPlayer`,`PCQuestStatusID`,`Remaining`,`Resref`),
  KEY `FK_PCQuestItemProgress_PCQuesttatusID` (`PCQuestStatusID`),
  CONSTRAINT `FK_PCQuestItemProgress_PCQuesttatusID` FOREIGN KEY (`PCQuestStatusID`) REFERENCES `PCQuestStatus` (`ID`),
  CONSTRAINT `FK_PCQuestItemProgress_PlayerID` FOREIGN KEY (`PlayerID`) REFERENCES `Player` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PCQuestItemProgress`
--

LOCK TABLES `PCQuestItemProgress` WRITE;
/*!40000 ALTER TABLE `PCQuestItemProgress` DISABLE KEYS */;
/*!40000 ALTER TABLE `PCQuestItemProgress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PCQuestKillTargetProgress`
--

DROP TABLE IF EXISTS `PCQuestKillTargetProgress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PCQuestKillTargetProgress` (
  `ID` varchar(64) NOT NULL,
  `PlayerID` varchar(64) NOT NULL,
  `PCQuestStatusID` varchar(64) NOT NULL,
  `NPCGroupID` int NOT NULL,
  `RemainingToKill` int NOT NULL,
  `ClusterID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CIX_PCQuestKillTargetProgress_ID` (`ClusterID`),
  KEY `IX_PCQuestKillTargetProgress_PlayerID` (`PlayerID`,`NPCGroupID`,`PCQuestStatusID`,`RemainingToKill`),
  KEY `FK_PCQuestKillTargetProgress_NPCGroupID` (`NPCGroupID`),
  KEY `FK_PCQuestKillTargetProgress_PCQuesttatusID` (`PCQuestStatusID`),
  CONSTRAINT `FK_PCQuestKillTargetProgress_NPCGroupID` FOREIGN KEY (`NPCGroupID`) REFERENCES `NPCGroup` (`ID`),
  CONSTRAINT `FK_PCQuestKillTargetProgress_PCQuesttatusID` FOREIGN KEY (`PCQuestStatusID`) REFERENCES `PCQuestStatus` (`ID`),
  CONSTRAINT `FK_PCQuestKillTargetProgress_PlayerID` FOREIGN KEY (`PlayerID`) REFERENCES `Player` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PCQuestKillTargetProgress`
--

LOCK TABLES `PCQuestKillTargetProgress` WRITE;
/*!40000 ALTER TABLE `PCQuestKillTargetProgress` DISABLE KEYS */;
/*!40000 ALTER TABLE `PCQuestKillTargetProgress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PCQuestStatus`
--

DROP TABLE IF EXISTS `PCQuestStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PCQuestStatus` (
  `ID` varchar(64) NOT NULL,
  `PlayerID` varchar(64) NOT NULL,
  `QuestID` int NOT NULL,
  `CompletionDate` datetime(6) DEFAULT NULL,
  `SelectedItemRewardID` int DEFAULT NULL,
  `ClusterID` int NOT NULL AUTO_INCREMENT,
  `TimesCompleted` int NOT NULL DEFAULT '0',
  `QuestState` int NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CIX_PCQuestStatus_ID` (`ClusterID`),
  KEY `FK_PCQuesttatus_PlayerID` (`PlayerID`),
  CONSTRAINT `FK_PCQuesttatus_PlayerID` FOREIGN KEY (`PlayerID`) REFERENCES `Player` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PCQuestStatus`
--

LOCK TABLES `PCQuestStatus` WRITE;
/*!40000 ALTER TABLE `PCQuestStatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `PCQuestStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PCRegionalFame`
--

DROP TABLE IF EXISTS `PCRegionalFame`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PCRegionalFame` (
  `ID` varchar(64) NOT NULL,
  `PlayerID` varchar(64) NOT NULL,
  `FameRegionID` int NOT NULL,
  `Amount` int NOT NULL DEFAULT '0',
  `ClusterID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CIX_PCRegionalFame_ID` (`ClusterID`),
  KEY `IX_PCRegionalFame_PlayerID` (`PlayerID`,`Amount`,`FameRegionID`),
  KEY `FK_PCRegionalFame_FameRegionID` (`FameRegionID`),
  CONSTRAINT `FK_PCRegionalFame_FameRegionID` FOREIGN KEY (`FameRegionID`) REFERENCES `FameRegion` (`ID`),
  CONSTRAINT `FK_PCRegionalFame_PlayerID` FOREIGN KEY (`PlayerID`) REFERENCES `Player` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PCRegionalFame`
--

LOCK TABLES `PCRegionalFame` WRITE;
/*!40000 ALTER TABLE `PCRegionalFame` DISABLE KEYS */;
/*!40000 ALTER TABLE `PCRegionalFame` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PCSearchSite`
--

DROP TABLE IF EXISTS `PCSearchSite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PCSearchSite` (
  `ID` varchar(64) NOT NULL,
  `PlayerID` varchar(64) NOT NULL,
  `SearchSiteID` int NOT NULL,
  `UnlockDateTime` datetime(6) NOT NULL,
  `ClusterID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CIX_PCSearchSite_ID` (`ClusterID`),
  KEY `IX_PCSearchSite_PlayerID` (`PlayerID`,`SearchSiteID`,`UnlockDateTime`),
  CONSTRAINT `fk_PCSearchSite_PlayerID` FOREIGN KEY (`PlayerID`) REFERENCES `Player` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PCSearchSite`
--

LOCK TABLES `PCSearchSite` WRITE;
/*!40000 ALTER TABLE `PCSearchSite` DISABLE KEYS */;
/*!40000 ALTER TABLE `PCSearchSite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PCSearchSiteItem`
--

DROP TABLE IF EXISTS `PCSearchSiteItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PCSearchSiteItem` (
  `ID` varchar(64) NOT NULL,
  `PlayerID` varchar(64) NOT NULL,
  `SearchSiteID` int NOT NULL,
  `SearchItem` longtext,
  `ClusterID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CIX_PCSearchSiteItem_ID` (`ClusterID`),
  KEY `fk_PCSearchSiteItem_PlayerID` (`PlayerID`),
  CONSTRAINT `fk_PCSearchSiteItem_PlayerID` FOREIGN KEY (`PlayerID`) REFERENCES `Player` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PCSearchSiteItem`
--

LOCK TABLES `PCSearchSiteItem` WRITE;
/*!40000 ALTER TABLE `PCSearchSiteItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `PCSearchSiteItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PCSkill`
--

DROP TABLE IF EXISTS `PCSkill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PCSkill` (
  `ID` varchar(64) NOT NULL,
  `PlayerID` varchar(64) NOT NULL,
  `SkillID` int NOT NULL,
  `XP` int NOT NULL DEFAULT '0',
  `Rank` int NOT NULL DEFAULT '0',
  `IsLocked` tinyint(1) NOT NULL DEFAULT '0',
  `ClusterID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CIX_PCSkill_ID` (`ClusterID`),
  KEY `IX_PCSkill_PlayerID` (`PlayerID`,`IsLocked`,`Rank`,`SkillID`,`XP`),
  KEY `FK_PCSkill_SkillID` (`SkillID`),
  CONSTRAINT `FK_PCSkill_PlayerID` FOREIGN KEY (`PlayerID`) REFERENCES `Player` (`ID`),
  CONSTRAINT `FK_PCSkill_SkillID` FOREIGN KEY (`SkillID`) REFERENCES `Skill` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PCSkill`
--

LOCK TABLES `PCSkill` WRITE;
/*!40000 ALTER TABLE `PCSkill` DISABLE KEYS */;
/*!40000 ALTER TABLE `PCSkill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PCSkillPool`
--

DROP TABLE IF EXISTS `PCSkillPool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PCSkillPool` (
  `ID` varchar(64) NOT NULL,
  `PlayerID` varchar(64) NOT NULL,
  `SkillCategoryID` int NOT NULL,
  `Levels` int NOT NULL,
  `ClusterID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CIX_PCSkillPool_ID` (`ClusterID`),
  UNIQUE KEY `UQ_PCSkillPool` (`PlayerID`,`SkillCategoryID`),
  KEY `IX_PCSkillPool_PlayerID` (`PlayerID`,`Levels`,`SkillCategoryID`),
  KEY `FK_PCSkillPool_SkillCategoryID` (`SkillCategoryID`),
  CONSTRAINT `FK_PCSkillPool_PlayerID` FOREIGN KEY (`PlayerID`) REFERENCES `Player` (`ID`),
  CONSTRAINT `FK_PCSkillPool_SkillCategoryID` FOREIGN KEY (`SkillCategoryID`) REFERENCES `SkillCategory` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PCSkillPool`
--

LOCK TABLES `PCSkillPool` WRITE;
/*!40000 ALTER TABLE `PCSkillPool` DISABLE KEYS */;
/*!40000 ALTER TABLE `PCSkillPool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Perk`
--

DROP TABLE IF EXISTS `Perk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Perk` (
  `ID` int NOT NULL,
  `Name` varchar(64) NOT NULL DEFAULT '',
  `IsActive` tinyint(1) NOT NULL DEFAULT '0',
  `BaseCastingTime` double NOT NULL DEFAULT '0',
  `Description` varchar(256) NOT NULL DEFAULT '',
  `PerkCategoryID` int NOT NULL,
  `CooldownCategoryID` int DEFAULT NULL,
  `ExecutionTypeID` int NOT NULL,
  `IsTargetSelfOnly` tinyint(1) NOT NULL DEFAULT '0',
  `Enmity` int NOT NULL DEFAULT '0',
  `EnmityAdjustmentRuleID` int NOT NULL,
  `CastAnimationID` int DEFAULT NULL,
  `ForceBalanceTypeID` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `fk_Perk_CooldownCategoryID` (`CooldownCategoryID`),
  KEY `fk_Perk_EnmityAdjustmentRuleID` (`EnmityAdjustmentRuleID`),
  KEY `FK_Perk_ForceBalanceTypeID` (`ForceBalanceTypeID`),
  KEY `fk_Perk_PerkCategoryID` (`PerkCategoryID`),
  KEY `fk_Perk_ExecutionTypeID` (`ExecutionTypeID`),
  CONSTRAINT `fk_Perk_CooldownCategoryID` FOREIGN KEY (`CooldownCategoryID`) REFERENCES `CooldownCategory` (`ID`),
  CONSTRAINT `fk_Perk_EnmityAdjustmentRuleID` FOREIGN KEY (`EnmityAdjustmentRuleID`) REFERENCES `EnmityAdjustmentRule` (`ID`),
  CONSTRAINT `fk_Perk_ExecutionTypeID` FOREIGN KEY (`ExecutionTypeID`) REFERENCES `PerkExecutionType` (`ID`),
  CONSTRAINT `FK_Perk_ForceBalanceTypeID` FOREIGN KEY (`ForceBalanceTypeID`) REFERENCES `ForceBalanceType` (`ID`),
  CONSTRAINT `fk_Perk_PerkCategoryID` FOREIGN KEY (`PerkCategoryID`) REFERENCES `PerkCategory` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Perk`
--

LOCK TABLES `Perk` WRITE;
/*!40000 ALTER TABLE `Perk` DISABLE KEYS */;
INSERT INTO `Perk` VALUES (1,'Speedy Fabrication',1,0,'Reduces the amount of time it takes to craft fabrication items.',1,NULL,0,0,0,0,NULL,0),(2,'Fabrication Blueprints',1,0,'Unlocks new fabrication blueprints on every odd level (1, 3, 5, 7) and adds an enhancement slot for every even level (2, 4, 6, 8) for fabrication.',1,NULL,0,0,0,0,NULL,0),(3,'Force Speed',1,0,'Increases movement speed and dexterity.  At higher ranks grants additional attacks.',43,2,3,1,0,0,NULL,0),(4,'Absorb Energy',1,0,'Absorbs a percentage of damage that the caster would take, from all sources.',43,4,7,1,20,2,NULL,0),(5,'Force Body',1,0,'Converts a percentage of the casters current HP into FP.',43,5,3,1,0,0,NULL,0),(6,'Speedy Reassembly',1,0,'Reduces time it takes to reassemble an item.',34,NULL,0,0,0,0,NULL,0),(7,'Rest',1,1,'Restores HP quickly as long as you stay in one place. Must be out of combat to use. Moving or combat will interrupt the ability. Shares a cooldown with the Meditate Perk.',4,13,4,1,1,2,NULL,0),(8,'Stim Fiend',1,0,'Increases the duration of stim packs you use.',22,NULL,0,0,0,0,NULL,0),(9,'Medical Blueprints',1,0,'Unlocks new medicine blueprints on every odd level (1, 3, 5, 7) and adds an enhancement slot for every even level (2, 4, 6, 8) for medicine.',22,NULL,0,0,0,0,NULL,0),(10,'Speedy Medicine',1,0,'Reduces the amount of time it takes to craft medical items.',22,NULL,0,0,0,0,NULL,0),(11,'Martial Finesse',1,0,'Grants the Weapon Finesse feat which enables you to make attack rolls with your dexterity modifier instead of strength, if it is higher. Requires a martial arts weapon or unarmed to use.',17,NULL,5,0,0,0,NULL,0),(12,'Hide',1,0,'Reduces the user\'s enmity towards all targets by a sharp amount. Must be equipped with light armor.',7,19,4,1,0,0,NULL,0),(13,'Mind Shield',1,0,'Protects the target from mind affecting powers and abilities.',43,6,7,0,20,2,NULL,1),(14,'Stronidium Refining',1,0,'Increases the yield of Stronidium when refining. (Refining requires the \'Refining\' Perk.)',34,NULL,0,0,0,0,NULL,0),(15,'Lucky',1,0,'Improves your luck. Luck affects many actions and activities.',4,NULL,0,0,0,0,NULL,0),(16,'Health',1,0,'Improves your hit points.',4,NULL,0,0,0,0,NULL,0),(17,'FP',1,0,'Improves your FP pool.',4,NULL,0,0,0,0,NULL,0),(18,'Speedy Harvester',1,0,'Reduces time it takes to harvest a resource.',34,NULL,0,0,0,0,NULL,0),(19,'Rage',1,0,'Increases STR and CON at the cost of AC and HP damage each round.  At higher ranks grants additional attacks, that do not stack with Force Speed.',43,7,7,1,10,2,NULL,2),(20,'Speedy First Aid',1,0,'Healing kits and bandages are occasionally applied instantly.',22,NULL,0,0,0,0,NULL,0),(21,'Healing Kit Expert',1,0,'Improves the duration of healing kits.',22,NULL,0,0,0,0,NULL,0),(22,'Immediate Improvement',1,0,'Healing kits immediately recover HP in addition to their natural recovery over time.',22,NULL,0,0,0,0,NULL,0),(23,'Frugal Medic',1,0,'Occasionally use a healing kit without consuming a charge.',22,NULL,0,0,0,0,NULL,0),(24,'Expulsion Maneuver',1,0,'Occasionally receive increased Attack Bonus when blocking with a shield.',6,NULL,1,0,15,2,NULL,0),(25,'Blocking Recovery',1,0,'Occasionally recover hit points on a successful block with a shield.',6,NULL,1,0,10,2,NULL,0),(26,'Evasiveness',1,0,'Grants a concealment bonus for a short period of time when equipped with light armor.',7,1,4,1,20,2,NULL,0),(27,'Deflect Damage',1,0,'You are protected by a damage shield for a limited time. Must be wearing heavy armor.',7,1,4,1,10,2,NULL,0),(28,'Point Blank Shot',1,0,'Negates the -4 penalty for using missile weapons in melee and gains +1 to attack roll and damage with ranged weapons when the target is within 15 feet.',8,NULL,5,0,0,0,NULL,0),(29,'One-Handed Dual Wielding',1,0,'Grants bonuses while wielding two weapons. Must be equipped with a non-lightsaber one-handed weapon.',9,NULL,5,0,0,0,NULL,0),(30,'Blade Power Attack',1,0,'Increases damage at the cost of reduced attack rolls. Only available when equipped with a blade.',10,NULL,5,0,0,0,NULL,0),(31,'Blunt Power Attack',1,0,'Increases damage at the cost of reduced attack rolls. Only available when equipped with a blunt.',12,NULL,5,0,0,0,NULL,0),(32,'Called Shot',1,0,'Grants the ability to make a potentially disabling attack against an opponent\'s arms or legs. Must be equipped with a Finesse Blade.',11,NULL,5,0,0,0,NULL,0),(33,'Circle Kick',1,0,'Grants the Circle Kick feat. You gain an additional free attack against another, nearby enemy. There is a maximum of one free attack per round. You must be equipped with a Martial Arts weapon.',17,NULL,5,0,0,0,NULL,0),(34,'Cleave',1,0,'Grants a free attack against any opponent who is within melee range when an enemy is killed. Must be equipped with a Two-Handed Heavy Blade weapon.',13,NULL,5,0,0,0,NULL,0),(35,'Evade Blaster Fire',1,0,'Enables you to evade a blaster shot if you meet the difficulty check. DEX modifier increases chance of evasion. Must be equipped with martial arts weapon.',17,NULL,0,0,0,0,NULL,0),(36,'Dodge',1,0,'You gain a dodge bonus to AC against attacks from your current target or last target. Must be equipped with light armor.',7,NULL,5,0,0,0,NULL,0),(37,'Expertise',1,0,'Gives you the ability to make defensive attacks, gaining +5 AC but receiving -5 penalty to attack rolls. Must be equipped with Heavy Armor.',7,NULL,5,0,0,0,NULL,0),(38,'Guild Relations',1,0,'Improves your GP acquisition with all guilds.',4,NULL,0,0,0,0,0,0),(39,'Improved Critical - Vibroblades',1,0,'Improves the critical hit chance when using a vibroblade.',10,NULL,5,0,0,0,NULL,0),(40,'Improved Critical - Finesse Vibroblades',1,0,'Improves the critical hit chance when using a finesse vibroblade.',11,NULL,5,0,0,0,NULL,0),(41,'Improved Critical - Batons',1,0,'Improves the critical hit chance when using a baton weapon.',12,NULL,5,0,0,0,NULL,0),(42,'Improved Critical - Heavy Vibroblades',1,0,'Improves the critical hit chance when using a heavy vibroblade.',13,NULL,5,0,0,0,NULL,0),(43,'Improved Critical - Saberstaffs',1,0,'Improves the critical hit chance when using a saberstaff weapon.',14,NULL,5,0,0,0,NULL,0),(44,'Improved Critical - Polearms',1,0,'Improves the critical hit chance when using a polearm.',15,NULL,5,0,0,0,NULL,0),(45,'Improved Critical - Twin Vibroblades',1,0,'Improves the critical hit chance when using twin vibroblades.',16,NULL,5,0,0,0,NULL,0),(46,'Improved Critical - Martial Arts',1,0,'Improves the critical hit chance when using martial arts.',17,NULL,5,0,0,0,NULL,0),(47,'Improved Critical - Blasters',1,0,'Improves the critical hit chance when using blaster pistols.',18,NULL,5,0,0,0,NULL,0),(48,'Improved Critical - Rifles',1,0,'Improves the critical hit chance when using blaster rifles.',19,NULL,5,0,0,0,NULL,0),(49,'Improved Critical - Throwing',1,0,'Improves the critical hit chance when using throwing weapons.',20,NULL,5,0,0,0,NULL,0),(50,'Knockdown',1,0,'Your next attack deals additional bludgeoning damage and knocks down the target for a short period of time. Must be equipped with a baton.',12,3,2,1,20,1,NULL,0),(51,'Mobility',1,0,'Grants an AC bonus against attacks of opportunities. Must be equipped with light armor.',7,NULL,5,0,0,0,NULL,0),(52,'Opportunist',1,0,'You gain a +4 bonus to attack rolls when making an attack of opportunity. Must be equipped with a Finesse Blade.',11,NULL,5,0,0,0,NULL,0),(53,'Rapid Reload',1,0,'You receive the same number of attacks with any rifle as you would if you were using a blaster.',19,NULL,5,0,0,0,NULL,0),(54,'Rapid Shot',1,0,'You gain an extra attack per round while feat is active but all attacks in the round suffer a -2 penalty. Must be equipped with a blaster.',18,NULL,5,0,0,0,NULL,0),(55,'Rapid Toss',1,0,'You gain an extra attack per round while feat is active but all attacks in the round suffer a -2 penalty. Must be equipped with a throwing weapon.',20,NULL,5,0,0,0,NULL,0),(56,'Weapon Finesse',1,0,'You make melee attack rolls with your DEX if it is higher than your STR. Must be equipped with a finesse blade.',11,NULL,5,0,0,0,NULL,0),(57,'Zen Marksmanship',1,0,'Wisdom guides your ranged attacks. If your WIS modifier is higher than DEX, it will be used when firing ranged weapons. Must be equipped with a blaster or rifle.',8,NULL,5,0,0,0,NULL,0),(58,'Zen Tossing',1,0,'Wisdom guides your ranged attacks. If your WIS modifier is higher than DEX, it will be used when firing ranged weapons. Must be equipped with a throwing weapon.',20,NULL,5,0,0,0,NULL,0),(59,'Weapon Focus - Vibroblades',1,0,'You gain a bonus to attack rolls and damage when using a vibroblade. The first level will grant a bonus to your attack roll. The second level will grant a bonus to your damage.',10,NULL,5,0,0,0,NULL,0),(60,'Weapon Focus - Finesse Vibroblades',1,0,'You gain a bonus to attack rolls and damage when using a finesse vibroblade. The first level will grant a bonus to your attack roll. The second level will grant a bonus to your damage.',11,NULL,5,0,0,0,NULL,0),(61,'Weapon Focus - Batons',1,0,'You gain a bonus to attack rolls and damage when using a baton weapon. The first level will grant a bonus to your attack roll. The second level will grant a bonus to your damage.',12,NULL,5,0,0,0,NULL,0),(62,'Weapon Focus - Heavy Vibroblades',1,0,'You gain a bonus to attack rolls and damage when using heavy vibroblades. The first level will grant a bonus to your attack roll. The second level will grant a bonus to your damage.',13,NULL,5,0,0,0,NULL,0),(63,'Weapon Focus - Saberstaffs',1,0,'You gain a bonus to attack rolls and damage when using saberstaff weapons. The first level will grant a bonus to your attack roll. The second level will grant a bonus to your damage.',14,NULL,5,0,0,0,NULL,0),(64,'Weapon Focus - Polearms',1,0,'You gain a bonus to attack rolls and damage when using polearms. The first level will grant a bonus to your attack roll. The second level will grant a bonus to your damage.',15,NULL,5,0,0,0,NULL,0),(65,'Weapon Focus - Twin Blades',1,0,'You gain a bonus to attack rolls and damage when using twin vibroblades. The first level will grant a bonus to your attack roll. The second level will grant a bonus to your damage.',16,NULL,5,0,0,0,NULL,0),(66,'Weapon Focus - Martial Arts',1,0,'You gain a bonus to attack rolls and damage when using martial arts. The first level will grant a bonus to your attack roll. The second level will grant a bonus to your damage.',17,NULL,5,0,0,0,NULL,0),(67,'Weapon Focus - Blaster Pistols',1,0,'You gain a bonus to attack rolls and damage when using blaster pistols. The first level will grant a bonus to your attack roll. The second level will grant a bonus to your damage.',18,NULL,5,0,0,0,NULL,0),(68,'Weapon Focus - Blaster Rifles',1,0,'You gain a bonus to attack rolls and damage when using blaster rifles. The first level will grant a bonus to your attack roll. The second level will grant a bonus to your damage.',19,NULL,5,0,0,0,NULL,0),(69,'Weapon Focus - Throwing',1,0,'You gain a bonus to attack rolls and damage when using throwing weapons. The first level will grant a bonus to your attack roll. The second level will grant a bonus to your damage.',20,NULL,5,0,0,0,NULL,0),(70,'Shield Boost',1,3,'Increases user\'s maximum hit points for a limited time. Increases enmity of all nearby enemies by a sharp amount. Must be equipped with Heavy Armor.',7,22,4,1,100,2,NULL,0),(71,'Recovery Blast',1,0,'Your next attack deals no damage but all party members within range receive healing. Must be equipped with a blaster rifle.',19,23,2,1,0,0,NULL,0),(72,'Leg Shot',1,0,'Your next attack deals extra piercing damage and immobilizes your target for a short period of time. Must be equipped with a blaster pistol.',18,24,2,1,0,0,NULL,0),(73,'Grenade Proficiency',1,0,'Grenades have a chance to inflict knockdown.',20,NULL,0,0,0,0,NULL,0),(74,'Tranquilizer',1,0,'Your next attack will tranquilize your target, putting them to sleep for a short period of time. Damage will break the effect prematurely. Must be equipped with a Blaster Rifle to use.',19,25,2,1,0,0,NULL,0),(75,'Mass Tranquilizer',1,0,'Your next attack will tranquilize all creatures within range of your target, putting them to sleep for a short time. Damage will break the effect prematurely. Must be equipped with a Blaster Rifle to use. Length of effect depends on Tranquilizer Perk.',19,26,2,1,0,0,NULL,0),(76,'Force Persuade',0,0,'Applies Domination effect to humanoid creatures with lower WIS than the caster.',40,8,7,0,0,0,NULL,1),(77,'Precise Toss',1,0,'Your next attack deals extra piercing damage and inflicts bleeding on your target, which deals damage over time for a short time. Must be equipped with a throwing weapon.',20,27,2,1,0,0,NULL,0),(78,'Confusion',1,0,'Applies Confusion effect to organic creatures with lower WIS than the caster.',40,9,3,0,0,0,NULL,1),(79,'Speedy Refining',1,0,'Reduces the amount of time it takes to refine raw materials.',34,NULL,0,0,0,0,NULL,0),(80,'Processing Efficiency',1,0,'Occasionally receive additional items while processing raw materials.',33,NULL,0,0,0,0,NULL,0),(81,'Refinery Management',1,0,'Increases the time power sources last in a refinery.',34,NULL,0,0,0,0,NULL,0),(82,'Refining',1,0,'Enables you to refine more difficult raw materials at a refinery.',34,NULL,0,0,0,0,NULL,0),(83,'Weapon Mod Installation',1,0,'Enables the installation of mods into weapons.',23,NULL,0,0,0,0,NULL,0),(84,'Weapon Blueprints',1,0,'Unlocks new weapon blueprints on every odd level (1, 3, 5, 7) and adds an enhancement slot for every even level (2, 4, 6, 8) for weaponsmithing.',23,NULL,0,0,0,0,NULL,0),(85,'Scavenging Expert',1,0,'You have a chance to search multiple times while scavenging.',3,NULL,0,0,0,0,NULL,0),(86,'Force Insight',1,0,'The caster boosts their AB and AC. Only affects themselves.',46,28,7,1,25,2,NULL,0),(87,'Weapon Focus - Lightsabers',1,0,'You gain a bonus to attack rolls and damage when using a lightsaber. The first level will grant a bonus to your attack roll. The second level will grant a bonus to your damage. ',36,NULL,5,0,0,0,NULL,0),(89,'Dash',1,0,'Increases your movement speed for a short period of time.',4,29,4,1,0,0,110,0),(90,'Careful Scavenger',1,0,'Reduces the chance of exhausting a resource while scavenging.',3,NULL,0,0,0,0,NULL,0),(91,'Farming Efficiency',0,0,'Crops you Plant have a reduced chance to be exhausted when scavenged once fully grown. This bonus affects all players who scavenge this crop, not just you.',32,NULL,0,0,0,0,NULL,0),(92,'Expert Farmer',0,0,'Reduces the amount of time it takes for a Plant to fully mature.',32,NULL,0,0,0,0,NULL,0),(93,'Electric Fist',1,0,'Your next attack deals extra electrical damage and inflicts shock, which paralyzes your target for a short period of time. Must be equipped with a power glove.',17,30,2,1,0,0,NULL,0),(94,'Plasma Cell',1,0,'Your attacks have a chance to inflict additional elemental damage over time on each hit. Must be equipped with a Blaster Pistol or Blaster Rifle.',8,31,0,0,0,0,NULL,0),(95,'Chi',1,0,'Restores the user\'s HP. At rank 7, this ability also heals all party members within Area of effect.',17,32,4,1,0,0,NULL,0),(96,'Engineering Blueprints',1,0,'Unlocks new engineering blueprints on every odd level (1, 3, 5, 7) and adds an enhancement slot for every even level (2, 4, 6, 8) for engineering.',33,NULL,0,0,0,0,NULL,0),(98,'Speedy Weaponsmith',1,0,'Reduces the amount of time it takes to craft weaponsmith items and install mods into weapons.',23,NULL,0,0,0,0,NULL,0),(99,'Speedy Armorsmith',1,0,'Reduces the amount of time it takes to craft armorsmith items and install mods into armors.',25,NULL,0,0,0,0,NULL,0),(100,'Speedy Cooking',0,0,'Reduces the amount of time it takes to craft cooking items.',27,NULL,0,0,0,0,NULL,0),(101,'Speedy Engineering',1,0,'Reduces the amount of time it takes to craft engineering items.',33,NULL,0,0,0,0,NULL,0),(102,'Food Recipes',0,0,'Unlocks additional food recipes on every odd level (1, 3, 5, 7) and adds an enhancement slot for every even level (2, 4, 6, 8) for cooking.',27,NULL,0,0,0,0,NULL,0),(103,'Meditate',1,1,'Restores FP quickly as long as you stay in one place. Must be out of combat to use. Moving or combat will interrupt the ability. Shares a cooldown with the Rest Perk.',4,13,4,1,1,2,NULL,0),(104,'Provoke',1,0,'Increases the enmity of a single target towards the user. Must be equipped with Heavy Armor to use.',7,14,4,0,0,0,NULL,0),(105,'Improved Critical - Lightsabers',1,0,'Improves the critical hit chance when using a lightsaber.',36,NULL,5,0,0,0,NULL,0),(107,'Twin Blade Mastery',1,0,'Grants bonuses and reduces penalties while wielding twin vibroblades.',16,NULL,5,0,0,0,NULL,0),(108,'Balanced Stance',1,3,'Grants immunity to knockdown. Only one stance may be active at a time.',5,33,6,1,0,0,NULL,0),(109,'Armor Mod Installation',1,0,'Enables the installation of mods into armors.',25,NULL,0,0,0,0,NULL,0),(113,'Skewer',1,0,'Interrupts your target\'s concentration effect. Must be equipped with a Polearm.',15,40,2,1,0,0,NULL,0),(123,'Sneak Attack',1,0,'Deals extreme damage to a target on your next attack. Highest amount of damage is done from behind the target. Must be equipped with a finesse blade.',11,15,2,1,0,0,NULL,0),(124,'Armor Blueprints',1,0,'Unlocks new armor blueprints on every odd level (1, 3, 5, 7) and adds an enhancement slot for every even level (2, 4, 6, 8) for armorsmithing.',25,NULL,0,0,0,0,NULL,0),(126,'Force Stun',1,0,'Tranquilises an enemy or slows their reaction time.',40,10,7,0,10,1,NULL,1),(127,'Clarity',1,0,'Increases natural FP regeneration. Must be equipped with force armor.',7,NULL,0,0,0,0,NULL,0),(128,'Sturdiness',1,0,'Increases natural HP regeneration. Must be equipped with heavy armor.',7,NULL,0,0,0,0,NULL,0),(130,'Speedy Resource Scanner',1,0,'Increases the speed at which you use resource scanners.',34,NULL,0,0,0,0,NULL,0),(131,'Cross-Cut',1,0,'Your next attack deals additional slashing damage and inflicts Breach, which reduces target\'s AC for a short period of time. Must be equipped with a twin blade.',16,18,2,1,0,0,NULL,0),(132,'Shield Oath',1,3,'Increases AC and enmity generation but reduces damage while active. Only one stance may be active at a time.',5,33,6,1,0,0,110,0),(133,'Precision Targeting',1,3,'Increases damage with blasters but reduces AC while active. Only one stance may be active at a time.',5,33,6,1,0,0,110,0),(134,'Resuscitation Devices',1,0,'Enables and improves the use of resuscitation devices.',22,NULL,0,0,0,0,NULL,0),(135,'Ranged Healing',1,0,'Increases the range you can use medical devices and kits.',22,NULL,0,0,0,0,NULL,0),(136,'Immediate Force Pack',1,0,'Force packs immediately recover FP in addition to their natural recovery over time.',22,NULL,0,0,0,0,NULL,0),(149,'Weapon Repair',1,0,'Provides a bonus to repairs when using weapon repair kits',23,NULL,0,0,0,0,NULL,0),(150,'Armor Repair',1,0,'Provides a bonus to repairs when using armor repair kits',25,NULL,0,0,0,0,NULL,0),(151,'Lightsaber Blueprints',1,0,'Unlocks new lightsaber blueprints on every odd level (1, 3, 5, 7, 9) and adds an enhancement slot for every even level (2, 4, 6, 8, 10) for engineering.',33,NULL,0,0,0,0,NULL,0),(152,'Electronic Repair',1,0,'Provides a bonus to repairs when using Electronic repair kits.',33,NULL,0,0,0,0,NULL,0),(153,'Saberstaff Mastery',1,0,'Grants bonuses and reduces penalties while wielding saberstaffs.',14,NULL,5,0,0,0,NULL,0),(154,'Deflect Blaster Fire',1,0,'Enables you to evade a blaster shot if you meet the difficulty check. CHA modifier increases chance of evasion. Must be equipped with either a lightsaber or saberstaff.',2,NULL,0,0,0,0,NULL,0),(155,'Lightsaber Dual Wielding',1,0,'Grants bonuses while wielding two weapons. Must be equipped with a one-handed lightsaber.',36,NULL,5,0,0,0,NULL,0),(156,'Engineering Mod Installation',1,0,'Enables the installation of mods into engineering items.',33,NULL,0,0,0,0,NULL,0),(160,'Saber Finesse',1,0,'You make melee attack rolls with your DEX if it is higher than your STR. Must be equipped with a lightsaber or saberstaff.',2,NULL,5,0,0,0,NULL,0),(161,'Racer',1,0,'Increases movement speed when piloting a starship or speeder by 10% per rank.',37,NULL,0,0,0,0,NULL,0),(162,'Evasive',1,0,'Increases effective piloting Skill by 3 per rank when dodging enemy attacks.',37,NULL,0,0,0,0,NULL,0),(163,'Hunter',1,0,'Increases the relative chance of finding hostile ships when determining space encounters.',37,NULL,0,0,0,0,NULL,0),(164,'Sneak',1,0,'Decreases the relative chance of finding hostile ships when determining space encounters.',37,NULL,0,0,0,0,NULL,0),(165,'Scavenger',1,0,'Increases the relative chance of finding salvage when determining space encounters.',37,NULL,0,0,0,0,NULL,0),(166,'Sniper',1,0,'When acting as a gunner, increases the range of the ship.',37,NULL,0,0,0,0,NULL,0),(167,'Crack Shot',1,0,'When acting as a gunner, increases effective piloting Skill by 3 when making attacks.',37,NULL,0,0,0,0,NULL,0),(168,'Systems Optimization',1,0,'When in a starship but not piloting or crewing the guns, reduces Stronidium consumption by 1 per rank on each attack and defense (to a min of 1).',37,NULL,0,0,0,0,NULL,0),(169,'Combat Repair',1,0,'Allows repairing starships in space.  At level 2, halves the repair time.',37,NULL,0,0,0,0,NULL,0),(170,'Careful Pilot',1,0,'You may re-roll a failed Piloting check to take off, land, or jump through hyperspace, conserving fuel.',37,NULL,0,0,0,0,NULL,0),(171,'Molecular Reassembly Proficiency',1,0,'Improves your ability to reassemble components from fully-built equipment. Requires the use of an Molecular Reassembly Terminal.',34,NULL,0,0,0,0,NULL,0),(172,'Shield Proficiency',1,0,'Increases your damage reduction by 2% while equipped with a shield.',6,NULL,0,0,0,0,NULL,0),(173,'Sith Alchemy',1,0,'The power to transform living (or recently-living) flesh.',40,11,7,0,0,0,NULL,2),(174,'Throw Saber',1,0,'The caster throws their lightsaber at nearby enemies and pulls it back to their hand.',40,12,3,0,10,1,NULL,0),(175,'Premonition',0,0,'The caster sees a short way into the future, allowing them to avoid an untimely fate.',46,16,3,1,0,0,NULL,0),(176,'Comprehend Speech',1,0,'The caster improves their ability to understand other languages.',46,17,7,1,0,0,NULL,0),(177,'Force Detection',0,0,'The caster senses nearby hidden creatures.',46,20,3,1,0,0,NULL,0),(178,'Farseeing',0,0,'The caster gets a vision of another character.',46,21,7,1,0,0,NULL,0),(179,'Battle Insight',1,0,'The caster boosts their nearby allies at the expense of their own abilities.',46,28,7,1,10,2,NULL,0),(180,'Animal Bond',0,0,'The caster convinces a creature to travel and fight with them.',46,34,7,0,0,0,NULL,0),(181,'Drain Life',1,0,'Steals HP from a single target every second.',40,35,7,0,0,0,NULL,2),(182,'Force Lightning',1,0,'Deals electrical damage over time to a single target.',40,36,7,0,0,0,NULL,2),(183,'Force Push',1,0,'Knocks down a single target or, if resisted, slows the target instead.',40,37,3,0,0,0,NULL,0),(184,'Force Breach',1,0,'Deals direct damage to a single target.',40,38,3,0,0,0,NULL,0),(185,'Force Heal',1,0,'Restores HP on a single target over time.',43,NULL,7,0,0,0,NULL,1);
/*!40000 ALTER TABLE `Perk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PerkCategory`
--

DROP TABLE IF EXISTS `PerkCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PerkCategory` (
  `ID` int NOT NULL,
  `Name` varchar(64) NOT NULL DEFAULT '',
  `IsActive` tinyint(1) NOT NULL DEFAULT '0',
  `Sequence` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PerkCategory`
--

LOCK TABLES `PerkCategory` WRITE;
/*!40000 ALTER TABLE `PerkCategory` DISABLE KEYS */;
INSERT INTO `PerkCategory` VALUES (1,'Fabrication',1,1),(2,'Lightsabers & Saberstaffs',1,2),(3,'Gathering',1,25),(4,'General',1,1),(5,'Stances',1,5),(6,'Shields',1,3),(7,'Armor',1,2),(8,'Firearms - General',1,13),(9,'One-Handed - General',1,4),(10,'One-Handed - Vibroblades',1,5),(11,'One-Handed - Finesse Vibroblades',1,6),(12,'One-Handed - Batons',1,7),(13,'Two-Handed - Heavy Vibroblades',1,8),(14,'Saberstaffs',1,9),(15,'Two-Handed - Polearms',1,10),(16,'Twin Blades - Twin Vibroblades',1,11),(17,'Martial Arts',1,12),(18,'Blasters - Blaster Pistols',1,14),(19,'Blasters - Blaster Rifles',1,15),(20,'Throwing',1,16),(22,'Medicine',1,22),(23,'Weaponsmith',1,20),(25,'Armorsmith',1,21),(27,'Cooking',0,23),(32,'Survival',0,27),(33,'Engineering',1,22),(34,'Harvesting',1,26),(36,'Lightsabers',1,28),(37,'Piloting',1,29),(40,'Force Alter',1,30),(43,'Force Control',1,33),(46,'Force Sense',1,36);
/*!40000 ALTER TABLE `PerkCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PerkExecutionType`
--

DROP TABLE IF EXISTS `PerkExecutionType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PerkExecutionType` (
  `ID` int NOT NULL,
  `Name` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PerkExecutionType`
--

LOCK TABLES `PerkExecutionType` WRITE;
/*!40000 ALTER TABLE `PerkExecutionType` DISABLE KEYS */;
INSERT INTO `PerkExecutionType` VALUES (0,'N/A'),(1,'Shield On-Hit'),(2,'Queued Weapon Skill'),(3,'Force Ability'),(4,'Combat Ability'),(5,'Equipment-Based'),(6,'Stance'),(7,'Concentration Ability');
/*!40000 ALTER TABLE `PerkExecutionType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PerkFeat`
--

DROP TABLE IF EXISTS `PerkFeat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PerkFeat` (
  `ID` int NOT NULL,
  `PerkID` int NOT NULL,
  `FeatID` int NOT NULL,
  `PerkLevelUnlocked` int NOT NULL,
  `BaseFPCost` int NOT NULL DEFAULT '0',
  `ConcentrationFPCost` int NOT NULL DEFAULT '0',
  `ConcentrationTickInterval` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UQ_PerkFeat_FeatID` (`FeatID`),
  UNIQUE KEY `UQ_PerkFeat_SurrogateKey` (`PerkID`,`PerkLevelUnlocked`),
  CONSTRAINT `FK_PerkFeat_PerkID` FOREIGN KEY (`PerkID`) REFERENCES `Perk` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PerkFeat`
--

LOCK TABLES `PerkFeat` WRITE;
/*!40000 ALTER TABLE `PerkFeat` DISABLE KEYS */;
INSERT INTO `PerkFeat` VALUES (4,7,1139,1,0,0,0),(6,12,1142,1,0,0,0),(9,26,1116,1,0,0,0),(10,27,1117,1,0,0,0),(11,50,1118,1,0,0,0),(12,70,1146,1,0,0,0),(13,71,1147,1,0,0,0),(14,72,1148,1,0,0,0),(15,74,1149,1,0,0,0),(16,75,1150,1,0,0,0),(18,77,1151,1,0,0,0),(20,89,1153,1,0,0,0),(21,93,1154,1,0,0,0),(22,94,1155,1,0,0,0),(23,95,1156,1,0,0,0),(24,103,1128,1,0,0,0),(25,104,1129,1,0,0,0),(26,108,1157,1,0,0,0),(27,123,1132,1,0,0,0),(30,131,1141,1,0,0,0),(31,132,1158,1,0,0,0),(32,133,1159,1,0,0,0),(36,3,1165,1,2,0,0),(37,3,1166,2,4,0,0),(38,3,1167,3,6,0,0),(39,3,1168,4,8,0,0),(40,3,1169,5,20,0,0),(41,4,1170,1,2,0,1),(42,4,1171,2,4,0,1),(43,4,1172,3,6,0,1),(44,4,1173,4,8,0,1),(45,4,1174,5,10,0,1),(46,185,1175,1,0,1,6),(47,185,1176,2,0,2,6),(48,185,1177,3,0,3,6),(49,185,1178,4,0,4,6),(50,185,1179,5,0,5,6),(51,5,1180,1,0,0,0),(52,5,1181,2,0,0,0),(53,5,1182,3,0,0,0),(54,5,1183,4,0,0,0),(55,13,1184,1,0,1,1),(56,13,1185,2,0,2,1),(57,13,1186,3,0,3,1),(58,19,1187,1,2,0,6),(59,19,1188,2,4,0,6),(60,19,1189,3,6,0,6),(61,19,1190,4,8,0,6),(62,19,1191,5,10,0,6),(63,76,1192,1,8,0,1),(64,76,1193,2,20,0,1),(65,78,1194,1,8,0,0),(66,78,1195,2,20,0,0),(67,126,1196,1,0,8,6),(68,126,1197,2,0,12,6),(69,126,1198,3,0,20,6),(70,183,1199,1,4,0,0),(71,183,1200,2,6,0,0),(72,183,1201,3,8,0,0),(73,183,1202,4,10,0,0),(74,182,1203,1,0,2,3),(75,182,1204,2,0,2,3),(76,182,1205,3,0,2,3),(77,182,1206,4,0,2,3),(78,182,1207,5,0,2,3),(79,181,1208,1,0,4,1),(80,181,1209,2,0,4,1),(81,181,1210,3,0,4,1),(82,181,1211,4,0,4,1),(83,181,1212,5,0,4,1),(84,173,1213,1,25,0,1),(85,173,1214,2,300,0,1),(86,173,1215,3,0,5,1),(87,184,1216,1,8,0,0),(88,184,1217,2,10,0,0),(89,184,1218,3,12,0,0),(90,184,1219,4,14,0,0),(91,184,1220,5,16,0,0),(92,174,1221,1,5,0,0),(93,174,1222,2,5,0,0),(94,174,1223,3,16,0,0),(95,174,1224,4,8,0,0),(96,174,1225,5,10,0,0),(97,175,1226,1,0,0,0),(98,175,1227,2,0,0,0),(99,175,1228,3,0,0,0),(100,176,1229,1,0,1,6),(101,176,1230,2,0,2,6),(102,176,1231,3,0,3,6),(103,176,1232,4,0,4,6),(104,177,1233,1,0,1,1),(105,177,1234,2,0,2,1),(106,177,1235,3,0,3,1),(107,177,1236,4,0,4,1),(108,177,1237,5,0,5,1),(109,179,1238,1,0,3,6),(110,179,1239,2,0,4,6),(111,179,1240,3,0,5,6),(112,180,1241,1,4,0,1),(113,180,1242,2,8,0,1),(114,180,1243,3,12,0,1),(115,180,1244,4,16,0,1),(116,180,1245,5,20,0,1),(117,180,1246,6,30,0,1),(118,113,1247,1,0,0,0),(119,86,1248,1,0,3,6),(120,86,1249,2,0,4,6),(121,86,1250,3,0,5,6);
/*!40000 ALTER TABLE `PerkFeat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PerkLevel`
--

DROP TABLE IF EXISTS `PerkLevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PerkLevel` (
  `ID` int NOT NULL,
  `PerkID` int NOT NULL,
  `Level` int NOT NULL DEFAULT '0',
  `Price` int NOT NULL DEFAULT '0',
  `Description` varchar(512) NOT NULL DEFAULT '',
  `SpecializationID` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uq_PerkLevel_PerkIDLevel` (`PerkID`,`Level`),
  KEY `FK_PerkLevel_SpecializationID` (`SpecializationID`),
  CONSTRAINT `FK_PerkLevel_PerkID` FOREIGN KEY (`PerkID`) REFERENCES `Perk` (`ID`),
  CONSTRAINT `FK_PerkLevel_SpecializationID` FOREIGN KEY (`SpecializationID`) REFERENCES `Specialization` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PerkLevel`
--

LOCK TABLES `PerkLevel` WRITE;
/*!40000 ALTER TABLE `PerkLevel` DISABLE KEYS */;
INSERT INTO `PerkLevel` VALUES (73,15,1,6,'+1 Luck',0),(74,15,2,6,'+2 Luck',0),(75,15,3,11,'+3 Luck',0),(76,15,4,11,'+4 Luck',0),(77,15,5,16,'+5 Luck',0),(78,15,6,16,'+6 Luck',0),(79,16,1,2,'+5 HP',0),(80,16,2,2,'+10 HP',0),(81,16,3,3,'+15 HP',0),(82,16,4,3,'+20 HP',0),(83,16,5,3,'+25 HP',0),(84,16,6,4,'+30 HP',0),(85,16,7,4,'+35 HP',0),(86,16,8,5,'+40 HP',0),(87,16,9,5,'+45 HP',0),(88,16,10,6,'+50 HP',0),(89,17,1,2,'+5 FP',0),(90,17,2,2,'+10 FP',0),(91,17,3,3,'+15 FP',0),(92,17,4,3,'+20 FP',0),(93,17,5,3,'+25 FP',0),(94,17,6,4,'+30 FP',0),(95,17,7,4,'+35 FP',0),(96,17,8,5,'+40 FP',0),(97,17,9,5,'+45 FP',0),(98,17,10,6,'+50 FP',0),(99,18,1,2,'+10% Speed',0),(100,18,2,2,'+20% Speed',0),(101,18,3,3,'+30% Speed',0),(102,18,4,3,'+40% Speed',0),(103,18,5,4,'+50% Speed',0),(109,20,1,2,'+10% Chance',0),(110,20,2,2,'+20% Chance',0),(111,20,3,3,'+30% Chance',0),(112,20,4,3,'+40% Chance',0),(113,20,5,4,'+50% Chance',0),(114,20,6,4,'+60% Chance',0),(115,21,1,2,'+6 Seconds',0),(116,21,2,2,'+12 Seconds',0),(117,21,3,3,'+18 Seconds',0),(118,21,4,3,'+24 Seconds',0),(119,21,5,4,'+30 Seconds',0),(120,22,1,2,'1x Healing Kit Effectiveness',0),(121,22,2,2,'2x Healing Kit Effectiveness',0),(122,22,3,3,'3x Healing Kit Effectiveness',0),(123,22,4,3,'4x Healing Kit Effectiveness',0),(124,23,1,2,'10% Chance',0),(125,23,2,2,'20% Chance',0),(126,23,3,3,'30% Chance',0),(127,23,4,3,'40% Chance',0),(128,23,5,4,'50% Chance',0),(129,24,1,2,'+1 AB for 12 seconds with a 10% of occurring',0),(130,24,2,2,'+1 AB for 12 seconds with a 20% of occurring',0),(131,24,3,3,'+2 AB for 12 seconds with a 20% of occurring',0),(132,24,4,3,'+2 AB for 12 seconds with a 30% of occurring',0),(133,24,5,4,'+3 AB for 12 seconds with a 30% of occurring',0),(134,25,1,2,'50% chance to recover 1 HP',0),(135,25,2,2,'50% chance to recover 2 HP',0),(136,25,3,3,'50% chance to recover 3 HP',0),(137,25,4,3,'75% chance to recover 3 HP',0),(138,25,5,4,'75% chance to recover 4 HP',0),(139,26,1,2,'+10% Concealment for 12 seconds',0),(140,26,2,2,'+15% Concealment for 12 seconds',0),(141,26,3,3,'+20% Concealment for 12 seconds',0),(142,26,4,3,'+25% Concealment for 12 seconds',0),(143,26,5,4,'+30% Concealment for 18 seconds',0),(144,27,1,2,'Damage shield damage: 1 + 1d4 for 12 seconds',0),(145,27,2,2,'Damage shield damage: 1 + 1d8 for 12 seconds',0),(146,27,3,3,'Damage shield damage: 2 + 2d6 for 12 seconds',0),(147,27,4,3,'Damage shield damage: 2 + 2d8 for 12 seconds',0),(148,27,5,4,'Damage shield damage: 3 + 2d12 for 12 seconds',0),(1144,28,1,2,'',0),(1145,29,1,3,'Grants Two-weapon Fighting feat which reduces attack penalty from -6/-10 to -4/-8 when fighting with two weapons. Must be equipped with a one-handed non-lightsaber weapon',0),(1146,29,2,4,'Grants Ambidexterity feat which reduces the attack penalty of your off-hand weapon by 4. Must be equipped with a one-handed non-lightsaber weapon',0),(1147,29,3,6,'Grants Improved two-weapon fighting which gives you a second off-hand attack at a penalty of -5 to your attack roll. Must be equipped with a one-handed non-lightsaber weapon',0),(1148,30,1,2,'Grants the Power Attack feat which grants a +5 bonus to damage roll at the cost of -5 to attack roll. Only available when equipped with a Blade.',0),(1149,30,2,3,'Grants the Improved Power Attack feat which grants a +10 bonus to damage roll at the cost of -10 to attack roll. Does not replace Power Attack. Only available when equipped with a Blade.',0),(1150,31,1,2,'Grants the Power Attack feat which grants a +5 bonus to damage roll at the cost of -5 to attack roll. Only available when equipped with a baton.',0),(1151,31,2,3,'Grants the Improved Power Attack feat which grants a +10 bonus to damage roll at the cost of -10 to attack roll. Does not replace Power Attack. Only available when equipped with a baton.',0),(1152,32,1,2,'Grants the Called Shot feat which have a chance to reduce a target\'s movement rate by 20% and inflicts a penalty to DEX. This feat is only available when equipped with a Finesse Blade.',0),(1153,33,1,2,'Grants the Circle Kick feat.',0),(1154,34,1,2,'Grants the Cleave feat.',0),(1155,35,1,2,'18 second delay between evasion attempts.',0),(1156,36,1,2,'Grants the Dodge feat.',0),(1157,37,1,2,'Grants the Expertise feat.',0),(1163,39,1,3,'Grants the Improved Critical feat when equipped with a blade.',0),(1164,40,1,3,'Grants the Improved Critical feat when equipped with a finesse blade.',0),(1165,41,1,3,'Grants the Improved Critical feat when equipped with a baton weapon.',0),(1166,42,1,3,'Grants the Improved Critical feat when equipped with a heavy blade.',0),(1167,43,1,3,'Grants the Improved Critical feat when equipped with a saberstaff weapon.',0),(1168,44,1,3,'Grants the Improved Critical feat when equipped with a polearm.',0),(1169,45,1,3,'Grants the Improved Critical feat when equipped with twin vibroblades.',0),(1170,46,1,3,'Grants the Improved Critical feat when equipped with martial arts weapons.',0),(1171,47,1,3,'Grants the Improved Critical feat when equipped with bows.',0),(1172,48,1,3,'Grants the Improved Critical feat when equipped with crossbows.',0),(1173,49,1,3,'Grants the Improved Critical feat when equipped with throwing weapons.',0),(1174,50,1,2,'1d4 damage, knockdown lasts 6 seconds',0),(1175,50,2,2,'2d4 damage, knockdown lasts 6 seconds',0),(1176,50,3,3,'2d6 damage, knockdown lasts 6 seconds',0),(1177,50,4,4,'2d6 damage, knockdown lasts 9 seconds',0),(1178,50,5,4,'3d6 damage, knockdown lasts 9 seconds',0),(1179,50,6,5,'3d8 damage, knockdown lasts 9 seconds',0),(1180,51,1,4,'+4 Dodge AC',0),(1181,52,1,4,'You gain the Opportunist feat.',0),(1182,53,1,4,'You gain the Rapid Reload feat.',0),(1183,54,1,4,'You gain the Rapid Shot feat.',0),(1184,55,1,4,'You gain the Rapid Shot feat.',0),(1185,56,1,3,'You gain the Weapon Finesse feat.',0),(1186,57,1,3,'You gain the Zen Archery feat.',0),(1187,58,1,3,'You gain the Zen Archery feat.',0),(1188,59,1,3,'You gain the Weapon Focus feat which grants a +1 attack bonus when equipped with vibroblades.',0),(1189,59,2,4,'You gain the Weapon Specialization feat which grants a +2 damage when equipped with vibroblades.',0),(1190,60,1,3,'You gain the Weapon Focus feat which grants a +1 attack bonus when equipped with finesse vibroblades.',0),(1191,60,2,4,'You gain the Weapon Specialization feat which grants a +2 damage when equipped with finesse vibroblades.',0),(1192,61,1,3,'You gain the Weapon Focus feat which grants a +1 attack bonus when equipped with a baton weapon.',0),(1193,61,2,4,'You gain the Weapon Specialization feat which grants a +2 damage when equipped with a baton weapon.',0),(1194,62,1,3,'You gain the Weapon Focus feat which grants a +1 attack bonus when equipped with a heavy blade.',0),(1195,62,2,4,'You gain the Weapon Specialization feat which grants a +2 damage when equipped with a heavy blade.',0),(1196,63,1,3,'You gain the Weapon Focus feat which grants a +1 attack bonus when equipped with a saberstaff weapon.',0),(1197,63,2,4,'You gain the Weapon Specialization feat which grants a +2 damage when equipped with a saberstaff weapon.',0),(1198,64,1,3,'You gain the Weapon Focus feat which grants a +1 attack bonus when equipped with a polearm.',0),(1199,64,2,4,'You gain the Weapon Specialization feat which grants a +2 damage when equipped with a polearm.',0),(1200,65,1,3,'You gain the Weapon Focus feat which grants a +1 attack bonus when equipped with twin vibroblades.',0),(1201,65,2,4,'You gain the Weapon Specialization feat which grants a +2 damage when equipped with twin vibroblades.',0),(1202,66,1,3,'You gain the Weapon Focus feat which grants a +1 attack bonus when equipped with martial arts weapons or unarmed.',0),(1203,66,2,4,'You gain the Weapon Specialization feat which grants a +2 damage when equipped with martial arts weapons or unarmed.',0),(1204,67,1,3,'You gain the Weapon Focus feat which grants a +1 attack bonus when equipped with bows.',0),(1205,67,2,4,'You gain the Weapon Specialization feat which grants a +2 damage when equipped with bows.',0),(1206,68,1,3,'You gain the Weapon Focus feat which grants a +1 attack bonus when equipped with crossbows.',0),(1207,68,2,4,'You gain the Weapon Specialization feat which grants a +2 damage when equipped with crossbows.',0),(1208,69,1,3,'You gain the Weapon Focus feat which grants a +1 attack bonus when equipped with throwing weapons.',0),(1209,69,2,4,'You gain the Weapon Specialization feat which grants a +2 damage when equipped with throwing weapons.',0),(1251,79,1,2,'-10% Delay',0),(1252,79,2,2,'-20% Delay',0),(1253,79,3,2,'-30% Delay',0),(1254,79,4,2,'-40% Delay',0),(1255,79,5,2,'-50% Delay',0),(1256,79,6,2,'-60% Delay',0),(1257,80,1,2,'+10% Chance',0),(1258,80,2,2,'+20% Chance',0),(1259,80,3,2,'+30% Chance',0),(1260,80,4,2,'+40% Chance',0),(1261,80,5,2,'+50% Chance',0),(1262,80,6,2,'+60% Chance',0),(1263,81,1,2,'+12 seconds',0),(1264,81,2,2,'+18 seconds',0),(1265,81,3,2,'+24 seconds',0),(1266,81,4,2,'+30 seconds',0),(1267,81,5,3,'+48 seconds',0),(1268,81,6,3,'+60 seconds',0),(1269,82,1,2,'You can refine Veldite.',0),(1270,82,2,2,'You can refine Veldite and Scordspar.',0),(1271,82,3,2,'You can refine Veldite, Scordspar, and Plagionite.',0),(1272,82,4,2,'You can refine Veldite, Scordspar, Plagionite, and Keromber.',0),(1273,82,5,2,'You can refine Veldite, Scordspar, Plagionite, Keromber, and Jasioclase.',0),(1274,82,6,2,'You can refine Veldite, Scordspar, Plagionite, Keromber, Jasioclase, and Hemorgite.',0),(1275,82,7,2,'You can refine Veldite, Scordspar, Plagionite, Keromber, Jasioclase, Hemorgite, and Ochne.',0),(1276,82,8,2,'You can refine Veldite, Scordspar, Plagionite, Keromber, Jasioclase, Hemorgite, Ochne, and Croknor.',0),(1277,82,9,2,'You can refine Veldite, Scordspar, Plagionite, Keromber, Jasioclase, Hemorgite, Ochne, Croknor, and Arkoxit.',0),(1278,82,10,2,'You can refine Veldite, Scordspar, Plagionite, Keromber, Jasioclase, Hemorgite, Ochne, Croknor, Arkoxit, and Bisteiss.',0),(1289,84,1,2,'Tier 1 weaponsmith blueprints.',0),(1290,84,2,2,'Tier 1 weaponsmith blueprints. +1 enhancement slot',0),(1291,84,3,3,'Tier 2 weaponsmith blueprints. +1 enhancement slot',0),(1292,84,4,4,'Tier 2 weaponsmith blueprints. +2 enhancement slots',0),(1293,84,5,5,'Tier 3 weaponsmith blueprints. +2 enhancement slots',0),(1294,84,6,5,'Tier 3 weaponsmith blueprints. +3 enhancement slots',0),(1295,84,7,5,'Tier 4 weaponsmith blueprints. +3 enhancement slots',0),(1296,84,8,6,'Tier 4 weaponsmith blueprints. +4 enhancement slots',0),(1299,85,1,2,'10% chance to search one more time',0),(1300,85,2,2,'20% chance to search one more time',0),(1301,85,3,3,'30% chance to search one more time',0),(1302,85,4,3,'40% chance to search one more time',0),(1303,85,5,4,'50% chance to search one more time',0),(1304,85,6,4,'50% chance to search one more time. 10% chance to search a second time.',0),(1305,85,7,5,'50% chance to search one more time. 20% chance to search a second time.',0),(1306,85,8,5,'50% chance to search one more time. 30% chance to search a second time.',0),(1307,85,9,6,'50% chance to search one more time. 40% chance to search a second time.',0),(1308,85,10,7,'50% chance to search one more time. 50% chance to search a second time.',0),(1340,90,1,2,'-5% Chance',0),(1341,90,2,2,'-10% Chance',0),(1342,90,3,3,'-15% Chance',0),(1343,90,4,4,'-20% Chance',0),(1344,90,5,5,'-25% Chance',0),(1345,90,6,5,'-30% Chance',0),(1346,91,1,2,'-2% Chance',0),(1347,91,2,2,'-4% Chance',0),(1348,91,3,3,'-6% Chance',0),(1349,91,4,3,'-8% Chance',0),(1350,91,5,4,'-10% Chance',0),(1351,91,6,5,'-30% Chance',0),(1352,92,1,2,'+5% Speed',0),(1353,92,2,2,'+10% Speed',0),(1354,92,3,3,'+15% Speed',0),(1355,92,4,4,'+20% Speed',0),(1356,92,5,5,'+25% Speed',0),(1360,96,1,2,'Tier 1 engineering blueprints.',0),(1361,96,2,3,'Tier 1 engineering blueprints. +1 enhancement slot',0),(1362,96,3,4,'Tier 2 engineering blueprints. +1 enhancement slot',0),(1363,96,4,5,'Tier 2 engineering blueprints. +2 enhancement slots',0),(1364,96,5,6,'Tier 3 engineering blueprints. +2 enhancement slots',0),(1365,96,6,7,'Tier 3 engineering blueprints. +3 enhancement slots',0),(1366,96,7,8,'Tier 4 engineering blueprints. +3 enhancement slots',0),(1367,96,8,9,'Tier 4 engineering blueprints. +4 enhancement slots',0),(1380,98,1,2,'+10% Crafting Speed',0),(1381,98,2,2,'+20% Crafting Speed',0),(1382,98,3,3,'+30% Crafting Speed',0),(1383,98,4,3,'+40% Crafting Speed',0),(1384,98,5,3,'+50% Crafting Speed',0),(1385,98,6,4,'+60% Crafting Speed',0),(1386,98,7,4,'+70% Crafting Speed',0),(1387,98,8,4,'+80% Crafting Speed',0),(1388,98,9,5,'+90% Crafting Speed',0),(1389,98,10,6,'+99% Crafting Speed',0),(1390,99,1,2,'+10% Crafting Speed',0),(1391,99,2,2,'+20% Crafting Speed',0),(1392,99,3,3,'+30% Crafting Speed',0),(1393,99,4,3,'+40% Crafting Speed',0),(1394,99,5,3,'+50% Crafting Speed',0),(1395,99,6,4,'+60% Crafting Speed',0),(1396,99,7,4,'+70% Crafting Speed',0),(1397,99,8,4,'+80% Crafting Speed',0),(1398,99,9,5,'+90% Crafting Speed',0),(1399,99,10,6,'+99% Crafting Speed',0),(1400,100,1,2,'+10% Crafting Speed',0),(1401,100,2,2,'+20% Crafting Speed',0),(1402,100,3,3,'+30% Crafting Speed',0),(1403,100,4,3,'+40% Crafting Speed',0),(1404,100,5,3,'+50% Crafting Speed',0),(1405,100,6,4,'+60% Crafting Speed',0),(1406,100,7,4,'+70% Crafting Speed',0),(1407,100,8,4,'+80% Crafting Speed',0),(1408,100,9,5,'+90% Crafting Speed',0),(1409,100,10,6,'+99% Crafting Speed',0),(1410,101,1,2,'+10% Crafting Speed',0),(1411,101,2,2,'+20% Crafting Speed',0),(1412,101,3,3,'+30% Crafting Speed',0),(1413,101,4,3,'+40% Crafting Speed',0),(1414,101,5,3,'+50% Crafting Speed',0),(1415,101,6,4,'+60% Crafting Speed',0),(1416,101,7,4,'+70% Crafting Speed',0),(1417,101,8,4,'+80% Crafting Speed',0),(1418,101,9,5,'+90% Crafting Speed',0),(1419,101,10,6,'+99% Crafting Speed',0),(1420,102,1,2,'Unlocks tier 1 cooking recipes.',0),(1421,102,2,2,'Unlocks tier 2 cooking recipes.',0),(1422,102,3,3,'Unlocks tier 3 cooking recipes.',0),(1423,102,4,4,'Unlocks tier 4 cooking recipes.',0),(1424,102,5,5,'Unlocks tier 5 cooking recipes.',0),(1425,102,6,5,'Unlocks tier 6 cooking recipes.',0),(1426,102,7,5,'Unlocks tier 7 cooking recipes.',0),(1427,102,8,6,'Unlocks tier 8 cooking recipes.',0),(1430,103,1,2,'Restores 6 FP every 6 seconds. Recast time: 5 minutes',0),(1431,103,2,3,'Restores 6 FP every 6 seconds. Recast time: 4 minutes, 30 seconds',0),(1432,103,3,4,'Restores 6 FP every 6 seconds. Recast time: 4 minutes',0),(1433,103,4,5,'Restores 10 FP every 6 seconds. Recast time: 4 minutes',0),(1434,103,5,6,'Restores 10 FP every 6 seconds. Recast time: 3 minutes, 30 seconds',0),(1435,103,6,7,'Restores 10 FP every 6 seconds. Recast time: 3 minutes',0),(1436,103,7,8,'Restores 14 FP every 6 seconds. Recast time: 3 minutes',0),(1467,107,1,3,'Grants two-weapon fighting feat which reduces attack penalty from -6/-10 to -2/-6. Must be equipped with a Twin Blade.',0),(1468,107,2,4,'Grants Ambidexterity feat which reduces the attack penatly fo your off-hand weapon by 4. Must be equipped with a Twin Blade.',0),(1469,107,3,6,'Grants Improved two-weapon fighting which gives you a second off-hand attack at a penalty of -5 to your attack roll. Must be equipped with a Twin Blade.',0),(1482,104,1,3,'Grants the Provoke ability.',0),(1483,104,2,2,'Reduces cooldown by 5 seconds.',0),(1484,104,3,4,'Reduces cooldown by 10 seconds.',0),(1485,104,4,4,'Reduces cooldown by 15 seconds.',0),(1486,83,1,2,'Install mods up to level 5 on items up to level 10.',0),(1487,83,2,2,'Install mods up to level 10 on items up to level 20.',0),(1488,83,3,2,'Install mods up to level 15 on items up to level 30.',0),(1489,83,4,3,'Install mods up to level 20 on items up to level 40.',0),(1490,83,5,3,'Install mods up to level 25 on items up to level 50.',0),(1491,83,6,4,'Install mods up to level 30 on items up to level 60.',0),(1492,83,7,4,'Install mods up to level 35 on items up to level 70.',0),(1493,83,8,5,'Install mods up to level 40 on items up to level 80.',0),(1494,83,9,5,'Install mods up to level 45 on items up to level 90.',0),(1495,83,10,5,'Install mods up to level 50 on items up to level 100.',0),(1536,109,1,2,'Install mods up to level 5 on items up to level 10.',0),(1537,109,2,2,'Install mods up to level 10 on items up to level 20.',0),(1538,109,3,2,'Install mods up to level 15 on items up to level 30.',0),(1539,109,4,3,'Install mods up to level 20 on items up to level 40.',0),(1540,109,5,3,'Install mods up to level 25 on items up to level 50.',0),(1541,109,6,4,'Install mods up to level 30 on items up to level 60.',0),(1542,109,7,4,'Install mods up to level 35 on items up to level 70.',0),(1543,109,8,5,'Install mods up to level 40 on items up to level 80.',0),(1544,109,9,5,'Install mods up to level 45 on items up to level 90.',0),(1545,109,10,5,'Install mods up to level 50 on items up to level 100.',0),(1681,123,1,4,'Deals 2x damage from behind, 1.5x damage from any other direction.',0),(1682,123,4,6,'Deals 3x damage from behind, 2x damage from any other direction. Reduces cooldown by 1 minute.',0),(1683,123,2,4,'Deals 2x damage from behind, 1.5x damage from any other direction. Reduces cooldown by 30 seconds.',0),(1684,123,3,5,'Deals 2x damage from behind, 1.5x damage from any other direction. Reduces cooldown by 1 minute.',0),(1685,124,1,2,'Tier 1 armorsmith blueprints.',0),(1686,124,2,2,'Tier 1 armorsmith blueprints. +1 enhancement slot',0),(1687,124,3,3,'Tier 2 armorsmith blueprints. +1 enhancement slot',0),(1688,124,4,3,'Tier 2 armorsmith blueprints. +2 enhancement slots',0),(1689,124,5,4,'Tier 3 armorsmith blueprints. +2 enhancement slots',0),(1690,124,6,4,'Tier 3 armorsmith blueprints. +3 enhancement slots',0),(1691,124,7,5,'Tier 4 armorsmith blueprints. +3 enhancement slots',0),(1692,124,8,5,'Tier 4 armorsmith blueprints. +4 enhancement slots',0),(1704,127,1,2,'+2 to natural FP regen',0),(1705,127,2,3,'+3 to natural FP regen',0),(1706,127,3,4,'+4 to natural FP regen',0),(1707,127,4,5,'+5 to natural FP regen',0),(1708,127,5,6,'+6 to natural FP regen',0),(1709,128,1,2,'+2 to natural HP regen',0),(1710,128,2,3,'+3 to natural HP regen',0),(1711,128,3,4,'+4 to natural HP regen',0),(1712,128,4,5,'+5 to natural HP regen',0),(1713,128,5,6,'+6 to natural HP regen',0),(1714,87,1,3,'You gain the Weapon Focus feat which grants a +1 attack bonus when equipped with lightsabers.',0),(1715,87,2,4,'You gain the Weapon Specialization feat which grants a +2 damage when equipped with lightsabers.',0),(1716,105,1,3,'Grants the Improved Critical feat when equipped with a lightsaber.',0),(1737,1,1,2,'+10% Crafting Speed',0),(1738,1,2,2,'+20% Crafting Speed',0),(1739,1,3,3,'+30% Crafting Speed',0),(1740,1,4,3,'+40% Crafting Speed',0),(1741,1,5,3,'+50% Crafting Speed',0),(1742,1,6,4,'+60% Crafting Speed',0),(1743,1,7,4,'+70% Crafting Speed',0),(1744,1,8,4,'+80% Crafting Speed',0),(1745,1,9,5,'+90% Crafting Speed',0),(1746,1,10,6,'+99% Crafting Speed',0),(1747,2,1,2,'Tier 1 fabrication blueprints.',0),(1748,2,2,2,'Tier 1 fabrication blueprints. +1 enhancement slot',0),(1749,2,3,3,'Tier 2 fabrication blueprints. +1 enhancement slot',0),(1750,2,4,3,'Tier 2 fabrication blueprints. +2 enhancement slots',0),(1751,2,5,4,'Tier 3 fabrication blueprints. +2 enhancement slots',0),(1752,2,6,4,'Tier 3 fabrication blueprints. +3 enhancement slots',0),(1753,2,7,5,'Tier 4 fabrication blueprints. +3 enhancement slots',0),(1754,2,8,5,'Tier 4 fabrication blueprints. +4 enhancement slots',0),(1757,18,6,4,'+60% Speed',0),(1758,18,7,5,'+70% Speed',0),(1759,18,8,5,'+80% Speed',0),(1760,18,9,6,'+90% Speed',0),(1761,18,10,7,'+99% Speed',0),(1762,130,1,2,'+10% Speed',0),(1763,130,2,2,'+20% Speed',0),(1764,130,3,3,'+30% Speed',0),(1765,130,4,3,'+40% Speed',0),(1766,130,5,4,'+50% Speed',0),(1767,130,6,4,'+60% Speed',0),(1814,7,1,2,'Restores 6 HP every 6 seconds. Recast time: 5 minutes',0),(1815,7,2,3,'Restores 6 HP every 6 seconds. Recast time: 4 minutes, 30 seconds',0),(1816,7,3,4,'Restores 6 HP every 6 seconds. Recast time: 4 minutes',0),(1817,7,4,5,'Restores 10 HP every 6 seconds. Recast time: 4 minutes',0),(1818,7,5,6,'Restores 10 HP every 6 seconds. Recast time: 3 minutes, 30 seconds',0),(1819,7,6,7,'Restores 10 HP every 6 seconds. Recast time: 3 minutes',0),(1820,7,7,8,'Restores 14 HP every 6 seconds. Recast time: 3 minutes',0),(1821,8,1,2,'Length +25%',0),(1822,8,2,2,'+50% length',0),(1823,8,3,3,'+75% length',0),(1824,8,4,4,'+100% length',0),(1825,8,5,4,'+125% length',0),(1826,8,6,4,'+150% length',0),(1827,8,7,5,'+175% length',0),(1828,8,8,5,'+200% length',0),(1829,8,9,6,'+225% length',0),(1830,8,10,6,'+250% length',0),(1831,9,1,2,'Tier 1 medical blueprints.',0),(1832,9,2,2,'Tier 1 medical blueprints. +1 enhancement slot',0),(1833,9,3,3,'Tier 2 medical blueprints. +1 enhancement slot',0),(1834,9,4,4,'Tier 2 medical blueprints. +2 enhancement slots',0),(1835,9,5,5,'Tier 3 medical blueprints. +2 enhancement slots',0),(1836,9,6,5,'Tier 3 medical blueprints. +3 enhancement slots',0),(1837,9,7,5,'Tier 4 medical blueprints. +3 enhancement slots',0),(1838,9,8,6,'Tier 4 medical blueprints. +4 enhancement slots',0),(1841,10,1,2,'+10% Crafting Speed',0),(1842,10,2,2,'+20% Crafting Speed',0),(1843,10,3,3,'+30% Crafting Speed',0),(1844,10,4,3,'+40% Crafting Speed',0),(1845,10,5,3,'+50% Crafting Speed',0),(1846,10,6,4,'+60% Crafting Speed',0),(1847,10,7,4,'+70% Crafting Speed',0),(1848,10,8,4,'+80% Crafting Speed',0),(1849,10,9,5,'+90% Crafting Speed',0),(1850,10,10,6,'+99% Crafting Speed',0),(1860,131,1,2,'1d4 slashing damage. Breach lasts for 6 seconds.',0),(1861,131,2,2,'2d4 slashing damage. Breach lasts for 6 seconds',0),(1862,131,3,3,'2d4 slashing damage. Breach lasts for 9 seconds',0),(1863,131,4,3,'2d8 slashing damage. Breach lasts for 9 seconds',0),(1864,131,5,4,'2d8 slashing damage. Breach lasts for 12 seconds',0),(1865,131,6,4,'3d6 slashing damage. Breach lasts for 15 seconds',0),(1866,131,7,5,'3d8 slashing damage. Breach lasts for 15 seconds',0),(1867,131,8,5,'3d8 slashing damage. Breach lasts for 18 seconds',0),(1868,131,9,6,'4d8 slashing damage. Breach lasts for 18 seconds',0),(1869,131,10,6,'4d8 slashing damage. Breach lasts for 21 seconds',0),(1870,12,1,2,'-10% enmity',0),(1871,12,2,2,'-20% enmity',0),(1872,12,3,3,'-30% enmity',0),(1873,12,4,3,'-40% enmity',0),(1874,12,5,4,'-50% enmity',0),(1875,12,6,4,'-60% enmity',0),(1876,12,7,5,'-70% enmity',0),(1877,12,8,6,'-80% enmity',0),(1878,12,9,7,'-90% enmity',0),(1906,70,1,2,'5% increase',0),(1907,70,2,2,'10% increase',0),(1908,70,3,3,'15% increase',0),(1909,70,4,3,'20% increase',0),(1910,70,5,4,'25% increase',0),(1911,70,6,4,'30% increase',0),(1912,70,7,5,'35% increase',0),(1913,70,8,5,'40% increase',0),(1914,70,9,6,'45% increase',0),(1915,70,10,6,'50% increase',0),(1916,71,1,2,'1d12 HP restored',0),(1917,71,2,2,'2d8 HP restored',0),(1918,71,3,3,'3d8 HP restored',0),(1919,71,4,3,'4d8 HP restored',0),(1920,71,5,4,'5d8 HP restored',0),(1921,71,6,4,'6d8 HP restored',0),(1931,72,1,2,'1d4 damage, immobilization lasts 6 seconds',0),(1932,72,2,2,'1d8 damage, immobilization lasts 6 seconds',0),(1933,72,3,3,'2d8 damage, immobilization lasts 6 seconds',0),(1934,72,4,3,'2d8 damage, immobilization lasts 12 seconds',0),(1935,72,5,4,'3d8 damage, immobilization lasts 12 seconds',0),(1936,72,6,4,'4d8 damage, immobilization lasts 12 seconds',0),(1937,72,7,5,'5d8 damage, immobilization lasts 12 seconds',0),(1938,72,8,5,'5d8 damage, immobilization lasts 18 seconds',0),(1939,72,9,6,'6d8 damage, immobilization lasts 24 seconds',0),(1940,73,1,2,'10% chance, lasts 6 seconds',0),(1941,73,2,2,'20% chance, lasts 6 seconds',0),(1942,73,3,3,'30% chance, lasts 6 seconds',0),(1943,73,4,3,'40% chance, lasts 6 seconds',0),(1944,73,5,4,'50% chance, lasts 9 seconds',0),(1945,73,6,4,'60% chance, lasts 9 seconds',0),(1946,73,7,5,'70% chance, lasts 9 seconds',0),(1947,73,8,5,'80% chance, lasts 9 seconds',0),(1948,73,9,6,'90% chance, lasts 9 seconds',0),(1949,74,1,2,'Lasts 12 seconds',0),(1950,74,2,2,'Lasts 24 seconds',0),(1951,74,3,3,'Lasts 36 seconds',0),(1952,74,4,3,'Lasts 48 seconds',0),(1953,74,5,4,'Lasts 60 seconds',0),(1954,74,6,4,'Lasts 72 seconds',0),(1955,74,7,5,'Lasts 84 seconds',0),(1956,74,8,5,'Lasts 96 seconds',0),(1957,74,9,6,'Lasts 108 seconds',0),(1958,74,10,6,'Lasts 120 seconds',0),(1960,75,1,5,'Range: 5 meters',0),(1961,75,2,5,'Range: 10 meters',0),(1962,75,3,5,'Range: 15 meters',0),(1963,77,1,2,'1d4 damage, bleeding lasts 6 seconds',0),(1964,77,2,2,'1d8 damage, bleeding lasts 6 seconds',0),(1965,77,3,3,'2d8 damage, bleeding lasts 6 seconds',0),(1966,77,4,3,'2d8 damage, bleeding lasts 12 seconds',0),(1967,77,5,4,'3d8 damage, bleeding lasts 12 seconds',0),(1968,77,6,4,'4d8 damage, bleeding lasts 12 seconds',0),(1969,77,7,5,'5d8 damage, bleeding lasts 12 seconds',0),(1970,77,8,5,'5d8 damage, bleeding lasts 18 seconds',0),(1971,77,9,6,'6d8 damage, bleeding lasts 24 seconds',0),(1977,89,1,2,'+25% speed, lasts 1 minute',0),(1978,89,2,2,'+30% speed, lasts 1 minute',0),(1979,89,3,3,'+35% speed, lasts 1 minute',0),(1980,89,4,3,'+40% speed, lasts 1 minute',0),(1981,89,5,3,'+45% speed, lasts 1 minute',0),(1982,89,6,4,'+50% speed, lasts 1 minute',0),(1983,89,7,5,'+50% speed, lasts 2 minutes',0),(1984,93,1,2,'1d8 damage, shock lasts 3 seconds',0),(1985,93,2,2,'2d8 damage, shock lasts 3 seconds',0),(1986,93,3,3,'3d8 damage, shock lasts 3 seconds',0),(1987,93,4,3,'3d8 damage, shock lasts 6 seconds',0),(1988,93,5,4,'4d8 damage, shock lasts 6 seconds',0),(1989,93,6,4,'5d8 damage, shock lasts 6 seconds',0),(1990,93,7,5,'6d8 damage, shock lasts 6 seconds',0),(1991,93,8,5,'7d8 damage, shock lasts 6 seconds',0),(1992,93,9,5,'7d8 damage, shock lasts 9 seconds',0),(1993,93,10,5,'8d8 damage, shock lasts 9 seconds',0),(1994,94,1,2,'10% chance. Damage types: Fire',0),(1995,94,2,2,'10% chance. Damage types: Fire, Electric',0),(1996,94,3,3,'20% chance. Damage types: Fire, Electric',0),(1997,94,4,3,'20% chance. Damage types: Fire, Electric, Sonic',0),(1998,94,5,4,'30% chance. Damage types: Fire, Electric, Sonic',0),(1999,94,6,4,'30% chance. Damage types: Fire, Electric, Sonic, Acid',0),(2000,94,7,5,'40% chance. Damage types: Fire, Electric, Sonic, Acid',0),(2001,94,8,5,'40% chance. Damage types: Fire, Electric, Sonic, Acid, Cold',0),(2002,94,9,6,'50% chance. Damage types: Fire, Electric, Sonic, Acid, Cold',0),(2003,94,10,7,'50% chance. Damage types: Fire, Electric, Sonic, Acid, Cold, Divine',0),(2004,95,1,3,'Restores up to 10% of maximum HP',0),(2005,95,2,4,'Restores up to 20% of maximum HP',0),(2006,95,3,5,'Restores up to 30% of maximum HP',0),(2007,95,4,5,'Restores up to 40% of maximum HP',0),(2008,95,5,6,'Restores up to 50% of maximum HP',0),(2009,95,6,6,'Restores up to 60% of maximum HP',0),(2010,95,7,7,'Restores up to 70% of maximum HP. All party members within range also receive the healing.',0),(2011,95,8,7,'Restores up to 80% of maximum HP. All party members within range also receive the healing.',0),(2012,108,1,8,'Grants Balanced Stance Perk',0),(2013,132,1,8,'Grants Shield Oath Perk',0),(2014,133,1,8,'Grants the Precision Targeting Perk.',0),(2015,134,1,3,'Enables the use of tech 1 resuscitation devices.',0),(2016,134,2,3,'Can use tech 1 resuscitation devices. Resuscitation HP/FP recovery +1',0),(2017,134,3,3,'Can use tech 1 resuscitation devices. Resuscitation HP/FP recovery +2',0),(2018,134,4,3,'Can use tech 2 resuscitation devices. Resuscitation HP/FP recovery +2',0),(2019,134,5,4,'Can use tech 2 resuscitation devices. Resuscitation HP/FP recovery +3',0),(2020,134,6,4,'Can use tech 3 resuscitation devices. Resuscitation HP/FP recovery +3',0),(2021,134,7,5,'Can use tech 3 resuscitation devices. Resuscitation HP/FP recovery +4',0),(2022,134,8,5,'Can use tech 4 resuscitation devices. Resuscitation HP/FP recovery +4',0),(2023,134,9,6,'Can use tech 4 resuscitation devices. Resuscitation HP/FP recovery +5',0),(2024,135,1,2,'+1 meters',0),(2025,135,2,2,'+2 meters',0),(2026,135,3,3,'+3 meters',0),(2027,135,4,3,'+4 meters',0),(2028,135,5,3,'+5 meters',0),(2029,135,6,3,'+6 meters',0),(2030,135,7,4,'+7 meters',0),(2031,135,8,4,'+8 meters',0),(2032,135,9,4,'+9 meters',0),(2033,135,10,4,'+10 meters',0),(2034,136,1,2,'1x Force Pack Effectiveness',0),(2035,136,2,2,'2x Force Pack Effectiveness',0),(2036,136,3,3,'3x Force Pack Effectiveness',0),(2037,136,4,3,'4x Force Pack Effectiveness',0),(2062,149,1,3,'Gains +2 to weapon repair when using an weapon repair kit',0),(2063,149,2,3,'Gains +4 to weapon repair when using an weapon repair kit',0),(2064,149,3,3,'Gains +6 to weapon repair when using an weapon repair kit',0),(2065,149,4,3,'Gains +8 to weapon repair when using an weapon repair kit',0),(2066,150,1,3,'Gain +2 to armor repair when using an armor repair kit.',0),(2067,150,2,3,'Gains +4 to armor repair when using an armor repair kit',0),(2068,150,3,3,'Gains +6 to armor repair when using an armor repair kit',0),(2069,150,4,3,'Gains +8 to armor repair when using an armor repair kit',0),(2070,151,1,3,'Tier 1 lightsaber blueprints.',0),(2071,151,2,3,'Tier 1 lightsaber blueprints. +1 enhancement slot',0),(2072,151,3,4,'Tier 2 lightsaber blueprints. +1 enhancement slot',0),(2073,151,4,5,'Tier 2 lightsaber blueprints. +2 enhancement slots',0),(2074,151,5,6,'Tier 3 lightsaber blueprints. +2 enhancement slots',0),(2075,151,6,6,'Tier 3 lightsaber blueprints. +3 enhancement slots',0),(2076,151,7,6,'Tier 4 lightsaber blueprints. +3 enhancement slots',0),(2077,151,8,7,'Tier 4 lightsaber blueprints. +4 enhancement slots',0),(2078,151,9,7,'Tier 5 lightsaber blueprints. +4 enhancement slots',0),(2079,151,10,8,'Tier 5 lightsaber blueprints. +5 enhancement slots',0),(2080,152,1,3,'Gains +2 to electronic repair when using an electronic repair kit',0),(2081,152,2,3,'Gains +4 to electronic repair when using an electronic repair kit',0),(2082,152,3,3,'Gains +6 to electronic repair when using an electronic repair kit',0),(2083,152,4,3,'Gains +8 to electronic repair when using an electronic repair kit',0),(2084,153,1,3,'Grants two-weapon fighting feat which reduces attack penalty from -6/-10 to -2/-6. Must be equipped with a Saberstaff.',0),(2085,153,2,4,'Grants Ambidexterity feat which reduces the attack penatly fo your off-hand weapon by 4. Must be equipped with a Saberstaff.',0),(2086,153,3,6,'Grants Improved two-weapon fighting which gives you a second off-hand attack at a penalty of -5 to your attack roll. Must be equipped with a Saberstaff.',0),(2097,35,2,4,'12 second delay between evasion attempts.',0),(2098,35,3,5,'6 second delay between evasion attempts.',0),(2099,154,1,2,'18 second delay between deflection attempts.',0),(2100,154,2,4,'12 second delay between deflection attempts.',0),(2101,154,3,5,'6 second delay between deflection attempts.',0),(2102,155,1,3,'Grants Two-weapon Fighting feat which reduces attack penalty from -6/-10 to -4/-8 when fighting with two weapons. Must be equipped with a one-handed lightsaber.',0),(2103,155,2,4,'Grants Ambidexterity feat which reduces the attack penalty of your off-hand weapon by 4. Must be equipped with a one-handed lightsaber.',0),(2104,155,3,6,'Grants Improved two-weapon fighting which gives you a second off-hand attack at a penalty of -5 to your attack roll. Must be equipped with a one-handed lightsaber.',0),(2105,156,1,2,'Install mods up to level 5 on items up to level 10.',0),(2106,156,2,2,'Install mods up to level 10 on items up to level 20.',0),(2107,156,3,2,'Install mods up to level 15 on items up to level 30.',0),(2108,156,4,3,'Install mods up to level 20 on items up to level 40.',0),(2109,156,5,3,'Install mods up to level 25 on items up to level 50.',0),(2110,156,6,4,'Install mods up to level 30 on items up to level 60.',0),(2111,156,7,4,'Install mods up to level 35 on items up to level 70.',0),(2112,156,8,5,'Install mods up to level 40 on items up to level 80.',0),(2113,156,9,5,'Install mods up to level 45 on items up to level 90.',0),(2114,156,10,5,'Install mods up to level 50 on items up to level 100.',0),(2145,160,1,3,'You gain the Weapon Finesse feat.',0),(2146,161,1,2,'Increases movement speed by 10%.',0),(2147,161,2,2,'Increases movement speed by 20%.',0),(2148,161,3,3,'Increases movement speed by 30%.',0),(2149,161,4,3,'Increases movement speed by 40%.',0),(2150,161,5,4,'Increases movement speed by 50%.',0),(2151,162,1,2,'Increases piloting by 3 when evading.',0),(2152,162,2,2,'Increases piloting by 6 when evading.',0),(2153,162,3,3,'Increases piloting by 9 when evading.',0),(2154,162,4,3,'Increases piloting by 12 when evading.',0),(2155,162,5,4,'Increases piloting by 15 when evading.',0),(2156,163,1,2,'Increases relative chance of hostile encounters by 1 each.',0),(2157,163,2,2,'Increases relative chance of hostile encounters by 2 each.',0),(2158,163,3,3,'Increases relative chance of hostile encounters by 3 each.',0),(2159,163,4,3,'Increases relative chance of hostile encounters by 4 each.',0),(2160,163,5,4,'Increases relative chance of hostile encounters by 5 each.',0),(2161,164,1,2,'Decreases relative chance of hostile encounters by 1 each.',0),(2162,164,2,2,'Decreases relative chance of hostile encounters by 2 each.',0),(2163,164,3,3,'Decreases relative chance of hostile encounters by 3 each.',0),(2164,164,4,3,'Decreases relative chance of hostile encounters by 4 each.',0),(2165,164,5,4,'Decreases relative chance of hostile encounters by 5 each.',0),(2166,165,1,2,'Increases relative chance of salvage encounters by 1 each.',0),(2167,165,2,2,'Increases relative chance of salvage encounters by 2 each.',0),(2168,165,3,3,'Increases relative chance of salvage encounters by 3 each.',0),(2169,165,4,3,'Increases relative chance of salvage encounters by 4 each.',0),(2170,165,5,4,'Increases relative chance of salvage encounters by 5 each.',0),(2171,166,1,2,'Increases range of the ship by 1.',0),(2172,166,2,2,'Increases range of the ship by 2.',0),(2173,166,3,3,'Increases range of the ship by 3.',0),(2174,166,4,3,'Increases range of the ship by 4.',0),(2175,166,5,4,'Increases range of the ship by 5.',0),(2176,167,1,2,'Increases piloting by 3 when crewing ship guns.',0),(2177,167,2,2,'Increases piloting by 6 when crewing ship guns.',0),(2178,167,3,3,'Increases piloting by 9 when crewing ship guns.',0),(2179,167,4,3,'Increases piloting by 12 when crewing ship guns.',0),(2180,167,5,4,'Increases piloting by 15 when crewing ship guns.',0),(2181,168,1,3,'Reduces Stronidium usage by 1 (min 1).',0),(2182,168,2,4,'Reduces Stronidium usage by 2 (min 1).',0),(2183,168,3,5,'Reduces Stronidium usage by 3 (min 1).',0),(2184,168,4,6,'Reduces Stronidium usage by 4 (min 1).',0),(2185,168,5,7,'Reduces Stronidium usage by 5 (min 1).',0),(2186,169,1,5,'Allows repairing ships in space.',0),(2187,169,2,2,'Halves the time needed to repair ships.',0),(2188,170,1,4,'Grants a re-roll on failure to take off, land, or jump through hyperspace.',0),(2189,14,1,2,'Stronidium yield increased by 100% of normal.',0),(2190,14,2,2,'Stronidium yield increased by 200% of normal.',0),(2191,14,3,2,'Stronidium yield increased by 300% of normal.',0),(2192,14,4,2,'Stronidium yield increased by 400% of normal.',0),(2193,14,5,2,'Stronidium yield increased by 500% of normal.',0),(2194,14,6,2,'Stronidium yield increased by 600% of normal.',0),(2195,14,7,2,'Stronidium yield increased by 700% of normal.',0),(2196,14,8,2,'Stronidium yield increased by 800% of normal.',0),(2197,14,9,2,'Stronidium yield increased by 900% of normal.',0),(2198,14,10,2,'Stronidium yield increased by 1000% of normal.',0),(2199,6,1,2,'+10% Speed',0),(2200,6,2,2,'+10% Speed',0),(2201,6,3,3,'+30% Speed',0),(2202,6,4,3,'+40% Speed',0),(2203,6,5,4,'+50% Speed',0),(2204,6,6,4,'+60% Speed',0),(2205,6,7,5,'+70% Speed',0),(2206,6,8,5,'+80% Speed',0),(2207,6,9,6,'+90% Speed',0),(2208,6,10,7,'+99% Speed',0),(2209,171,1,2,'+10 to property transfer',0),(2210,171,2,2,'+20 to property transfer',0),(2211,171,3,3,'+30 to property transfer',0),(2212,171,4,3,'+40 to property transfer',0),(2213,171,5,4,'+50 to property transfer',0),(2214,171,6,4,'+60 to property transfer',0),(2215,171,7,5,'+70 to property transfer',0),(2216,171,8,5,'+80 to property transfer',0),(2217,171,9,6,'+90 to property transfer',0),(2218,171,10,7,'+100 to property transfer',0),(2219,181,1,4,'Steals 5 HP from a single target every second.',2),(2220,181,2,4,'Steals 6 HP from a single target every second.',2),(2221,181,3,5,'Steals 7 HP from a single target every second.',2),(2222,181,4,5,'Steals 8 HP from a single target every second.',2),(2223,181,5,6,'Steals 10 HP from a single target every second.',2),(2224,182,1,4,'Damages a single target for 10 HP every three seconds.',2),(2225,182,2,4,'Damages a single target for 12 HP every three seconds.',2),(2226,182,3,5,'Damages a single target for 14 HP every three seconds.',2),(2227,182,4,5,'Damages a single target for 16 HP every three seconds.',2),(2228,182,5,6,'Damages a single target for 20 HP every three seconds.',2),(2229,183,1,2,'Knockdown a small target. If resisted, target is slowed for 6 seconds.',0),(2230,183,2,3,'Knockdown a medium or smaller target. If resisted, target is slowed for 6 seconds.',0),(2231,183,3,4,'Knockdown a large or smaller target. If resisted, target is slowed for 6 seconds.',3),(2232,183,4,5,'Knockdown any size target. If resisted, target is slowed for 6 seconds.',3),(2233,184,1,4,'Deals 100 damage to a single target.',2),(2234,184,2,5,'Deals 125 damage to a single target.',2),(2235,184,3,6,'Deals 160 damage to a single target.',2),(2236,184,4,7,'Deals 200 damage to a single target.',2),(2237,184,5,8,'Deals 250 damage to a single target.',2),(2238,185,1,2,'Heals a single target for 2 HP every three seconds.',0),(2239,185,2,2,'Heals a single target for 3 HP every three seconds.',0),(2240,185,3,3,'Heals a single target for 5 HP every three seconds.',0),(2241,185,4,3,'Heals a single target for 7 HP every three seconds.',2),(2242,185,5,4,'Heals a single target for 10 HP every three seconds.',2),(2243,3,1,2,'Increases movement speed by 10% and Dexterity by 2.',0),(2244,3,2,2,'Increases movement speed by 20% and Dexterity by 4.',0),(2245,3,3,3,'Increases movement speed by 30%, Dexterity by 6 and grants an extra attack.',0),(2246,3,4,3,'Increases movement speed by 40%, Dexterity by 8 and grants an extra attack.',1),(2247,3,5,12,'Increases movement speed by 50%, Dexterity by 10 and grants an extra attack.',1),(2248,4,1,2,'Grants 10% immunity to all damage while the caster retains concentration.',0),(2249,4,2,2,'Grants 20% immunity to all damage while the caster retains concentration.',0),(2250,4,3,3,'Grants 30% immunity to all damage while the caster retains concentration.',0),(2251,4,4,3,'Grants 40% immunity to all damage while the caster retains concentration.',2),(2252,4,5,4,'Grants 50% immunity to all damage while the caster retains concentration.',2),(2253,5,1,3,'Converts 10% of the casters current HP into FP.',0),(2254,5,2,4,'Converts 20% of the casters current HP into FP.',0),(2255,5,3,5,'Converts 35% of the casters current HP into FP.',0),(2256,5,4,6,'Converts 50% of the casters current HP into FP.',0),(2257,13,1,4,'Immune to Tranquilisation effects while concentrating.',0),(2258,13,2,6,'Immune to Tranquilisation, Confusion and Persuade effects while concentrating.',0),(2259,13,3,8,'Immune to Tranquilisation, Confusion, Persuade and Drain effects while concentrating.',1),(2260,19,1,2,'Increases Strength and Dexterity by 2 while concentrating but reduces AC by 2 and deals 2 damage per round.',0),(2261,19,2,2,'Increases Strength and Dexterity by 4 while concentrating but reduces AC by 2 and deals 4 damage per round.',0),(2262,19,3,5,'Increases Strength and Dexterity by 6 while concentrating and grants an extra attack but reduces AC by 4 and deals 6 damage per round.',0),(2263,19,4,5,'Increases Strength and Dexterity by 8 while concentrating and grants an extra attack but reduces AC by 4 and deals 8 damage per round.',1),(2264,19,5,8,'Increases Strength and Dexterity by 10 while concentrating and grants two extra attacks but reduces AC by 2 and deals 10 damage per round.',1),(2265,76,1,7,'Applies Domination effect to a single humanoid target with lower WIS than the caster, while the caster concentrates.',0),(2266,76,2,7,'Applies Domination effect to all hostile humanoid targets within 5m with lower WIS than the caster, while the caster concentrates.',2),(2267,78,1,7,'Applies Confusion effect to a single non-mechanical target with lower WIS than the caster, while the caster concentrates.',0),(2268,78,2,7,'Applies Confusion effect to all hostile non-mechanical targets within 10m with lower WIS than the caster, while the caster concentrates.',2),(2269,126,1,4,'Single target is Tranquilised while the caster concentrates or, if resisted, gets -5 to AB and AC.',0),(2270,126,2,7,'Target and nearest other enemy within 10m is Tranquilised while the caster concentrates or, if resisted, get -5 to AB and AC.',2),(2271,126,3,10,'Target and all other enemies within 10 are Tranquilised while the caster concentrates or, if resisted, get -5 to AB and AC.',2),(2272,173,1,0,'Unlocks Sith Alchemy.',2),(2273,173,2,7,'When used on a corpse, raises the creature as a henchman while the caster concentrates.',2),(2274,173,3,7,'Alchemist can create monsters.',2),(2275,173,4,0,'Alchemist can employ monsters as henchmen while they concentrate.',2),(2276,174,1,2,'Throw your equipped lightsaber up to 15m for (saber damage + INT modifier) * 100%.  This ability hits automatically.',0),(2277,174,2,2,'Throw your equipped lightsaber up to 15m for (saber damage + INT modifier) * 125%.  This ability hits automatically.',0),(2278,174,3,2,'Throw your equipped lightsaber up to 15m for (saber damage + INT modifier) * 160%.  This ability hits automatically.',0),(2279,174,4,2,'Throw your equipped lightsaber up to 15m for (saber damage + INT modifier) * 200%.  This ability hits automatically and will chain to a second target within 5m of the first.',1),(2280,174,5,2,'Throw your equipped lightsaber up to 15m for (saber damage + INT modifier) * 250%.  This ability hits automatically and will chain to a second and third target within 5m each.',1),(2281,175,1,4,'The next time the caster would die in the next 30 minutes, they are instead healed to 25% of their max HP.',0),(2282,175,2,7,'The next time the caster would die in the next 30 minutes, they are instead healed to 50% of their max HP.',0),(2283,175,3,10,'For 12s after casting, the caster is immune to all damage, and the next time the caster would die in the next 30 minutes, they are instead healed to 25% of their max HP.',3),(2284,176,1,3,'The caster counts has having 5 extra ranks in all languages for the purpose of understanding others speaking, so long as they concentrate.',0),(2285,176,2,4,'The caster counts has having 10 extra ranks in all languages for the purpose of understanding others speaking, so long as they concentrate.',0),(2286,176,3,5,'The caster counts has having 15 extra ranks in all languages for the purpose of understanding others speaking, so long as they concentrate.',3),(2287,176,4,6,'The caster counts has having 20 extra ranks in all languages for the purpose of understanding others speaking, so long as they concentrate.',3),(2288,177,1,2,'The caster gets improved detection of hidden creatures while they concentrate.  ((Will do something when the stealth system is introduced)).',0),(2289,177,2,2,'The caster gets improved detection of hidden creatures while they concentrate.  ((Will do something when the stealth system is introduced)).',0),(2290,177,3,3,'The caster gets improved detection of hidden creatures while they concentrate.  ((Will do something when the stealth system is introduced)).',3),(2291,177,4,3,'The caster gets improved detection of hidden creatures while they concentrate.  ((Will do something when the stealth system is introduced)).',3),(2292,177,5,4,'The caster gets improved detection of hidden creatures while they concentrate.  ((Will do something when the stealth system is introduced)).',3),(2293,178,1,10,'The caster attempts to view what another character is currently doing.',0),(2294,179,1,4,'The caster gets -5 AB & AC but their nearby party members get +5 AB & AC',0),(2295,179,2,6,'The caster gets -10 AB & AC but their nearby party members get +10 AB & AC',0),(2296,179,3,8,'The caster and nearby enemies get -10 AB & AC but the nearby party members get +10 AB & AC',0),(2297,180,1,2,'The caster befriends an animal or beast with up to Challenge Rating 4.',0),(2298,180,2,2,'The caster befriends an animal or beast with up to Challenge Rating 8.',0),(2299,180,3,3,'The caster befriends an animal or beast with up to Challenge Rating 12.',0),(2300,180,4,3,'The caster befriends an animal or beast with up to Challenge Rating 16.',3),(2301,180,5,4,'The caster befriends an animal or beast with up to Challenge Rating 20.',3),(2302,180,6,5,'The caster befriends an animal or beast with any Challenge Rating.',3),(2303,172,1,3,'2% damage reduction',0),(2304,172,2,3,'4% damage reduction',0),(2305,172,3,3,'6% damage reduction',0),(2306,172,4,3,'8% damage reduction',0),(2307,172,5,3,'10% damage reduction',0),(2308,38,1,6,'Doubles GP gain.',0),(2309,38,2,6,'Triples GP gain.',0),(2310,38,3,6,'Quadruples GP gain.',0),(2311,113,1,4,'25% chance to interrupt',0),(2312,113,2,4,'50% chance to interrupt',0),(2313,113,3,5,'75% chance to interrupt',0),(2314,113,4,6,'100% chance to interrupt',0),(2315,86,1,3,'Caster gets +3 AB.',0),(2316,86,2,4,'Caster gets +5 AB and +2 AC.',0),(2317,86,3,5,'Caster gets +5 AB and +4 AC.',0),(2318,11,1,3,'Grants the Weapon Finesse feat when equipped with a martial arts weapon or unarmed.',0);
/*!40000 ALTER TABLE `PerkLevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PerkLevelQuestRequirement`
--

DROP TABLE IF EXISTS `PerkLevelQuestRequirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PerkLevelQuestRequirement` (
  `ID` int NOT NULL,
  `PerkLevelID` int NOT NULL,
  `RequiredQuestID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_PerkLevelQuestRequirement_PerkLevelID` (`PerkLevelID`),
  CONSTRAINT `FK_PerkLevelQuestRequirement_PerkLevelID` FOREIGN KEY (`PerkLevelID`) REFERENCES `PerkLevel` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PerkLevelQuestRequirement`
--

LOCK TABLES `PerkLevelQuestRequirement` WRITE;
/*!40000 ALTER TABLE `PerkLevelQuestRequirement` DISABLE KEYS */;
INSERT INTO `PerkLevelQuestRequirement` VALUES (2,2070,30),(3,2071,30),(4,2072,30),(5,2073,30),(6,2074,30),(7,2075,30),(8,2076,30),(9,2077,30),(10,2078,30),(11,2079,30),(12,2272,99);
/*!40000 ALTER TABLE `PerkLevelQuestRequirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PerkLevelSkillRequirement`
--

DROP TABLE IF EXISTS `PerkLevelSkillRequirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PerkLevelSkillRequirement` (
  `ID` int NOT NULL,
  `PerkLevelID` int NOT NULL,
  `SkillID` int NOT NULL,
  `RequiredRank` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `FK_PerkLevelkillRequirements_PerkLevelID` (`PerkLevelID`),
  KEY `FK_PerkLevelkillRequirements_SkillID` (`SkillID`),
  CONSTRAINT `FK_PerkLevelkillRequirements_PerkLevelID` FOREIGN KEY (`PerkLevelID`) REFERENCES `PerkLevel` (`ID`),
  CONSTRAINT `FK_PerkLevelkillRequirements_SkillID` FOREIGN KEY (`SkillID`) REFERENCES `Skill` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PerkLevelSkillRequirement`
--

LOCK TABLES `PerkLevelSkillRequirement` WRITE;
/*!40000 ALTER TABLE `PerkLevelSkillRequirement` DISABLE KEYS */;
INSERT INTO `PerkLevelSkillRequirement` VALUES (73,99,10,10),(74,100,10,20),(75,101,10,30),(76,102,10,40),(77,103,10,50),(83,109,17,5),(84,110,17,10),(85,111,17,15),(86,112,17,20),(87,113,17,25),(88,114,17,30),(89,115,17,10),(90,116,17,20),(91,117,17,30),(92,118,17,40),(93,119,17,50),(94,120,17,5),(95,121,17,10),(96,122,17,15),(97,123,17,20),(98,124,17,5),(99,125,17,10),(100,126,17,15),(101,127,17,20),(102,128,17,25),(103,129,9,5),(104,130,9,10),(105,131,9,15),(106,132,9,20),(107,133,9,25),(108,134,9,5),(109,135,9,10),(110,136,9,15),(111,137,9,20),(112,138,9,25),(113,139,7,10),(114,140,7,15),(115,141,7,30),(116,142,7,40),(117,143,7,50),(118,144,8,10),(119,145,8,15),(120,146,8,30),(121,147,8,40),(122,148,8,50),(1118,1144,5,2),(1119,1145,1,10),(1120,1146,1,15),(1121,1147,1,25),(1122,1148,1,2),(1123,1149,1,15),(1124,1150,1,2),(1125,1151,1,15),(1126,1152,1,5),(1127,1153,4,15),(1128,1154,2,5),(1129,1155,4,10),(1130,1156,7,15),(1131,1157,8,15),(1137,1163,1,10),(1138,1164,1,10),(1139,1165,1,10),(1140,1166,2,10),(1141,1167,14,10),(1142,1168,2,10),(1143,1169,3,10),(1144,1170,4,10),(1145,1171,5,10),(1146,1172,5,10),(1147,1173,6,10),(1148,1174,1,5),(1149,1175,1,10),(1150,1176,1,15),(1151,1177,1,20),(1152,1178,1,30),(1153,1179,1,50),(1154,1180,7,15),(1155,1181,1,10),(1156,1182,5,5),(1157,1183,5,10),(1158,1184,6,10),(1159,1185,1,5),(1160,1186,5,10),(1161,1187,6,10),(1162,1188,1,5),(1163,1189,1,15),(1164,1190,1,5),(1165,1191,1,15),(1166,1192,1,5),(1167,1193,1,15),(1168,1194,2,5),(1169,1195,2,15),(1170,1196,14,5),(1171,1197,14,15),(1172,1198,2,5),(1173,1199,2,15),(1174,1200,3,5),(1175,1201,3,15),(1176,1202,4,5),(1177,1203,4,15),(1178,1204,5,5),(1179,1205,5,15),(1180,1206,5,5),(1181,1207,5,15),(1182,1208,6,5),(1183,1209,6,15),(1226,1251,10,5),(1227,1252,10,10),(1228,1253,10,15),(1229,1254,10,20),(1230,1255,10,35),(1231,1256,10,40),(1232,1257,22,5),(1233,1258,22,10),(1234,1259,22,15),(1235,1260,22,20),(1236,1261,22,35),(1237,1262,22,40),(1238,1263,10,5),(1239,1264,10,10),(1240,1265,10,15),(1241,1266,10,20),(1242,1267,10,35),(1243,1268,10,40),(1245,1270,10,5),(1246,1271,10,10),(1247,1272,10,15),(1248,1273,10,20),(1249,1274,10,25),(1250,1275,10,30),(1251,1276,10,35),(1252,1277,10,40),(1253,1278,10,45),(1265,1290,12,5),(1266,1291,12,10),(1267,1292,12,15),(1268,1293,12,20),(1269,1294,12,25),(1270,1295,12,30),(1271,1296,12,35),(1274,1299,24,5),(1275,1300,24,10),(1276,1301,24,15),(1277,1302,24,20),(1278,1303,24,25),(1279,1304,24,30),(1280,1305,24,35),(1281,1306,24,40),(1282,1307,24,45),(1283,1308,24,50),(1315,1340,24,5),(1316,1341,24,10),(1317,1342,24,15),(1318,1343,24,20),(1319,1344,24,25),(1320,1345,24,30),(1321,1346,23,2),(1322,1347,23,6),(1323,1348,23,9),(1324,1349,23,12),(1325,1350,23,15),(1326,1351,23,30),(1327,1352,23,5),(1328,1353,23,10),(1329,1354,23,15),(1330,1355,23,20),(1331,1356,23,25),(1336,1361,22,5),(1337,1362,22,10),(1338,1363,22,15),(1339,1364,22,20),(1340,1365,22,25),(1341,1366,22,30),(1342,1367,22,35),(1356,1381,12,5),(1357,1382,12,10),(1358,1383,12,15),(1359,1384,12,20),(1360,1385,12,25),(1361,1386,12,30),(1362,1387,12,35),(1363,1388,12,40),(1364,1389,12,50),(1366,1391,13,5),(1367,1392,13,10),(1368,1393,13,15),(1369,1394,13,20),(1370,1395,13,25),(1371,1396,13,30),(1372,1397,13,35),(1373,1398,13,40),(1374,1399,13,50),(1376,1401,16,5),(1377,1402,16,10),(1378,1403,16,15),(1379,1404,16,20),(1380,1405,16,25),(1381,1406,16,30),(1382,1407,16,35),(1383,1408,16,40),(1384,1409,16,50),(1386,1411,22,5),(1387,1412,22,10),(1388,1413,22,15),(1389,1414,22,20),(1390,1415,22,25),(1391,1416,22,30),(1392,1417,22,35),(1393,1418,22,40),(1394,1419,22,50),(1396,1421,16,10),(1397,1422,16,20),(1398,1423,16,30),(1399,1424,16,40),(1400,1425,16,50),(1401,1426,16,60),(1402,1427,16,70),(1435,1467,3,1),(1436,1468,3,8),(1437,1469,3,15),(1450,1482,8,2),(1451,1483,8,10),(1452,1484,8,20),(1453,1485,8,30),(1454,1486,12,5),(1455,1487,12,10),(1456,1488,12,15),(1457,1489,12,20),(1458,1490,12,25),(1459,1491,12,30),(1460,1492,12,35),(1461,1493,12,40),(1462,1494,12,45),(1463,1495,12,50),(1504,1536,13,5),(1505,1537,13,10),(1506,1538,13,15),(1507,1539,13,20),(1508,1540,13,25),(1509,1541,13,30),(1510,1542,13,35),(1511,1543,13,40),(1512,1544,13,45),(1513,1545,13,50),(1649,1681,1,10),(1650,1682,1,40),(1651,1683,1,20),(1652,1684,1,30),(1653,1685,13,0),(1654,1686,13,5),(1655,1687,13,10),(1656,1688,13,15),(1657,1689,13,20),(1658,1690,13,25),(1659,1691,13,30),(1660,1692,13,35),(1672,1704,11,5),(1673,1705,11,15),(1674,1706,11,25),(1675,1707,11,40),(1676,1708,11,60),(1677,1709,8,5),(1678,1710,8,15),(1679,1711,8,25),(1680,1712,8,40),(1681,1713,8,60),(1682,1714,14,5),(1683,1715,14,15),(1684,1716,14,10),(1695,1738,15,5),(1696,1739,15,10),(1697,1740,15,15),(1698,1741,15,20),(1699,1742,15,25),(1700,1743,15,30),(1701,1744,15,35),(1702,1745,15,40),(1703,1746,15,50),(1704,1747,15,0),(1705,1748,15,5),(1706,1749,15,10),(1707,1750,15,15),(1708,1751,15,20),(1709,1752,15,25),(1710,1753,15,30),(1711,1754,15,35),(1714,1757,10,60),(1715,1758,10,70),(1716,1759,10,80),(1717,1760,10,90),(1718,1761,10,100),(1719,1762,10,5),(1720,1763,10,15),(1721,1764,10,25),(1722,1765,10,35),(1723,1766,10,45),(1724,1767,10,55),(1768,1821,17,5),(1769,1822,17,10),(1770,1823,17,15),(1771,1824,17,20),(1772,1825,17,25),(1773,1826,17,30),(1774,1827,17,35),(1775,1828,17,40),(1776,1829,17,45),(1777,1830,17,50),(1778,1832,17,5),(1779,1833,17,10),(1780,1834,17,15),(1781,1835,17,20),(1782,1836,17,25),(1783,1837,17,30),(1784,1838,17,35),(1787,1841,17,5),(1788,1842,17,10),(1789,1843,17,15),(1790,1844,17,20),(1791,1845,17,25),(1792,1846,17,30),(1793,1847,17,35),(1794,1848,17,40),(1795,1849,17,45),(1796,1850,17,50),(1806,1860,3,5),(1807,1861,3,10),(1808,1862,3,15),(1809,1863,3,20),(1810,1864,3,25),(1811,1865,3,30),(1812,1866,3,35),(1813,1867,3,40),(1814,1868,3,45),(1815,1869,3,50),(1816,1870,7,10),(1817,1871,7,20),(1818,1872,7,30),(1819,1873,7,40),(1820,1874,7,50),(1821,1875,7,60),(1822,1876,7,70),(1823,1877,7,80),(1824,1878,7,90),(1852,1906,8,10),(1853,1907,8,20),(1854,1908,8,30),(1855,1909,8,40),(1856,1910,8,50),(1857,1911,8,60),(1858,1912,8,70),(1859,1913,8,80),(1860,1914,8,90),(1861,1915,8,100),(1862,1916,5,10),(1863,1917,5,20),(1864,1918,5,30),(1865,1919,5,40),(1866,1920,5,50),(1867,1921,5,60),(1877,1931,5,10),(1878,1932,5,20),(1879,1933,5,30),(1880,1934,5,40),(1881,1935,5,50),(1882,1936,5,60),(1883,1937,5,70),(1884,1938,5,80),(1885,1939,5,90),(1886,1940,6,10),(1887,1941,6,20),(1888,1942,6,30),(1889,1943,6,40),(1890,1944,6,50),(1891,1945,6,60),(1892,1946,6,70),(1893,1947,6,80),(1894,1948,6,90),(1895,1949,5,5),(1896,1950,5,10),(1897,1951,5,15),(1898,1952,5,20),(1899,1953,5,25),(1900,1954,5,30),(1901,1955,5,35),(1902,1956,5,40),(1903,1957,5,45),(1904,1958,5,50),(1906,1960,5,25),(1907,1961,5,30),(1908,1962,5,35),(1909,1963,6,10),(1910,1964,6,20),(1911,1965,6,30),(1912,1966,6,40),(1913,1967,6,50),(1914,1968,6,60),(1915,1969,6,70),(1916,1970,6,80),(1917,1971,6,90),(1923,1984,4,10),(1924,1985,4,20),(1925,1986,4,30),(1926,1987,4,40),(1927,1988,4,50),(1928,1989,4,60),(1929,1990,4,70),(1930,1991,4,80),(1931,1992,4,90),(1932,1993,4,100),(1933,1994,5,10),(1934,1995,5,20),(1935,1996,5,30),(1936,1997,5,40),(1937,1998,5,50),(1938,1999,5,60),(1939,2000,5,70),(1940,2001,5,80),(1941,2002,5,90),(1942,2003,5,100),(1943,2004,4,5),(1944,2005,4,15),(1945,2006,4,30),(1946,2007,4,45),(1947,2008,4,60),(1948,2009,4,75),(1949,2010,4,90),(1950,2011,4,100),(1951,2015,17,5),(1952,2016,17,10),(1953,2017,17,15),(1954,2018,17,20),(1955,2019,17,25),(1956,2020,17,30),(1957,2021,17,35),(1958,2022,17,40),(1959,2023,17,45),(1960,2024,17,5),(1961,2025,17,10),(1962,2026,17,15),(1963,2027,17,20),(1964,2028,17,25),(1965,2029,17,30),(1966,2030,17,35),(1967,2031,17,40),(1968,2032,17,45),(1969,2033,17,50),(1970,2034,17,5),(1971,2035,17,10),(1972,2036,17,15),(1973,2037,17,20),(1998,2062,12,10),(1999,2063,12,20),(2000,2064,12,30),(2001,2065,12,40),(2002,2066,13,10),(2003,2067,13,20),(2004,2068,13,30),(2005,2069,13,40),(2006,2071,14,5),(2007,2072,14,10),(2008,2073,14,15),(2009,2074,14,20),(2010,2075,14,25),(2011,2076,14,30),(2012,2077,14,35),(2013,2078,14,40),(2014,2079,14,45),(2015,2080,22,10),(2016,2081,22,20),(2017,2082,22,30),(2018,2083,22,40),(2019,2084,14,1),(2020,2085,14,8),(2021,2086,14,15),(2032,2097,4,25),(2033,2098,4,50),(2034,2099,14,10),(2035,2100,14,25),(2036,2101,14,50),(2037,2102,14,10),(2038,2103,14,15),(2039,2104,14,25),(2040,2105,22,5),(2041,2106,22,10),(2042,2107,22,15),(2043,2108,22,20),(2044,2109,22,25),(2045,2110,22,30),(2046,2111,22,35),(2047,2112,22,40),(2048,2113,22,45),(2049,2114,22,50),(2080,2145,14,5),(2081,2146,36,5),(2082,2147,36,10),(2083,2148,36,15),(2084,2149,36,20),(2085,2150,36,25),(2086,2151,36,10),(2087,2152,36,20),(2088,2153,36,30),(2089,2154,36,40),(2090,2155,36,50),(2091,2156,36,20),(2092,2157,36,35),(2093,2158,36,50),(2094,2159,36,65),(2095,2160,36,80),(2096,2161,36,15),(2097,2162,36,30),(2098,2163,36,45),(2099,2164,36,60),(2100,2165,36,75),(2101,2166,36,25),(2102,2167,36,40),(2103,2168,36,55),(2104,2169,36,70),(2105,2170,36,85),(2106,2171,36,50),(2107,2172,36,60),(2108,2173,36,70),(2109,2174,36,80),(2110,2175,36,90),(2111,2176,36,8),(2112,2177,36,18),(2113,2178,36,28),(2114,2179,36,38),(2115,2180,36,48),(2116,2181,36,50),(2117,2182,36,60),(2118,2183,36,70),(2119,2184,36,80),(2120,2185,36,90),(2121,2186,36,15),(2122,2187,36,20),(2123,2188,36,20),(2124,2189,10,5),(2125,2190,10,10),(2126,2191,10,15),(2127,2192,10,20),(2128,2193,10,25),(2129,2194,10,30),(2130,2195,10,35),(2131,2196,10,40),(2132,2197,10,45),(2133,2198,10,50),(2134,2199,10,10),(2135,2200,10,20),(2136,2201,10,30),(2137,2202,10,40),(2138,2203,10,50),(2139,2204,10,60),(2140,2205,10,70),(2141,2206,10,80),(2142,2207,10,90),(2143,2208,10,100),(2144,2209,10,10),(2145,2210,10,20),(2146,2211,10,30),(2147,2212,10,40),(2148,2213,10,50),(2149,2214,10,60),(2150,2215,10,70),(2151,2216,10,80),(2152,2217,10,90),(2153,2218,10,100),(2154,2219,19,30),(2155,2220,19,45),(2156,2221,19,60),(2157,2222,19,75),(2158,2223,19,90),(2159,2224,19,30),(2160,2225,19,45),(2161,2226,19,60),(2162,2227,19,75),(2163,2228,19,90),(2164,2229,19,0),(2165,2230,19,10),(2166,2231,19,20),(2167,2232,19,30),(2168,2233,19,50),(2169,2234,19,60),(2170,2235,19,70),(2171,2236,19,80),(2172,2237,19,90),(2173,2238,20,0),(2174,2239,20,10),(2175,2240,20,20),(2176,2241,20,30),(2177,2242,20,40),(2178,2243,20,0),(2179,2244,20,10),(2180,2245,20,25),(2181,2246,20,40),(2182,2247,20,80),(2183,2248,20,0),(2184,2249,20,15),(2185,2250,20,30),(2186,2251,20,45),(2187,2252,20,60),(2188,2253,20,10),(2189,2254,20,25),(2190,2255,20,40),(2191,2256,20,55),(2192,2257,20,10),(2193,2258,20,30),(2194,2259,20,50),(2195,2260,20,10),(2196,2261,20,30),(2197,2262,20,50),(2198,2263,20,70),(2199,2264,20,90),(2200,2265,19,40),(2201,2266,19,80),(2202,2267,19,40),(2203,2268,19,80),(2204,2269,19,10),(2205,2270,19,50),(2206,2271,19,80),(2207,2272,19,0),(2208,2273,19,80),(2209,2274,19,90),(2210,2275,19,90),(2211,2276,19,0),(2212,2277,19,10),(2213,2278,19,20),(2214,2279,19,30),(2215,2280,19,40),(2216,2281,21,0),(2217,2282,21,20),(2218,2283,21,50),(2219,2284,21,0),(2220,2285,21,15),(2221,2286,21,30),(2222,2287,21,45),(2223,2288,21,0),(2224,2289,21,5),(2225,2290,21,20),(2226,2291,21,35),(2227,2292,21,50),(2228,2293,21,80),(2229,2294,21,40),(2230,2295,21,60),(2231,2296,21,80),(2232,2297,21,10),(2233,2298,21,25),(2234,2299,21,40),(2235,2300,21,55),(2236,2301,21,70),(2237,2302,21,85),(2238,2303,9,10),(2239,2304,9,20),(2240,2305,9,30),(2241,2306,9,40),(2242,2307,9,50),(2243,2311,2,15),(2244,2312,2,30),(2245,2313,2,50),(2246,2314,2,80),(2247,2315,21,0),(2248,2316,21,15),(2249,2317,21,30),(2250,2318,4,1);
/*!40000 ALTER TABLE `PerkLevelSkillRequirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Plant`
--

DROP TABLE IF EXISTS `Plant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Plant` (
  `ID` int NOT NULL,
  `Name` varchar(32) NOT NULL DEFAULT '',
  `BaseTicks` int NOT NULL DEFAULT '0',
  `Resref` varchar(16) NOT NULL DEFAULT '',
  `WaterTicks` int NOT NULL DEFAULT '0',
  `Level` int NOT NULL DEFAULT '0',
  `SeedResref` varchar(16) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Plant`
--

LOCK TABLES `Plant` WRITE;
/*!40000 ALTER TABLE `Plant` DISABLE KEYS */;
INSERT INTO `Plant` VALUES (2,'Cotton',1200,'cotton_shrub',600,0,'cot_seeds'),(3,'Flax',1200,'flax_shrub',600,5,'fla_seeds'),(4,'Jute',1200,'jute_shrub',600,10,'jut_seeds'),(5,'Sisal',1200,'sisal_shrub',600,15,'sis_seeds'),(6,'Kapok',1200,'kapok_shrub',600,20,'kap_seeds'),(7,'Abaca',1200,'abaca_shrub',600,25,'aba_seeds'),(8,'Pina',1200,'pina_shrub',600,30,'pin_seeds'),(9,'Rayon',1200,'rayon_shrub',600,35,'ray_seeds'),(10,'Lyocell',1200,'lyocell_shrub',600,40,'lyo_seeds'),(11,'Hemp',1200,'hemp_shrub',600,45,'hem_seeds'),(12,'Greel Tree',1800,'tree',600,2,''),(13,'Borl Tree',1800,'tree',600,7,''),(14,'Cosian Tree',1800,'tree',600,12,''),(15,'Homoni Tree',1800,'tree',600,17,''),(16,'Japor Tree',1800,'tree',600,22,''),(17,'Laroon Tree',1800,'tree',600,27,''),(18,'Quasiwood Tree',1800,'tree',600,32,''),(19,'Resinwood Tree',1800,'tree',600,37,''),(20,'Scentwood Tree',1800,'tree',600,42,''),(21,'Ebony Tree',1800,'ebony_tree',600,47,''),(22,'Aloe Vera',1200,'plant_aloevera',300,8,'alo_seeds'),(23,'Sage',1200,'plant_sage',300,8,'sag_seeds'),(24,'Barley',600,'crop_barley',300,3,''),(25,'Wheat',600,'crop_wheat',300,3,''),(26,'Rye',600,'crop_rye',300,3,''),(27,'Rice',800,'crop_rice',200,6,''),(28,'Corn',600,'crop_corn',500,1,''),(29,'Blackberry',600,'bush_blackberry',400,0,''),(30,'Blueberry',600,'bush_blueberry',400,0,''),(31,'Raspberry',600,'bush_raspberry',400,0,''),(32,'Onion',1800,'plant_onion',600,6,'oni_seeds'),(51,'Potato Plant',1800,'potato_plant',400,5,'pot_seeds'),(52,'Leek',1800,'plant_leek',400,5,'leek_seeds'),(53,'Grape Vine',2400,'plant_grape',200,10,''),(54,'Bell Pepper',1800,'plant_bellpepper',400,5,'pep_seeds');
/*!40000 ALTER TABLE `Plant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Player`
--

DROP TABLE IF EXISTS `Player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Player` (
  `ID` varchar(64) NOT NULL,
  `CharacterName` longtext ,
  `HitPoints` int NOT NULL,
  `LocationAreaResref` varchar(16) DEFAULT NULL,
  `LocationX` double NOT NULL,
  `LocationY` double NOT NULL,
  `LocationZ` double NOT NULL,
  `LocationOrientation` double NOT NULL,
  `CreateTimestamp` datetime(6) NOT NULL,
  `UnallocatedSP` int NOT NULL,
  `HPRegenerationAmount` int NOT NULL,
  `RegenerationTick` int NOT NULL,
  `RegenerationRate` int NOT NULL,
  `VersionNumber` int NOT NULL,
  `MaxFP` int NOT NULL DEFAULT '0',
  `CurrentFP` int NOT NULL DEFAULT '0',
  `CurrentFPTick` int NOT NULL DEFAULT '0',
  `RespawnAreaResref` varchar(16) DEFAULT '',
  `RespawnLocationX` double NOT NULL DEFAULT '0',
  `RespawnLocationY` double NOT NULL DEFAULT '0',
  `RespawnLocationZ` double NOT NULL DEFAULT '0',
  `RespawnLocationOrientation` double NOT NULL DEFAULT '0',
  `DateSanctuaryEnds` datetime(6) NOT NULL,
  `IsSanctuaryOverrideEnabled` tinyint(1) NOT NULL DEFAULT '0',
  `STRBase` int NOT NULL DEFAULT '0',
  `DEXBase` int NOT NULL DEFAULT '0',
  `CONBase` int NOT NULL DEFAULT '0',
  `INTBase` int NOT NULL DEFAULT '0',
  `WISBase` int NOT NULL DEFAULT '0',
  `CHABase` int NOT NULL DEFAULT '0',
  `TotalSPAcquired` int NOT NULL DEFAULT '0',
  `DisplayHelmet` tinyint(1) NOT NULL DEFAULT '1',
  `PrimaryResidencePCBaseStructureID` varchar(64) DEFAULT NULL,
  `DatePerkRefundAvailable` datetime(6) DEFAULT NULL,
  `AssociationID` int NOT NULL,
  `DisplayHolonet` tinyint(1) NOT NULL DEFAULT '1',
  `DisplayDiscord` tinyint(1) NOT NULL DEFAULT '1',
  `PrimaryResidencePCBaseID` varchar(64) DEFAULT NULL,
  `IsUsingNovelEmoteStyle` tinyint(1) NOT NULL DEFAULT '0',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `XPBonus` int NOT NULL DEFAULT '0',
  `LeaseRate` int NOT NULL DEFAULT '0',
  `LocationInstanceID` varchar(64) DEFAULT NULL,
  `GoldTill` int NOT NULL DEFAULT '0',
  `RoleplayPoints` int NOT NULL DEFAULT '0',
  `RoleplayXP` int NOT NULL DEFAULT '0',
  `ClusterID` int NOT NULL AUTO_INCREMENT,
  `SpecializationID` int NOT NULL DEFAULT '0',
  `ActiveConcentrationPerkID` int DEFAULT NULL,
  `ActiveConcentrationTier` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CIX_Player_ID` (`ClusterID`),
  KEY `FK_Player_AssociationID` (`AssociationID`),
  KEY `FK_Player_PrimaryResidencePCBaseStructureID` (`PrimaryResidencePCBaseStructureID`),
  KEY `FK_Player_PrimaryResidencePCBaseID` (`PrimaryResidencePCBaseID`),
  KEY `FK_Player_ActiveConcentrationPerkID` (`ActiveConcentrationPerkID`),
  KEY `FK_Player_SpecializationID` (`SpecializationID`),
  CONSTRAINT `FK_Player_ActiveConcentrationPerkID` FOREIGN KEY (`ActiveConcentrationPerkID`) REFERENCES `Perk` (`ID`),
  CONSTRAINT `FK_Player_AssociationID` FOREIGN KEY (`AssociationID`) REFERENCES `Association` (`ID`),
  CONSTRAINT `FK_Player_PrimaryResidencePCBaseID` FOREIGN KEY (`PrimaryResidencePCBaseID`) REFERENCES `PCBase` (`ID`),
  CONSTRAINT `FK_Player_PrimaryResidencePCBaseStructureID` FOREIGN KEY (`PrimaryResidencePCBaseStructureID`) REFERENCES `PCBaseStructure` (`ID`),
  CONSTRAINT `FK_Player_SpecializationID` FOREIGN KEY (`SpecializationID`) REFERENCES `Specialization` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Player`
--

LOCK TABLES `Player` WRITE;
/*!40000 ALTER TABLE `Player` DISABLE KEYS */;
/*!40000 ALTER TABLE `Player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ServerConfiguration`
--

DROP TABLE IF EXISTS `ServerConfiguration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ServerConfiguration` (
  `ID` int NOT NULL,
  `ServerName` varchar(50) NOT NULL DEFAULT '',
  `MessageOfTheDay` varchar(1024) NOT NULL DEFAULT '',
  `ModuleVersion` int NOT NULL DEFAULT '0',
  `LastGuildTaskUpdate` datetime(6) NOT NULL DEFAULT '1900-01-01 00:00:00.000000',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ServerConfiguration`
--

LOCK TABLES `ServerConfiguration` WRITE;
/*!40000 ALTER TABLE `ServerConfiguration` DISABLE KEYS */;
INSERT INTO `ServerConfiguration` VALUES (1,'Star Wars: Legends of the Old Republic','Welcome to SWLOR! Visit our website at https://starwarsnwn.com  Please report ALL bugs using the in-game /bug command. May the Force be with you!',1,'2020-03-01 01:31:52.893333');
/*!40000 ALTER TABLE `ServerConfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Skill`
--

DROP TABLE IF EXISTS `Skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Skill` (
  `ID` int NOT NULL,
  `SkillCategoryID` int NOT NULL,
  `Name` varchar(32) NOT NULL DEFAULT '',
  `MaxRank` int NOT NULL DEFAULT '0',
  `IsActive` tinyint(1) NOT NULL DEFAULT '0',
  `Description` varchar(1024) NOT NULL DEFAULT '',
  `Primary` int NOT NULL DEFAULT '0',
  `Secondary` int NOT NULL DEFAULT '0',
  `Tertiary` int NOT NULL DEFAULT '0',
  `ContributesToSkillCap` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `FK_Skill_Primary` (`Primary`),
  KEY `FK_Skill_Secondary` (`Secondary`),
  KEY `FK_Skill_Tertiary` (`Tertiary`),
  KEY `FK_Skill_SkillCategoryID` (`SkillCategoryID`),
  CONSTRAINT `FK_Skill_Primary` FOREIGN KEY (`Primary`) REFERENCES `Attribute` (`ID`),
  CONSTRAINT `FK_Skill_Secondary` FOREIGN KEY (`Secondary`) REFERENCES `Attribute` (`ID`),
  CONSTRAINT `FK_Skill_SkillCategoryID` FOREIGN KEY (`SkillCategoryID`) REFERENCES `SkillCategory` (`ID`),
  CONSTRAINT `FK_Skill_Tertiary` FOREIGN KEY (`Tertiary`) REFERENCES `Attribute` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Skill`
--

LOCK TABLES `Skill` WRITE;
/*!40000 ALTER TABLE `Skill` DISABLE KEYS */;
INSERT INTO `Skill` VALUES (0,0,'None',0,0,'Unused in-game.',0,0,0,1),(1,1,'One-Handed',100,1,'Ability to use one-handed weapons like vibroblades and batons. Higher Skill levels unlock more powerful one-handed weapons.',1,2,0,1),(2,1,'Two-Handed',100,1,'Ability to use heavy weapons like heavy vibroblades and polearms in combat. Higher Skill levels unlock more powerful two-handed weapons.',1,3,0,1),(3,1,'Twin Blades',100,1,'Ability to use double edged weapons like twin vibroblades in combat. Higher Skill levels unlock more powerful twin blade weapons.',1,3,0,1),(4,1,'Martial Arts',100,1,'Ability to fight using power gloves and staves in combat. Higher Skill levels unlock more powerful power gloves and staves.',1,2,0,1),(5,2,'Blasters',100,1,'Ability to use blasters like pistols and rifles in combat. Higher Skill levels unlock more powerful blasters.',2,5,0,1),(6,2,'Throwing',100,1,'Ability to use throwing weapons like shurikens, grenades and slings in combat. Higher Skill levels unlock more powerful throwing weapons.',2,1,0,1),(7,3,'Light Armor',100,1,'Ability to effectively defend against attacks while wearing light armor like tunics. Higher Skill levels unlock more powerful light armors.',2,3,0,1),(8,3,'Heavy Armor',100,1,'Ability to effectively defend against attacks while wearing heavy armor like plate mail. Higher Skill levels unlock more powerful heavy armors.',3,1,0,1),(9,3,'Shields',100,1,'Ability to effectively defend against attacks while using shields. Higher Skill levels unlock more powerful shields.',3,1,0,1),(10,7,'Harvesting',100,1,'Ability to harvest raw resources from ore veins, trees, etc. Higher Skill levels increase yield and unlock more difficult resources.',3,1,0,1),(11,3,'Force Armor',100,1,'Ability to effectively defend against attacks while wearing force armor like Jedi robes. Higher Skill levels unlock more powerful force armors.',3,6,5,1),(12,4,'Weaponsmith',50,1,'Ability to create weapons like axes and swords. Higher Skill levels reduce crafting difficulty and unlock more recipes.',2,4,0,1),(13,4,'Armorsmith',50,1,'Ability to create armors like robes and plate mail. Higher Skill levels reduce crafting difficulty and unlock more recipes.',3,4,0,1),(14,1,'Lightsabers',100,1,'Ability to use lightsaber and saberstaff weapons. Higher Skill levels unlock more powerful lightsabers and saberstaff weapons.',2,6,0,1),(15,4,'Fabrication',50,1,'Ability to create structures like furniture, buildings, control towers, etc. Higher Skill levels reduce crafting difficulty and unlock more structures for building.',4,3,0,1),(16,4,'Cooking',30,1,'Ability to create food items which can grant temporary stat increases. Higher Skill levels reduce crafting difficulty and unlock more recipes.',4,6,0,1),(17,4,'Medicine',50,1,'Ability to treat bodily injuries in the field with healing kits. Also enables construction of medical items like stim packs. Higher Skill levels increase effectiveness of healing kits and unlock new blueprints.',4,5,6,1),(18,8,'Mirialan',20,1,'Ability to speak the Mirialan language.',0,0,0,0),(19,6,'Force Alter',100,1,'Ability to use alter-based force abilities like Force Confusion and Force Push. Higher Skill levels unlock new abilities.',4,5,6,1),(20,6,'Force Control',100,1,'Ability to use control-based force abilities like Force Speed and Rage. Higher Skill levels unlock new abilities.',5,4,6,1),(21,6,'Force Sense',100,1,'Ability to use sense-based force abilities like Force Insight and Premonition. Higher Skill levels unlock new abilities.',6,3,2,1),(22,4,'Engineering',50,1,'Ability to process raw materials and create mechanical devices like firearms. Higher Skill levels increase processing yield and allow more difficult ore to be smelted. Also reduces crafting difficulty and unlocks more blueprints.',2,5,0,1),(23,5,'Farming',50,0,'Ability to Plant seeds, water plants, and harvest crops. Higher Skill levels increase yield and unlock more crops.',3,6,5,1),(24,7,'Scavenging',50,1,'Ability to search through junk to find useful supplies. Higher Skill levels unlock more types of objects to scavenge.',3,5,0,1),(25,8,'Bothese',20,1,'Ability to speak the Bothese language.',0,0,0,0),(26,8,'Cheunh',20,1,'Ability to speak the Cheunh language.',0,0,0,0),(27,8,'Zabraki',20,1,'Ability to speak the Zabraki language.',0,0,0,0),(28,8,'Twi\'leki (Ryl)',20,1,'Ability to speak the Twi\'leki (originally Ryl) language.',0,0,0,0),(29,8,'Catharese',20,1,'Ability to speak the Catharese language.',0,0,0,0),(30,8,'Dosh',20,1,'Ability to speak the Dosh language.',0,0,0,0),(31,8,'Shyriiwook (Wookieespeak)',20,1,'Ability to speak the Shyriiwook (AKA Wookieespeak) language.',0,0,0,0),(32,8,'Droidspeak',20,1,'Ability to speak the Droid language.',0,0,0,0),(33,8,'Basic',20,1,'Ability to speak the Galactic Basic language.',0,0,0,0),(34,8,'Mandoa',20,1,'Ability to speak the Mandoa language.',0,0,0,0),(35,8,'Huttese',20,1,'Ability to speak the Huttese language.',0,0,0,0),(36,5,'Piloting',100,1,'Ability to pilot speeders and starships, follow navigation charts and control starship systems.',2,6,0,1),(37,8,'Mon Calamarian',20,1,'Ability to speak the Mon Calamarian language.',0,0,0,0),(38,8,'Ugnaught',20,1,'Ability to speak the Ugnaught language.',0,0,0,0);
/*!40000 ALTER TABLE `Skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SkillCategory`
--

DROP TABLE IF EXISTS `SkillCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SkillCategory` (
  `ID` int NOT NULL,
  `Name` varchar(32) NOT NULL DEFAULT '',
  `IsActive` tinyint(1) NOT NULL DEFAULT '0',
  `Sequence` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SkillCategory`
--

LOCK TABLES `SkillCategory` WRITE;
/*!40000 ALTER TABLE `SkillCategory` DISABLE KEYS */;
INSERT INTO `SkillCategory` VALUES (0,'N/A',0,0),(1,'Melee Combat',1,1),(2,'Ranged Combat',1,2),(3,'Defense',1,3),(4,'Crafting',1,4),(5,'Utility',1,6),(6,'Force',1,7),(7,'Gathering',1,5),(8,'Languages',1,8);
/*!40000 ALTER TABLE `SkillCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SpaceEncounter`
--

DROP TABLE IF EXISTS `SpaceEncounter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SpaceEncounter` (
  `ID` int NOT NULL,
  `Planet` varchar(255) NOT NULL,
  `TypeID` int NOT NULL,
  `Chance` int NOT NULL,
  `Difficulty` int NOT NULL,
  `LootTableID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_SpaceEncounter_LootTableID` (`LootTableID`),
  CONSTRAINT `FK_SpaceEncounter_LootTableID` FOREIGN KEY (`LootTableID`) REFERENCES `LootTable` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SpaceEncounter`
--

LOCK TABLES `SpaceEncounter` WRITE;
/*!40000 ALTER TABLE `SpaceEncounter` DISABLE KEYS */;
INSERT INTO `SpaceEncounter` VALUES (1,'Viscara',1,15,10,52),(2,'Viscara',1,4,20,53),(3,'Viscara',2,1,5,0),(4,'Viscara',3,20,15,51),(5,'Tatooine',4,20,10,52),(6,'Tatooine',4,5,20,52),(7,'Tatooine',4,1,30,53),(8,'Tatooine',2,1,15,0),(9,'Tatooine',3,15,15,51),(10,'Tatooine',3,5,25,51),(11,'Tatooine',3,3,35,51),(12,'Mon Cala',1,15,40,52),(13,'Mon Cala',2,1,40,0),(14,'Mon Cala',3,15,45,0),(15,'Hutlar',1,15,40,52),(16,'Hutlar',2,1,40,0),(17,'Hutlar',3,15,45,0);
/*!40000 ALTER TABLE `SpaceEncounter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Spawn`
--

DROP TABLE IF EXISTS `Spawn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Spawn` (
  `ID` int NOT NULL,
  `Name` varchar(64) NOT NULL,
  `SpawnObjectTypeID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Spawn_SpawnObjectTypeID` (`SpawnObjectTypeID`),
  CONSTRAINT `FK_Spawn_SpawnObjectTypeID` FOREIGN KEY (`SpawnObjectTypeID`) REFERENCES `SpawnObjectType` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Spawn`
--

LOCK TABLES `Spawn` WRITE;
/*!40000 ALTER TABLE `Spawn` DISABLE KEYS */;
INSERT INTO `Spawn` VALUES (0,'No Spawns',-1),(1,'Resources - Tier 1',64),(2,'Resources - Tier 2',64),(3,'Resources - Tier 3',64),(4,'Resources - Tier 4',64),(5,'Resources - Tier 5',64),(6,'Resources - Tier 6',64),(7,'Resources - Tier 7',64),(8,'Resources - Tier 8',64),(9,'Resources - Tier 9',64),(10,'Resources - Tier 10',64),(11,'CZ-220 Maintenance Level - Droids',1),(12,'CZ-220 Maintenance Level - Mynocks',1),(13,'CZ-220 Scavenge Points',64),(14,'CZ-220 Ore Veins',64),(15,'CZ-220 Colicoid Experiment Spawn',1),(16,'Resources - Tier 1 (Tree/Fiberplast Heavy)',64),(17,'Resources - Tier 1 (Ore Heavy)',64),(18,'Viscara - Kath Hounds (Wildlands)',1),(19,'Mandalorian Raiders',1),(20,'Mandalorian Facility Scavenge Sites',64),(21,'Mandalorian Leader',1),(22,'Viscara - Wildwoods Looters',1),(23,'Viscara - Wildwoods Gimpassa',1),(24,'Viscara - Wildwoods Kinrath',1),(25,'Viscara - Valley Cairnmogs',1),(26,'Viscara - Coxxion Base (Instance)',1),(27,'Viscara - Coxxion Base Boss',1),(28,'Viscara - Deep Mountains',1),(29,'Viscara - Cavern Resources',64),(30,'Viscara - Crystal Cavern',1),(31,'Hutlar - Byysk',1),(32,'Hutlar - Qion Animals',1),(33,'Hutlar - Resources',64),(40,'Mon Cala Coral Isles',1),(41,'Mon Cala Eco-Terrorists',1),(42,'Tatooine Womprat',1),(43,'Tatooine Sandswimmer',1),(44,'Tatooine Wraid',1),(45,'Tatooine Sand Demon',1),(46,'Tatooine Tusken Raider',1),(47,'Tatooine Exterior Resources',64);
/*!40000 ALTER TABLE `Spawn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SpawnObject`
--

DROP TABLE IF EXISTS `SpawnObject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SpawnObject` (
  `ID` int NOT NULL,
  `SpawnID` int NOT NULL,
  `Resref` varchar(16) NOT NULL,
  `Weight` int NOT NULL DEFAULT '1',
  `SpawnRule` varchar(32) NOT NULL DEFAULT '',
  `NPCGroupID` int DEFAULT NULL,
  `BehaviourScript` varchar(64) NOT NULL DEFAULT '',
  `DeathVFXID` int NOT NULL DEFAULT '0',
  `AIFlags` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `FK_SpawnObject_NPCGroupID` (`NPCGroupID`),
  KEY `FK_SpawnObject_SpawnID` (`SpawnID`),
  CONSTRAINT `FK_SpawnObject_NPCGroupID` FOREIGN KEY (`NPCGroupID`) REFERENCES `NPCGroup` (`ID`),
  CONSTRAINT `FK_SpawnObject_SpawnID` FOREIGN KEY (`SpawnID`) REFERENCES `Spawn` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SpawnObject`
--

LOCK TABLES `SpawnObject` WRITE;
/*!40000 ALTER TABLE `SpawnObject` DISABLE KEYS */;
INSERT INTO `SpawnObject` VALUES (1,16,'herbs_patch',30,'',NULL,'',0,0),(2,17,'herbs_patch',30,'',NULL,'',0,0),(3,18,'warocas',40,'',14,'StandardBehaviour',0,13),(4,25,'vall_nashtah',20,'',15,'StandardBehaviour',0,15),(5,30,'crystalspider',10,'',16,'StandardBehaviour',0,15),(6,31,'byysk_warrior',10,'',28,'StandardBehaviour',0,11),(7,31,'byysk_warrior2',10,'',28,'StandardBehaviour',0,11),(8,32,'qion_slug',10,'',29,'StandardBehaviour',0,15),(9,1,'ore_vein',70,'OreSpawnRule',NULL,'',0,0),(10,1,'tree',10,'TreeSpawnRule',NULL,'',0,0),(11,2,'ore_vein',70,'OreSpawnRule',NULL,'',0,0),(12,2,'tree',30,'TreeSpawnRule',NULL,'',0,0),(13,3,'ore_vein',70,'OreSpawnRule',NULL,'',0,0),(14,3,'tree',30,'TreeSpawnRule',NULL,'',0,0),(15,4,'ore_vein',70,'OreSpawnRule',NULL,'',0,0),(16,4,'tree',30,'TreeSpawnRule',NULL,'',0,0),(17,5,'ore_vein',70,'OreSpawnRule',NULL,'',0,0),(18,5,'tree',30,'TreeSpawnRule',NULL,'',0,0),(19,6,'ore_vein',70,'OreSpawnRule',NULL,'',0,0),(20,6,'tree',30,'TreeSpawnRule',NULL,'',0,0),(21,7,'ore_vein',70,'OreSpawnRule',NULL,'',0,0),(22,7,'tree',30,'TreeSpawnRule',NULL,'',0,0),(23,8,'ore_vein',70,'OreSpawnRule',NULL,'',0,0),(24,8,'tree',30,'TreeSpawnRule',NULL,'',0,0),(25,9,'ore_vein',70,'OreSpawnRule',NULL,'',0,0),(26,9,'tree',30,'TreeSpawnRule',NULL,'',0,0),(27,10,'ore_vein',70,'OreSpawnRule',NULL,'',0,0),(28,10,'tree',30,'TreeSpawnRule',NULL,'',0,0),(29,1,'fiberplast_shrub',30,'FiberplastSpawnRule',NULL,'',0,0),(30,2,'fiberplast_shrub',10,'FiberplastSpawnRule',NULL,'',0,0),(31,3,'fiberplast_shrub',10,'FiberplastSpawnRule',NULL,'',0,0),(32,4,'fiberplast_shrub',10,'FiberplastSpawnRule',NULL,'',0,0),(33,5,'fiberplast_shrub',10,'FiberplastSpawnRule',NULL,'',0,0),(34,6,'fiberplast_shrub',10,'FiberplastSpawnRule',NULL,'',0,0),(35,7,'fiberplast_shrub',10,'FiberplastSpawnRule',NULL,'',0,0),(36,8,'fiberplast_shrub',10,'FiberplastSpawnRule',NULL,'',0,0),(37,9,'fiberplast_shrub',10,'FiberplastSpawnRule',NULL,'',0,0),(38,10,'fiberplast_shrub',10,'FiberplastSpawnRule',NULL,'',0,0),(39,1,'crystal_cluster',7,'CrystalClusterSpawnRule',NULL,'',0,0),(40,2,'crystal_cluster',7,'CrystalClusterSpawnRule',NULL,'',0,0),(41,3,'crystal_cluster',7,'CrystalClusterSpawnRule',NULL,'',0,0),(42,4,'crystal_cluster',7,'CrystalClusterSpawnRule',NULL,'',0,0),(43,5,'crystal_cluster',7,'CrystalClusterSpawnRule',NULL,'',0,0),(44,6,'crystal_cluster',7,'CrystalClusterSpawnRule',NULL,'',0,0),(45,7,'crystal_cluster',7,'CrystalClusterSpawnRule',NULL,'',0,0),(46,8,'crystal_cluster',7,'CrystalClusterSpawnRule',NULL,'',0,0),(47,9,'crystal_cluster',7,'CrystalClusterSpawnRule',NULL,'',0,0),(48,10,'crystal_cluster',7,'CrystalClusterSpawnRule',NULL,'',0,0),(49,12,'mynock',100,'',1,'StandardBehaviour',0,13),(50,11,'malsecdroid',50,'',2,'StandardBehaviour',22,13),(51,11,'malspiderdroid',50,'',2,'StandardBehaviour',22,13),(52,13,'cz220_junk',10,'',NULL,'',0,0),(53,14,'ore_vein',70,'OreSpawnRule',NULL,'',0,0),(54,15,'colicoidexp',10,'',3,'StandardBehaviour',0,13),(55,16,'tree',30,'TreeSpawnRule',NULL,'',0,0),(56,16,'ore_vein',10,'OreSpawnRule',NULL,'',0,0),(57,16,'fiberplast_shrub',70,'FiberplastSpawnRule',NULL,'',0,0),(58,17,'ore_vein',70,'OreSpawnRule',NULL,'',0,0),(59,17,'fiberplast_shrub',30,'FiberplastSpawnRule',NULL,'',0,0),(60,18,'kath_hound',70,'',4,'StandardBehaviour',0,13),(61,19,'man_warrior_1',30,'',6,'StandardBehaviour',0,11),(62,19,'man_warrior_2',30,'',6,'StandardBehaviour',0,11),(63,19,'man_ranger_1',30,'',7,'StandardBehaviour',0,11),(64,19,'man_ranger_2',30,'',7,'StandardBehaviour',0,11),(65,20,'supp_crate',50,'',NULL,'',0,0),(66,21,'man_leader',99,'',5,'StandardBehaviour',0,11),(67,22,'looter_1',30,'',8,'StandardBehaviour',0,11),(68,22,'looter_2',30,'',8,'StandardBehaviour',0,11),(69,23,'ww_gimpassa',30,'',9,'StandardBehaviour',0,11),(70,24,'ww_kinrath',30,'',10,'StandardBehaviour',0,15),(71,25,'valley_cairnmog',50,'',11,'StandardBehaviour',0,15),(72,25,'valley_cairnmog2',50,'',11,'StandardBehaviour',0,15),(73,26,'v_flesheater',10,'',NULL,'StandardBehaviour',0,11),(74,26,'v_flesheater2',10,'',NULL,'StandardBehaviour',0,11),(75,27,'v_fleshleader',100,'',12,'StandardBehaviour',0,11),(76,32,'qion_tiger',8,'',30,'StandardBehaviour',0,15),(77,33,'crystal_clusterb',10,'ColoredCrystalSpawnRule',NULL,'',0,0),(78,28,'v_raivor',10,'',13,'StandardBehaviour',0,15),(79,28,'v_raivor2',10,'',13,'StandardBehaviour',0,15),(80,29,'ore_vein',30,'OreSpawnRule',NULL,'',0,0),(81,29,'crystal_cluster',70,'CrystalClusterSpawnRule',NULL,'',0,0),(82,33,'crystal_clusterr',8,'ColoredCrystalSpawnRule',NULL,'',0,0),(83,33,'crystal_clustery',6,'ColoredCrystalSpawnRule',NULL,'',0,0),(84,33,'crystal_clusterg',12,'ColoredCrystalSpawnRule',NULL,'',0,0),(85,33,'ore_vein',8,'OreSpawnRule',NULL,'',0,0),(100,40,'viper',20,'',NULL,'StandardBehaviour',0,13),(101,40,'mc_aradile',40,'',NULL,'StandardBehaviour',0,15),(102,40,'mc_amphihydrus',10,'',NULL,'DarkForceUser',0,15),(103,41,'ecoterr_1',50,'',NULL,'StandardBehaviour',0,15),(104,41,'ecoterr_2',50,'',NULL,'StandardBehaviour',0,15),(105,42,'womprat',50,'',23,'StandardBehaviour',0,7),(106,43,'sandswimmer',50,'',24,'StandardBehaviour',0,7),(107,44,'sandbeetle',50,'',25,'StandardBehaviour',0,7),(108,45,'sanddemon',50,'',26,'StandardBehaviour',0,7),(109,46,'ext_tusken_tr003',50,'',27,'StandardBehaviour',0,7),(110,47,'fiberplast_shrub',100,'FiberplastSpawnRule',NULL,'',0,0);
/*!40000 ALTER TABLE `SpawnObject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SpawnObjectType`
--

DROP TABLE IF EXISTS `SpawnObjectType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SpawnObjectType` (
  `ID` int NOT NULL,
  `Name` varchar(64) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SpawnObjectType`
--

LOCK TABLES `SpawnObjectType` WRITE;
/*!40000 ALTER TABLE `SpawnObjectType` DISABLE KEYS */;
INSERT INTO `SpawnObjectType` VALUES (-1,'Invalid'),(1,'Creature'),(2,'Item'),(4,'Trigger'),(8,'Door'),(16,'AreaOfEffect'),(32,'Waypoint'),(64,'Placeable'),(128,'Store');
/*!40000 ALTER TABLE `SpawnObjectType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Specialization`
--

DROP TABLE IF EXISTS `Specialization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Specialization` (
  `ID` int NOT NULL,
  `Name` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Specialization`
--

LOCK TABLES `Specialization` WRITE;
/*!40000 ALTER TABLE `Specialization` DISABLE KEYS */;
INSERT INTO `Specialization` VALUES (0,'None'),(1,'Guardian'),(2,'Consular'),(3,'Sentinel');
/*!40000 ALTER TABLE `Specialization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Starport`
--

DROP TABLE IF EXISTS `Starport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Starport` (
  `ID` int NOT NULL,
  `StarportID` varchar(64) NOT NULL,
  `PlanetName` varchar(64) NOT NULL,
  `Name` varchar(64) NOT NULL,
  `CustomsDC` int NOT NULL,
  `Cost` int NOT NULL,
  `WaypointTag` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UQ__Starport__36C4170821AB9846` (`StarportID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Starport`
--

LOCK TABLES `Starport` WRITE;
/*!40000 ALTER TABLE `Starport` DISABLE KEYS */;
INSERT INTO `Starport` VALUES (1,'6D9E3CFE-70B1-4B77-8166-10C4F5B0DA9D','Viscara','Veles Starport',20,400,'VISCARA_LANDING'),(2,'E38D63C5-D595-4DC8-873A-35151229CD6F','Tatooine','Mos Eisley Starport',5,400,'TATOOINE_LANDING'),(3,'498EA709-7638-4A6E-9BE0-6F223EBA6C4A','Mon Cala','Dac City Starport',50,400,'MON_CALA_LANDING'),(4,'4A882E34-437E-4300-ACE4-D43428F2CFE0','Hutlar','Hutlar Outpost Starport',50,400,'HUTLAR_LANDING');
/*!40000 ALTER TABLE `Starport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StructureMode`
--

DROP TABLE IF EXISTS `StructureMode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StructureMode` (
  `ID` int NOT NULL,
  `Name` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StructureMode`
--

LOCK TABLES `StructureMode` WRITE;
/*!40000 ALTER TABLE `StructureMode` DISABLE KEYS */;
INSERT INTO `StructureMode` VALUES (0,'None'),(1,'Residence'),(2,'Workshop'),(3,'Storefront');
/*!40000 ALTER TABLE `StructureMode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'swlor'
--

--
-- Dumping routines for database 'swlor'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-07 21:01:40
