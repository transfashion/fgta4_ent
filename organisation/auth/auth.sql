SET FOREIGN_KEY_CHECKS=0;

drop table if exists `mst_auth`;
drop table if exists `mst_authdelegate`;


CREATE TABLE IF NOT EXISTS `mst_auth` (
	`auth_id` varchar(30) NOT NULL , 
	`auth_name` varchar(60) NOT NULL , 
	`auth_isdisabled` tinyint(1) NOT NULL DEFAULT 0, 
	`auth_descr` varchar(90)  , 
	`authlevel_id` varchar(10) NOT NULL , 
	`empl_id` varchar(14)  , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `auth_name` (`auth_name`),
	PRIMARY KEY (`auth_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar Authorisasi';


ALTER TABLE `mst_auth` ADD COLUMN IF NOT EXISTS  `auth_name` varchar(60) NOT NULL  AFTER `auth_id`;
ALTER TABLE `mst_auth` ADD COLUMN IF NOT EXISTS  `auth_isdisabled` tinyint(1) NOT NULL DEFAULT 0 AFTER `auth_name`;
ALTER TABLE `mst_auth` ADD COLUMN IF NOT EXISTS  `auth_descr` varchar(90)   AFTER `auth_isdisabled`;
ALTER TABLE `mst_auth` ADD COLUMN IF NOT EXISTS  `authlevel_id` varchar(10) NOT NULL  AFTER `auth_descr`;
ALTER TABLE `mst_auth` ADD COLUMN IF NOT EXISTS  `empl_id` varchar(14)   AFTER `authlevel_id`;


ALTER TABLE `mst_auth` MODIFY COLUMN IF EXISTS  `auth_name` varchar(60) NOT NULL   AFTER `auth_id`;
ALTER TABLE `mst_auth` MODIFY COLUMN IF EXISTS  `auth_isdisabled` tinyint(1) NOT NULL DEFAULT 0  AFTER `auth_name`;
ALTER TABLE `mst_auth` MODIFY COLUMN IF EXISTS  `auth_descr` varchar(90)    AFTER `auth_isdisabled`;
ALTER TABLE `mst_auth` MODIFY COLUMN IF EXISTS  `authlevel_id` varchar(10) NOT NULL   AFTER `auth_descr`;
ALTER TABLE `mst_auth` MODIFY COLUMN IF EXISTS  `empl_id` varchar(14)    AFTER `authlevel_id`;


ALTER TABLE `mst_auth` ADD CONSTRAINT `auth_name` UNIQUE IF NOT EXISTS  (`auth_name`);

ALTER TABLE `mst_auth` ADD KEY IF NOT EXISTS `authlevel_id` (`authlevel_id`);
ALTER TABLE `mst_auth` ADD KEY IF NOT EXISTS `empl_id` (`empl_id`);

ALTER TABLE `mst_auth` ADD CONSTRAINT `fk_mst_auth_mst_authlevel` FOREIGN KEY IF NOT EXISTS  (`authlevel_id`) REFERENCES `mst_authlevel` (`authlevel_id`);
ALTER TABLE `mst_auth` ADD CONSTRAINT `fk_mst_auth_mst_empl` FOREIGN KEY IF NOT EXISTS  (`empl_id`) REFERENCES `mst_empl` (`empl_id`);





CREATE TABLE IF NOT EXISTS `mst_authdelegate` (
	`authdelegate_id` varchar(14) NOT NULL , 
	`authdelegate_portion` int(3) NOT NULL DEFAULT 0, 
	`empl_id` varchar(14) NOT NULL , 
	`auth_id` varchar(30) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `authdelegate_id` (`auth_id`, `empl_id`),
	PRIMARY KEY (`authdelegate_id`)
) 
ENGINE=InnoDB
COMMENT='Delegasi Authorisasi, apabila person yang ada di master authorisasi berhalangan.';


ALTER TABLE `mst_authdelegate` ADD COLUMN IF NOT EXISTS  `authdelegate_portion` int(3) NOT NULL DEFAULT 0 AFTER `authdelegate_id`;
ALTER TABLE `mst_authdelegate` ADD COLUMN IF NOT EXISTS  `empl_id` varchar(14) NOT NULL  AFTER `authdelegate_portion`;
ALTER TABLE `mst_authdelegate` ADD COLUMN IF NOT EXISTS  `auth_id` varchar(30) NOT NULL  AFTER `empl_id`;


ALTER TABLE `mst_authdelegate` MODIFY COLUMN IF EXISTS  `authdelegate_portion` int(3) NOT NULL DEFAULT 0  AFTER `authdelegate_id`;
ALTER TABLE `mst_authdelegate` MODIFY COLUMN IF EXISTS  `empl_id` varchar(14) NOT NULL   AFTER `authdelegate_portion`;
ALTER TABLE `mst_authdelegate` MODIFY COLUMN IF EXISTS  `auth_id` varchar(30) NOT NULL   AFTER `empl_id`;


ALTER TABLE `mst_authdelegate` ADD CONSTRAINT `authdelegate_id` UNIQUE IF NOT EXISTS  (`auth_id`, `empl_id`);

ALTER TABLE `mst_authdelegate` ADD KEY IF NOT EXISTS `empl_id` (`empl_id`);
ALTER TABLE `mst_authdelegate` ADD KEY IF NOT EXISTS `auth_id` (`auth_id`);

ALTER TABLE `mst_authdelegate` ADD CONSTRAINT `fk_mst_authdelegate_mst_empl` FOREIGN KEY IF NOT EXISTS  (`empl_id`) REFERENCES `mst_empl` (`empl_id`);
ALTER TABLE `mst_authdelegate` ADD CONSTRAINT `fk_mst_authdelegate_mst_auth` FOREIGN KEY IF NOT EXISTS (`auth_id`) REFERENCES `mst_auth` (`auth_id`);





