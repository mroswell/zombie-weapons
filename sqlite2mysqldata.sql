use zombie_weapons;

DROP TABLE IF EXISTS auth_permission;
CREATE TABLE IF NOT EXISTS `auth_permission` (
    `id` integer NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` varchar(50) NOT NULL,
    `content_type_id` integer NOT NULL,
    `codename` varchar(100) NOT NULL,
    UNIQUE (`content_type_id`, `codename`)
);
INSERT INTO auth_permission VALUES(1,'Can add group',2,'add_group');
INSERT INTO auth_permission VALUES(2,'Can add permission',1,'add_permission');
INSERT INTO auth_permission VALUES(3,'Can add user',3,'add_user');
INSERT INTO auth_permission VALUES(4,'Can change group',2,'change_group');
INSERT INTO auth_permission VALUES(5,'Can change permission',1,'change_permission');
INSERT INTO auth_permission VALUES(6,'Can change user',3,'change_user');
INSERT INTO auth_permission VALUES(7,'Can delete group',2,'delete_group');
INSERT INTO auth_permission VALUES(8,'Can delete permission',1,'delete_permission');
INSERT INTO auth_permission VALUES(9,'Can delete user',3,'delete_user');
INSERT INTO auth_permission VALUES(10,'Can add content type',4,'add_contenttype');
INSERT INTO auth_permission VALUES(11,'Can change content type',4,'change_contenttype');
INSERT INTO auth_permission VALUES(12,'Can delete content type',4,'delete_contenttype');
INSERT INTO auth_permission VALUES(13,'Can add session',5,'add_session');
INSERT INTO auth_permission VALUES(14,'Can change session',5,'change_session');
INSERT INTO auth_permission VALUES(15,'Can delete session',5,'delete_session');
INSERT INTO auth_permission VALUES(16,'Can add site',6,'add_site');
INSERT INTO auth_permission VALUES(17,'Can change site',6,'change_site');
INSERT INTO auth_permission VALUES(18,'Can delete site',6,'delete_site');
INSERT INTO auth_permission VALUES(19,'Can add migration history',7,'add_migrationhistory');
INSERT INTO auth_permission VALUES(20,'Can change migration history',7,'change_migrationhistory');
INSERT INTO auth_permission VALUES(21,'Can delete migration history',7,'delete_migrationhistory');
INSERT INTO auth_permission VALUES(22,'Can add weapon',8,'add_weapon');
INSERT INTO auth_permission VALUES(23,'Can change weapon',8,'change_weapon');
INSERT INTO auth_permission VALUES(24,'Can delete weapon',8,'delete_weapon');
INSERT INTO auth_permission VALUES(25,'Can add log entry',9,'add_logentry');
INSERT INTO auth_permission VALUES(26,'Can change log entry',9,'change_logentry');
INSERT INTO auth_permission VALUES(27,'Can delete log entry',9,'delete_logentry');
INSERT INTO auth_permission VALUES(31,'Can add household item',11,'add_householditem');
INSERT INTO auth_permission VALUES(32,'Can change household item',11,'change_householditem');
INSERT INTO auth_permission VALUES(33,'Can delete household item',11,'delete_householditem');
DROP TABLE IF EXISTS auth_group_permissions;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
    `id` integer NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `group_id` integer NOT NULL,
    `permission_id` integer NOT NULL REFERENCES `auth_permission` (`id`),
    UNIQUE (`group_id`, `permission_id`)
);
DROP TABLE IF EXISTS auth_group;
CREATE TABLE IF NOT EXISTS `auth_group` (
    `id` integer NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` varchar(80) NOT NULL UNIQUE
);
DROP TABLE IF EXISTS auth_user_user_permissions;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
    `id` integer NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `user_id` integer NOT NULL,
    `permission_id` integer NOT NULL REFERENCES `auth_permission` (`id`),
    UNIQUE (`user_id`, `permission_id`)
);
DROP TABLE IF EXISTS auth_user_groups;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
    `id` integer NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `user_id` integer NOT NULL,
    `group_id` integer NOT NULL REFERENCES `auth_group` (`id`),
    UNIQUE (`user_id`, `group_id`)
);
DROP TABLE IF EXISTS auth_user;
CREATE TABLE IF NOT EXISTS `auth_user` (
    `id` integer NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `username` varchar(30) NOT NULL UNIQUE,
    `first_name` varchar(30) NOT NULL,
    `last_name` varchar(30) NOT NULL,
    `email` varchar(75) NOT NULL,
    `password` varchar(128) NOT NULL,
    `is_staff` bool NOT NULL,
    `is_active` bool NOT NULL,
    `is_superuser` bool NOT NULL,
    `last_login` datetime NOT NULL,
    `date_joined` datetime NOT NULL
);
INSERT INTO auth_user VALUES(1,'admin','','','admin@anywhere.com','pbkdf2_sha256$10000$onkjxHjulmjh$qS6EIUBL1NqhRNdQ2Avtnu0cTOH1GUCOwdn0ojn2lWM=',1,1,1,'2012-06-19 03:21:31.098371','2012-06-05 22:14:53');
DROP TABLE IF EXISTS django_content_type;
CREATE TABLE IF NOT EXISTS `django_content_type` (
    `id` integer NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` varchar(100) NOT NULL,
    `app_label` varchar(100) NOT NULL,
    `model` varchar(100) NOT NULL,
    UNIQUE (`app_label`, `model`)
);
INSERT INTO django_content_type VALUES(1,'permission','auth','permission');
INSERT INTO django_content_type VALUES(2,'group','auth','group');
INSERT INTO django_content_type VALUES(3,'user','auth','user');
INSERT INTO django_content_type VALUES(4,'content type','contenttypes','contenttype');
INSERT INTO django_content_type VALUES(5,'session','sessions','session');
INSERT INTO django_content_type VALUES(6,'site','sites','site');
INSERT INTO django_content_type VALUES(7,'migration history','south','migrationhistory');
INSERT INTO django_content_type VALUES(8,'weapon','weapons','weapon');
INSERT INTO django_content_type VALUES(9,'log entry','admin','logentry');
INSERT INTO django_content_type VALUES(11,'household item','weapons','householditem');
DROP TABLE IF EXISTS django_session;
CREATE TABLE IF NOT EXISTS `django_session` (
    `session_key` varchar(40) NOT NULL PRIMARY KEY,
    `session_data` text NOT NULL,
    `expire_date` datetime NOT NULL
);
INSERT INTO django_session VALUES('b0ce94ca36886c149fd72c8db59141cb','ZjY2ZjU4YTk0MjU4N2M1ZDQ2ZTJhN2M5MjUzZTU3MTc3MDlmZjgxZTqAAn1xAShVEl9hdXRoX3Vz
ZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED
VQ1fYXV0aF91c2VyX2lkcQRLAXUu
','2012-06-19 22:30:57.439263');
INSERT INTO django_session VALUES('30bb307f232658a9a36c94ddfa365642','ZjY2ZjU4YTk0MjU4N2M1ZDQ2ZTJhN2M5MjUzZTU3MTc3MDlmZjgxZTqAAn1xAShVEl9hdXRoX3Vz
ZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED
VQ1fYXV0aF91c2VyX2lkcQRLAXUu
','2012-07-03 03:21:31.187878');
DROP TABLE IF EXISTS django_site;
CREATE TABLE IF NOT EXISTS `django_site` (
    `id` integer NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `domain` varchar(100) NOT NULL,
    `name` varchar(50) NOT NULL
);
INSERT INTO django_site VALUES(1,'example.com','example.com');
DROP TABLE IF EXISTS south_migrationhistory;
CREATE TABLE IF NOT EXISTS `south_migrationhistory` (
    `id` integer NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `app_name` varchar(255) NOT NULL,
    `migration` varchar(255) NOT NULL,
    `applied` datetime NOT NULL
);
INSERT INTO south_migrationhistory VALUES(1,'weapons','0001_initial','2012-06-05 22:26:55.324718');
INSERT INTO south_migrationhistory VALUES(2,'weapons','0002_auto__add_field_weapon_image','2012-06-05 23:47:31.784775');
INSERT INTO south_migrationhistory VALUES(3,'weapons','0003_auto__add_householditems','2012-06-05 23:53:12.709700');
INSERT INTO south_migrationhistory VALUES(4,'weapons','0004_auto__del_householditems__add_householditem','2012-06-05 23:53:44.922099');
INSERT INTO south_migrationhistory VALUES(5,'weapons','0005_auto','2012-06-06 01:31:03.968736');
DROP TABLE IF EXISTS django_admin_log;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
    `id` integer NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `action_time` datetime NOT NULL,
    `user_id` integer NOT NULL REFERENCES `auth_user` (`id`),
    `content_type_id` integer REFERENCES `django_content_type` (`id`),
    `object_id` text,
    `object_repr` varchar(200) NOT NULL,
    `action_flag` smallint unsigned NOT NULL,
    `change_message` text NOT NULL
);
INSERT INTO django_admin_log VALUES(1,'2012-06-05 23:38:15.891029',1,8,'1','Lamp',1,'');
INSERT INTO django_admin_log VALUES(2,'2012-06-05 23:38:51.979946',1,8,'1','Lamp',3,'');
INSERT INTO django_admin_log VALUES(3,'2012-06-05 23:49:07.758778',1,8,'1','Lamp',1,'');
INSERT INTO django_admin_log VALUES(4,'2012-06-05 23:51:23.320270',1,8,'1','Lamp',3,'');
INSERT INTO django_admin_log VALUES(5,'2012-06-05 23:51:40.973546',1,8,'1','Lamp',1,'');
INSERT INTO django_admin_log VALUES(6,'2012-06-05 23:54:34.881386',1,8,'1','Lamp',3,'');
INSERT INTO django_admin_log VALUES(7,'2012-06-05 23:55:01.308155',1,11,'1','Lamp',1,'');
INSERT INTO django_admin_log VALUES(8,'2012-06-05 23:55:34.943478',1,11,'1','Lamp',3,'');
INSERT INTO django_admin_log VALUES(9,'2012-06-06 00:26:04.504537',1,11,'1','Lamp',1,'');
INSERT INTO django_admin_log VALUES(10,'2012-06-06 01:29:57.399258',1,11,'1','Lamp',3,'');
INSERT INTO django_admin_log VALUES(11,'2012-06-06 01:30:09.345994',1,11,'1','Lamp',3,'');
INSERT INTO django_admin_log VALUES(12,'2012-06-06 01:31:15.660376',1,11,'1','Lamp',3,'');
INSERT INTO django_admin_log VALUES(13,'2012-06-06 01:31:30.750032',1,11,'1','Lamp',1,'');
INSERT INTO django_admin_log VALUES(14,'2012-06-06 01:34:25.446830',1,11,'1','Lamp',3,'');
INSERT INTO django_admin_log VALUES(15,'2012-06-06 01:34:41.929545',1,11,'1','Lamp',1,'');
INSERT INTO django_admin_log VALUES(16,'2012-06-06 01:35:49.755389',1,11,'1','Lamp',3,'');
INSERT INTO django_admin_log VALUES(17,'2012-06-06 01:36:04.759126',1,11,'1','Lamp',1,'');
INSERT INTO django_admin_log VALUES(18,'2012-06-06 01:36:56.428269',1,11,'1','Lamp',3,'');
INSERT INTO django_admin_log VALUES(19,'2012-06-06 01:37:10.472872',1,11,'1','Lamp',1,'');
INSERT INTO django_admin_log VALUES(20,'2012-06-06 03:09:57.137655',1,8,'1','forgot to create an item',1,'');
INSERT INTO django_admin_log VALUES(21,'2012-06-06 20:46:23.159995',1,8,'2','another weapon',1,'');
INSERT INTO django_admin_log VALUES(22,'2012-06-06 23:28:58.404728',1,8,'1','forgot to create an item',3,'');
INSERT INTO django_admin_log VALUES(23,'2012-06-06 23:28:58.549339',1,8,'2','another weapon',3,'');
INSERT INTO django_admin_log VALUES(24,'2012-06-06 23:29:36.065743',1,11,'2','Umbrella',1,'');
INSERT INTO django_admin_log VALUES(25,'2012-06-06 23:29:40.784957',1,8,'1','Umbrella''',1,'');
INSERT INTO django_admin_log VALUES(26,'2012-06-06 23:29:46.872662',1,8,'1','Umbrella',2,'Changed title.');
INSERT INTO django_admin_log VALUES(27,'2012-06-06 23:30:18.149329',1,11,'3','Keyboard',1,'');
INSERT INTO django_admin_log VALUES(28,'2012-06-06 23:30:21.404451',1,8,'2','Keyboard',1,'');
INSERT INTO django_admin_log VALUES(29,'2012-06-06 23:30:46.481456',1,8,'1','Umbrella',2,'Changed image.');
INSERT INTO django_admin_log VALUES(30,'2012-06-06 23:32:30.099248',1,11,'4','Chair',1,'');
INSERT INTO django_admin_log VALUES(31,'2012-06-06 23:33:26.188287',1,11,'5','Table',1,'');
INSERT INTO django_admin_log VALUES(32,'2012-06-06 23:33:30.023195',1,8,'3','Leg Club',1,'');
INSERT INTO django_admin_log VALUES(33,'2012-06-06 23:33:41.131480',1,8,'2','Keyboard',2,'Changed image.');
INSERT INTO django_admin_log VALUES(34,'2012-06-06 23:33:53.540229',1,8,'1','Umbrella',2,'Changed image.');
INSERT INTO django_admin_log VALUES(35,'2012-06-06 23:34:51.265913',1,11,'6','Toilet',1,'');
INSERT INTO django_admin_log VALUES(36,'2012-06-06 23:34:57.409690',1,8,'4','Toilet lid',1,'');
INSERT INTO django_admin_log VALUES(37,'2012-06-06 23:35:50.617872',1,11,'7','CD',1,'');
INSERT INTO django_admin_log VALUES(38,'2012-06-06 23:35:52.098770',1,8,'5','Broken CD',1,'');
INSERT INTO django_admin_log VALUES(39,'2012-06-06 23:36:46.589407',1,11,'8','Bat',1,'');
INSERT INTO django_admin_log VALUES(40,'2012-06-06 23:37:21.930109',1,11,'9','Nails',1,'');
INSERT INTO django_admin_log VALUES(41,'2012-06-06 23:37:23.537183',1,8,'6','Spiked bat',1,'');
INSERT INTO django_admin_log VALUES(42,'2012-06-06 23:38:14.028848',1,11,'10','Potatoes',1,'');
INSERT INTO django_admin_log VALUES(43,'2012-06-06 23:40:25.037376',1,11,'11','Glue',1,'');
INSERT INTO django_admin_log VALUES(44,'2012-06-06 23:40:35.885204',1,11,'12','PVC pipe',1,'');
INSERT INTO django_admin_log VALUES(45,'2012-06-06 23:40:47.508705',1,8,'7','Potato gun',1,'');
INSERT INTO django_admin_log VALUES(46,'2012-06-06 23:41:14.718728',1,8,'8','PVC pipe',1,'');
INSERT INTO django_admin_log VALUES(47,'2012-06-06 23:42:49.076551',1,11,'13','Broom',1,'');
INSERT INTO django_admin_log VALUES(48,'2012-06-06 23:42:58.077416',1,11,'14','Machete',1,'');
INSERT INTO django_admin_log VALUES(49,'2012-06-06 23:42:59.628370',1,8,'9','Pole weapon',1,'');
INSERT INTO django_admin_log VALUES(50,'2012-06-06 23:43:15.378569',1,8,'10','Machete',1,'');
INSERT INTO django_admin_log VALUES(51,'2012-06-19 03:21:08.331691',1,3,'1','admin',2,'Changed username, password and email.');
DROP TABLE IF EXISTS weapons_weapon;
CREATE TABLE IF NOT EXISTS `weapons_weapon` (`image` varchar(100) NOT NULL, `id` integer PRIMARY KEY AUTO_INCREMENT, `title` varchar(200) NOT NULL);
INSERT INTO weapons_weapon VALUES('weapon_images/zombie_weapon_umbrella_2.jpg',1,'Umbrella');
INSERT INTO weapons_weapon VALUES('weapon_images/zombie_weapon_keyboard_1.jpg',2,'Keyboard');
INSERT INTO weapons_weapon VALUES('weapon_images/zombie_weapon_chair_or_table_leg.jpg',3,'Leg Club');
INSERT INTO weapons_weapon VALUES('weapon_images/zombie_weapon_toilet_lid.jpg',4,'Toilet lid');
INSERT INTO weapons_weapon VALUES('weapon_images/zombie_weapon_broken_cd.jpg',5,'Broken CD');
INSERT INTO weapons_weapon VALUES('weapon_images/zombie_weapons_spiked_bat.jpg',6,'Spiked bat');
INSERT INTO weapons_weapon VALUES('weapon_images/zombie_weapons_potato_gun.JPG',7,'Potato gun');
INSERT INTO weapons_weapon VALUES('weapon_images/zombie_item_pvc_pipe.jpg',8,'PVC pipe');
INSERT INTO weapons_weapon VALUES('weapon_images/zombie_weapon_pole_knife.jpg',9,'Pole weapon');
INSERT INTO weapons_weapon VALUES('weapon_images/zombie_item_machete.jpg',10,'Machete');
DROP TABLE IF EXISTS weapons_householditem;
CREATE TABLE IF NOT EXISTS `weapons_householditem` (`id` integer NOT NULL PRIMARY KEY AUTO_INCREMENT, `title` varchar(200) NOT NULL, `image` varchar(100) NOT NULL);
INSERT INTO weapons_householditem VALUES(1,'Lamp','householditem_images/6-3-rider_lamp.jpg');
INSERT INTO weapons_householditem VALUES(2,'Umbrella','householditem_images/zombie_weapon_umbrella.jpg');
INSERT INTO weapons_householditem VALUES(3,'Keyboard','householditem_images/zombie_weapon_keyboard.jpg');
INSERT INTO weapons_householditem VALUES(4,'Chair','householditem_images/zombie_item_chair.jpg');
INSERT INTO weapons_householditem VALUES(5,'Table','householditem_images/zombie_item_table.jpg');
INSERT INTO weapons_householditem VALUES(6,'Toilet','householditem_images/zombie_item_toilet.jpg');
INSERT INTO weapons_householditem VALUES(7,'CD','householditem_images/zombie_id_cd.jpg');
INSERT INTO weapons_householditem VALUES(8,'Bat','householditem_images/zombie_item_bat.jpg');
INSERT INTO weapons_householditem VALUES(9,'Nails','householditem_images/zombie_item_nails.jpg');
INSERT INTO weapons_householditem VALUES(10,'Potatoes','householditem_images/zombie_item_potatoes.jpg');
INSERT INTO weapons_householditem VALUES(11,'Glue','householditem_images/zombie_item_super_glue.jpg');
INSERT INTO weapons_householditem VALUES(12,'PVC pipe','householditem_images/zombie_item_pvc_pipe.jpg');
INSERT INTO weapons_householditem VALUES(13,'Broom','householditem_images/zombie_item_broom.jpg');
INSERT INTO weapons_householditem VALUES(14,'Machete','householditem_images/zombie_item_machete.jpg');
DROP TABLE IF EXISTS weapons_weapon_items;
CREATE TABLE IF NOT EXISTS `weapons_weapon_items` (`id` integer NOT NULL PRIMARY KEY AUTO_INCREMENT, `weapon_id` integer NOT NULL, `householditem_id` integer NOT NULL);
INSERT INTO weapons_weapon_items VALUES(4,3,4);
INSERT INTO weapons_weapon_items VALUES(5,3,5);
INSERT INTO weapons_weapon_items VALUES(6,2,3);
INSERT INTO weapons_weapon_items VALUES(7,1,2);
INSERT INTO weapons_weapon_items VALUES(8,4,6);
INSERT INTO weapons_weapon_items VALUES(9,5,7);
INSERT INTO weapons_weapon_items VALUES(10,6,8);
INSERT INTO weapons_weapon_items VALUES(11,6,9);
INSERT INTO weapons_weapon_items VALUES(12,7,10);
INSERT INTO weapons_weapon_items VALUES(13,7,11);
INSERT INTO weapons_weapon_items VALUES(14,7,12);
INSERT INTO weapons_weapon_items VALUES(15,8,12);
INSERT INTO weapons_weapon_items VALUES(16,9,13);
INSERT INTO weapons_weapon_items VALUES(17,9,14);
INSERT INTO weapons_weapon_items VALUES(18,10,14);
CREATE INDEX `auth_permission_e4470c6e` ON `auth_permission` (`content_type_id`);
CREATE INDEX `auth_group_permissions_bda51c3c` ON `auth_group_permissions` (`group_id`);
CREATE INDEX `auth_group_permissions_1e014c8f` ON `auth_group_permissions` (`permission_id`);
CREATE INDEX `auth_user_user_permissions_fbfc09f1` ON `auth_user_user_permissions` (`user_id`);
CREATE INDEX `auth_user_user_permissions_1e014c8f` ON `auth_user_user_permissions` (`permission_id`);
CREATE INDEX `auth_user_groups_fbfc09f1` ON `auth_user_groups` (`user_id`);
CREATE INDEX `auth_user_groups_bda51c3c` ON `auth_user_groups` (`group_id`);
CREATE INDEX `django_session_c25c2c28` ON `django_session` (`expire_date`);
CREATE INDEX `django_admin_log_fbfc09f1` ON `django_admin_log` (`user_id`);
CREATE INDEX `django_admin_log_e4470c6e` ON `django_admin_log` (`content_type_id`);
CREATE INDEX `weapons_weapon_items_c082f932` ON `weapons_weapon_items` (`weapon_id`);
CREATE INDEX `weapons_weapon_items_53208c73` ON `weapons_weapon_items` (`householditem_id`);