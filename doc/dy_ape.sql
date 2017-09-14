# Host: 112.124.1.72  (Version 5.6.22)
# Date: 2017-08-12 11:04:44
# Generator: MySQL-Front 5.4  (Build 1.36)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "ape_invite_code"
#

DROP TABLE IF EXISTS `ape_invite_code`;
CREATE TABLE `ape_invite_code` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL DEFAULT '' COMMENT '码值',
  `status` tinyint(3) DEFAULT NULL COMMENT '状态 0-未使用 1-已使用 2-已过期',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `end_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '过期时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `uk_code` (`code`) COMMENT '邀请码唯一性索引'
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COMMENT='邀请码';

#
# Data for table "ape_invite_code"
#

INSERT INTO `ape_invite_code` VALUES (7,'ldauuw',0,'2017-06-13 17:47:00','2017-09-13 17:47:01'),(17,'s4mtxe',0,'2017-06-13 17:49:08','2017-09-13 17:49:09'),(18,'xfgyfx',0,'2017-06-13 17:49:08','2017-09-13 17:49:09'),(19,'4txuim',0,'2017-06-13 17:49:08','2017-09-13 17:49:09'),(20,'jwpbps',0,'2017-06-13 17:49:08','2017-09-13 17:49:09'),(21,'meatvv',0,'2017-06-13 17:49:08','2017-09-13 17:49:09'),(22,'rnp8js',0,'2017-06-13 17:50:02','2017-09-13 17:50:02'),(23,'5ckg7m',0,'2017-06-13 17:50:02','2017-09-13 17:50:02'),(24,'nns7i3',0,'2017-06-13 17:50:02','2017-09-13 17:50:02'),(25,'kttj4b',0,'2017-06-13 17:50:02','2017-09-13 17:50:02'),(26,'vqvhci',0,'2017-06-13 17:50:02','2017-09-13 17:50:02'),(27,'cpmqxb',0,'2017-06-13 17:50:56','2017-09-13 17:50:56'),(28,'l7xnna',0,'2017-06-13 17:50:56','2017-09-13 17:50:56'),(29,'jxcark',0,'2017-06-13 17:50:56','2017-09-13 17:50:56'),(30,'4qjyui',0,'2017-06-13 17:50:56','2017-09-13 17:50:56'),(31,'yfrdqw',0,'2017-06-13 17:50:56','2017-09-13 17:50:56'),(32,'ddvhlg',0,'2017-06-13 17:50:56','2017-09-13 17:50:57'),(33,'myrms4',0,'2017-06-13 17:50:56','2017-09-13 17:50:57'),(34,'inq4yq',0,'2017-06-13 17:50:56','2017-09-13 17:50:57'),(35,'bb3qgw',0,'2017-06-13 17:50:56','2017-09-13 17:50:57'),(36,'3enpet',0,'2017-06-13 17:50:56','2017-09-13 17:50:57'),(38,'veacby',0,'2017-06-13 17:52:07','2017-09-13 17:52:07'),(39,'kngsjc',0,'2017-06-13 17:52:07','2017-09-13 17:52:07'),(42,'nxnhpq',0,'2017-06-13 17:53:10','2017-09-13 17:53:11'),(43,'kewxcc',0,'2017-06-13 17:53:10','2017-09-13 17:53:11'),(44,'lqvyfb',0,'2017-06-13 17:53:10','2017-09-13 17:53:11'),(45,'jeiwi5',0,'2017-06-13 17:53:10','2017-09-13 17:53:11'),(47,'bsx859',0,'2017-06-13 17:55:30','2017-09-13 17:55:31'),(48,'ndyxvl',0,'2017-06-13 17:55:30','2017-09-13 17:55:31'),(49,'6iucnb',0,'2017-06-13 17:55:30','2017-09-13 17:55:31'),(50,'i6es6m',0,'2017-06-13 17:55:30','2017-09-13 17:55:31'),(52,'sjfcxu',0,'2017-06-13 17:57:30','2017-09-13 17:57:30'),(53,'6wfyk7',0,'2017-06-13 17:57:30','2017-09-13 17:57:30'),(54,'vf5bvy',0,'2017-06-13 17:57:30','2017-09-13 17:57:30'),(55,'kgy9qv',0,'2017-06-13 17:57:30','2017-09-13 17:57:30'),(56,'t7rega',0,'2017-06-13 17:57:30','2017-09-13 17:57:30'),(57,'yuuy9y',0,'2017-06-13 18:00:32','2017-09-13 18:00:32'),(58,'xbrt4w',0,'2017-06-13 18:00:32','2017-09-13 18:00:32'),(59,'yijqcs',0,'2017-06-13 18:00:32','2017-09-13 18:00:32'),(60,'efgsnv',0,'2017-06-13 18:00:32','2017-09-13 18:00:32'),(61,'ypvhhh',0,'2017-06-13 18:00:32','2017-09-13 18:00:32'),(62,'tckkmh',0,'2017-06-13 18:20:59','2017-09-13 18:20:59'),(63,'ywjfrh',0,'2017-06-13 18:20:59','2017-09-13 18:21:00'),(64,'a4esma',0,'2017-06-13 18:20:59','2017-09-13 18:21:00'),(65,'fpclc7',0,'2017-06-13 18:20:59','2017-09-13 18:21:00'),(66,'cebvey',0,'2017-06-13 18:20:59','2017-09-13 18:21:00'),(67,'iudl5g',0,'2017-06-13 18:26:03','2017-09-13 18:26:03'),(68,'vvmuln',0,'2017-06-13 18:26:03','2017-09-13 18:26:03'),(69,'s5sqwg',0,'2017-06-13 18:26:03','2017-09-13 18:26:03'),(70,'ixfgfl',0,'2017-06-13 18:26:03','2017-09-13 18:26:03'),(71,'l8vnya',0,'2017-06-13 18:26:03','2017-09-13 18:26:03'),(72,'5ricwj',0,'2017-06-14 09:06:20','2017-09-14 09:06:21'),(73,'dyd8x7',0,'2017-06-14 09:06:20','2017-09-14 09:06:21'),(74,'dnxrdk',0,'2017-06-14 09:06:20','2017-09-14 09:06:21'),(75,'fxv6qj',0,'2017-06-14 09:06:20','2017-09-14 09:06:21'),(76,'trrmre',0,'2017-06-14 09:06:20','2017-09-14 09:06:21'),(77,'nnqwrj',0,'2017-06-14 13:28:06','2017-09-14 13:28:07'),(78,'rnnuhl',0,'2017-06-14 13:28:06','2017-09-14 13:28:07'),(80,'u5sbg5',0,'2017-06-14 13:28:06','2017-09-14 13:28:07'),(81,'i6rmwp',0,'2017-06-14 13:28:07','2017-09-14 13:28:07'),(83,'fnncwq',0,'2017-06-15 23:07:40','2017-09-15 23:07:41'),(84,'xretkv',0,'2017-06-15 23:07:40','2017-09-15 23:07:41'),(85,'8bcvmy',0,'2017-06-15 23:07:40','2017-09-15 23:07:41'),(86,'rvnnyt',0,'2017-06-15 23:07:40','2017-09-15 23:07:41'),(87,'dawdkh',0,'2017-06-15 23:07:40','2017-09-15 23:07:41'),(88,'mbg7wv',0,'2017-06-21 21:31:31','2017-09-21 21:31:32'),(89,'pfgxl6',0,'2017-06-21 21:31:31','2017-09-21 21:31:32'),(90,'6bvnu3',0,'2017-06-21 21:31:31','2017-09-21 21:31:32'),(91,'x3kvc9',0,'2017-06-21 21:31:31','2017-09-21 21:31:32'),(92,'mhggiw',0,'2017-06-21 21:31:31','2017-09-21 21:31:32');

#
# Structure for table "ape_test"
#

DROP TABLE IF EXISTS `ape_test`;
CREATE TABLE `ape_test` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='测试用';

#
# Data for table "ape_test"
#


#
# Structure for table "ape_user"
#

DROP TABLE IF EXISTS `ape_user`;
CREATE TABLE `ape_user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `real_name` varchar(255) DEFAULT '' COMMENT '真实姓名',
  `sex` varchar(255) DEFAULT '' COMMENT '性别',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `phone` varchar(255) DEFAULT NULL COMMENT '手机号码',
  `wx` varchar(255) DEFAULT NULL COMMENT '微信号',
  `qq` varchar(255) DEFAULT NULL COMMENT 'qq号',
  `code_url` varchar(255) DEFAULT NULL COMMENT '代码库地址',
  `blog_url` varchar(255) DEFAULT NULL COMMENT '博客地址',
  `school_name` varchar(255) DEFAULT '' COMMENT '学校名称',
  `degree` tinyint(3) DEFAULT NULL COMMENT '学历 1-本科 2-专科 3-研究生 4-博士',
  `gradu_time` datetime DEFAULT NULL COMMENT '毕业时间',
  `hack_domain` varchar(255) DEFAULT '' COMMENT '个性域名',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `major` varchar(255) DEFAULT NULL COMMENT '大学专业',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `uk_hack_domain` (`hack_domain`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='用户表';

#
# Data for table "ape_user"
#

INSERT INTO `ape_user` VALUES (32,NULL,NULL,NULL,'541641622@qq.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ww','4185e24baaf8395a753362fb72f02c6b',NULL),(33,NULL,NULL,NULL,'123456@qq.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'todo','a07048c2da8dbd236847d29f39c7b6d7',NULL),(34,'高开亮','M','1991-12-12 00:00:00','1027336328@qq.com','18251767971','466580669','1027336328','https://git.oschina.net/','https://my.oschina.net/u/3268478/blog','上海震旦职业学院',2,'2011-06-30 00:00:00','gkl','2795b366cbcfbc3acf65a73965c3b21a','国际商务'),(35,'张三','M','1900-07-21 00:00:00','2371671422@qq.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'a7dd51bf45ad7cc4b4d03a1f8bcb80c9',NULL),(36,NULL,NULL,NULL,'1551130722@qq.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'b5667800787bbcb7ec6f12386385d293',NULL),(37,'代守诚','M','1992-02-05 00:00:00','1522391464@qq.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ebb6c55d16e53d8a8899b9ebeab23d0f',NULL),(38,NULL,NULL,NULL,'273811343@qq.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'765fcfbf3859ebb924174063e2be7be7',NULL),(39,NULL,NULL,NULL,'1051528468@qq.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'caabc32f6c55e016849221e489e60fca',NULL),(40,NULL,NULL,NULL,'yingyunzhizi@163.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'d9d42b5a9eaf04ea10b022763a018a9c',NULL),(41,NULL,NULL,NULL,'876434333@qq.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'08813e11a69bf3c21e28fbe3d1480001',NULL),(42,NULL,NULL,NULL,'970012916@qq.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'050445aa393b7dfce9d2e56f0e27feeb',NULL),(43,NULL,NULL,NULL,'1143336350@qq.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'b692dbad9e03a89d64f2dcbec26f3d74',NULL),(44,NULL,NULL,NULL,'1124646194@qq.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'879319ffdf52f56380431517aa884150',NULL),(45,NULL,NULL,NULL,'854594875@qq.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9935d75702c4c1bbb014efc5df196a20',NULL),(46,'毛涛','M','1993-02-28 00:00:00','923371425@qq.com','18011447483','18011447483','92371425',NULL,NULL,'成都大学',1,'2016-06-20 00:00:00','mt','b71252da8c38ecd8c85b0e83ef891c75','材料成型及控制工程'),(47,NULL,NULL,NULL,'zhangtao@dayuanit.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'077f1a1879374f7088f13be901ad4bd8',NULL),(48,NULL,NULL,NULL,'111111@qq.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05095629ffe6064c2515efbf39973647',NULL);

#
# Structure for table "ape_user_book"
#

DROP TABLE IF EXISTS `ape_user_book`;
CREATE TABLE `ape_user_book` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `book_name` varchar(255) DEFAULT NULL COMMENT '书本名称',
  `progess` tinyint(3) DEFAULT NULL COMMENT '进度',
  `book_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='读书表';

#
# Data for table "ape_user_book"
#


#
# Structure for table "ape_user_code"
#

DROP TABLE IF EXISTS `ape_user_code`;
CREATE TABLE `ape_user_code` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `invite_id` int(11) NOT NULL DEFAULT '0' COMMENT '邀请码ID',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8 COMMENT='用户邀请码表';

#
# Data for table "ape_user_code"
#

INSERT INTO `ape_user_code` VALUES (156,32,7),(157,32,8),(158,32,9),(159,32,10),(160,32,11),(161,33,12),(162,33,13),(163,33,14),(164,33,15),(165,33,16),(166,34,17),(167,34,18),(168,34,19),(169,34,20),(170,34,21),(171,35,22),(172,35,23),(173,35,24),(174,35,25),(175,35,26),(176,36,27),(177,36,28),(178,36,29),(179,36,30),(180,36,31),(181,37,32),(182,37,33),(183,37,34),(184,37,35),(185,37,36),(186,38,37),(187,38,38),(188,38,39),(189,38,40),(190,38,41),(191,39,42),(192,39,43),(193,39,44),(194,39,45),(195,39,46),(196,40,47),(197,40,48),(198,40,49),(199,40,50),(200,40,51),(201,41,52),(202,41,53),(203,41,54),(204,41,55),(205,41,56),(206,42,57),(207,42,58),(208,42,59),(209,42,60),(210,42,61),(211,43,62),(212,43,63),(213,43,64),(214,43,65),(215,43,66),(216,44,67),(217,44,68),(218,44,69),(219,44,70),(220,44,71),(221,45,72),(222,45,73),(223,45,74),(224,45,75),(225,45,76),(226,46,77),(227,46,78),(228,46,79),(229,46,80),(230,46,81),(231,47,83),(232,47,84),(233,47,85),(234,47,86),(235,47,87),(236,48,88),(237,48,89),(238,48,90),(239,48,91),(240,48,92);

#
# Structure for table "ape_user_company"
#

DROP TABLE IF EXISTS `ape_user_company`;
CREATE TABLE `ape_user_company` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `company_name` varchar(255) NOT NULL DEFAULT '' COMMENT '公司名称',
  `position` varchar(255) DEFAULT NULL COMMENT '职位',
  `post_desc` varchar(700) DEFAULT NULL COMMENT '职位描述',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` varchar(255) DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户工作经历';

#
# Data for table "ape_user_company"
#

INSERT INTO `ape_user_company` VALUES (2,46,'南京千牛软件有限公司','java程序员','&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;敲代码','2017-02-13 00:00:00',NULL),(3,37,'江苏大学','教授哈哈','教授少时诵诗书所所所所所所所所所所所','2011-01-01 00:00:00',NULL);

#
# Structure for table "ape_user_info"
#

DROP TABLE IF EXISTS `ape_user_info`;
CREATE TABLE `ape_user_info` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `one_word` varchar(255) DEFAULT '' COMMENT '一句话',
  `about_me` varchar(700) DEFAULT '' COMMENT '自我介绍',
  `skill_desc` varchar(700) DEFAULT NULL COMMENT '技能描述',
  `express_desc` varchar(700) DEFAULT NULL COMMENT '工作经历描述',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `uk_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='用户详情表';

#
# Data for table "ape_user_info"
#

INSERT INTO `ape_user_info` VALUES (19,32,NULL,NULL,NULL,NULL),(20,33,NULL,NULL,NULL,NULL),(21,34,'既然选择了远方，便只顾风雨兼程。','1.本人有良好的团队合作精神，能迅速融入新的团队。\n<br>2.易和人相处，拥有良好的亲和力。\n<br>3.能吃苦耐劳，能在较大的压力下保持良好的工作态，善于自我调节。\n<br>4.具有强烈的责任感，工作踏实。性格开朗乐观，积极上进。\n<br>5.有较强的学习能力，对Java编程有浓厚的兴趣。','1.掌握Java编程语言，拥有良好的Java编程习惯和代码规范；\n<br>2.熟练使用Juint4、Log4j、Debug等进行程序的调试；\n<br>3.熟悉MySql数据库，掌握基本SQL语句操作，对SQL的优化有一定的认识；\n<br>4.掌握JSP、Servlet、HTML、JavaScript、jQuery、Ajax、JSTL、EL、apache&nbsp;tiles框架、WebService、Socket等开发技能；\n<br>5.能够使用SpringMVC、&nbsp;Spring、MyBatis框架进行WEB开发；\n<br>6.熟练使用Eclipse等开发工具、能够使用Tomcat运行web项目以及基本配置，能够使用maven构建项目以及常用的命令；\n<br>7.能够正确使用SVN在项目的应用，理解分支和主干的区别。使用过一些常用的第三方框架，比如，日志框架logback，定时器quartz，序列化工具Jackson，单元测试工具Junit，以及处理http协议的httpclient等；\n<br>8.能够使用redis缓存提高系统的性能',NULL),(22,35,NULL,NULL,NULL,NULL),(23,36,NULL,NULL,NULL,NULL),(24,37,NULL,NULL,NULL,NULL),(25,38,NULL,NULL,NULL,NULL),(26,39,NULL,NULL,NULL,NULL),(27,40,NULL,NULL,NULL,NULL),(28,41,NULL,NULL,NULL,NULL),(29,42,NULL,NULL,NULL,NULL),(30,43,NULL,NULL,NULL,NULL),(31,44,NULL,NULL,NULL,NULL),(32,45,NULL,NULL,NULL,NULL),(33,46,NULL,NULL,'具备扎实的Java基础知识，良好的面向对象编程思想和代码规范。\n<br>了解Javaweb技术，包括Servlet、JSP、Cookie、Session、EL表达式等技术。\n<br>能够使用spring+spring&nbsp;MVC+mybatis搭建项目。\n<br>熟练掌握了SQL语句的编写，对SQL的优化有一定的认识。\n<br>熟练使用SVN,Maven，eclipse等项目开发及管理工具。\n<br>掌握前段JavaScript编程以及ajax技术，能够使用jQuery操作DOM以及一些常用的功能。\n<br>熟悉Linux常用命令\n<br>能够使用redis缓存提高系统的性能。\n<br>能够正确使用SVN在项目的应用，理解分支和主干的区别。使用过一些常用的第三方框架，比如，apache&nbsp;title框架，日志框架logback，定时器quartz，序列化工具Jackson，单元测试工具Junit，以及处理http协议的httpclient。',NULL),(34,47,NULL,NULL,NULL,NULL),(35,48,NULL,NULL,NULL,NULL);
