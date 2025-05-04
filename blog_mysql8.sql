-- MySQL dump 10.13  Distrib 5.7.24, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: blog
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `tb_article`
--

Drop DATABASE IF EXISTS blog;
CREATE Database blog;
use blog;

DROP TABLE IF EXISTS `tb_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_article` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '作者',
  `category_id` int DEFAULT NULL COMMENT '文章分类',
  `article_cover` varchar(1024) CHARACTER SET utf8 COLLATE  utf8_general_ci DEFAULT NULL COMMENT '文章缩略图',
  `article_title` varchar(50) CHARACTER SET utf8 COLLATE  utf8_general_ci NOT NULL COMMENT '标题',
  `article_content` longtext CHARACTER SET utf8 COLLATE  utf8_general_ci NOT NULL COMMENT '内容',
  `create_time` datetime DEFAULT NULL COMMENT '发表时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_top` tinyint(1) DEFAULT NULL COMMENT '是否置顶 0否 1是',
  `is_draft` tinyint(1) DEFAULT '0' COMMENT '是否为草稿 0否 1是',
  `is_delete` tinyint(1) DEFAULT '0' COMMENT '是否删除  0否 1是',
  `permalink` varchar(100) DEFAULT NULL,
  `summary` varchar(500) DEFAULT NULL COMMENT '文章摘要',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_permalink` (`permalink`),
  KEY `category_id` (`category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COLLATE= utf8_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_article`
--

LOCK TABLES `tb_article` WRITE;
/*!40000 ALTER TABLE `tb_article` DISABLE KEYS */;
INSERT INTO `tb_article` VALUES (40,2,12,'https://big-event20040810.oss-cn-beijing.aliyuncs.com/articles/1904625462542385154.jpg','测试文章','测试文章','2025-03-26 04:04:32','2025-03-27 00:48:22',0,0,0,'2025-03-26-86747',NULL),(41,1,14,'https://big-event20040810.oss-cn-beijing.aliyuncs.com/articles/1905317401767968769.png','测试文章','测试文章','2025-03-27 00:25:33','2025-04-01 02:45:35',1,0,0,'java--86774','测试文章'),(42,2,15,'https://big-event20040810.oss-cn-beijing.aliyuncs.com/articles/1904939094790684673.png','测试文章','测试文章','2025-03-27 00:48:01','2025-03-27 00:50:50',0,0,0,'vue3--api--86781',NULL),(43,2,14,'https://big-event20040810.oss-cn-beijing.aliyuncs.com/articles/1904939251720568833.png','测试文章','测试文章','2025-03-27 00:51:25',NULL,0,0,0,'spring-boot--86785',NULL),(44,2,14,'https://big-event20040810.oss-cn-beijing.aliyuncs.com/articles/1904939251720568833.png','测试文章','测试文章','2025-03-27 00:51:47',NULL,0,0,0,'2b7545b1',NULL),(45,2,14,'https://big-event20040810.oss-cn-beijing.aliyuncs.com/articles/1904939251720568833.png','测试文章','测试文章','2025-03-27 00:51:59',NULL,0,0,0,'4a8d06b0',NULL),(46,2,14,'https://big-event20040810.oss-cn-beijing.aliyuncs.com/articles/1904939251720568833.png','测试文章','测试文章','2025-03-27 00:52:02',NULL,0,0,0,'d6f4e8a5',NULL),(47,2,14,'https://big-event20040810.oss-cn-beijing.aliyuncs.com/articles/1904939251720568833.png','测试文章','测试文章','2025-03-27 00:52:05',NULL,0,0,1,NULL,NULL),(48,2,14,'https://big-event20040810.oss-cn-beijing.aliyuncs.com/articles/1904939251720568833.png','测试文章','测试文章','2025-03-27 00:52:08',NULL,0,0,1,NULL,NULL),(49,2,14,'https://big-event20040810.oss-cn-beijing.aliyuncs.com/articles/1904939251720568833.png','测试文章','测试文章','2025-03-27 00:52:10',NULL,0,0,0,'eaadf2b6',NULL),(50,2,14,'https://big-event20040810.oss-cn-beijing.aliyuncs.com/articles/1904939251720568833.png','测试文章','测试文章','2025-03-27 00:52:12',NULL,0,0,0,'9ab42687',NULL),(51,2,14,'https://big-event20040810.oss-cn-beijing.aliyuncs.com/articles/1904939251720568833.png','测试文章','测试文章','2025-03-27 00:52:24',NULL,0,0,1,NULL,NULL),(52,1,14,'https://big-event20040810.oss-cn-beijing.aliyuncs.com/articles/1904939251720568833.png','测试文章','测试文章','2025-03-27 00:52:26','2025-03-29 15:24:57',0,0,1,NULL,NULL),(53,2,14,'https://big-event20040810.oss-cn-beijing.aliyuncs.com/articles/1904939251720568833.png','测试文章','测试文章','2025-03-27 00:52:29',NULL,0,0,1,NULL,NULL),(54,2,14,'https://big-event20040810.oss-cn-beijing.aliyuncs.com/articles/1904939251720568833.png','测试文章','测试文章','2025-03-27 00:52:31',NULL,0,0,0,'8651d808',NULL),(55,2,14,'https://big-event20040810.oss-cn-beijing.aliyuncs.com/articles/1904939251720568833.png','测试文章','测试文章','2025-03-27 00:52:34',NULL,0,0,0,'30b48426',NULL),(56,2,14,'https://big-event20040810.oss-cn-beijing.aliyuncs.com/articles/1904939251720568833.png','测试文章','测试文章','2025-03-27 00:52:46',NULL,0,0,0,'-spring-boot--86838',NULL),(57,2,14,'https://big-event20040810.oss-cn-beijing.aliyuncs.com/articles/1904939251720568833.png','测试文章','测试文章','2025-03-27 00:52:48',NULL,0,0,0,'-spring-boot--86841',NULL),(58,2,NULL,'','测试文章','测试文章','2025-03-28 00:32:47',NULL,0,1,0,'2025-03-28-86844',NULL),(59,2,NULL,'','测试文章','测试文章','2025-03-28 01:24:52',NULL,0,1,0,'2025-03-28-86847',NULL),(60,2,NULL,'','测试文章','测试文章','2025-03-28 01:38:28',NULL,0,1,0,'2025-03-28-86851',NULL),(61,2,NULL,'','测试文章','测试文章','2025-03-28 01:40:15',NULL,0,1,0,'2025-03-28-86855',NULL),(62,2,NULL,'','测试文章','测试文章','2025-03-28 01:42:19',NULL,0,1,0,'2025-03-28-86858',NULL),(63,2,12,'https://big-event20040810.oss-cn-beijing.aliyuncs.com/articles/1905318595827597314.png','测试文章','测试文章','2025-03-28 01:58:48','2025-03-28 04:03:14',0,0,0,'2025-03-28-86861',NULL),(64,2,NULL,'','测试文章','测试文章','2025-03-28 02:06:05',NULL,0,1,0,'2025-03-28-86863',NULL),(65,2,NULL,'','测试文章','测试文章','2025-03-28 02:21:11',NULL,0,1,0,'2025-03-28-86866',NULL),(66,2,NULL,'','测试文章','测试文章','2025-03-28 02:22:51',NULL,0,1,0,'2025-03-28-86869',NULL),(67,2,NULL,'','测试文章','测试文章','2025-03-28 02:27:21',NULL,0,1,0,'2025-03-28-86872',NULL),(68,2,NULL,'','测试文章','测试文章','2025-03-28 02:27:38',NULL,0,1,0,'2025-03-28-86875',NULL),(69,2,NULL,'','测试文章','测试文章','2025-03-28 02:28:53',NULL,0,1,0,'2025-03-28-86877',NULL),(70,2,NULL,'','测试文章','测试文章','2025-03-28 02:34:32',NULL,0,1,0,'2025-03-28-86879',NULL),(71,2,NULL,'','测试文章','测试文章','2025-03-28 02:35:31',NULL,0,1,0,'2025-03-28-86882',NULL),(72,2,NULL,'','测试文章','测试文章','2025-03-28 03:43:09',NULL,0,1,0,'2025-03-28-86886',NULL),(73,1,14,'https://big-event20040810.oss-cn-beijing.aliyuncs.com/articles/1905670601704534017.ico','测试文章','测试文章','2025-03-29 01:17:35','2025-04-01 02:22:51',0,0,0,'2025-03-29-86888','测试文章'),(74,1,NULL,'','测试文章','测试文章','2025-03-29 17:49:50',NULL,0,1,0,'2025-03-29-86890',NULL),(75,1,15,'https://big-event20040810.oss-cn-beijing.aliyuncs.com/articles/1906776926794579970.png','测试文章','测试文章','2025-04-01 02:33:41','2025-04-01 02:41:44',0,0,0,NULL,'测试文章');
/*!40000 ALTER TABLE `tb_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_article_tag`
--

DROP TABLE IF EXISTS `tb_article_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_article_tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `article_id` int NOT NULL COMMENT '文章id',
  `tag_id` int NOT NULL COMMENT '标签id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_article_tag_1` (`article_id`) USING BTREE,
  KEY `fk_article_tag_2` (`tag_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=384 DEFAULT CHARSET=utf8 COLLATE= utf8_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_article_tag`
--

LOCK TABLES `tb_article_tag` WRITE;
/*!40000 ALTER TABLE `tb_article_tag` DISABLE KEYS */;
INSERT INTO `tb_article_tag` VALUES (278,31,18),(279,35,18),(280,33,18),(281,36,18),(282,37,18),(283,38,18),(294,40,18),(295,42,20),(296,42,19),(297,43,19),(298,44,19),(299,45,19),(300,46,19),(301,47,19),(302,48,19),(303,49,19),(304,50,19),(305,51,19),(307,53,19),(308,54,19),(309,55,19),(310,56,19),(311,57,19),(365,63,18),(369,52,19),(377,73,28),(382,75,18),(383,41,19);
/*!40000 ALTER TABLE `tb_article_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_category`
--

DROP TABLE IF EXISTS `tb_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(20) CHARACTER SET utf8 COLLATE  utf8_general_ci NOT NULL COMMENT '分类名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE= utf8_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_category`
--

LOCK TABLES `tb_category` WRITE;
/*!40000 ALTER TABLE `tb_category` DISABLE KEYS */;
INSERT INTO `tb_category` VALUES (12,'测试分类1','2021-03-20 22:02:43'),(14,'Java','2025-03-27 00:25:42'),(15,'vue','2025-03-27 00:48:12'),(16,'111','2025-03-27 16:40:19');
/*!40000 ALTER TABLE `tb_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_chat_record`
--

DROP TABLE IF EXISTS `tb_chat_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_chat_record` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int DEFAULT NULL COMMENT '用户id',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE  utf8_general_ci DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE  utf8_general_ci DEFAULT NULL COMMENT '头像',
  `content` varchar(5000) CHARACTER SET utf8 COLLATE  utf8_general_ci DEFAULT NULL COMMENT '聊天内容',
  `ip_addr` varchar(50) CHARACTER SET utf8 COLLATE  utf8_general_ci DEFAULT NULL COMMENT 'ip地址',
  `ip_source` varchar(255) CHARACTER SET utf8 COLLATE  utf8_general_ci DEFAULT NULL COMMENT 'ip来源',
  `type` tinyint DEFAULT NULL COMMENT '类型',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1293 DEFAULT CHARSET=utf8 COLLATE= utf8_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_chat_record`
--

LOCK TABLES `tb_chat_record` WRITE;
/*!40000 ALTER TABLE `tb_chat_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_chat_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_comment`
--

DROP TABLE IF EXISTS `tb_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '评论用户Id',
  `article_id` int DEFAULT NULL COMMENT '评论文章id',
  `comment_content` text CHARACTER SET utf8 COLLATE  utf8_general_ci NOT NULL COMMENT '评论内容',
  `create_time` datetime NOT NULL COMMENT '评论时间',
  `reply_id` int DEFAULT NULL COMMENT '回复用户id',
  `parent_id` int DEFAULT NULL COMMENT '父评论id',
  `is_delete` tinyint DEFAULT '0' COMMENT '是否删除  0否 1是',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_comment_user` (`user_id`) USING BTREE,
  KEY `fk_comment_article` (`article_id`) USING BTREE,
  KEY `fk_comment_parent` (`parent_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=290 DEFAULT CHARSET=utf8 COLLATE= utf8_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_comment`
--

LOCK TABLES `tb_comment` WRITE;
/*!40000 ALTER TABLE `tb_comment` DISABLE KEYS */;
INSERT INTO `tb_comment` VALUES (264,1,31,'测试评论<img src= \'https://www.static.talkxj.com/emoji/goutou.jpg\' width=\'22\'height=\'20\' style=\'padding: 0 1px\'/>','2021-03-20 23:41:53',NULL,NULL,0),(265,1,NULL,'test','2025-03-26 01:23:55',NULL,NULL,0),(266,2,41,'测试评论<img src= \'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEgAAABICAMAAABiM0N1AAAAVFBMVEVHcEz/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE2ziSdwTQVmRQDPojX1xEifeB2MZxPsu0ODXg55VgrZqjrGmTCWbxjisz+dUJF3AAAADXRSTlMA36/PgFCPIJ/vQL9g4e8akwAAAbpJREFUeF7tmNluwyAQRcGJWWxfvGfr//9nrTQuSsCYTEftS4+Ul4l0NQx4NpFAN6qWeCBr1WhBoDQSAdKU4i20stjAqny/qgJJiirPG4NdTIZXR4sM7HHPnQMyOSSdKi2ysWXiWHiLzeMZvIlJ6DAoGRAwe/Ghx6kEkZe70xZE7PN7OoDMIQgQlWPiYNTDGQSQ3kCFH7LmpzCP9eeuO/fItRePCIU63Z0+146vKCm8MLTdnXbIswPqLhRcmeseuDw7YOMfx2kVOu3YPWX07rtvEvbwBciE0Jy2e2RwZ0SPoEXDI9QIBY5gQ4kaoF+/p/axpj1IH20AhE8kxAsRP1ovROCvhf6FJFiQogYLtVBgQYkGLDRCgwUteKItNwp/2/bYoG/bjfJfIppsbzMizLflr62+zSJg7Bam62tiu07dwogAGy/ZwLwm59FdFj6WnxtPvhbFS7ZGIm2HOIRo39aEh9tgREiRarTGfB1Uydavb0OZ+KswO83o4M7PMmc37HXaR8S5uGmtZZO7IM6Rq2FnHSH4hxr6mMU4+NGV+Idawzyu8y8Q6CsN/iULfe3DtYjiX43xL+vY1oefIwTWrJDpq5sAAAAASUVORK5CYII=\' width=\'22\'height=\'20\' style=\'padding: 0 1px\'/>','2025-03-27 00:28:45',280,NULL,0),(267,2,NULL,'1112','2025-03-27 01:00:06',NULL,NULL,0),(268,2,NULL,'1','2025-03-27 01:00:44',NULL,NULL,0),(269,2,NULL,'12是<img src= \'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEgAAABICAMAAABiM0N1AAAAVFBMVEVHcEz/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE2ziSdwTQVmRQDPojX1xEifeB2MZxPsu0ODXg55VgrZqjrGmTCWbxjisz+dUJF3AAAADXRSTlMA36/PgFCPIJ/vQL9g4e8akwAAAbpJREFUeF7tmNluwyAQRcGJWWxfvGfr//9nrTQuSsCYTEftS4+Ul4l0NQx4NpFAN6qWeCBr1WhBoDQSAdKU4i20stjAqny/qgJJiirPG4NdTIZXR4sM7HHPnQMyOSSdKi2ysWXiWHiLzeMZvIlJ6DAoGRAwe/Ghx6kEkZe70xZE7PN7OoDMIQgQlWPiYNTDGQSQ3kCFH7LmpzCP9eeuO/fItRePCIU63Z0+146vKCm8MLTdnXbIswPqLhRcmeseuDw7YOMfx2kVOu3YPWX07rtvEvbwBciE0Jy2e2RwZ0SPoEXDI9QIBY5gQ4kaoF+/p/axpj1IH20AhE8kxAsRP1ovROCvhf6FJFiQogYLtVBgQYkGLDRCgwUteKItNwp/2/bYoG/bjfJfIppsbzMizLflr62+zSJg7Bam62tiu07dwogAGy/ZwLwm59FdFj6WnxtPvhbFS7ZGIm2HOIRo39aEh9tgREiRarTGfB1Uydavb0OZ+KswO83o4M7PMmc37HXaR8S5uGmtZZO7IM6Rq2FnHSH4hxr6mMU4+NGV+Idawzyu8y8Q6CsN/iULfe3DtYjiX43xL+vY1oefIwTWrJDpq5sAAAAASUVORK5CYII=\' width=\'22\'height=\'20\' style=\'padding: 0 1px\'/>','2025-03-27 01:01:21',268,267,0),(270,2,NULL,'111','2025-03-27 11:20:08',NULL,NULL,0),(271,2,NULL,'22','2025-03-27 11:33:58',NULL,NULL,0),(272,2,56,'111','2025-03-27 11:34:08',NULL,NULL,0),(273,2,57,'44','2025-03-27 11:37:02',NULL,NULL,0),(274,2,NULL,'<img src= \'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEgAAABICAMAAABiM0N1AAAAVFBMVEVHcEz/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE2ziSdwTQVmRQDPojX1xEifeB2MZxPsu0ODXg55VgrZqjrGmTCWbxjisz+dUJF3AAAADXRSTlMA36/PgFCPIJ/vQL9g4e8akwAAAbpJREFUeF7tmNluwyAQRcGJWWxfvGfr//9nrTQuSsCYTEftS4+Ul4l0NQx4NpFAN6qWeCBr1WhBoDQSAdKU4i20stjAqny/qgJJiirPG4NdTIZXR4sM7HHPnQMyOSSdKi2ysWXiWHiLzeMZvIlJ6DAoGRAwe/Ghx6kEkZe70xZE7PN7OoDMIQgQlWPiYNTDGQSQ3kCFH7LmpzCP9eeuO/fItRePCIU63Z0+146vKCm8MLTdnXbIswPqLhRcmeseuDw7YOMfx2kVOu3YPWX07rtvEvbwBciE0Jy2e2RwZ0SPoEXDI9QIBY5gQ4kaoF+/p/axpj1IH20AhE8kxAsRP1ovROCvhf6FJFiQogYLtVBgQYkGLDRCgwUteKItNwp/2/bYoG/bjfJfIppsbzMizLflr62+zSJg7Bam62tiu07dwogAGy/ZwLwm59FdFj6WnxtPvhbFS7ZGIm2HOIRo39aEh9tgREiRarTGfB1Uydavb0OZ+KswO83o4M7PMmc37HXaR8S5uGmtZZO7IM6Rq2FnHSH4hxr6mMU4+NGV+Idawzyu8y8Q6CsN/iULfe3DtYjiX43xL+vY1oefIwTWrJDpq5sAAAAASUVORK5CYII=\' width=\'22\'height=\'20\' style=\'padding: 0 1px\'/><img src= \'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEgAAABICAMAAABiM0N1AAAAVFBMVEVHcEz/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE2ziSdwTQVmRQDPojX1xEifeB2MZxPsu0ODXg55VgrZqjrGmTCWbxjisz+dUJF3AAAADXRSTlMA36/PgFCPIJ/vQL9g4e8akwAAAbpJREFUeF7tmNluwyAQRcGJWWxfvGfr//9nrTQuSsCYTEftS4+Ul4l0NQx4NpFAN6qWeCBr1WhBoDQSAdKU4i20stjAqny/qgJJiirPG4NdTIZXR4sM7HHPnQMyOSSdKi2ysWXiWHiLzeMZvIlJ6DAoGRAwe/Ghx6kEkZe70xZE7PN7OoDMIQgQlWPiYNTDGQSQ3kCFH7LmpzCP9eeuO/fItRePCIU63Z0+146vKCm8MLTdnXbIswPqLhRcmeseuDw7YOMfx2kVOu3YPWX07rtvEvbwBciE0Jy2e2RwZ0SPoEXDI9QIBY5gQ4kaoF+/p/axpj1IH20AhE8kxAsRP1ovROCvhf6FJFiQogYLtVBgQYkGLDRCgwUteKItNwp/2/bYoG/bjfJfIppsbzMizLflr62+zSJg7Bam62tiu07dwogAGy/ZwLwm59FdFj6WnxtPvhbFS7ZGIm2HOIRo39aEh9tgREiRarTGfB1Uydavb0OZ+KswO83o4M7PMmc37HXaR8S5uGmtZZO7IM6Rq2FnHSH4hxr6mMU4+NGV+Idawzyu8y8Q6CsN/iULfe3DtYjiX43xL+vY1oefIwTWrJDpq5sAAAAASUVORK5CYII=\' width=\'22\'height=\'20\' style=\'padding: 0 1px\'/><img src= \'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEgAAABICAMAAABiM0N1AAAAVFBMVEVHcEz/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE2ziSdwTQVmRQDPojX1xEifeB2MZxPsu0ODXg55VgrZqjrGmTCWbxjisz+dUJF3AAAADXRSTlMA36/PgFCPIJ/vQL9g4e8akwAAAbpJREFUeF7tmNluwyAQRcGJWWxfvGfr//9nrTQuSsCYTEftS4+Ul4l0NQx4NpFAN6qWeCBr1WhBoDQSAdKU4i20stjAqny/qgJJiirPG4NdTIZXR4sM7HHPnQMyOSSdKi2ysWXiWHiLzeMZvIlJ6DAoGRAwe/Ghx6kEkZe70xZE7PN7OoDMIQgQlWPiYNTDGQSQ3kCFH7LmpzCP9eeuO/fItRePCIU63Z0+146vKCm8MLTdnXbIswPqLhRcmeseuDw7YOMfx2kVOu3YPWX07rtvEvbwBciE0Jy2e2RwZ0SPoEXDI9QIBY5gQ4kaoF+/p/axpj1IH20AhE8kxAsRP1ovROCvhf6FJFiQogYLtVBgQYkGLDRCgwUteKItNwp/2/bYoG/bjfJfIppsbzMizLflr62+zSJg7Bam62tiu07dwogAGy/ZwLwm59FdFj6WnxtPvhbFS7ZGIm2HOIRo39aEh9tgREiRarTGfB1Uydavb0OZ+KswO83o4M7PMmc37HXaR8S5uGmtZZO7IM6Rq2FnHSH4hxr6mMU4+NGV+Idawzyu8y8Q6CsN/iULfe3DtYjiX43xL+vY1oefIwTWrJDpq5sAAAAASUVORK5CYII=\' width=\'22\'height=\'20\' style=\'padding: 0 1px\'/><img src= \'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEgAAABICAMAAABiM0N1AAAAVFBMVEVHcEz/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE2ziSdwTQVmRQDPojX1xEifeB2MZxPsu0ODXg55VgrZqjrGmTCWbxjisz+dUJF3AAAADXRSTlMA36/PgFCPIJ/vQL9g4e8akwAAAbpJREFUeF7tmNluwyAQRcGJWWxfvGfr//9nrTQuSsCYTEftS4+Ul4l0NQx4NpFAN6qWeCBr1WhBoDQSAdKU4i20stjAqny/qgJJiirPG4NdTIZXR4sM7HHPnQMyOSSdKi2ysWXiWHiLzeMZvIlJ6DAoGRAwe/Ghx6kEkZe70xZE7PN7OoDMIQgQlWPiYNTDGQSQ3kCFH7LmpzCP9eeuO/fItRePCIU63Z0+146vKCm8MLTdnXbIswPqLhRcmeseuDw7YOMfx2kVOu3YPWX07rtvEvbwBciE0Jy2e2RwZ0SPoEXDI9QIBY5gQ4kaoF+/p/axpj1IH20AhE8kxAsRP1ovROCvhf6FJFiQogYLtVBgQYkGLDRCgwUteKItNwp/2/bYoG/bjfJfIppsbzMizLflr62+zSJg7Bam62tiu07dwogAGy/ZwLwm59FdFj6WnxtPvhbFS7ZGIm2HOIRo39aEh9tgREiRarTGfB1Uydavb0OZ+KswO83o4M7PMmc37HXaR8S5uGmtZZO7IM6Rq2FnHSH4hxr6mMU4+NGV+Idawzyu8y8Q6CsN/iULfe3DtYjiX43xL+vY1oefIwTWrJDpq5sAAAAASUVORK5CYII=\' width=\'22\'height=\'20\' style=\'padding: 0 1px\'/>','2025-03-27 13:41:37',NULL,NULL,0),(275,2,NULL,'<img src= \'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEgAAABICAMAAABiM0N1AAAAk1BMVEVHcEzaL0faL0faL0faL0faL0faL0faL0faL0faL0faL0faL0faL0faL0eCLz0pLzNKLzdVLziuL0LPL0ajL0FgLzmYL0BrLzvEL0V2Lzw0LzS5L0M/LzaNLz5RVlmHiow2PEBscHOUl5l5fYC8vr9fY2ahpKbKy8z///9ESU3X2Nny8vLk5eavsbMpLzMpLzMpLzOzKzDcAAAAMXRSTlMAIGCPv9//UJ/vQK+Az///////////////////////////////////////////IK/v+L0AlAAAAxdJREFUeAGk00WiACAIBNDBGMG4/3F/d1i8vdKYkBBT5pucYhBcKJr5S9aCIxKN/7Ao2FUbp1rFDlEuqWCpGzdYx5wMbhqCiWLcZmVSFo90/EN5SGf/+H9SXtBJf5x9KrxU8I0YL5ngq8Frw9+gN/22sElxShfFm0qnileNTg0vhG6CZ5FuEc+MbvbjOB45Kw8Ui2EYiG5JtFTJNT33P+b2r5+BIe3RH2FMRsZS+yZETVl2yEVjsG9UnA+cvTm1y0LJXTUHb0CLQU4/uHeG3hwIanFmahiVBcijAQpze4NPUypaJ/tnKrKhPH3VkrDINzr8uZJD1fub6QVoiM1+to0PN7qa2Bwa73qLkkJpN9u2hRD2g4IQSBA/XUn4UVA2J6O9HzRwe/3X9iyyX3bglgftjV+55UE7F3LK3NKgltliv5R9ixeyEUZZzJaya5Hm/ouNvOMzcp+3u8uILCRvO2m8iCbvevP4j3aD0R9/X0er3WL1dfRYkMsX32WBxDYMRNFmoNz+C3QMK9hny+r9j9eR5KQqvjD4zYJhpcGyblp3NbbVQnuNpsZu4+uUPQbdfBsXyOmSrRsnHdA9J+CSgRqF0l4CjXPTYLpkP2aRCilxSdJKcdi3gqsB3L4cYZ1Fj2ms0Q0o4CO2rBMzSJMoQZbAJtGnedC6y1DBnNNWKXMZhBbQJNrg2gKESfRxHv3U4CfSUYCrwjKLlKHAqZve+3kYVWPt0VzUFpGW6HWBqlk0il033czDaB+PNciYRgyDCodmUYbRzN267LdVxJcuWswu3MBsU+eAukcPL1Fq0ZxQl7sH88Dek5Mk44WpEykBII++9y+2UT1KD7UnNvHujgjMucxGcgns4ozw3LO9l3kpPPv2x4JUnQVkZN04ZYN0wCIlS5KPtwXY1Xjzd1HCFTE9P2G6OJ3SU2P0zE8aZfmb6Ls6RpSTNDAuaQewV9fqkAQD+09Emy29r4PFW/ipjoN9758Uons+pOw/JofVIH1+soA+hkF6BuSYY6DHgGmSPhnu0aN8kIX6wz6UD0RRPjRGl8E6yocPAfl1xtr+W9WPAAAAAElFTkSuQmCC\' width=\'22\'height=\'20\' style=\'padding: 0 1px\'/>','2025-03-27 13:41:44',NULL,NULL,0),(276,2,NULL,'<img src= \'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEgAAABICAMAAABiM0N1AAAAvVBMVEVHcEz/y0xkqt1kqt3/y0z/y0z/y0z/y0z/y0z/y0xkqt3/y0y2vJH/y0z/y0ydtqhkqt3/y0xkqt1kqt1kqt1kqt1kqt1lRxv/y0xkqt1vTx71xErFmjqQbCnZqkCfeS2yo43su0biskNrqtP///+CYCSogTCyiTRyVCaOd1bi3dR4XjjnxmPPoj28kTfJwH9lY1PFuqqFr7z19PFmfobs6OOwtZ2hjWvZ0cZlUzN+fmt3rs9knMKCakaomH+0sCqFAAAAF3RSTlMA33spgElgIJ/vTc/+j7/9va/vn9+Pz1Lta7YAAAPpSURBVHjapZjXeuIwEEYhFNMCIWFX414xvaWX3X3/x1pLLmMzUkyScwucSP8U53PjE7RuezyEjOa43dUa36DTawKh2et8zaJd90FB/1q7/DBT+JTpZcfSelBLT2u0Br9uZvrtzVVL4Wn3oZ7DZKYX3EmPMwQZlsHckiXUK9zSQ3Xlx9mxhAA429EHGpSmNkgJDC5yuGaiS/ld9ShSNufcM08097qKAfVQYuExYaSrmV3gcbjH8NEjpUXyIYiL7QAOn4quinqBAot7bEiYXCLSlG245BczhfLxAtEQENpCCwA/Nhh7rBW1QYUtDuS7THAMlfWvuZjJEtwFy9moWolUXha1kVmWcQCSLsDB7YASlxXYFnCwv+mwTUGJXWgcKBiFioRATaYxrKr+rHwHTYiua0W2CWX2jL2VVOEBroWoXyfay7bK2316wT8jE6BPopb1tUWGj7OJVm/H4/Et/biDtZcT2LZDtorgNfKYYA4JvUTUhC/hMMG/KBcxHwCapGZ1mEZ6sQchwgg1+f6obax1hCKxY7p0Xik0IC9KeMmbDBLajTE5vOXafLAC6egJVhFnxUohjc830Q6HAggBywPiLFmGI9Ku/kX+oVLkp0Ev18LzxHJ2kFAWOXNWwpE83wSnSHBiOYuqyIxZGYt6MGiMiIqC7HuGa+B8SQr/knkemFy0M1LNwlzIA3KxYIJnucgq9oUvfKbC8/chF21QtC+JDPHzXf4Lq9ZzqpQFRWKMfV5ivBj1LJ+inA0RNfNv2mYxA47Csy48HisBCcN8RAIH4HligkEPZNrE85Q1Li6kMQ4tf2KFYhB3pH8KD/YQ4oqhxTWyDfkG5r+ozoXE49HW7eJim+h6aoqrm556XlkFka1WrNqtnvLIArI3sO6cdREQRtTE5f+sZ7wDEks8D38ZvVmveByZYS4Kt+cxs5XCg0PQKR6QB73gHlIcg+GcyjxYsz4+su91ZITX4ngKD+7Z7JGtZVEjW9wqbHmKkDXxxJDWTDDNo8bL7fNrbdYR8irqRROaCo2I+0Ov8M4wZtKHpGQiakFvq1f5I4nnaUU9NqS1z9HIP4aP5Fpedi16sb7WKLg5F4X8/4TStU4bJiGAdF4RnXDcvGLNn1FDAxo2kAEVfRTRnDAb6hEXQ650yvs/z/NeVpiMzCP2R43oyAjUgwFh1rK6qTECwMr/QGSb6PmByLCAeL6TUWwC5lOlRT2h6jSxDyn9boMyI6KJNWeUuWVCxhD7R96RuG/9vW2UJS5aoN9uyLk7Ex0gxXd2i4S945y/9iFITYfvvIiilbsd/OjVWOvuVmhmVz9/WdcaDAYtxevDYc3rw/9x8rWZSkmNEwAAAABJRU5ErkJggg==\' width=\'22\'height=\'20\' style=\'padding: 0 1px\'/>','2025-03-27 13:42:19',NULL,NULL,0),(277,2,NULL,'222\n','2025-03-27 13:46:07',NULL,NULL,0),(278,2,NULL,'<img src= \'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEgAAABICAMAAABiM0N1AAAAolBMVEVHcEz/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE1drexdrexdrexdrez/zE1mRQBdrez1xEjPojVwTQWpgCJ5VgqDXg7ZqjrGmTCfeB2ziSeMZxNnr+L1ylfsu0OGtcSku6Z7s868kSuaubDhxmuWbxjisz+4vpPryGGwo2LXxHVxsdiuvZ1fk7FieXZeoM9lUh5kXztghpQxividAAAAEXRSTlMAUGC/j9+AIJ/vz0Cvz48gEGIX8nkAAAKESURBVHhetZjnjuMgEIBJArFJvNkb3NN7tl0t7/9qd0KwazPGYay77y/SpylgM7AeojGfCDCICR9HbACjWABCxCOaJeISPEgeHtc8gV6SeVg0MdwlDohqKiEAOb0XzgwCmfUGNZIQjBz1pAUkvOnFQCSmeOgm7KGbcH2G12kEA3F6F0kYiGzvp/Y+zFbrSim1AYeNUqparzJoMvMW6HmtDOCgDOtnVCac2OFJKb/I8nRwkkOdvxRG4knNUlw69sAcLJkNpyrzZQaIbJmXlQ3qY31uRMm7p8Y1sOAa1u+mxFTI8WyRBqm2jinSIg6G2lTGA65WDQauRbZlpfasIIiVNpW2cc3DkVkPxZQ1DkpsRcZDMjV3gGjkXQKBslFPoXuGyCulqhwoKxEbd3iUJqesjBlHnsyckiILXwHOJuA9UZvwFZgwgUS1FdXhKyAYIEI+I4DoFR0CViz/PyK6aHixsYje/iARfUNi0fAjAkz8m0Mr0BEZyIRxwNx2uxvQ4F2fkf0uTXd7IDFmESCO6V+OQCJiuNovqeYFCAj98UeJaUjJxR13tWtquFLvbbLdsfSdGwAs9ZVLVesl9CDNL9uptOVof/J3rwTcXCIafE4bvBWqQZH39EyToIAM31QbX3qJHfRQQJZfbVFxgE7meHi4tkW/VZutp/foMvqaOvwMSE5GeH746oq+O6InwEw7LuxfXNGPy9JwKfVWAMSsY4S4pYgbfJBtiqIrMTzUnLDoRBpqbJnOWHSmj6MxQNrBkBHSJ6IPtUSR9WCIoinz8eApNvkBYeFpP/lJ4xGLXkmPLP6QTgOffT45VTrvSQ9R2IQ99KexBcpr6GPd40JH9bB4JD0f/gFEQCDwt7/hgwAAAABJRU5ErkJggg==\' width=\'22\'height=\'20\' style=\'padding: 0 1px\'/><img src= \'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEgAAABICAMAAABiM0N1AAAAolBMVEVHcEz/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE1drexdrexdrexdrez/zE1mRQBdrez1xEjPojVwTQWpgCJ5VgqDXg7ZqjrGmTCfeB2ziSeMZxNnr+L1ylfsu0OGtcSku6Z7s868kSuaubDhxmuWbxjisz+4vpPryGGwo2LXxHVxsdiuvZ1fk7FieXZeoM9lUh5kXztghpQxividAAAAEXRSTlMAUGC/j9+AIJ/vz0Cvz48gEGIX8nkAAAKESURBVHhetZjnjuMgEIBJArFJvNkb3NN7tl0t7/9qd0KwazPGYay77y/SpylgM7AeojGfCDCICR9HbACjWABCxCOaJeISPEgeHtc8gV6SeVg0MdwlDohqKiEAOb0XzgwCmfUGNZIQjBz1pAUkvOnFQCSmeOgm7KGbcH2G12kEA3F6F0kYiGzvp/Y+zFbrSim1AYeNUqparzJoMvMW6HmtDOCgDOtnVCac2OFJKb/I8nRwkkOdvxRG4knNUlw69sAcLJkNpyrzZQaIbJmXlQ3qY31uRMm7p8Y1sOAa1u+mxFTI8WyRBqm2jinSIg6G2lTGA65WDQauRbZlpfasIIiVNpW2cc3DkVkPxZQ1DkpsRcZDMjV3gGjkXQKBslFPoXuGyCulqhwoKxEbd3iUJqesjBlHnsyckiILXwHOJuA9UZvwFZgwgUS1FdXhKyAYIEI+I4DoFR0CViz/PyK6aHixsYje/iARfUNi0fAjAkz8m0Mr0BEZyIRxwNx2uxvQ4F2fkf0uTXd7IDFmESCO6V+OQCJiuNovqeYFCAj98UeJaUjJxR13tWtquFLvbbLdsfSdGwAs9ZVLVesl9CDNL9uptOVof/J3rwTcXCIafE4bvBWqQZH39EyToIAM31QbX3qJHfRQQJZfbVFxgE7meHi4tkW/VZutp/foMvqaOvwMSE5GeH746oq+O6InwEw7LuxfXNGPy9JwKfVWAMSsY4S4pYgbfJBtiqIrMTzUnLDoRBpqbJnOWHSmj6MxQNrBkBHSJ6IPtUSR9WCIoinz8eApNvkBYeFpP/lJ4xGLXkmPLP6QTgOffT45VTrvSQ9R2IQ99KexBcpr6GPd40JH9bB4JD0f/gFEQCDwt7/hgwAAAABJRU5ErkJggg==\' width=\'22\'height=\'20\' style=\'padding: 0 1px\'/><img src= \'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEgAAABICAMAAABiM0N1AAAAolBMVEVHcEz/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE1drexdrexdrexdrez/zE1mRQBdrez1xEjPojVwTQWpgCJ5VgqDXg7ZqjrGmTCfeB2ziSeMZxNnr+L1ylfsu0OGtcSku6Z7s868kSuaubDhxmuWbxjisz+4vpPryGGwo2LXxHVxsdiuvZ1fk7FieXZeoM9lUh5kXztghpQxividAAAAEXRSTlMAUGC/j9+AIJ/vz0Cvz48gEGIX8nkAAAKESURBVHhetZjnjuMgEIBJArFJvNkb3NN7tl0t7/9qd0KwazPGYay77y/SpylgM7AeojGfCDCICR9HbACjWABCxCOaJeISPEgeHtc8gV6SeVg0MdwlDohqKiEAOb0XzgwCmfUGNZIQjBz1pAUkvOnFQCSmeOgm7KGbcH2G12kEA3F6F0kYiGzvp/Y+zFbrSim1AYeNUqparzJoMvMW6HmtDOCgDOtnVCac2OFJKb/I8nRwkkOdvxRG4knNUlw69sAcLJkNpyrzZQaIbJmXlQ3qY31uRMm7p8Y1sOAa1u+mxFTI8WyRBqm2jinSIg6G2lTGA65WDQauRbZlpfasIIiVNpW2cc3DkVkPxZQ1DkpsRcZDMjV3gGjkXQKBslFPoXuGyCulqhwoKxEbd3iUJqesjBlHnsyckiILXwHOJuA9UZvwFZgwgUS1FdXhKyAYIEI+I4DoFR0CViz/PyK6aHixsYje/iARfUNi0fAjAkz8m0Mr0BEZyIRxwNx2uxvQ4F2fkf0uTXd7IDFmESCO6V+OQCJiuNovqeYFCAj98UeJaUjJxR13tWtquFLvbbLdsfSdGwAs9ZVLVesl9CDNL9uptOVof/J3rwTcXCIafE4bvBWqQZH39EyToIAM31QbX3qJHfRQQJZfbVFxgE7meHi4tkW/VZutp/foMvqaOvwMSE5GeH746oq+O6InwEw7LuxfXNGPy9JwKfVWAMSsY4S4pYgbfJBtiqIrMTzUnLDoRBpqbJnOWHSmj6MxQNrBkBHSJ6IPtUSR9WCIoinz8eApNvkBYeFpP/lJ4xGLXkmPLP6QTgOffT45VTrvSQ9R2IQ99KexBcpr6GPd40JH9bB4JD0f/gFEQCDwt7/hgwAAAABJRU5ErkJggg==\' width=\'22\'height=\'20\' style=\'padding: 0 1px\'/>','2025-03-27 13:46:13',NULL,NULL,0),(279,2,41,'<img src= \'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEgAAABICAMAAABiM0N1AAAAilBMVEVHcEz92Ij92Ij92Ij92Ij92Ij92Ij92Ij92Ij92Ij92Ij92Ij92Ij92Ij92Ij92Ij92Ij/rDP/rDP/rDP/rDP/rDP/rDP/rDP/rDP/rDP/rDP/rDP/rDP/rDP/rDP/rDP/rDP/sj7/tEP90Hj+v1j91YP/rzj+zXP9033+xWP/t0j+yGj+uk7+ym0lGjnAAAAAInRSTlMAIGCfv//fjzBQgBCvz+9wQDCfv2AQ7/+AcN/PII+vQFCA8t6qWgAAAmVJREFUeAHt1wVy5DAQBdAvaPMYBqwwJ8v3v97Go4BL1nTLWyned4Bf/dsoxChtLHmZzbXCv9GWAlleYLUyo5isUlijbuhoY6ojO4s1K6KKDRG1ppxHl/lHWKNSc1qitqoRKvKWPFMn9doQWYUondFR20HWEFXyVbBiv5JIg6N9wbYEL6Mq8Zrm4GiyEJV+qA23802rIKstTbICpyhfTJb7RZ1M6toaaTSf1BikKlsuKSuRrOCSCILEpNpijZImWY2F3iBG2PgmElRhnZwmuRgkszQpEVCrg2q/cIVAhbV6mtj0IGFNXZiP1eqMXoWPlsZ6JU1MEA8ec+UUWMN2t0/bdwPOYXTOnX3BSOfu1UXaSAaMSze5giCTRrpyR+cQdDSp2GaTSwgUTTKhWUq3DU0KnDA4T+5W8Z/Ma/fmBoKe73bh3h3Aq+lIMc28PQR0pJlm3k3atnOpmRvTnhKLmFs3c5cUlMG7HV2aa4RaOoKXmBNZfk3e/MmSRd4sJX3RRIa8tTvaxr5uPsi72rkE413kk+QFLw7e7goBTcsgDJeOd4/TOTZ4MhgPj2R6zNU5fTDw5J0/PdOrzJQqPOlEH9rDjYt6+UYfWjuZp0RfI+fRWs/Es1jYR4NIoLEQ7/adWBmWXNQPYpVYuHNRP4nTYGnr4rhtRw9do4v7RSe1BfuSDfw+PU8hfD7cOL+AL3RCU0ufj5sD9rOifygmK6UP43gevBC2pWkXrTTzM+NdDmHXEUDRGfsxS9Mp+WfmOvJCGACv6Pu+Bi/2Qj3chJ8PmZ9odwgLj36iFYYLv+XAcOnbrnFA6L+/o4hmrXkDsOEAAAAASUVORK5CYII=\' width=\'22\'height=\'20\' style=\'padding: 0 1px\'/>','2025-03-27 13:49:44',280,281,0),(280,2,41,'哈哈哈','2025-03-27 13:52:58',NULL,NULL,0),(281,2,41,'111','2025-03-27 13:54:00',NULL,NULL,0),(282,2,41,'<img src= \'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEgAAABICAMAAABiM0N1AAAAVFBMVEVHcEz/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE2ziSdwTQVmRQDPojX1xEifeB2MZxPsu0ODXg55VgrZqjrGmTCWbxjisz+dUJF3AAAADXRSTlMA36/PgFCPIJ/vQL9g4e8akwAAAbpJREFUeF7tmNluwyAQRcGJWWxfvGfr//9nrTQuSsCYTEftS4+Ul4l0NQx4NpFAN6qWeCBr1WhBoDQSAdKU4i20stjAqny/qgJJiirPG4NdTIZXR4sM7HHPnQMyOSSdKi2ysWXiWHiLzeMZvIlJ6DAoGRAwe/Ghx6kEkZe70xZE7PN7OoDMIQgQlWPiYNTDGQSQ3kCFH7LmpzCP9eeuO/fItRePCIU63Z0+146vKCm8MLTdnXbIswPqLhRcmeseuDw7YOMfx2kVOu3YPWX07rtvEvbwBciE0Jy2e2RwZ0SPoEXDI9QIBY5gQ4kaoF+/p/axpj1IH20AhE8kxAsRP1ovROCvhf6FJFiQogYLtVBgQYkGLDRCgwUteKItNwp/2/bYoG/bjfJfIppsbzMizLflr62+zSJg7Bam62tiu07dwogAGy/ZwLwm59FdFj6WnxtPvhbFS7ZGIm2HOIRo39aEh9tgREiRarTGfB1Uydavb0OZ+KswO83o4M7PMmc37HXaR8S5uGmtZZO7IM6Rq2FnHSH4hxr6mMU4+NGV+Idawzyu8y8Q6CsN/iULfe3DtYjiX43xL+vY1oefIwTWrJDpq5sAAAAASUVORK5CYII=\' width=\'22\'height=\'20\' style=\'padding: 0 1px\'/><img src= \'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEgAAABICAMAAABiM0N1AAAAwFBMVEVHcExdrexdrexdrez/zE3+zE7/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE1drez/zE1drezbxXBdreyziSj/zE1mRQD1xEiMZxNwTQXsu0PZqjryylqku6bisz////92stOMdECfeB3GmTBkrOGDXg6+u46WbxhlVCK8kSuzooCuvZ2pgCJghZDPojXi3M/Z0b/Lv6fMwn/cxXCCiG+aubDx7ueo0/WJxPJ5Vw6DaDCWf1BeoM9ieXZic2dfmsB8zBAYAAAAE3RSTlMAgM8Y349QIJ/vv2BAr8+PgHCPJC8E5gAAAyNJREFUeF6tmNd2ozAQQAkGG1yS7KrQXXsv6WV3//+vNpaFByRLxj7chzxM8GVmNFJiGRpqDbtuEY5Vtxs14waqjkUkLKd6naVmu0SBaxfPq9kiWlrNYtk45CJOgaweXVIA9/FSOvekIPfapKouKYxb1ZRFrkJZnkOuxCnBA6YSPGBS9+f2PlXJjQhrV3NvFbn5eSo8h54nTaamQeFyRCk+58GUjpah0CZVYZFPGUTGoww/koqTVz6cUKoRcSbhuRloEmAWUIayNE4wI0CTi1oQ6qdvHHiKZg/SjPsQbPEOwVMj/kxINIT8bSN417FLtuAZtckF2iPBZDORm68LkwIs89W5uc0xY54BKcSAmWawUWDtQ/AUN4WZCbC4yNfUpZwEnwcsWLMI4peBN0endWtAGDItRJhNqZEuvpddhQGz+tAvKQ6rfBqAekYUwpQIEyXGISU+S3XDgt7hoyegJwIwiXH4DO+2cGSBRzCJcfGYAxFskywfnj6uFOE/07wJp5XnmP7FetF+iIbUxxED+4ciCCOgNBv/eWyvEy3QD2MIeDhIRQH2xOfUohd0oEsu0kUHXiQReBhPlzx7hCSTIXtQohLAk7LJsKDulG6xynJ9stItQsYIiPWeJ4QkU92w5V+iZ7wOVZZwjZ9RCjTU5sdIPMyKVmxn+ks8ixgh+znDS5/N9yorGsb8GKmdqga+qRZ4KXS0djxqE5RH65miPIvjUWs40CBo0qfa8wEtgjY57M9R3BVFb53OZjuez3uMz96R+Xy83XQ6b6KoGx//b3MXSBZpeEciC9c48BtJvF8nGtpMdIdktmrPFsn8YiITydCv1/Oa1y+KZEwmYgF5/Xs7yfW661HKRCIHT0UhOrjmu00q2ezmPRij4iINKpFRhkjV7H860beq2Q+yaKUTrWTRnaFo0lS/aSUqxvmUknWg9gTrRE6IY0qb0JuoPBNP2uSmkVIxBQ98IwHgW4hgMnlhYnUJ4bT7QoFBv02OxIlQF1B5MFk2SUwyRNj/4MeZjyMe5CqWlflQKfMCofwrjfIvWYpf+5R1EVX+1Vj5l3WlXR/+B3ehafKkDafjAAAAAElFTkSuQmCC\' width=\'22\'height=\'20\' style=\'padding: 0 1px\'/><img src= \'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEgAAABICAMAAABiM0N1AAAAolBMVEVHcEz/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE1drexdrexdrexdrez/zE1mRQBdrez1xEjPojVwTQWpgCJ5VgqDXg7ZqjrGmTCfeB2ziSeMZxNnr+L1ylfsu0OGtcSku6Z7s868kSuaubDhxmuWbxjisz+4vpPryGGwo2LXxHVxsdiuvZ1fk7FieXZeoM9lUh5kXztghpQxividAAAAEXRSTlMAUGC/j9+AIJ/vz0Cvz48gEGIX8nkAAAKESURBVHhetZjnjuMgEIBJArFJvNkb3NN7tl0t7/9qd0KwazPGYay77y/SpylgM7AeojGfCDCICR9HbACjWABCxCOaJeISPEgeHtc8gV6SeVg0MdwlDohqKiEAOb0XzgwCmfUGNZIQjBz1pAUkvOnFQCSmeOgm7KGbcH2G12kEA3F6F0kYiGzvp/Y+zFbrSim1AYeNUqparzJoMvMW6HmtDOCgDOtnVCac2OFJKb/I8nRwkkOdvxRG4knNUlw69sAcLJkNpyrzZQaIbJmXlQ3qY31uRMm7p8Y1sOAa1u+mxFTI8WyRBqm2jinSIg6G2lTGA65WDQauRbZlpfasIIiVNpW2cc3DkVkPxZQ1DkpsRcZDMjV3gGjkXQKBslFPoXuGyCulqhwoKxEbd3iUJqesjBlHnsyckiILXwHOJuA9UZvwFZgwgUS1FdXhKyAYIEI+I4DoFR0CViz/PyK6aHixsYje/iARfUNi0fAjAkz8m0Mr0BEZyIRxwNx2uxvQ4F2fkf0uTXd7IDFmESCO6V+OQCJiuNovqeYFCAj98UeJaUjJxR13tWtquFLvbbLdsfSdGwAs9ZVLVesl9CDNL9uptOVof/J3rwTcXCIafE4bvBWqQZH39EyToIAM31QbX3qJHfRQQJZfbVFxgE7meHi4tkW/VZutp/foMvqaOvwMSE5GeH746oq+O6InwEw7LuxfXNGPy9JwKfVWAMSsY4S4pYgbfJBtiqIrMTzUnLDoRBpqbJnOWHSmj6MxQNrBkBHSJ6IPtUSR9WCIoinz8eApNvkBYeFpP/lJ4xGLXkmPLP6QTgOffT45VTrvSQ9R2IQ99KexBcpr6GPd40JH9bB4JD0f/gFEQCDwt7/hgwAAAABJRU5ErkJggg==\' width=\'22\'height=\'20\' style=\'padding: 0 1px\'/>','2025-03-27 13:54:46',NULL,NULL,0),(283,2,41,'<img src= \'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEgAAABICAMAAABiM0N1AAAAvVBMVEVHcEz/y0xkqt1kqt3/y0z/y0z/y0z/y0z/y0z/y0xkqt3/y0y2vJH/y0z/y0ydtqhkqt3/y0xkqt1kqt1kqt1kqt1kqt1lRxv/y0xkqt1vTx71xErFmjqQbCnZqkCfeS2yo43su0biskNrqtP///+CYCSogTCyiTRyVCaOd1bi3dR4XjjnxmPPoj28kTfJwH9lY1PFuqqFr7z19PFmfobs6OOwtZ2hjWvZ0cZlUzN+fmt3rs9knMKCakaomH+0sCqFAAAAF3RSTlMA33spgElgIJ/vTc/+j7/9va/vn9+Pz1Lta7YAAAPpSURBVHjapZjXeuIwEEYhFNMCIWFX414xvaWX3X3/x1pLLmMzUkyScwucSP8U53PjE7RuezyEjOa43dUa36DTawKh2et8zaJd90FB/1q7/DBT+JTpZcfSelBLT2u0Br9uZvrtzVVL4Wn3oZ7DZKYX3EmPMwQZlsHckiXUK9zSQ3Xlx9mxhAA429EHGpSmNkgJDC5yuGaiS/ld9ShSNufcM08097qKAfVQYuExYaSrmV3gcbjH8NEjpUXyIYiL7QAOn4quinqBAot7bEiYXCLSlG245BczhfLxAtEQENpCCwA/Nhh7rBW1QYUtDuS7THAMlfWvuZjJEtwFy9moWolUXha1kVmWcQCSLsDB7YASlxXYFnCwv+mwTUGJXWgcKBiFioRATaYxrKr+rHwHTYiua0W2CWX2jL2VVOEBroWoXyfay7bK2316wT8jE6BPopb1tUWGj7OJVm/H4/Et/biDtZcT2LZDtorgNfKYYA4JvUTUhC/hMMG/KBcxHwCapGZ1mEZ6sQchwgg1+f6obax1hCKxY7p0Xik0IC9KeMmbDBLajTE5vOXafLAC6egJVhFnxUohjc830Q6HAggBywPiLFmGI9Ku/kX+oVLkp0Ev18LzxHJ2kFAWOXNWwpE83wSnSHBiOYuqyIxZGYt6MGiMiIqC7HuGa+B8SQr/knkemFy0M1LNwlzIA3KxYIJnucgq9oUvfKbC8/chF21QtC+JDPHzXf4Lq9ZzqpQFRWKMfV5ivBj1LJ+inA0RNfNv2mYxA47Csy48HisBCcN8RAIH4HligkEPZNrE85Q1Li6kMQ4tf2KFYhB3pH8KD/YQ4oqhxTWyDfkG5r+ozoXE49HW7eJim+h6aoqrm556XlkFka1WrNqtnvLIArI3sO6cdREQRtTE5f+sZ7wDEks8D38ZvVmveByZYS4Kt+cxs5XCg0PQKR6QB73gHlIcg+GcyjxYsz4+su91ZITX4ngKD+7Z7JGtZVEjW9wqbHmKkDXxxJDWTDDNo8bL7fNrbdYR8irqRROaCo2I+0Ov8M4wZtKHpGQiakFvq1f5I4nnaUU9NqS1z9HIP4aP5Fpedi16sb7WKLg5F4X8/4TStU4bJiGAdF4RnXDcvGLNn1FDAxo2kAEVfRTRnDAb6hEXQ650yvs/z/NeVpiMzCP2R43oyAjUgwFh1rK6qTECwMr/QGSb6PmByLCAeL6TUWwC5lOlRT2h6jSxDyn9boMyI6KJNWeUuWVCxhD7R96RuG/9vW2UJS5aoN9uyLk7Ex0gxXd2i4S945y/9iFITYfvvIiilbsd/OjVWOvuVmhmVz9/WdcaDAYtxevDYc3rw/9x8rWZSkmNEwAAAABJRU5ErkJggg==\' width=\'22\'height=\'20\' style=\'padding: 0 1px\'/><img src= \'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEgAAABICAMAAABiM0N1AAAAvVBMVEVHcEz/y0xkqt1kqt3/y0z/y0z/y0z/y0z/y0z/y0xkqt3/y0y2vJH/y0z/y0ydtqhkqt3/y0xkqt1kqt1kqt1kqt1kqt1lRxv/y0xkqt1vTx71xErFmjqQbCnZqkCfeS2yo43su0biskNrqtP///+CYCSogTCyiTRyVCaOd1bi3dR4XjjnxmPPoj28kTfJwH9lY1PFuqqFr7z19PFmfobs6OOwtZ2hjWvZ0cZlUzN+fmt3rs9knMKCakaomH+0sCqFAAAAF3RSTlMA33spgElgIJ/vTc/+j7/9va/vn9+Pz1Lta7YAAAPpSURBVHjapZjXeuIwEEYhFNMCIWFX414xvaWX3X3/x1pLLmMzUkyScwucSP8U53PjE7RuezyEjOa43dUa36DTawKh2et8zaJd90FB/1q7/DBT+JTpZcfSelBLT2u0Br9uZvrtzVVL4Wn3oZ7DZKYX3EmPMwQZlsHckiXUK9zSQ3Xlx9mxhAA429EHGpSmNkgJDC5yuGaiS/ld9ShSNufcM08097qKAfVQYuExYaSrmV3gcbjH8NEjpUXyIYiL7QAOn4quinqBAot7bEiYXCLSlG245BczhfLxAtEQENpCCwA/Nhh7rBW1QYUtDuS7THAMlfWvuZjJEtwFy9moWolUXha1kVmWcQCSLsDB7YASlxXYFnCwv+mwTUGJXWgcKBiFioRATaYxrKr+rHwHTYiua0W2CWX2jL2VVOEBroWoXyfay7bK2316wT8jE6BPopb1tUWGj7OJVm/H4/Et/biDtZcT2LZDtorgNfKYYA4JvUTUhC/hMMG/KBcxHwCapGZ1mEZ6sQchwgg1+f6obax1hCKxY7p0Xik0IC9KeMmbDBLajTE5vOXafLAC6egJVhFnxUohjc830Q6HAggBywPiLFmGI9Ku/kX+oVLkp0Ev18LzxHJ2kFAWOXNWwpE83wSnSHBiOYuqyIxZGYt6MGiMiIqC7HuGa+B8SQr/knkemFy0M1LNwlzIA3KxYIJnucgq9oUvfKbC8/chF21QtC+JDPHzXf4Lq9ZzqpQFRWKMfV5ivBj1LJ+inA0RNfNv2mYxA47Csy48HisBCcN8RAIH4HligkEPZNrE85Q1Li6kMQ4tf2KFYhB3pH8KD/YQ4oqhxTWyDfkG5r+ozoXE49HW7eJim+h6aoqrm556XlkFka1WrNqtnvLIArI3sO6cdREQRtTE5f+sZ7wDEks8D38ZvVmveByZYS4Kt+cxs5XCg0PQKR6QB73gHlIcg+GcyjxYsz4+su91ZITX4ngKD+7Z7JGtZVEjW9wqbHmKkDXxxJDWTDDNo8bL7fNrbdYR8irqRROaCo2I+0Ov8M4wZtKHpGQiakFvq1f5I4nnaUU9NqS1z9HIP4aP5Fpedi16sb7WKLg5F4X8/4TStU4bJiGAdF4RnXDcvGLNn1FDAxo2kAEVfRTRnDAb6hEXQ650yvs/z/NeVpiMzCP2R43oyAjUgwFh1rK6qTECwMr/QGSb6PmByLCAeL6TUWwC5lOlRT2h6jSxDyn9boMyI6KJNWeUuWVCxhD7R96RuG/9vW2UJS5aoN9uyLk7Ex0gxXd2i4S945y/9iFITYfvvIiilbsd/OjVWOvuVmhmVz9/WdcaDAYtxevDYc3rw/9x8rWZSkmNEwAAAABJRU5ErkJggg==\' width=\'22\'height=\'20\' style=\'padding: 0 1px\'/>','2025-03-27 23:34:00',NULL,NULL,0),(284,2,41,'111231<img src= \'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEgAAABICAMAAABiM0N1AAAAwFBMVEVHcExdrexdrexdrez/zE3+zE7/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE1drez/zE1drezbxXBdreyziSj/zE1mRQD1xEiMZxNwTQXsu0PZqjryylqku6bisz////92stOMdECfeB3GmTBkrOGDXg6+u46WbxhlVCK8kSuzooCuvZ2pgCJghZDPojXi3M/Z0b/Lv6fMwn/cxXCCiG+aubDx7ueo0/WJxPJ5Vw6DaDCWf1BeoM9ieXZic2dfmsB8zBAYAAAAE3RSTlMAgM8Y349QIJ/vv2BAr8+PgHCPJC8E5gAAAyNJREFUeF6tmNd2ozAQQAkGG1yS7KrQXXsv6WV3//+vNpaFByRLxj7chzxM8GVmNFJiGRpqDbtuEY5Vtxs14waqjkUkLKd6naVmu0SBaxfPq9kiWlrNYtk45CJOgaweXVIA9/FSOvekIPfapKouKYxb1ZRFrkJZnkOuxCnBA6YSPGBS9+f2PlXJjQhrV3NvFbn5eSo8h54nTaamQeFyRCk+58GUjpah0CZVYZFPGUTGoww/koqTVz6cUKoRcSbhuRloEmAWUIayNE4wI0CTi1oQ6qdvHHiKZg/SjPsQbPEOwVMj/kxINIT8bSN417FLtuAZtckF2iPBZDORm68LkwIs89W5uc0xY54BKcSAmWawUWDtQ/AUN4WZCbC4yNfUpZwEnwcsWLMI4peBN0endWtAGDItRJhNqZEuvpddhQGz+tAvKQ6rfBqAekYUwpQIEyXGISU+S3XDgt7hoyegJwIwiXH4DO+2cGSBRzCJcfGYAxFskywfnj6uFOE/07wJp5XnmP7FetF+iIbUxxED+4ciCCOgNBv/eWyvEy3QD2MIeDhIRQH2xOfUohd0oEsu0kUHXiQReBhPlzx7hCSTIXtQohLAk7LJsKDulG6xynJ9stItQsYIiPWeJ4QkU92w5V+iZ7wOVZZwjZ9RCjTU5sdIPMyKVmxn+ks8ixgh+znDS5/N9yorGsb8GKmdqga+qRZ4KXS0djxqE5RH65miPIvjUWs40CBo0qfa8wEtgjY57M9R3BVFb53OZjuez3uMz96R+Xy83XQ6b6KoGx//b3MXSBZpeEciC9c48BtJvF8nGtpMdIdktmrPFsn8YiITydCv1/Oa1y+KZEwmYgF5/Xs7yfW661HKRCIHT0UhOrjmu00q2ezmPRij4iINKpFRhkjV7H860beq2Q+yaKUTrWTRnaFo0lS/aSUqxvmUknWg9gTrRE6IY0qb0JuoPBNP2uSmkVIxBQ98IwHgW4hgMnlhYnUJ4bT7QoFBv02OxIlQF1B5MFk2SUwyRNj/4MeZjyMe5CqWlflQKfMCofwrjfIvWYpf+5R1EVX+1Vj5l3WlXR/+B3ehafKkDafjAAAAAElFTkSuQmCC\' width=\'22\'height=\'20\' style=\'padding: 0 1px\'/><img src= \'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEgAAABICAMAAABiM0N1AAAAwFBMVEVHcExdrexdrexdrez/zE3+zE7/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE3/zE1drez/zE1drezbxXBdreyziSj/zE1mRQD1xEiMZxNwTQXsu0PZqjryylqku6bisz////92stOMdECfeB3GmTBkrOGDXg6+u46WbxhlVCK8kSuzooCuvZ2pgCJghZDPojXi3M/Z0b/Lv6fMwn/cxXCCiG+aubDx7ueo0/WJxPJ5Vw6DaDCWf1BeoM9ieXZic2dfmsB8zBAYAAAAE3RSTlMAgM8Y349QIJ/vv2BAr8+PgHCPJC8E5gAAAyNJREFUeF6tmNd2ozAQQAkGG1yS7KrQXXsv6WV3//+vNpaFByRLxj7chzxM8GVmNFJiGRpqDbtuEY5Vtxs14waqjkUkLKd6naVmu0SBaxfPq9kiWlrNYtk45CJOgaweXVIA9/FSOvekIPfapKouKYxb1ZRFrkJZnkOuxCnBA6YSPGBS9+f2PlXJjQhrV3NvFbn5eSo8h54nTaamQeFyRCk+58GUjpah0CZVYZFPGUTGoww/koqTVz6cUKoRcSbhuRloEmAWUIayNE4wI0CTi1oQ6qdvHHiKZg/SjPsQbPEOwVMj/kxINIT8bSN417FLtuAZtckF2iPBZDORm68LkwIs89W5uc0xY54BKcSAmWawUWDtQ/AUN4WZCbC4yNfUpZwEnwcsWLMI4peBN0endWtAGDItRJhNqZEuvpddhQGz+tAvKQ6rfBqAekYUwpQIEyXGISU+S3XDgt7hoyegJwIwiXH4DO+2cGSBRzCJcfGYAxFskywfnj6uFOE/07wJp5XnmP7FetF+iIbUxxED+4ciCCOgNBv/eWyvEy3QD2MIeDhIRQH2xOfUohd0oEsu0kUHXiQReBhPlzx7hCSTIXtQohLAk7LJsKDulG6xynJ9stItQsYIiPWeJ4QkU92w5V+iZ7wOVZZwjZ9RCjTU5sdIPMyKVmxn+ks8ixgh+znDS5/N9yorGsb8GKmdqga+qRZ4KXS0djxqE5RH65miPIvjUWs40CBo0qfa8wEtgjY57M9R3BVFb53OZjuez3uMz96R+Xy83XQ6b6KoGx//b3MXSBZpeEciC9c48BtJvF8nGtpMdIdktmrPFsn8YiITydCv1/Oa1y+KZEwmYgF5/Xs7yfW661HKRCIHT0UhOrjmu00q2ezmPRij4iINKpFRhkjV7H860beq2Q+yaKUTrWTRnaFo0lS/aSUqxvmUknWg9gTrRE6IY0qb0JuoPBNP2uSmkVIxBQ98IwHgW4hgMnlhYnUJ4bT7QoFBv02OxIlQF1B5MFk2SUwyRNj/4MeZjyMe5CqWlflQKfMCofwrjfIvWYpf+5R1EVX+1Vj5l3WlXR/+B3ehafKkDafjAAAAAElFTkSuQmCC\' width=\'22\'height=\'20\' style=\'padding: 0 1px\'/>','2025-03-27 23:34:07',2,283,1),(285,2,41,'qq','2025-03-27 23:38:38',2,283,1),(286,2,41,'111','2025-03-27 23:38:43',2,283,1),(287,1,41,'12123','2025-04-01 02:55:23',NULL,NULL,0),(288,1,41,'12414','2025-04-01 02:55:31',NULL,NULL,0),(289,1,41,'123','2025-04-01 03:05:20',NULL,NULL,0);
/*!40000 ALTER TABLE `tb_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_favorite`
--

DROP TABLE IF EXISTS `tb_favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_favorite` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '收藏ID',
  `name` varchar(100) NOT NULL COMMENT '网站名称',
  `url` varchar(255) NOT NULL COMMENT '网站地址',
  `description` varchar(500) DEFAULT NULL COMMENT '网站描述',
  `icon` varchar(255) DEFAULT NULL COMMENT '网站图标',
  `category_id` int NOT NULL COMMENT '分类ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort` int DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `idx_category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE= utf8_general_ci COMMENT='收藏网站表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_favorite`
--

LOCK TABLES `tb_favorite` WRITE;
/*!40000 ALTER TABLE `tb_favorite` DISABLE KEYS */;
INSERT INTO `tb_favorite` VALUES (1,'GitHub','https://github.com','全球最大的开源代码托管平台，发现优秀的开源项目','https://github.githubassets.com/favicons/favicon.svg',1,'2025-03-31 03:42:18','2025-03-31 03:42:18',1),(2,'MDN Web Docs','https://developer.mozilla.org','提供Web技术的文档，包括HTML、CSS和JavaScript','https://developer.mozilla.org/favicon-48x48.png',3,'2025-03-31 03:42:18','2025-03-31 03:42:18',1),(3,'Figma','https://www.figma.com','专业的在线设计工具，支持团队协作','https://static.figma.com/app/icon/1/favicon.svg',2,'2025-03-31 03:42:18','2025-03-31 03:42:18',1),(4,'Vue.js','https://vuejs.org','渐进式JavaScript框架，用于构建用户界面','https://vuejs.org/images/logo.png',1,'2025-03-31 03:42:18','2025-03-31 03:42:18',2),(5,'掘金','https://juejin.cn','一个帮助开发者成长的社区，分享技术文章和编程经验','https://lf3-cdn-tos.bytescm.com/obj/static/xitu_juejin_web/static/favicons/favicon-32x32.png',5,'2025-03-31 03:42:18','2025-03-31 03:42:18',1),(6,'Can I Use','https://caniuse.com','查询HTML、CSS和JavaScript特性的浏览器兼容性','https://caniuse.com/img/favicon-128.png',4,'2025-03-31 03:42:18','2025-03-31 04:08:40',1),(7,'LeetCode','https://leetcode.com','提供海量编程题目，帮助提升算法和数据结构能力','https://leetcode.com/static/images/LeetCode_logo_rvs.png',3,'2025-03-31 03:42:18','2025-03-31 03:42:18',2),(8,'Unsplash','https://unsplash.com','免费高质量图片分享平台，可用于商业和非商业用途','https://unsplash.com/favicon-32x32.png',2,'2025-03-31 03:42:18','2025-03-31 03:42:18',2);
/*!40000 ALTER TABLE `tb_favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_favorite_category`
--

DROP TABLE IF EXISTS `tb_favorite_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_favorite_category` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `category_name` varchar(50) NOT NULL COMMENT '分类名称',
  `category_icon` varchar(200) DEFAULT NULL COMMENT '分类图标',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort` int DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE= utf8_general_ci COMMENT='收藏网站分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_favorite_category`
--

LOCK TABLES `tb_favorite_category` WRITE;
/*!40000 ALTER TABLE `tb_favorite_category` DISABLE KEYS */;
INSERT INTO `tb_favorite_category` VALUES (1,'开发工具','mdi-code-tags','2025-03-31 03:42:18','2025-03-31 03:42:18',1),(2,'设计资源','mdi-palette','2025-03-31 03:42:18','2025-03-31 03:42:18',2),(3,'学习资源','mdi-school','2025-03-31 03:42:18','2025-03-31 03:42:18',3),(4,'实用工具','mdi-tools','2025-03-31 03:42:18','2025-03-31 03:42:18',4),(5,'社区论坛','mdi-account-group','2025-03-31 03:42:18','2025-03-31 03:42:18',5);
/*!40000 ALTER TABLE `tb_favorite_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_favorite_tag`
--

DROP TABLE IF EXISTS `tb_favorite_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_favorite_tag` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '标签ID',
  `favorite_id` int NOT NULL COMMENT '收藏网站ID',
  `tag_name` varchar(50) NOT NULL COMMENT '标签名称',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_favorite_id` (`favorite_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE= utf8_general_ci COMMENT='收藏网站标签表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_favorite_tag`
--

LOCK TABLES `tb_favorite_tag` WRITE;
/*!40000 ALTER TABLE `tb_favorite_tag` DISABLE KEYS */;
INSERT INTO `tb_favorite_tag` VALUES (3,2,'文档','2025-03-31 03:42:18'),(4,2,'Web开发','2025-03-31 03:42:18'),(5,3,'设计工具','2025-03-31 03:42:18'),(6,3,'UI/UX','2025-03-31 03:42:18'),(7,4,'前端框架','2025-03-31 03:42:18'),(8,4,'JavaScript','2025-03-31 03:42:18'),(9,5,'技术社区','2025-03-31 03:42:18'),(10,5,'博客','2025-03-31 03:42:18'),(13,7,'算法','2025-03-31 03:42:18'),(14,7,'面试题','2025-03-31 03:42:18'),(15,8,'图片资源','2025-03-31 03:42:18'),(16,8,'免费素材','2025-03-31 03:42:18'),(17,1,'代码托管','2025-03-31 04:05:13'),(18,1,'开源社区','2025-03-31 04:05:13'),(23,6,'浏览器兼容','2025-03-31 04:08:40'),(24,6,'前端开发','2025-03-31 04:08:40');
/*!40000 ALTER TABLE `tb_favorite_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_friend_link`
--

DROP TABLE IF EXISTS `tb_friend_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_friend_link` (
  `id` int NOT NULL AUTO_INCREMENT,
  `link_name` varchar(20) CHARACTER SET utf8 COLLATE  utf8_general_ci NOT NULL COMMENT '链接名',
  `link_avatar` varchar(255) CHARACTER SET utf8 COLLATE  utf8_general_ci NOT NULL COMMENT '链接头像',
  `link_address` varchar(50) CHARACTER SET utf8 COLLATE  utf8_general_ci NOT NULL COMMENT '链接地址',
  `link_intro` varchar(50) CHARACTER SET utf8 COLLATE  utf8_general_ci NOT NULL COMMENT '链接介绍',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_friend_link_user` (`link_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE= utf8_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_friend_link`
--

LOCK TABLES `tb_friend_link` WRITE;
/*!40000 ALTER TABLE `tb_friend_link` DISABLE KEYS */;
INSERT INTO `tb_friend_link` VALUES (12,'个人博客','https://big-event20040810.oss-cn-beijing.aliyuncs.com/avatar/1904580896942034945.jpg','https://www.fishblog.yyf040810.cn/','且将新火试新茶，诗酒趁年华','2021-03-20 23:40:33'),(13,'Github','https://big-event20040810.oss-cn-beijing.aliyuncs.com/avatar/1904580896942034945.jpg','https://github.com/Auroral0810','存放一些琐碎的项目代码','2025-03-27 00:58:12'),(14,'CSDN','https://big-event20040810.oss-cn-beijing.aliyuncs.com/avatar/1904580896942034945.jpg','https://blog.csdn.net/Luck_ff','然而并没有什么文章','2025-03-27 00:59:29');
/*!40000 ALTER TABLE `tb_friend_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_menu`
--

DROP TABLE IF EXISTS `tb_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_menu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8 COLLATE  utf8_general_ci DEFAULT NULL COMMENT '菜单名',
  `path` varchar(50) CHARACTER SET utf8 COLLATE  utf8_general_ci DEFAULT NULL COMMENT '菜单路径',
  `component` varchar(50) CHARACTER SET utf8 COLLATE  utf8_general_ci DEFAULT NULL COMMENT '组件',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE  utf8_general_ci DEFAULT NULL COMMENT '菜单icon',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `order_num` tinyint DEFAULT NULL COMMENT '排序',
  `parent_id` int DEFAULT NULL COMMENT '父id',
  `is_disable` tinyint(1) DEFAULT NULL COMMENT '是否禁用 0否1是',
  `is_hidden` tinyint(1) DEFAULT NULL COMMENT '是否隐藏  0否1是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8 COLLATE= utf8_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_menu`
--

LOCK TABLES `tb_menu` WRITE;
/*!40000 ALTER TABLE `tb_menu` DISABLE KEYS */;
INSERT INTO `tb_menu` VALUES (1,'首页','/','/home/Home.vue','el-icon-myshouye','2021-01-26 17:06:51','2021-01-26 17:06:53',1,NULL,0,0),(2,'文章管理','/article-submenu','Layout','el-icon-mywenzhang-copy','2021-01-25 20:43:07','2021-01-25 20:43:09',2,NULL,0,0),(3,'消息管理','/message-submenu','Layout','el-icon-myxiaoxi','2021-01-25 20:44:17','2021-01-25 20:44:20',3,NULL,0,0),(4,'系统管理','/system-submenu','Layout','el-icon-myshezhi','2021-01-25 20:45:57','2021-01-25 20:45:59',5,NULL,0,0),(5,'个人中心','/setting','/setting/Setting.vue','el-icon-myuser','2021-01-26 17:22:38','2021-01-26 17:22:41',7,NULL,0,0),(6,'添加文章','/articles','/article/Article.vue','el-icon-myfabiaowenzhang','2021-01-26 14:30:48','2021-01-26 14:30:51',1,2,0,0),(7,'修改文章','/articles/*','/article/Article.vue','el-icon-myfabiaowenzhang','2021-01-26 14:31:32','2021-01-26 14:31:34',2,2,0,1),(8,'文章列表','/article-list','/article/ArticleList.vue','el-icon-mywenzhangliebiao','2021-01-26 14:32:13','2021-01-26 14:32:16',3,2,0,0),(9,'分类管理','/categories','/category/Category.vue','el-icon-folder','2021-01-26 14:33:42','2021-01-26 14:33:43',4,2,0,0),(10,'标签管理','/tags','/tag/Tag.vue','el-icon-myicontag','2021-01-26 14:34:33','2021-01-26 14:34:36',5,2,0,0),(11,'评论管理','/comments','/comment/Comment.vue','el-icon-mypinglunzu','2021-01-26 14:35:31','2021-01-26 14:35:34',1,3,0,0),(12,'留言管理','/messages','/message/Message.vue','el-icon-myliuyan','2021-01-26 14:36:09','2021-01-26 14:36:13',2,3,0,0),(13,'用户列表','/users','/user/User.vue','el-icon-myyonghuliebiao','2021-01-26 14:38:09','2021-01-26 14:38:12',1,202,0,0),(14,'角色管理','/roles','/role/Role.vue','el-icon-myjiaoseliebiao','2021-01-26 14:39:01','2021-01-26 14:39:03',2,202,0,0),(15,'资源管理','/resources','/resource/Resource.vue','el-icon-myxitong','2021-01-26 14:40:14','2021-01-26 14:40:16',2,4,0,0),(16,'菜单管理','/menus','/menu/Menu.vue','el-icon-mycaidan','2021-01-26 14:40:54','2021-01-26 14:40:56',1,4,0,0),(17,'友链管理','/links','/friendLink/FriendLink.vue','el-icon-mydashujukeshihuaico-','2021-01-26 14:41:35','2021-01-26 14:41:37',3,4,0,0),(18,'关于我','/about','/about/About.vue','el-icon-myguanyuwo','2021-01-26 14:42:05','2021-01-26 14:42:10',4,4,0,0),(19,'日志管理','/log-submenu','Layout','el-icon-myguanyuwo','2021-01-31 21:33:56','2021-01-31 21:33:59',6,NULL,0,0),(20,'操作日志','/operation/log','/log/Operation.vue','el-icon-myguanyuwo','2021-01-31 15:53:21','2021-01-31 15:53:25',1,19,0,0),(21,'收藏管理','/favorites-submenu','Layout','el-icon-star-on','2025-03-31 03:59:39','2025-03-31 03:59:39',5,NULL,0,0),(22,'收藏列表','/favorites/list','/favorite/FavoriteList.vue','el-icon-link','2025-03-31 03:59:58','2025-03-31 03:59:58',1,21,0,0),(23,'分类管理','/favorites/category','/favorite/FavoriteCategory.vue','el-icon-folder','2025-03-31 03:59:58','2025-03-31 03:59:58',2,21,0,0),(201,'在线用户','/online/users','/user/Online.vue','el-icon-myyonghuliebiao','2021-02-05 14:59:51','2021-02-05 14:59:53',7,202,0,0),(202,'用户管理','/users-submenu','Layout','el-icon-myyonghuliebiao','2021-02-06 23:44:59','2021-02-06 23:45:03',4,NULL,0,0);
/*!40000 ALTER TABLE `tb_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_message`
--

DROP TABLE IF EXISTS `tb_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_message` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `ip_address` varchar(50) CHARACTER SET utf8 COLLATE  utf8_general_ci NOT NULL COMMENT '用户ip',
  `ip_source` varchar(255) CHARACTER SET utf8 COLLATE  utf8_general_ci NOT NULL COMMENT '用户地址',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE  utf8_general_ci NOT NULL COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE  utf8_general_ci NOT NULL COMMENT '头像',
  `message_content` varchar(255) CHARACTER SET utf8 COLLATE  utf8_general_ci NOT NULL COMMENT '留言内容',
  `time` tinyint(1) DEFAULT NULL COMMENT '弹幕速度',
  `create_time` datetime NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3464 DEFAULT CHARSET=utf8 COLLATE= utf8_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_message`
--

LOCK TABLES `tb_message` WRITE;
/*!40000 ALTER TABLE `tb_message` DISABLE KEYS */;
INSERT INTO `tb_message` VALUES (3432,'127.0.0.1','','游客','https://gravatar.loli.net/avatar/d41d8cd98f00b204e9800998ecf8427e?d=mp&v=1.4.14','测试留言',8,'2021-03-20 23:40:48'),(3433,'127.0.0.1','','Auroral','https://big-event20040810.oss-cn-beijing.aliyuncs.com/avatar/1904580896942034945.jpg','f1111',8,'2025-03-26 01:23:45'),(3434,'127.0.0.1','','Auroral','https://big-event20040810.oss-cn-beijing.aliyuncs.com/avatar/1904584532619268097.jpg','你好你好',7,'2025-03-26 11:38:47'),(3435,'127.0.0.1','','Auroral','https://big-event20040810.oss-cn-beijing.aliyuncs.com/avatar/1904584532619268097.jpg','1234',7,'2025-03-26 21:39:17'),(3436,'127.0.0.1','','游客','https://gravatar.loli.net/avatar/d41d8cd98f00b204e9800998ecf8427e?d=mp&v=1.4.14','test',7,'2025-03-27 17:06:44'),(3437,'127.0.0.1','','游客','https://big-event20040810.oss-cn-beijing.aliyuncs.com/avatar/default.png','test',8,'2025-03-27 17:07:57'),(3438,'127.0.0.1','','游客','https://big-event20040810.oss-cn-beijing.aliyuncs.com/avatar/default.png','111',7,'2025-03-29 02:02:40'),(3439,'127.0.0.1','','游客','https://big-event20040810.oss-cn-beijing.aliyuncs.com/avatar/default.png','法俄法俄方',7,'2025-03-29 02:02:47'),(3440,'127.0.0.1','','游客','https://big-event20040810.oss-cn-beijing.aliyuncs.com/avatar/default.png','213',8,'2025-03-29 02:04:40'),(3441,'127.0.0.1','','游客','https://big-event20040810.oss-cn-beijing.aliyuncs.com/avatar/default.png','213123',9,'2025-03-29 02:04:53'),(3442,'127.0.0.1','','游客','https://big-event20040810.oss-cn-beijing.aliyuncs.com/avatar/default.png','87',7,'2025-03-29 02:05:07'),(3443,'127.0.0.1','','Auroral','https://big-event20040810.oss-cn-beijing.aliyuncs.com/avatar/1904584754271457281.jpg','1',7,'2025-03-29 03:17:23'),(3444,'127.0.0.1','','Auroral','https://big-event20040810.oss-cn-beijing.aliyuncs.com/avatar/1904584754271457281.jpg','313113',8,'2025-03-29 03:17:26'),(3445,'127.0.0.1','','Auroral','https://big-event20040810.oss-cn-beijing.aliyuncs.com/avatar/1904584754271457281.jpg','111',8,'2025-03-29 03:17:32'),(3446,'127.0.0.1','','游客','https://big-event20040810.oss-cn-beijing.aliyuncs.com/avatar/default.png','sss',NULL,'2025-03-29 03:21:26'),(3447,'127.0.0.1','','游客','https://big-event20040810.oss-cn-beijing.aliyuncs.com/avatar/default.png','sssaf',NULL,'2025-03-29 03:21:30'),(3448,'127.0.0.1','','游客','https://big-event20040810.oss-cn-beijing.aliyuncs.com/avatar/default.png','312412',NULL,'2025-03-29 03:22:51'),(3449,'127.0.0.1','','游客','https://big-event20040810.oss-cn-beijing.aliyuncs.com/avatar/default.png','1123',NULL,'2025-03-29 03:23:25'),(3450,'127.0.0.1','','游客','https://big-event20040810.oss-cn-beijing.aliyuncs.com/avatar/default.png','1',NULL,'2025-03-29 03:23:34'),(3451,'127.0.0.1','','游客','https://big-event20040810.oss-cn-beijing.aliyuncs.com/avatar/default.png','111',NULL,'2025-03-29 03:23:46'),(3452,'127.0.0.1','','游客','https://big-event20040810.oss-cn-beijing.aliyuncs.com/avatar/default.png','111',NULL,'2025-03-29 03:25:14'),(3453,'127.0.0.1','','游客','https://big-event20040810.oss-cn-beijing.aliyuncs.com/avatar/default.png','1241',NULL,'2025-03-29 03:26:16'),(3454,'127.0.0.1','','游客','https://big-event20040810.oss-cn-beijing.aliyuncs.com/avatar/default.png','132231',NULL,'2025-03-29 03:32:17'),(3455,'127.0.0.1','','游客','https://big-event20040810.oss-cn-beijing.aliyuncs.com/avatar/default.png','111',NULL,'2025-03-29 03:32:24'),(3456,'127.0.0.1','','匿名用户','https://big-event20040810.oss-cn-beijing.aliyuncs.com/avatar/default.png','1214',NULL,'2025-03-29 03:38:13'),(3457,'127.0.0.1','','游客','https://big-event20040810.oss-cn-beijing.aliyuncs.com/avatar/default.png','123',NULL,'2025-03-29 03:38:39'),(3458,'127.0.0.1','','游客','https://big-event20040810.oss-cn-beijing.aliyuncs.com/avatar/default.png','你好你好',NULL,'2025-03-29 03:38:45'),(3459,'127.0.0.1','','游客','https://big-event20040810.oss-cn-beijing.aliyuncs.com/avatar/default.png','1',NULL,'2025-03-29 03:40:04'),(3460,'127.0.0.1','','游客','https://big-event20040810.oss-cn-beijing.aliyuncs.com/avatar/default.png','11',NULL,'2025-03-29 03:40:37'),(3463,'127.0.0.1','','游客','https://big-event20040810.oss-cn-beijing.aliyuncs.com/avatar/default.png','1',NULL,'2025-03-29 21:16:12');
/*!40000 ALTER TABLE `tb_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_notice`
--

DROP TABLE IF EXISTS `tb_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_notice` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `content` varchar(1000) COLLATE utf8_unicode_ci NOT NULL COMMENT '公告内容',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_notice`
--

LOCK TABLES `tb_notice` WRITE;
/*!40000 ALTER TABLE `tb_notice` DISABLE KEYS */;
INSERT INTO `tb_notice` VALUES (1,'### 博客正式上线啦～～～','2025-03-30 14:56:31',NULL),(2,'### 更新了公告板哦～111111','2025-03-30 15:06:23',NULL);
/*!40000 ALTER TABLE `tb_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_operation_log`
--

DROP TABLE IF EXISTS `tb_operation_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_operation_log` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `opt_module` varchar(20) CHARACTER SET utf8 COLLATE  utf8_general_ci DEFAULT NULL COMMENT '操作模块',
  `opt_type` varchar(20) CHARACTER SET utf8 COLLATE  utf8_general_ci DEFAULT NULL COMMENT '操作类型',
  `opt_url` varchar(255) CHARACTER SET utf8 COLLATE  utf8_general_ci DEFAULT NULL COMMENT '操作url',
  `opt_method` varchar(255) CHARACTER SET utf8 COLLATE  utf8_general_ci DEFAULT NULL COMMENT '操作方法',
  `opt_desc` varchar(255) CHARACTER SET utf8 COLLATE  utf8_general_ci DEFAULT NULL COMMENT '操作描述',
  `request_param` longtext CHARACTER SET utf8 COLLATE  utf8_general_ci COMMENT '请求参数',
  `request_method` varchar(20) CHARACTER SET utf8 COLLATE  utf8_general_ci DEFAULT NULL COMMENT '请求方式',
  `response_data` longtext CHARACTER SET utf8 COLLATE  utf8_general_ci COMMENT '返回数据',
  `user_id` int DEFAULT NULL COMMENT '用户id',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE  utf8_general_ci DEFAULT NULL COMMENT '用户昵称',
  `ip_addr` varchar(255) CHARACTER SET utf8 COLLATE  utf8_general_ci DEFAULT NULL COMMENT '操作ip',
  `ip_source` varchar(255) CHARACTER SET utf8 COLLATE  utf8_general_ci DEFAULT NULL COMMENT '操作地址',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8 COLLATE= utf8_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_operation_log`
--

LOCK TABLES `tb_operation_log` WRITE;
/*!40000 ALTER TABLE `tb_operation_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_operation_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_resource`
--

DROP TABLE IF EXISTS `tb_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_resource` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `resource_name` varchar(50) CHARACTER SET utf8 COLLATE  utf8_general_ci DEFAULT NULL COMMENT '资源名',
  `url` varchar(255) CHARACTER SET utf8 COLLATE  utf8_general_ci DEFAULT NULL COMMENT '权限路径',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE  utf8_general_ci DEFAULT NULL COMMENT '请求方式',
  `parent_id` int DEFAULT NULL COMMENT '父权限id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `is_disable` tinyint(1) DEFAULT NULL COMMENT '是否禁用 0否 1是',
  `is_anonymous` tinyint DEFAULT NULL COMMENT '是否匿名访问 0否 1是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8 COLLATE= utf8_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_resource`
--

LOCK TABLES `tb_resource` WRITE;
/*!40000 ALTER TABLE `tb_resource` DISABLE KEYS */;
INSERT INTO `tb_resource` VALUES (165,'分类模块',NULL,NULL,NULL,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(166,'博客信息模块',NULL,NULL,NULL,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(167,'友链模块',NULL,NULL,NULL,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(168,'文章模块',NULL,NULL,NULL,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(169,'日志模块',NULL,NULL,NULL,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(170,'标签模块',NULL,NULL,NULL,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(171,'用户信息模块',NULL,NULL,NULL,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(172,'用户账号模块',NULL,NULL,NULL,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(173,'留言模块',NULL,NULL,NULL,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(174,'菜单模块',NULL,NULL,NULL,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(175,'角色模块',NULL,NULL,NULL,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(176,'评论模块',NULL,NULL,NULL,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(177,'资源模块',NULL,NULL,NULL,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(178,'查看博客信息','/','GET',166,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(179,'查看关于我信息','/about','GET',166,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(180,'查看后台信息','/admin','GET',166,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(181,'修改关于我信息','/admin/about','PUT',166,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(182,'查看后台文章','/admin/articles','GET',168,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(183,'添加或修改文章','/admin/articles','POST',168,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(184,'恢复或删除文章','/admin/articles','PUT',168,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(185,'物理删除文章','/admin/articles','DELETE',168,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(186,'上传文章图片','/admin/articles/images','POST',168,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(187,'查看文章选项','/admin/articles/options','GET',168,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(188,'修改文章置顶','/admin/articles/top/*','PUT',168,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(189,'根据id查看后台文章','/admin/articles/*','GET',168,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(190,'查看后台分类列表','/admin/categories','GET',165,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(191,'添加或修改分类','/admin/categories','POST',165,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(192,'删除分类','/admin/categories','DELETE',165,'2021-03-20 22:56:20','2025-03-29 13:49:31',0,0),(193,'查询后台评论','/admin/comments','GET',176,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(194,'删除或恢复评论','/admin/comments','PUT',176,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(195,'物理删除评论','/admin/comments','DELETE',176,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(196,'查看后台友链列表','/admin/links','GET',167,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(197,'保存或修改友链','/admin/links','POST',167,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(198,'删除友链','/admin/links','DELETE',167,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(199,'查看菜单列表','/admin/menus','GET',174,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(200,'查看后台留言列表','/admin/messages','GET',173,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(201,'删除留言','/admin/messages','DELETE',173,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(202,'查看公告','/admin/notice','GET',166,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(203,'修改公告','/admin/notice','PUT',166,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(204,'查看操作日志','/admin/operation/logs','GET',169,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(205,'删除操作日志','/admin/operation/logs','DELETE',169,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(206,'查看资源列表','/admin/resources','GET',177,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(207,'新增或修改资源','/admin/resources','POST',177,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(208,'删除资源','/admin/resources','DELETE',177,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(209,'导入swagger接口','/admin/resources/import/swagger','GET',177,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(210,'保存或更新角色','/admin/role','POST',175,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(211,'查看角色菜单选项','/admin/role/menus','GET',174,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(212,'查看角色资源选项','/admin/role/resources','GET',177,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(213,'查询角色列表','/admin/roles','GET',175,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(214,'查看后台标签列表','/admin/tags','GET',170,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(215,'添加或修改标签','/admin/tags','POST',170,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(216,'删除标签','/admin/tags','DELETE',170,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(217,'查看用户菜单','/admin/user/menus','GET',174,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(218,'查看后台用户列表','/admin/users','GET',172,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(219,'修改用户禁用状态','/admin/users/disable/*','PUT',171,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(220,'查看在线用户','/admin/users/online','GET',171,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(221,'下线用户','/admin/users/online/*','DELETE',171,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(222,'修改管理员密码','/admin/users/password','PUT',172,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(223,'查询用户角色选项','/admin/users/role','GET',175,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(224,'修改用户角色','/admin/users/role','PUT',171,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,0),(225,'查看首页文章','/articles','GET',168,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(226,'查看文章归档','/articles/archives','GET',168,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(227,'点赞文章','/articles/like','POST',168,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(228,'查看最新文章','/articles/newest','GET',168,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(229,'搜索文章','/articles/search','GET',168,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(230,'根据id查看文章','/articles/*','GET',168,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(231,'查看分类列表','/categories','GET',165,'2021-03-20 22:56:20','2025-03-29 13:49:33',0,1),(232,'查看分类下对应的文章','/categories/*','GET',165,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(233,'查询评论','/comments','GET',176,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(234,'添加评论或回复','/comments','POST',176,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(235,'评论点赞','/comments/like','POST',176,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(236,'查询评论下的回复','/comments/replies/*','GET',176,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(237,'查看友链列表','/links','GET',167,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(238,'查看留言列表','/messages','GET',173,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(239,'添加留言','/messages','POST',173,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(240,'查看标签列表','/tags','GET',170,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(241,'查看分类下对应的文章','/tags/*','GET',170,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(242,'用户注册','/users','POST',172,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(243,'修改用户头像','/users/avatar','POST',171,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(244,'发送邮箱验证码','/users/code','GET',172,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(245,'修改用户资料','/users/info','PUT',171,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(246,'qq登录','/users/oauth/qq','POST',172,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(247,'微博登录','/users/oauth/weibo','POST',172,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(248,'修改密码','/users/password','PUT',172,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(249,'上传语音','/voice','POST',166,'2021-03-20 22:56:20','2021-03-20 22:56:20',0,1),(250,'收藏网站模块','','',0,'2025-03-31 04:00:18','2025-03-31 04:00:18',0,0),(251,'查询收藏网站分类列表','/favorites/categories','GET',250,'2025-03-31 04:00:22','2025-03-31 04:00:22',1,0),(252,'查询收藏网站列表','/favorites','GET',250,'2025-03-31 04:00:22','2025-03-31 04:00:22',1,0),(253,'根据ID查询收藏网站','/favorites/*','GET',250,'2025-03-31 04:00:22','2025-03-31 04:00:22',1,0),(254,'添加或修改收藏网站分类','/admin/favorites/categories','POST',250,'2025-03-31 04:00:22','2025-03-31 04:00:22',0,0),(255,'添加或修改收藏网站','/admin/favorites','POST',250,'2025-03-31 04:00:22','2025-03-31 04:00:22',0,0),(256,'删除收藏网站分类','/admin/favorites/categories/*','DELETE',250,'2025-03-31 04:00:22','2025-03-31 04:00:22',0,0),(257,'删除收藏网站','/admin/favorites/*','DELETE',250,'2025-03-31 04:00:22','2025-03-31 04:00:22',0,0);
/*!40000 ALTER TABLE `tb_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_role`
--

DROP TABLE IF EXISTS `tb_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_role` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_name` varchar(20) CHARACTER SET utf8 COLLATE  utf8_general_ci DEFAULT NULL COMMENT '角色名',
  `role_label` varchar(50) CHARACTER SET utf8 COLLATE  utf8_general_ci DEFAULT NULL COMMENT '角色描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_disable` tinyint(1) DEFAULT NULL COMMENT '是否禁用  0否 1是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE= utf8_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_role`
--

LOCK TABLES `tb_role` WRITE;
/*!40000 ALTER TABLE `tb_role` DISABLE KEYS */;
INSERT INTO `tb_role` VALUES (1,'管理员','admin','2021-01-11 17:21:57','2025-03-29 13:55:58',0),(2,'用户','user','2021-01-11 20:17:05','2021-03-16 23:20:20',0),(3,'测试','test','2021-01-11 20:17:23','2021-03-16 23:41:59',0);
/*!40000 ALTER TABLE `tb_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_role_menu`
--

DROP TABLE IF EXISTS `tb_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_role_menu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` int DEFAULT NULL COMMENT '角色id',
  `menu_id` int DEFAULT NULL COMMENT '菜单id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1293 DEFAULT CHARSET=utf8 COLLATE= utf8_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_role_menu`
--

LOCK TABLES `tb_role_menu` WRITE;
/*!40000 ALTER TABLE `tb_role_menu` DISABLE KEYS */;
INSERT INTO `tb_role_menu` VALUES (1181,3,1),(1182,3,202),(1183,3,13),(1184,3,14),(1185,3,201),(1266,1,2),(1267,1,6),(1268,1,7),(1269,1,8),(1270,1,9),(1271,1,10),(1272,1,1),(1273,1,16),(1274,1,217),(1275,1,174),(1276,1,3),(1277,1,4),(1278,1,5),(1279,1,11),(1280,1,12),(1281,1,13),(1282,1,14),(1283,1,15),(1284,1,17),(1285,1,18),(1286,1,19),(1287,1,20),(1288,1,201),(1289,1,202),(1290,1,21),(1291,1,22),(1292,1,23);
/*!40000 ALTER TABLE `tb_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_role_resource`
--

DROP TABLE IF EXISTS `tb_role_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_role_resource` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int DEFAULT NULL COMMENT '角色id',
  `resource_id` int DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4273 DEFAULT CHARSET=utf8 COLLATE= utf8_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_role_resource`
--

LOCK TABLES `tb_role_resource` WRITE;
/*!40000 ALTER TABLE `tb_role_resource` DISABLE KEYS */;
INSERT INTO `tb_role_resource` VALUES (4178,1,1),(4179,1,217),(4180,1,174),(4181,1,174),(4182,1,165),(4183,1,166),(4184,1,167),(4185,1,168),(4186,1,169),(4187,1,170),(4188,1,171),(4189,1,172),(4190,1,173),(4191,1,175),(4192,1,176),(4193,1,177),(4194,1,178),(4195,1,179),(4196,1,180),(4197,1,181),(4198,1,182),(4199,1,183),(4200,1,184),(4201,1,185),(4202,1,186),(4203,1,187),(4204,1,188),(4205,1,189),(4206,1,190),(4207,1,191),(4208,1,192),(4209,1,193),(4210,1,194),(4211,1,195),(4212,1,196),(4213,1,197),(4214,1,198),(4215,1,199),(4216,1,200),(4217,1,201),(4218,1,202),(4219,1,203),(4220,1,204),(4221,1,205),(4222,1,206),(4223,1,207),(4224,1,208),(4225,1,209),(4226,1,210),(4227,1,211),(4228,1,212),(4229,1,213),(4230,1,214),(4231,1,215),(4232,1,216),(4233,1,218),(4234,1,219),(4235,1,220),(4236,1,221),(4237,1,222),(4238,1,223),(4239,1,224),(4240,1,225),(4241,1,226),(4242,1,227),(4243,1,228),(4244,1,229),(4245,1,230),(4246,1,231),(4247,1,232),(4248,1,233),(4249,1,234),(4250,1,235),(4251,1,236),(4252,1,237),(4253,1,238),(4254,1,239),(4255,1,240),(4256,1,241),(4257,1,242),(4258,1,243),(4259,1,244),(4260,1,245),(4261,1,246),(4262,1,247),(4263,1,248),(4264,1,249),(4265,1,250),(4266,1,251),(4267,1,252),(4268,1,253),(4269,1,254),(4270,1,255),(4271,1,256),(4272,1,257);
/*!40000 ALTER TABLE `tb_role_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tag`
--

DROP TABLE IF EXISTS `tb_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(20) CHARACTER SET utf8 COLLATE  utf8_general_ci NOT NULL COMMENT '标签名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE= utf8_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tag`
--

LOCK TABLES `tb_tag` WRITE;
/*!40000 ALTER TABLE `tb_tag` DISABLE KEYS */;
INSERT INTO `tb_tag` VALUES (18,'测试标签1','2021-03-20 22:02:51'),(19,'Java','2025-03-27 00:25:58'),(20,'Vue3','2025-03-27 00:48:47'),(22,'MySQL','2025-03-27 13:36:53'),(23,'设计模式','2025-03-27 13:37:08'),(24,'面向对象编程','2025-03-27 13:37:15'),(25,'Spring Boot','2025-03-27 13:37:22'),(26,'Linux','2025-03-27 13:37:31'),(27,'Python','2025-03-27 13:37:34'),(28,'编程思想','2025-03-27 13:37:45'),(29,'博客','2025-03-27 13:37:52'),(30,'PHP','2025-03-27 13:38:02');
/*!40000 ALTER TABLE `tb_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_unique_view`
--

DROP TABLE IF EXISTS `tb_unique_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_unique_view` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL COMMENT '时间',
  `views_count` int NOT NULL COMMENT '访问量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8 COLLATE= utf8_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_unique_view`
--

LOCK TABLES `tb_unique_view` WRITE;
/*!40000 ALTER TABLE `tb_unique_view` DISABLE KEYS */;
INSERT INTO `tb_unique_view` VALUES (223,'2025-03-25 00:00:01',0),(224,'2025-03-26 03:40:28',3),(225,'2025-03-27 00:00:00',3),(226,'2025-03-28 00:00:00',2),(227,'2025-03-30 00:00:01',2),(228,'2025-03-31 00:00:00',3);
/*!40000 ALTER TABLE `tb_unique_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_auth`
--

DROP TABLE IF EXISTS `tb_user_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user_auth` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_info_id` int NOT NULL COMMENT '用户信息id',
  `username` varchar(50) CHARACTER SET utf8 COLLATE  utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE  utf8_general_ci NOT NULL COMMENT '密码',
  `login_type` tinyint(1) NOT NULL COMMENT '登录类型',
  `ip_addr` varchar(50) CHARACTER SET utf8 COLLATE  utf8_general_ci DEFAULT NULL COMMENT '用户登录ip',
  `ip_source` varchar(50) CHARACTER SET utf8 COLLATE  utf8_general_ci DEFAULT NULL COMMENT 'ip来源',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '上次登录时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8 COLLATE= utf8_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_auth`
--

LOCK TABLES `tb_user_auth` WRITE;
/*!40000 ALTER TABLE `tb_user_auth` DISABLE KEYS */;
INSERT INTO `tb_user_auth` VALUES (1,1,'15967777744@163.com','$2a$10$FKhj8Hv638OZxthl02QPa.gGgXNqpkxYRcXXBJPITQybiWLcSp8h2',0,'127.0.0.1','','2025-03-26 00:48:31','2025-04-01 16:42:19'),(201,2,'15967777744@qq.com','$2a$10$hha62NjZl8txqHpWsTLBM.fbBIpxPV1SgGVtBeLVIGqfJXEHyWzbS',0,'127.0.0.1','','2025-03-29 11:48:33',NULL),(202,5,'15967777744','$2a$10$oAOdqV.SE95ugZUZ5KQZMu2wF1gxJXE4e0qIgqTWd4q/FSw/HpUuK',3,'127.0.0.1','','2025-03-29 17:10:08','2025-04-01 16:42:40'),(203,6,'15967777777','$2a$10$W1FI8tFJDl1SaZK1SIfGF.O4oWgn4HPHqA4GxcVtJxsdsDvRmqyM2',3,'127.0.0.1','','2025-03-29 17:13:30','2025-03-29 17:16:23'),(204,7,'15967777744@gmail.com','$2a$10$62QgZJ0XxCGutnm3nX7Wku8atlz5A9mjjF3VFrGkPIG5EusyR9QoS',0,'127.0.0.1','','2025-03-29 22:54:20','2025-03-29 22:54:20');
/*!40000 ALTER TABLE `tb_user_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_info`
--

DROP TABLE IF EXISTS `tb_user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user_info` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `email` varchar(50) CHARACTER SET utf8 COLLATE  utf8_general_ci DEFAULT NULL COMMENT '邮箱号',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE  utf8_general_ci NOT NULL COMMENT '用户昵称',
  `avatar` varchar(1024) CHARACTER SET utf8 COLLATE  utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `intro` varchar(255) CHARACTER SET utf8 COLLATE  utf8_general_ci DEFAULT NULL COMMENT '用户简介',
  `web_site` varchar(255) CHARACTER SET utf8 COLLATE  utf8_general_ci DEFAULT NULL COMMENT '个人网站',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_disable` tinyint(1) DEFAULT '0' COMMENT '是否禁用',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE= utf8_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_info`
--

LOCK TABLES `tb_user_info` WRITE;
/*!40000 ALTER TABLE `tb_user_info` DISABLE KEYS */;
INSERT INTO `tb_user_info` VALUES (1,'admin@163.com',NULL,'Auroral','https://big-event20040810.oss-cn-beijing.aliyuncs.com/avatar/1905856827862609921.jpg','去无人的岛 摸鲨鱼的角','https://www.fishblog.yyf040810.cn','2025-03-26 00:48:31','2025-03-29 13:37:16',0),(2,'admin@qq.com',NULL,'Auroral0810','https://big-event20040810.oss-cn-beijing.aliyuncs.com/avatar/default.png',NULL,NULL,'2025-03-29 11:48:33',NULL,0),(5,NULL,'15967777744','用户1905899605594255361','https://big-event20040810.oss-cn-beijing.aliyuncs.com/avatar/default.png',NULL,NULL,'2025-03-29 17:10:07',NULL,0),(6,NULL,'15967777777','用户1905899605594255361','https://big-event20040810.oss-cn-beijing.aliyuncs.com/avatar/default.png',NULL,NULL,'2025-03-29 17:13:30',NULL,0),(7,'admin@gmail.com',NULL,'用户1905996951623692289','https://big-event20040810.oss-cn-beijing.aliyuncs.com/avatar/default.png',NULL,NULL,'2025-03-29 22:54:20',NULL,0);
/*!40000 ALTER TABLE `tb_user_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_role`
--

DROP TABLE IF EXISTS `tb_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL COMMENT '用户id',
  `role_id` int DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=232 DEFAULT CHARSET=utf8 COLLATE= utf8_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_role`
--

LOCK TABLES `tb_user_role` WRITE;
/*!40000 ALTER TABLE `tb_user_role` DISABLE KEYS */;
INSERT INTO `tb_user_role` VALUES (2,23,3),(5,3,2),(6,4,2),(7,5,2),(8,7,2),(9,8,2),(10,9,2),(11,10,2),(12,11,2),(13,15,2),(14,16,2),(15,18,2),(16,19,2),(17,21,2),(18,22,2),(19,23,2),(20,24,2),(21,25,2),(22,26,2),(23,27,2),(24,28,2),(25,29,2),(26,30,2),(27,31,2),(28,33,2),(29,35,2),(30,36,2),(31,37,2),(32,38,2),(33,39,2),(34,40,2),(35,41,2),(36,42,2),(37,44,2),(38,45,2),(39,46,2),(40,47,2),(41,48,2),(42,49,2),(43,52,2),(44,54,2),(45,55,2),(46,56,2),(47,57,2),(48,58,2),(49,59,2),(50,60,2),(51,61,2),(52,62,2),(53,63,2),(54,64,2),(55,65,2),(56,67,2),(57,68,2),(58,69,2),(59,70,2),(60,71,2),(61,72,2),(62,73,2),(63,74,2),(64,75,2),(65,76,2),(66,77,2),(67,78,2),(68,79,2),(69,80,2),(70,81,2),(71,82,2),(72,83,2),(73,84,2),(74,85,2),(75,86,2),(76,87,2),(77,88,2),(78,89,2),(79,90,2),(80,91,2),(81,92,2),(100,105,2),(133,138,2),(134,139,2),(135,140,2),(136,141,2),(137,142,2),(138,143,2),(139,144,2),(140,145,2),(141,146,2),(142,147,2),(143,148,2),(144,149,2),(145,150,2),(146,151,2),(147,152,2),(148,153,2),(149,154,2),(150,155,2),(151,156,2),(152,157,2),(153,158,2),(154,159,2),(155,160,2),(156,161,2),(157,162,2),(158,163,2),(159,164,2),(160,165,2),(161,167,2),(162,166,2),(163,168,2),(164,169,2),(165,170,2),(166,171,2),(167,172,2),(168,173,2),(169,174,2),(170,175,2),(171,176,2),(172,177,2),(173,178,2),(174,179,2),(175,180,2),(176,181,2),(177,182,2),(178,183,2),(179,184,2),(180,185,2),(181,186,2),(182,187,2),(183,188,2),(184,189,2),(185,190,2),(186,191,2),(187,192,2),(188,193,2),(189,194,2),(191,196,2),(192,195,2),(193,198,2),(194,197,2),(195,199,2),(196,200,2),(197,201,2),(198,202,2),(199,203,2),(200,204,2),(201,205,2),(202,206,2),(203,207,2),(204,208,2),(205,209,2),(206,210,2),(223,2,2),(224,2,1),(225,4,2),(226,1,1),(227,1,2),(229,5,2),(230,6,2),(231,7,2);
/*!40000 ALTER TABLE `tb_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-04 14:53:12
