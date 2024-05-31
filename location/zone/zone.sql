-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_zone`;


CREATE TABLE IF NOT EXISTS `mst_zone` (
	`zone_id` varchar(10) NOT NULL , 
	`zone_name` varchar(60) NOT NULL , 
	`zone_isdisabled` tinyint(1) NOT NULL DEFAULT 0, 
	`zone_descr` varchar(90)  , 
	`auth_id` varchar(30) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `zone_name` (`zone_name`),
	PRIMARY KEY (`zone_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar Zone';


ALTER TABLE `mst_zone` ADD COLUMN IF NOT EXISTS  `zone_name` varchar(60) NOT NULL  AFTER `zone_id`;
ALTER TABLE `mst_zone` ADD COLUMN IF NOT EXISTS  `zone_isdisabled` tinyint(1) NOT NULL DEFAULT 0 AFTER `zone_name`;
ALTER TABLE `mst_zone` ADD COLUMN IF NOT EXISTS  `zone_descr` varchar(90)   AFTER `zone_isdisabled`;
ALTER TABLE `mst_zone` ADD COLUMN IF NOT EXISTS  `auth_id` varchar(30) NOT NULL  AFTER `zone_descr`;


ALTER TABLE `mst_zone` MODIFY COLUMN IF EXISTS  `zone_name` varchar(60) NOT NULL  AFTER `zone_id`;
ALTER TABLE `mst_zone` MODIFY COLUMN IF EXISTS  `zone_isdisabled` tinyint(1) NOT NULL DEFAULT 0 AFTER `zone_name`;
ALTER TABLE `mst_zone` MODIFY COLUMN IF EXISTS  `zone_descr` varchar(90)   AFTER `zone_isdisabled`;
ALTER TABLE `mst_zone` MODIFY COLUMN IF EXISTS  `auth_id` varchar(30) NOT NULL  AFTER `zone_descr`;


ALTER TABLE `mst_zone` ADD CONSTRAINT `zone_name` UNIQUE IF NOT EXISTS  (`zone_name`);

ALTER TABLE `mst_zone` ADD KEY IF NOT EXISTS `auth_id` (`auth_id`);

ALTER TABLE `mst_zone` ADD CONSTRAINT `fk_mst_zone_mst_auth` FOREIGN KEY IF NOT EXISTS  (`auth_id`) REFERENCES `mst_auth` (`auth_id`);


INSERT INTO mst_zone (`zone_id`, `zone_name`, `auth_id`, `_createby`, `_createdate`) VALUES ('MDN', 'MEDAN', 'ROM-MDN', 'root', NOW());
INSERT INTO mst_zone (`zone_id`, `zone_name`, `auth_id`, `_createby`, `_createdate`) VALUES ('JKT-01', 'JAKARTA-01', 'ROM-JKT-01', 'root', NOW());
INSERT INTO mst_zone (`zone_id`, `zone_name`, `auth_id`, `_createby`, `_createdate`) VALUES ('JKT-02', 'JAKARTA-02', 'ROM-JKT-02', 'root', NOW());
INSERT INTO mst_zone (`zone_id`, `zone_name`, `auth_id`, `_createby`, `_createdate`) VALUES ('BDG', 'BANDUNG', 'ROM-BDG', 'root', NOW());
INSERT INTO mst_zone (`zone_id`, `zone_name`, `auth_id`, `_createby`, `_createdate`) VALUES ('SBY', 'SURABAYA', 'ROM-SBY', 'root', NOW());
INSERT INTO mst_zone (`zone_id`, `zone_name`, `auth_id`, `_createby`, `_createdate`) VALUES ('BJM', 'BANJARMASIN', 'ROM-BJM', 'root', NOW());
INSERT INTO mst_zone (`zone_id`, `zone_name`, `auth_id`, `_createby`, `_createdate`) VALUES ('MDO', 'MANADO', 'ROM-BJM', 'root', NOW());
INSERT INTO mst_zone (`zone_id`, `zone_name`, `auth_id`, `_createby`, `_createdate`) VALUES ('MKS', 'MAKASSAR', 'ROM-MDO', 'root', NOW());
INSERT INTO mst_zone (`zone_id`, `zone_name`, `auth_id`, `_createby`, `_createdate`) VALUES ('BAL', 'BALI', 'ROM-BAL', 'root', NOW());



