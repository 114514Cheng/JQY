CREATE DATABASE  IF NOT EXISTS `travel` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `travel`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: travel
-- ------------------------------------------------------
-- Server version	5.6.14

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
-- Table structure for table `facility`
--

DROP TABLE IF EXISTS `facility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facility` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `explains` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facility`
--

LOCK TABLES `facility` WRITE;
/*!40000 ALTER TABLE `facility` DISABLE KEYS */;
INSERT INTO `facility` VALUES (1,'和谐医院','和谐医院是一家现代化医疗机构，致力于为患者提供全方位的医疗服务。医院拥有先进的医疗设备和专业的医护团队，为患者提供高水平的诊疗和护理服务。我们坚持以患者为中心，竭诚为您的健康保驾护航。'),(2,'宜人医疗中心','宜人医疗中心哈哈哈哈哈哈是一家专业的综合性医疗机构，致力于为患者提供优质的医疗服务。我们拥有先进的医疗设备和资深的医疗团队，为患者提供全方位的诊疗和护理服务。我们坚持以患者为中心，竭诚为您的健康保驾护航。'),(3,'龙凤楼海鲜酒楼','龙凤楼海鲜酒楼是一家以粤菜和海鲜为特色的知名餐馆。我们精选新鲜食材，由资深大厨精心烹制，呈现给您地道正宗的粤式美食。无论是家庭聚餐、朋友聚会还是商务宴请，我们都能为您提供优质的餐饮体验。'),(4,'香港茶餐厅','香港茶餐厅以香港特色菜肴为主打，提供正宗的香港美食。这里有港式奶茶、炒河粉、煲仔饭等经典菜品，让您品尝到地道的香港味道。舒适的用餐环境和亲切的服务将为您带来愉快的用餐体验。'),(5,'城市图书馆','城市图书馆是一座现代化的公共文化设施，为市民提供丰富多样的阅读和学习资源。这里收藏了大量的图书、期刊、报纸等文献资料，同时提供舒适的阅读环境和便捷的借阅服务。无论您是学生、职场人士还是文学爱好者，这里都是您获取知识的理想场所。'),(6,'阳光医院','阳光医院是一家综合性医疗机构，拥有先进的医疗设备和优秀的医疗团队。我们提供全天候的门诊和急诊服务，涵盖内科、外科、妇产科、儿科等多个专科，致力于为患者提供高质量、高效率的医疗服务。'),(7,'美味小厨','美味小厨是一家提供地道中式菜肴的餐馆，拥有多年的厨艺经验和优质的食材。我们提供各种口味丰富、营养均衡的菜肴，包括川菜、粤菜、湘菜等，让您在品尝美食的同时感受家的味道。'),(8,'绿色公园','绿色公园是一座美丽而宁静的公共休闲场所，环境优美，空气清新。这里有茂密的树木、漂亮的花草以及宽敞的草坪，是市民们放松身心、享受自然的理想场所。公园内设有儿童游乐区、健身步道等设施，适合各个年龄段的人群。'),(9,'阳光儿童乐园','阳光儿童乐园是一座专为儿童设计的室内游乐场所，充满着欢声笑语和童趣无限。我们拥有丰富多彩的游乐设施，如蹦床、滑滑梯、迷宫等，能够满足不同年龄段孩子的需求。在这里，孩子们可以尽情玩耍，释放天性，是他们健康快乐成长的理想场所。'),(10,'云海阁餐厅','云海阁餐厅是一家提供地道本地美食的高级餐馆，位于风景秀丽的云海景区入口处。餐厅环境优雅，采用传统中式装饰风格，令人仿佛置身于古代宫廷。主打菜品包括脆皮烤鸭、红烧狮子头和清蒸桂花鱼，每道菜都精致美味，深受食客喜爱。餐厅还提供丰富的素食选择，特别是以新鲜的时令蔬菜制作的素食大餐。云海阁餐厅不仅仅是一个用餐的地方，更是一个体验本地文化与风味的绝佳场所。这里的服务一流，细心周到，让每一位顾客都能感受到宾至如归的温暖。');
/*!40000 ALTER TABLE `facility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_sight_facility`
--

DROP TABLE IF EXISTS `ref_sight_facility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ref_sight_facility` (
  `id` int(11) NOT NULL,
  `sightid` int(11) NOT NULL,
  `facilityid` int(11) NOT NULL,
  PRIMARY KEY (`id`,`sightid`,`facilityid`),
  KEY `sightid_idx` (`sightid`),
  KEY `facilityid_idx` (`facilityid`),
  CONSTRAINT `fk_facility_id` FOREIGN KEY (`facilityid`) REFERENCES `facility` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sight_id` FOREIGN KEY (`sightid`) REFERENCES `sight` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_sight_facility`
--

LOCK TABLES `ref_sight_facility` WRITE;
/*!40000 ALTER TABLE `ref_sight_facility` DISABLE KEYS */;
INSERT INTO `ref_sight_facility` VALUES (1,1,1),(3,1,3),(2,2,2),(4,2,4),(5,2,1),(6,3,8),(12,3,10),(13,3,5),(7,4,10),(11,4,9),(14,4,6),(8,5,2),(9,5,3),(10,5,7);
/*!40000 ALTER TABLE `ref_sight_facility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` date NOT NULL,
  `userid` int(11) NOT NULL,
  `sightid` int(11) NOT NULL,
  `down` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid_idx` (`userid`),
  KEY `sightid_idx` (`sightid`),
  CONSTRAINT `sightid` FOREIGN KEY (`sightid`) REFERENCES `sight` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,'2024-06-08',3,1,0),(2,'2024-06-09',3,2,0),(3,'2024-07-10',4,1,0),(4,'2024-07-10',3,4,0),(5,'2024-07-10',3,5,0),(6,'2024-11-05',3,3,0);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sight`
--

DROP TABLE IF EXISTS `sight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sight` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `explains` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sight`
--

