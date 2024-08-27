-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_site`;
-- drop table if exists `mst_siteevent`;
-- drop table if exists `mst_siteref`;


CREATE TABLE IF NOT EXISTS `mst_site` (
	`site_id` varchar(30) NOT NULL , 
	`site_nameshort` varchar(10) NOT NULL , 
	`site_code` varchar(3)  , 
	`site_name` varchar(90) NOT NULL , 
	`site_descr` varchar(250) NOT NULL , 
	`site_address` varchar(250) NOT NULL , 
	`site_phone` varchar(30) NOT NULL , 
	`site_email` varchar(150) NOT NULL , 
	`site_sqmwide` decimal(12, 2) NOT NULL DEFAULT 0, 
	`site_isdisabled` tinyint(1) NOT NULL DEFAULT 0, 
	`site_geoloc` varchar(30) NOT NULL DEFAULT '', 
	`site_opendate` date NOT NULL , 
	`sitemodel_id` varchar(10) NOT NULL , 
	`land_id` varchar(30) NOT NULL , 
	`unit_id` varchar(10) NOT NULL , 
	`dept_id` varchar(30) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `site_name` (`site_name`),
	UNIQUE KEY `site_nameshort` (`site_nameshort`),
	UNIQUE KEY `site_code` (`site_code`),
	PRIMARY KEY (`site_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar Site';


ALTER TABLE `mst_site` ADD COLUMN IF NOT EXISTS  `site_nameshort` varchar(10) NOT NULL  AFTER `site_id`;
ALTER TABLE `mst_site` ADD COLUMN IF NOT EXISTS  `site_code` varchar(3)   AFTER `site_nameshort`;
ALTER TABLE `mst_site` ADD COLUMN IF NOT EXISTS  `site_name` varchar(90) NOT NULL  AFTER `site_code`;
ALTER TABLE `mst_site` ADD COLUMN IF NOT EXISTS  `site_descr` varchar(250) NOT NULL  AFTER `site_name`;
ALTER TABLE `mst_site` ADD COLUMN IF NOT EXISTS  `site_address` varchar(250) NOT NULL  AFTER `site_descr`;
ALTER TABLE `mst_site` ADD COLUMN IF NOT EXISTS  `site_phone` varchar(30) NOT NULL  AFTER `site_address`;
ALTER TABLE `mst_site` ADD COLUMN IF NOT EXISTS  `site_email` varchar(150) NOT NULL  AFTER `site_phone`;
ALTER TABLE `mst_site` ADD COLUMN IF NOT EXISTS  `site_sqmwide` decimal(12, 2) NOT NULL DEFAULT 0 AFTER `site_email`;
ALTER TABLE `mst_site` ADD COLUMN IF NOT EXISTS  `site_isdisabled` tinyint(1) NOT NULL DEFAULT 0 AFTER `site_sqmwide`;
ALTER TABLE `mst_site` ADD COLUMN IF NOT EXISTS  `site_geoloc` varchar(30) NOT NULL DEFAULT '' AFTER `site_isdisabled`;
ALTER TABLE `mst_site` ADD COLUMN IF NOT EXISTS  `site_opendate` date NOT NULL  AFTER `site_geoloc`;
ALTER TABLE `mst_site` ADD COLUMN IF NOT EXISTS  `sitemodel_id` varchar(10) NOT NULL  AFTER `site_opendate`;
ALTER TABLE `mst_site` ADD COLUMN IF NOT EXISTS  `land_id` varchar(30) NOT NULL  AFTER `sitemodel_id`;
ALTER TABLE `mst_site` ADD COLUMN IF NOT EXISTS  `unit_id` varchar(10) NOT NULL  AFTER `land_id`;
ALTER TABLE `mst_site` ADD COLUMN IF NOT EXISTS  `dept_id` varchar(30) NOT NULL  AFTER `unit_id`;


