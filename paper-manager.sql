-- MySQL dump 10.13  Distrib 5.6.38, for Linux (x86_64)
--
-- Host: localhost    Database: paper-manager
-- ------------------------------------------------------
-- Server version	5.6.38

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
-- Table structure for table `authorlist`
--

DROP TABLE IF EXISTS `authorlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authorlist` (
  `authorname` varchar(45) NOT NULL,
  PRIMARY KEY (`authorname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorlist`
--

LOCK TABLES `authorlist` WRITE;
/*!40000 ALTER TABLE `authorlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `authorlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `first`
--

DROP TABLE IF EXISTS `first`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `first` (
  `firstID` int(11) NOT NULL,
  `sortname` varchar(45) DEFAULT NULL,
  `upperID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`firstID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `first`
--

LOCK TABLES `first` WRITE;
/*!40000 ALTER TABLE `first` DISABLE KEYS */;
INSERT INTO `first` VALUES (1,'基础学科','0'),(2,'工程科技','0'),(3,'农业科技','0'),(4,'医学卫生科技','0'),(5,'哲学与人文科学','0'),(6,'社会科学','0'),(7,'信息科学','0'),(8,'经济与管理科学','0');
/*!40000 ALTER TABLE `first` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new`
--

DROP TABLE IF EXISTS `new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `new` (
  `PaperID` varchar(50) NOT NULL,
  `authorname` varchar(45) NOT NULL,
  `level` int(11) DEFAULT '5',
  `SecondAuthorID` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new`
--

LOCK TABLES `new` WRITE;
/*!40000 ALTER TABLE `new` DISABLE KEYS */;
/*!40000 ALTER TABLE `new` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paper`
--

DROP TABLE IF EXISTS `paper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paper` (
  `PaperID` varchar(50) NOT NULL,
  `Title` varchar(200) NOT NULL,
  `FirstAuthorID` varchar(45) NOT NULL,
  `SecondAuthorID` varchar(500) DEFAULT NULL,
  `Date` date NOT NULL,
  `SortID` int(11) NOT NULL,
  `JournalID` varchar(45) DEFAULT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT '0',
  `KeyWords` varchar(200) NOT NULL,
  `Description` varchar(2000) DEFAULT NULL,
  `File` varchar(200) DEFAULT NULL,
  `level` int(11) DEFAULT '5',
  PRIMARY KEY (`PaperID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paper`
--

LOCK TABLES `paper` WRITE;
/*!40000 ALTER TABLE `paper` DISABLE KEYS */;
/*!40000 ALTER TABLE `paper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `second`
--

DROP TABLE IF EXISTS `second`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `second` (
  `secondID` int(11) NOT NULL,
  `sortname` varchar(45) DEFAULT NULL,
  `upper` int(11) DEFAULT NULL,
  PRIMARY KEY (`secondID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `second`
--

LOCK TABLES `second` WRITE;
/*!40000 ALTER TABLE `second` DISABLE KEYS */;
INSERT INTO `second` VALUES (1,'地质学',1),(2,'数学',1),(3,'资源科学',1),(4,'力学',1),(5,'物理学',1),(6,'生物学',1),(7,'天文学',1),(8,'地理学',1),(9,'气象学',1),(10,'海洋学',1),(11,'化学',2),(12,'材料科学',2),(13,'矿业工程',2),(14,'一般服务业',2),(15,'机械工业',2),(16,'汽车工业',2),(17,'铁路运输',2),(18,'船舶工业',2),(19,'动力工程',2),(20,'核科学技术',2),(21,'林业',3),(22,'园艺',3),(23,'农作物',3),(24,'农业工程',3),(25,'水产和渔业',3),(26,'畜牧与动物医学',3),(27,'医药方针法规研究',4),(28,'中医学',4),(29,'中药学',4),(30,'中西医结合',4),(31,'中国文学',5),(32,'音乐舞蹈',5),(33,'书法雕塑',5),(34,'影视戏曲艺术',5),(35,'中国古代史',5),(36,'中国近现代史',5),(37,'考古',5),(38,'哲学',5),(39,'心理学',5),(40,'宗教',5),(41,'马克思主义',6),(42,'中国共产党',6),(43,'思想政治教育',6),(44,'军事',6),(45,'宪法',6),(46,'国际法',6),(47,'民族学',6),(48,'学前教育',6),(49,'初等教育',6),(50,'高等教育',6),(51,'无线电电子学',7),(52,'计算机硬件技术',7),(53,'自动化技术',7),(54,'新闻与传媒',7),(55,'数字情报与数字图书馆',7),(56,'档案及博物馆',7),(57,'互联网技术',7),(58,'农业经济',8),(59,'经济理论及经济思想史',8),(60,'经济体制改革',8),(61,'经济统计',8),(62,'工业经济',8),(63,'交通运输经济',8),(64,'旅游',8),(65,'信息经济与邮政经济',8),(66,'服务于经济',8),(67,'金融',8),(68,'证券',8),(69,'保险',8),(70,'领导学和决策学',8);
/*!40000 ALTER TABLE `second` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `third`
--

DROP TABLE IF EXISTS `third`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `third` (
  `thirdID` int(11) DEFAULT NULL,
  `sortname` varchar(45) DEFAULT NULL,
  `upper` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `third`
--

LOCK TABLES `third` WRITE;
/*!40000 ALTER TABLE `third` DISABLE KEYS */;
INSERT INTO `third` VALUES (1,'岩石学',1),(2,'矿物学',1),(3,'古生物学',1),(4,'动力地质学',1),(5,'地质力学',1),(6,'构造地质学',1),(7,'宇宙地质学',1),(8,'环境地质学',1),(9,'海洋地质学',1),(10,'地球化学',1),(11,'数学概论',2),(12,'古典数学',2),(13,'数理逻辑',2),(14,'数学分析',2),(15,'初、高等数学',2),(16,'金融数学',2),(17,'代数、数论',2),(18,'应用数学',2),(19,'计算数学',2),(20,'运筹学',2),(21,'资源管理与利用',3),(22,'各种资源的开发与利用',3),(23,'力学概论',4),(24,'理论力学',4),(25,'固体力学',4),(26,'流体力学',4),(27,'爆炸力学',4),(28,'振动理论',4),(29,'流变学',4),(30,'应用力学',4),(31,'声学',5),(32,'光学',5),(33,'电磁学',5),(34,'热学与热分子运动论',5),(35,'固体物理学',5),(36,'半导体物理学',5),(37,'植物学',6),(38,'动物学',6),(39,'昆虫学',6),(40,'人类学',6),(41,'生物工程学',6),(42,'生理学',6),(43,'遗传学',6),(44,'细胞学',6),(45,'天体测量学',7),(46,'射电天文学',7),(47,'天体力学',7),(48,'天体物理学',7),(49,'太阳系',7),(50,'空间天文学',7),(51,'地貌学',8),(52,'土壤学',8),(53,'应用及分类地理学',8),(54,'一般理论与方法',8),(55,'气候学',9),(56,'动力气象学',9),(57,'应用气象学',9),(58,'气象灾难学',9),(59,'大气勘测',9),(60,'气象基础学科',9),(61,'区域海洋学',10),(62,'海洋气象学',10),(63,'海洋水文学',10),(64,'海洋化学',10),(65,'海洋物理学',10),(66,'海洋工程',10),(67,'海洋灾害',10),(68,'海洋生物学',10),(69,'海洋学',10),(70,'海洋资源与开发',10),(71,'有机化学',11),(72,'无机化学',11),(73,'高分子化学',11),(74,'物理化学',11),(75,'分析化学',11),(76,'应用化学',11),(77,'晶体学',11),(78,'金属材料',12),(79,'非金属材料',12),(80,'复合材料',12),(81,'功能材料',12),(82,'仿生材料',12),(83,'超导材料',12),(84,'耐高温、低温材料',12),(85,'耐腐蚀材料',12),(86,'智能材料',12),(87,'特种结构材料',12),(88,'矿山开采工程学',13),(89,'矿测量与勘测工程学',13),(90,'矿山安全与劳动保护',13),(91,'矿山电工',13),(92,'矿山运输与设备',13),(93,'选矿',13),(94,'美食学',14),(95,'居住管理',14),(96,'烹饪法',14),(97,'洗染、缝补',14),(98,'机械学',15),(99,'机械制造工业',15),(100,'起重机械与运输机械',15),(101,'机械工厂',15),(102,'气体压缩与运输机械',15),(103,'机械零件及其传动装置',15),(104,'汽车结构部件',16),(105,'汽车驾驶与使用',16),(106,'汽车保养与修理',16),(107,'汽车制造厂',16),(108,'汽车发动机',16),(109,'汽车理论',16),(110,'汽车制造工艺',16),(112,'汽车试验',16),(113,'汽车材料',16),(114,'汽车工业经济',16),(115,'铁路运输经济',17),(116,'电气化铁路',17),(117,'特种铁路',17),(118,'机车工程',17),(119,'车辆工程',17),(120,'铁路通信、信号',17),(121,'铁路运输管理工程',17),(122,'环境地质学',17),(123,'海洋地质学',17),(124,'地球化学',17),(125,'船舶原理',18),(126,'船舶材料',18),(127,'船舶机械',18),(128,'船舶建造工艺',18),(129,'船舶结构',18),(130,'船舶驾驶、航海学',18),(131,'热力工程、热机',19),(132,'内燃机',19),(133,'水能',19),(134,'蒸汽动力工程',19),(135,'动力工业经济',19),(136,'加速器',20),(137,'原子能技术经济',20),(138,'核反应堆工程，核电厂',20),(139,'辐射防护',20),(140,'核爆炸，放射性物质',20),(141,'林业基础科学',21),(142,'绿化建设',21),(143,'森林工程',21),(144,'森林树种',21),(145,'森林计测学',21),(146,'设施园艺',22),(147,'蔬菜园艺',22),(148,'瓜果园艺',22),(149,'果树园艺',22),(150,'观赏园艺',22),(151,'病虫害及其防治',22),(152,'禾谷类作物',23),(153,'豆类作物',23),(154,'经济作物',23),(155,'绿肥作物',23),(156,'饲料作物、牧草',23),(157,'野生植物及其他',23),(158,'农业机械及农具',24),(159,'农田水利及水污染防治',24),(160,'农业建筑',24),(161,'农业动力、农村能源',24),(162,'水产经济',25),(163,'渔捞',25),(164,'水产养殖技术',25),(165,'水产保护学',25),(166,'水产工程',25),(167,'水产物运输、存储保鲜',25),(168,'普通畜牧学',26),(169,'家畜',26),(160,'家禽',26),(171,'兽医学',26),(172,'卫生事业总论',27),(173,'医疗保险',27),(174,'医药、卫生政策法规',27),(175,'医疗服务、制度及改革',27),(176,'医疗与法',27),(177,'医疗器械',27),(178,'中国医学',28),(179,'中医基础理论',28),(180,'中医临床学',28),(181,'中医内科',28),(182,'中医外科',28),(183,'本草',29),(184,'中药材',29),(185,'中药药理学',29),(186,'中药炮制、制剂',29),(187,'中药化学',29),(188,'中药药事组织',29),(189,'方剂学',29),(190,'其他各国生药学',29),(191,'中西医结合基础',30),(192,'中西医结合临床',30),(193,'小说',31),(194,'散文',31),(195,'诗歌、韵文',31),(196,'儿童文学',31),(197,'戏剧文学',31),(198,'报告文学',31),(199,'少数民族文学',31),(200,'文学评论和研究',31),(201,'音乐',32),(202,'舞蹈',32),(203,'绘画',33),(204,'书法、篆刻',33),(205,'雕塑',33),(206,'摄影艺术',33),(207,'工艺美术',33),(208,'戏剧艺术',34),(209,'电影艺术',34),(210,'电视艺术',34),(211,'原始社会',35),(212,'奴隶社会',35),(213,'封建社会',35),(214,'半封建半殖民地社会',36),(215,'中华人民共和国史',36),(216,'考古学理论与方法',37),(217,'世界考古',37),(218,'中国考古',37),(219,'哲学理论',38),(220,'世界哲学',38),(221,'中国哲学',38),(222,'思维科学',38),(223,'自然辨证发',38),(224,'心理学',39),(225,'综合',40),(226,'佛教',40),(227,'道教',40),(228,'伊斯兰教',40),(229,'基督教',40),(220,'天主教',40),(231,'马克思、恩格斯、列宁、毛泽东等著作',41),(232,'马克思、恩格斯、列宁、毛泽东等生平传记',41),(233,'马原、毛概、邓理、列宁主义的学习和研究',41),(234,'建党理论、党章',42),(235,'党的组织、会议、文献',42),(236,'党的总路线和总政策',42),(237,'党的建设',42),(238,'党的领导',42),(239,'中国共产党与各国共产党的关系',42),(240,'中国共产主义青年团',42),(241,'思想政治教育与精神文明建设',43),(242,'革命传统教育',43),(243,'形式教育，国情教育',43),(244,'道德教育',43),(245,'国际主义，爱国主义教育',43),(246,'军事理论与军史',44),(247,'军事组织与管理',44),(248,'战略、战役、战术',44),(249,'国家法、宪法',45),(250,'国际法理论',46),(251,'国际经济法',46),(252,'国际私法',46),(253,'民族法',47),(254,'幼教理论',48),(255,'思想品德教育',48),(256,'幼儿教学',48),(257,'学校管理',48),(258,'世界各国幼教概况',48),(259,'教学理论与教学方法',49),(260,'教材、课本、辅助教材、参考书',49),(261,'研究生教育',50),(262,'各类型高等学校',50),(263,'高等教育理论',50),(264,'教学理论、教学方法',50),(265,'思想政治教育、德育',50),(266,'科学研究工作',50),(267,'教师与学生',50),(268,'中国及地方高等教育',50),(269,'世界各国教育',50),(270,'师范教育',50),(271,'电子工业',51),(272,'真空电子技术',51),(273,'光电子技术、激光技术',51),(274,'半导体技术',51),(275,'电子元件、组件',51),(276,'基本电子电路',51),(277,'微电子学，集成电路',51),(278,'电子计算机',52),(279,'微信计算机',52),(280,'其他计算机',52),(281,'一般性问题',52),(282,'自动化基础理论',53),(283,'自动化技术及设备',53),(284,'射流技术（流控技术）',53),(285,'遥感技术',53),(286,'远动技术',53),(287,'信息与传播理论',54),(288,'新闻学、新闻事业',54),(289,'广播电视',54),(290,'图书馆学、图书馆事业',55),(291,'情报学、情报工作',55),(292,'档案学、档案事业',56),(293,'博物馆学、博物馆事业',56),(294,'计算机网络理论',57),(295,'网络结构与设计',57),(296,'通信协议',57),(297,'通信设备与线路',57),(298,'网络管理与运行',57),(299,'网络安全',57),(300,'网络应用程序',57),(301,'农业经济理论',58),(302,'世界农业经济',58),(303,'中国农业经济',58),(304,'经济概论',59),(305,'社会生产方式',59),(306,'经济学分支科学及各科经济学',59),(307,'经济思想史',59),(308,'世界经济',60),(309,'中国经济',60),(310,'其他各国经济',60),(311,'经济统计概述',61),(312,'经济统计方法',61),(313,'专门经济统计',61),(314,'国籍经济统计',61),(315,'经济统计组织与工作',61),(316,'工业经济理论',62),(317,'世界工业经济',62),(318,'中国工业经济',62),(319,'铁路运输经济',63),(320,'陆路、公路运输经济',63),(321,'水路运输经济',63),(322,'航空运输经济',63),(323,'城市交通运输经济',63),(324,'交通运输经济理论及概况',63),(325,'旅游经济理论与方法',64),(326,'旅游事业',64),(327,'旅游资源',64),(328,'旅游文化',64),(329,'旅游与商业',64),(330,'旅游标准、旅游投诉',64),(331,'信息产业经济',65),(332,'电信',65),(333,'邮政',65),(334,'邮电经济理论',65),(335,'世界各国邮电事业',65),(336,'服务业经济概论',66),(337,'旅馆业',66),(338,'餐饮业',66),(339,'娱乐业',66),(340,'其他服务业',66),(341,'货币',67),(342,'金融、银行',67),(343,'证券学理论',68),(344,'世界证券学',68),(345,'中国证券学',68),(346,'各国证券学',68),(347,'保险学理论',69),(348,'世界保险业',69),(349,'中国保险业',69),(350,'各国保险业',69),(351,'领导学',70),(352,'决策学',70);
/*!40000 ALTER TABLE `third` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload`
--

DROP TABLE IF EXISTS `upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upload` (
  `username` varchar(45) NOT NULL,
  `paperID` varchar(50) NOT NULL,
  `uploadDate` date NOT NULL,
  `clickTime` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload`
--

LOCK TABLES `upload` WRITE;
/*!40000 ALTER TABLE `upload` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `username` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(40) NOT NULL,
  `realName` varchar(40) DEFAULT NULL,
  `registrationDate` date NOT NULL DEFAULT '2017-01-01',
  `authority` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-07 22:58:32