LOCK TABLES `sight` WRITE;
/*!40000 ALTER TABLE `sight` DISABLE KEYS */;
INSERT INTO `sight` VALUES (1,'摩天岭生态区','摩天岭生态区，位于山东省，是一片占地超过五千公顷的原始自然保护区，被誉为“大自然的宝藏”。这片生态区拥有丰富的生物多样性，栖息着数百种珍稀动植物，许多都是国家一级保护物种。摩天岭生态区不仅是野生动植物的天堂，更是科学研究和生态教育的重要基地。\n\n走进摩天岭生态区，首先映入眼帘的是高耸入云的古老森林。这里的树木高大挺拔，树冠层层叠叠，遮天蔽日。每年春天，百花齐放，漫山遍野的杜鹃花、兰花和野菊花竞相开放，形成一幅美丽的自然画卷。秋天则是枫叶红遍的季节，漫步在铺满落叶的小径上，仿佛走进了童话世界。冬天的大雪覆盖了整个山岭，银装素裹，宛如仙境。\n\n摩天岭生态区内有许多清澈见底的山泉和溪流，蜿蜒流淌在山谷之间。最大的湖泊——碧湖，湖水湛蓝如宝石，湖面平静如镜，倒映着周围的群山和森林，景色宜人。碧湖不仅是生态区的重要水源，也是多种水生动植物的栖息地。每年夏季，湖边的荷花竞相开放，湖面上时常能见到白鹭和鸳鸯成双成对地飞翔。\n\n摩天岭生态区内还有丰富的人文景观。这里保存着许多古老的村落和寺庙，村民们世代居住在这片土地上，过着与世无争、与自然和谐共处的生活。村落中的石板路、木质房屋和古井，无不散发着浓厚的历史气息。寺庙里的香火不断，每年都有许多信徒前来祈福求安，增添了这片大自然的神秘色彩。\n\n为了保护这一珍贵的自然资源，摩天岭生态区实行严格的生态保护措施，限制游客数量，确保生态平衡。生态区内的游览路线和设施也都经过精心设计，以减少对环境的干扰。这里还设有生态教育中心，通过展览、讲座和互动活动，向公众普及环境保护知识，倡导绿色生活理念。\n\n摩天岭生态区不仅是一个旅游胜地，更是一堂生动的自然课。无论是徒步旅行、野外探险，还是静静地感受大自然的美妙，这里都能带给你无尽的惊喜和感动。在摩天岭生态区，你不仅能看到最原始的自然风光，还能体验到人与自然和谐共处的美好画卷。欢迎每一位热爱自然的人来到摩天岭，探索大自然的奥秘，守护这片绿色家园。'),(2,'成头山景区','成头山景区，这里是自然奇观与人文底蕴的完美交汇地。成头山，以其壮丽的山川景色和悠久的历史文化吸引着无数游客。景区内古树参天，云雾缭绕，仿佛置身于一片世外桃源。登上山顶，壮丽的山河尽收眼底，您将感受到大自然的磅礴气势与无边美景。\n\n成头山不仅以秀美的自然风光著称，还是一处承载历史文化的宝地。景区内的古寺庙、石刻遗迹、古道等，无不诉说着千年历史的积淀与传承。在这里，您可以漫步林间小道，聆听山风低吟；也可以在寺庙中静心参禅，感悟生活的宁静与智慧。\n\n无论是亲近自然、舒缓身心，还是追寻历史的足迹，成头山景区都将为您带来一段充满惊喜与感动的旅行体验。这个秋天，邀您一同走进成头山，感受大自然的壮美与心灵的沉静，尽享属于您的惬意时光！'),(3,'神雕山自然保护区','神雕山自然保护区位于山东省荣成市，是一片以生态保护和自然景观为主的国家级自然保护区。这里地势起伏，山峰连绵，最高峰神雕峰海拔约500米，站在峰顶可以俯瞰整个保护区的壮丽景色。\n\n保护区内植被丰富，拥有多种珍稀植物，如银杏和红豆杉。每当春夏季节，花卉竞相开放，山间弥漫着花香，吸引了大量蜜蜂和蝴蝶。这里还是多种珍稀野生动物的家园，包括国家一级保护动物黑鹳、金雕和东方白鹳等。\n\n神雕山自然保护区设有多条生态旅游步道和生态教育中心，游客可以在专业导游的带领下深入林间，观赏动植物，聆听大自然的声音。此外，保护区内的神雕庙也吸引了众多信徒和游客前来祭拜和参观。\n\n神雕山自然保护区不仅是自然爱好者的天堂，也是科研人员的重要研究基地。保护区与多家科研机构合作，开展了多项生态保护和恢复项目，为生物多样性的保护和生态环境的改善做出了积极贡献。通过一系列环保措施和绿色旅游倡导，神雕山自然保护区正努力确保其可持续发展，欢迎您前来探索这片美丽而神秘的土地。'),(4,'红山生态区','红山生态区位于山东省，是一片以自然风光和生态保护为核心的区域，以其独特的红色砂岩地貌而闻名。这里山峦起伏，岩石嶙峋，风景秀丽，被誉为“天然地质博物馆”。红山的红色砂岩在阳光照射下熠熠生辉，与周围的绿树、蓝天相映成趣，形成了独特的自然景观。\n\n生态区内植被种类繁多，森林覆盖率高达70%以上。这里是多种珍稀植物的生长地，如黄栌、刺槐和栎树，每当秋季，黄栌的叶子变成绚丽的红色，与红山的岩石交相辉映，构成了一幅美丽的画卷。这里也是众多野生动物的栖息地，常见的动物有狍子、狐狸和多种鸟类。\n\n红山生态区设有多个徒步和登山路线，游客可以沿着蜿蜒的山路，穿越茂密的森林，攀登至山顶，俯瞰整个生态区的壮丽景色。生态区内还建有多个观景台和休息区，供游客驻足观赏和休息。每年，这里还举办各种自然教育和生态旅游活动，吸引了大量的自然爱好者和摄影师前来探索和记录这片美丽的土地。\n\n此外，红山生态区还积极开展生态保护和恢复工作，与多家科研机构合作，致力于保护生物多样性和改善生态环境。通过科学管理和环保宣传，红山生态区不仅成为了旅游胜地，也成为了生态保护的示范区。无论是探寻自然之美，还是学习生态知识，红山生态区都是一个不可错过的好去处。\n\n\n\n\n\n\n'),(5,'落凤岗农家乐','落凤岗村农家乐坐落于山东省的一个幽静村落，是一处能够让游客体验乡村生活和品味农家乐趣的理想去处。村庄周围绿树成荫，田园风光宜人，远离喧嚣的城市，来到这里仿佛进入了一片世外桃源。\n\n农家乐主人热情好客，为游客提供舒适的住宿和丰富的农家饭菜。游客可以选择在传统农舍里住宿，感受农村的朴实和宁静。村庄周围有着丰富的农田和果园，游客可以参与农事活动，体验农耕乐趣，亲手采摘新鲜的农产品，品尝当地的特色美食，感受农家的淳朴风情。\n\n除了农事体验，落凤岗村农家乐还提供丰富多彩的娱乐活动。游客可以参加农家乐的文化表演，欣赏民间舞蹈和音乐演奏，感受当地的民俗风情。此外，村庄周围还有许多自然景点和徒步路线，游客可以漫步乡间小道，探索周边的自然美景，享受大自然的恩赐。\n\n落凤岗村农家乐不仅是一个休闲度假的好去处，也是一个了解中国乡村文化和生活方式的绝佳机会。在这里，游客可以与自然亲近，与村民交流，体验纯朴的乡村生活，放松身心，感受大自然的魅力。');
/*!40000 ALTER TABLE `sight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sight_detail`
--

DROP TABLE IF EXISTS `sight_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sight_detail` (
  `sightid` int(11) NOT NULL,
  `imagepath` varchar(45) NOT NULL,
  `videopath` varchar(45) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sight_detail`
--

LOCK TABLES `sight_detail` WRITE;
/*!40000 ALTER TABLE `sight_detail` DISABLE KEYS */;
INSERT INTO `sight_detail` VALUES (1,'/images/sight3.jpg','/videos/video.mp4',1),(2,'/images/sight2.jpg','/videos/video.mp4',2),(3,'/images/sight3.jpg','/videos/video.mp4',3),(1,'/images/motianlingLogoCN.png','/videos/video.mp4',4),(2,'/images/chengtoushanLogoCN.png','/videos/video.mp4',5),(3,'/images/shendiaoshanLogoCN.png','/videos/video.mp4',6),(4,'/images/hongshan.jpg','/videos/video.mp4',7),(4,'/images/hongshanLogoCN.png','/videos/video.mp4',8),(5,'/images/sight2.jpg','/videos/video.mp4',9),(5,'/images/nongjialeLogoCN.png','/videos/video.mp4',10);
/*!40000 ALTER TABLE `sight_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sightcomment`
--

DROP TABLE IF EXISTS `sightcomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sightcomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bad_count` int(11) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `good_count` int(11) NOT NULL,
  `sightId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sightcomment`
--

LOCK TABLES `sightcomment` WRITE;
/*!40000 ALTER TABLE `sightcomment` DISABLE KEYS */;
INSERT INTO `sightcomment` VALUES (1,0,'不错的景点',0,5,3);
/*!40000 ALTER TABLE `sightcomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `sightid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (2,89,2),(3,58,3),(5,41,5),(6,52,4),(7,35,4),(8,78,3),(10,60,3),(11,45,3);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `telnumber` varchar(45) NOT NULL,
  `identify` int(11) NOT NULL,
  `ban` int(11) NOT NULL,
  PRIMARY KEY (`id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (3,'chengyu','836dd41181d9c281827faef57a183e1c2addddfd9b0a46568110c8e9a79cae30','male','2659681803@qq.com','13791308527',0,0),(4,'holy','836dd41181d9c281827faef57a183e1c2addddfd9b0a46568110c8e9a79cae30','other','2659681803@qq.com','13791308527',0,0),(5,'ccs','123456cy','male','2659681803@qq.com','13791308527',0,0),(6,'okok','836dd41181d9c281827faef57a183e1c2addddfd9b0a46568110c8e9a79cae30','male','2659681803@qq.com','13791308527',0,0),(7,'lll','836dd41181d9c281827faef57a183e1c2addddfd9b0a46568110c8e9a79cae30','male','2659681803@qq.com','13791308527',0,0),(8,'qiuiqu','3704f976a0ac82c4fb8be5743f07a57183a3a095b73ca3ef6f1a710db8720c53','male','2659681803@qq.com','13791308527',0,0),(9,'TEST','0d3df9c2dcf068b44b673a7ef8f07c6c9f3d19fa24addc64d658f438364b7755','male','2659681803@qq.com','13791308527',1,0);
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

-- Dump completed on 2024-10-14 16:30:51