ALTER TABLE `mst_site` MODIFY COLUMN IF EXISTS  `site_nameshort` varchar(10) NOT NULL   AFTER `site_id`;
ALTER TABLE `mst_site` MODIFY COLUMN IF EXISTS  `site_code` varchar(3)    AFTER `site_nameshort`;
ALTER TABLE `mst_site` MODIFY COLUMN IF EXISTS  `site_name` varchar(90) NOT NULL   AFTER `site_code`;
ALTER TABLE `mst_site` MODIFY COLUMN IF EXISTS  `site_descr` varchar(250) NOT NULL   AFTER `site_name`;
ALTER TABLE `mst_site` MODIFY COLUMN IF EXISTS  `site_address` varchar(250) NOT NULL   AFTER `site_descr`;
ALTER TABLE `mst_site` MODIFY COLUMN IF EXISTS  `site_phone` varchar(30) NOT NULL   AFTER `site_address`;
ALTER TABLE `mst_site` MODIFY COLUMN IF EXISTS  `site_email` varchar(150) NOT NULL   AFTER `site_phone`;
ALTER TABLE `mst_site` MODIFY COLUMN IF EXISTS  `site_sqmwide` decimal(12, 2) NOT NULL DEFAULT 0  AFTER `site_email`;
ALTER TABLE `mst_site` MODIFY COLUMN IF EXISTS  `site_isdisabled` tinyint(1) NOT NULL DEFAULT 0  AFTER `site_sqmwide`;
ALTER TABLE `mst_site` MODIFY COLUMN IF EXISTS  `site_geoloc` varchar(30) NOT NULL DEFAULT ''  AFTER `site_isdisabled`;
ALTER TABLE `mst_site` MODIFY COLUMN IF EXISTS  `site_opendate` date NOT NULL   AFTER `site_geoloc`;
ALTER TABLE `mst_site` MODIFY COLUMN IF EXISTS  `sitemodel_id` varchar(10) NOT NULL   AFTER `site_opendate`;
ALTER TABLE `mst_site` MODIFY COLUMN IF EXISTS  `land_id` varchar(30) NOT NULL   AFTER `sitemodel_id`;
ALTER TABLE `mst_site` MODIFY COLUMN IF EXISTS  `unit_id` varchar(10) NOT NULL   AFTER `land_id`;
ALTER TABLE `mst_site` MODIFY COLUMN IF EXISTS  `dept_id` varchar(30) NOT NULL   AFTER `unit_id`;


ALTER TABLE `mst_site` ADD CONSTRAINT `site_name` UNIQUE IF NOT EXISTS  (`site_name`);
ALTER TABLE `mst_site` ADD CONSTRAINT `site_nameshort` UNIQUE IF NOT EXISTS  (`site_nameshort`);
ALTER TABLE `mst_site` ADD CONSTRAINT `site_code` UNIQUE IF NOT EXISTS  (`site_code`);

ALTER TABLE `mst_site` ADD KEY IF NOT EXISTS `sitemodel_id` (`sitemodel_id`);
ALTER TABLE `mst_site` ADD KEY IF NOT EXISTS `land_id` (`land_id`);
ALTER TABLE `mst_site` ADD KEY IF NOT EXISTS `unit_id` (`unit_id`);
ALTER TABLE `mst_site` ADD KEY IF NOT EXISTS `dept_id` (`dept_id`);

ALTER TABLE `mst_site` ADD CONSTRAINT `fk_mst_site_mst_sitemodel` FOREIGN KEY IF NOT EXISTS  (`sitemodel_id`) REFERENCES `mst_sitemodel` (`sitemodel_id`);
ALTER TABLE `mst_site` ADD CONSTRAINT `fk_mst_site_mst_land` FOREIGN KEY IF NOT EXISTS  (`land_id`) REFERENCES `mst_land` (`land_id`);
ALTER TABLE `mst_site` ADD CONSTRAINT `fk_mst_site_mst_unit` FOREIGN KEY IF NOT EXISTS  (`unit_id`) REFERENCES `mst_unit` (`unit_id`);
ALTER TABLE `mst_site` ADD CONSTRAINT `fk_mst_site_mst_dept` FOREIGN KEY IF NOT EXISTS  (`dept_id`) REFERENCES `mst_dept` (`dept_id`);





CREATE TABLE IF NOT EXISTS `mst_siteevent` (
	`siteevent_id` varchar(14) NOT NULL , 
	`siteevent_name` varchar(60) NOT NULL , 
	`siteevent_date` date NOT NULL , 
	`siteevent_enabling` tinyint(1) NOT NULL DEFAULT 0, 
	`siteevent_disabling` tinyint(1) NOT NULL DEFAULT 0, 
	`site_id` varchar(30) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	PRIMARY KEY (`siteevent_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar Site Event';


ALTER TABLE `mst_siteevent` ADD COLUMN IF NOT EXISTS  `siteevent_name` varchar(60) NOT NULL  AFTER `siteevent_id`;
ALTER TABLE `mst_siteevent` ADD COLUMN IF NOT EXISTS  `siteevent_date` date NOT NULL  AFTER `siteevent_name`;
ALTER TABLE `mst_siteevent` ADD COLUMN IF NOT EXISTS  `siteevent_enabling` tinyint(1) NOT NULL DEFAULT 0 AFTER `siteevent_date`;
ALTER TABLE `mst_siteevent` ADD COLUMN IF NOT EXISTS  `siteevent_disabling` tinyint(1) NOT NULL DEFAULT 0 AFTER `siteevent_enabling`;
ALTER TABLE `mst_siteevent` ADD COLUMN IF NOT EXISTS  `site_id` varchar(30) NOT NULL  AFTER `siteevent_disabling`;


ALTER TABLE `mst_siteevent` MODIFY COLUMN IF EXISTS  `siteevent_name` varchar(60) NOT NULL   AFTER `siteevent_id`;
ALTER TABLE `mst_siteevent` MODIFY COLUMN IF EXISTS  `siteevent_date` date NOT NULL   AFTER `siteevent_name`;
ALTER TABLE `mst_siteevent` MODIFY COLUMN IF EXISTS  `siteevent_enabling` tinyint(1) NOT NULL DEFAULT 0  AFTER `siteevent_date`;
ALTER TABLE `mst_siteevent` MODIFY COLUMN IF EXISTS  `siteevent_disabling` tinyint(1) NOT NULL DEFAULT 0  AFTER `siteevent_enabling`;
ALTER TABLE `mst_siteevent` MODIFY COLUMN IF EXISTS  `site_id` varchar(30) NOT NULL   AFTER `siteevent_disabling`;



ALTER TABLE `mst_siteevent` ADD KEY IF NOT EXISTS `site_id` (`site_id`);

ALTER TABLE `mst_siteevent` ADD CONSTRAINT `fk_mst_siteevent_mst_site` FOREIGN KEY IF NOT EXISTS (`site_id`) REFERENCES `mst_site` (`site_id`);





CREATE TABLE IF NOT EXISTS `mst_siteref` (
	`siteref_id` varchar(14) NOT NULL , 
	`interface_id` varchar(7) NOT NULL , 
	`siteref_name` varchar(30) NOT NULL , 
	`siteref_code` varchar(255)  , 
	`siteref_notes` varchar(255)  , 
	`site_id` varchar(14) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `siteref_pair` (`site_id`, `interface_id`, `siteref_name`),
	PRIMARY KEY (`siteref_id`)
) 
ENGINE=InnoDB
COMMENT='Kode referensi site untuk keperluan interfacing dengan system lain';


ALTER TABLE `mst_siteref` ADD COLUMN IF NOT EXISTS  `interface_id` varchar(7) NOT NULL  AFTER `siteref_id`;
ALTER TABLE `mst_siteref` ADD COLUMN IF NOT EXISTS  `siteref_name` varchar(30) NOT NULL  AFTER `interface_id`;
ALTER TABLE `mst_siteref` ADD COLUMN IF NOT EXISTS  `siteref_code` varchar(255)   AFTER `siteref_name`;
ALTER TABLE `mst_siteref` ADD COLUMN IF NOT EXISTS  `siteref_notes` varchar(255)   AFTER `siteref_code`;
ALTER TABLE `mst_siteref` ADD COLUMN IF NOT EXISTS  `site_id` varchar(14) NOT NULL  AFTER `siteref_notes`;


ALTER TABLE `mst_siteref` MODIFY COLUMN IF EXISTS  `interface_id` varchar(7) NOT NULL   AFTER `siteref_id`;
ALTER TABLE `mst_siteref` MODIFY COLUMN IF EXISTS  `siteref_name` varchar(30) NOT NULL   AFTER `interface_id`;
ALTER TABLE `mst_siteref` MODIFY COLUMN IF EXISTS  `siteref_code` varchar(255)    AFTER `siteref_name`;
ALTER TABLE `mst_siteref` MODIFY COLUMN IF EXISTS  `siteref_notes` varchar(255)    AFTER `siteref_code`;
ALTER TABLE `mst_siteref` MODIFY COLUMN IF EXISTS  `site_id` varchar(14) NOT NULL   AFTER `siteref_notes`;


ALTER TABLE `mst_siteref` ADD CONSTRAINT `siteref_pair` UNIQUE IF NOT EXISTS  (`site_id`, `interface_id`, `siteref_name`);

ALTER TABLE `mst_siteref` ADD KEY IF NOT EXISTS `interface_id` (`interface_id`);
ALTER TABLE `mst_siteref` ADD KEY IF NOT EXISTS `site_id` (`site_id`);

ALTER TABLE `mst_siteref` ADD CONSTRAINT `fk_mst_siteref_mst_interface` FOREIGN KEY IF NOT EXISTS  (`interface_id`) REFERENCES `mst_interface` (`interface_id`);
ALTER TABLE `mst_siteref` ADD CONSTRAINT `fk_mst_siteref_mst_site` FOREIGN KEY IF NOT EXISTS (`site_id`) REFERENCES `mst_site` (`site_id`);





