-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_land`;


CREATE TABLE IF NOT EXISTS `mst_land` (
	`land_id` varchar(30) NOT NULL , 
	`land_name` varchar(90) NOT NULL , 
	`land_address` varchar(250)  , 
	`land_phone` varchar(30)  , 
	`land_email` varchar(150)  , 
	`land_isdisabled` tinyint(1) NOT NULL DEFAULT 0, 
	`land_geoloc` varchar(30)  DEFAULT '', 
	`landtype_id` varchar(10) NOT NULL , 
	`city_id` varchar(30) NOT NULL , 
	`territorial_id` varchar(10)  , 
	`partner_id` varchar(30)  , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `land_name` (`land_name`),
	PRIMARY KEY (`land_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar Land';


ALTER TABLE `mst_land` ADD COLUMN IF NOT EXISTS  `land_name` varchar(90) NOT NULL  AFTER `land_id`;
ALTER TABLE `mst_land` ADD COLUMN IF NOT EXISTS  `land_address` varchar(250)   AFTER `land_name`;
ALTER TABLE `mst_land` ADD COLUMN IF NOT EXISTS  `land_phone` varchar(30)   AFTER `land_address`;
ALTER TABLE `mst_land` ADD COLUMN IF NOT EXISTS  `land_email` varchar(150)   AFTER `land_phone`;
ALTER TABLE `mst_land` ADD COLUMN IF NOT EXISTS  `land_isdisabled` tinyint(1) NOT NULL DEFAULT 0 AFTER `land_email`;
ALTER TABLE `mst_land` ADD COLUMN IF NOT EXISTS  `land_geoloc` varchar(30)  DEFAULT '' AFTER `land_isdisabled`;
ALTER TABLE `mst_land` ADD COLUMN IF NOT EXISTS  `landtype_id` varchar(10) NOT NULL  AFTER `land_geoloc`;
ALTER TABLE `mst_land` ADD COLUMN IF NOT EXISTS  `city_id` varchar(30) NOT NULL  AFTER `landtype_id`;
ALTER TABLE `mst_land` ADD COLUMN IF NOT EXISTS  `territorial_id` varchar(10)   AFTER `city_id`;
ALTER TABLE `mst_land` ADD COLUMN IF NOT EXISTS  `partner_id` varchar(30)   AFTER `territorial_id`;


ALTER TABLE `mst_land` MODIFY COLUMN IF EXISTS  `land_name` varchar(90) NOT NULL   AFTER `land_id`;
ALTER TABLE `mst_land` MODIFY COLUMN IF EXISTS  `land_address` varchar(250)    AFTER `land_name`;
ALTER TABLE `mst_land` MODIFY COLUMN IF EXISTS  `land_phone` varchar(30)    AFTER `land_address`;
ALTER TABLE `mst_land` MODIFY COLUMN IF EXISTS  `land_email` varchar(150)    AFTER `land_phone`;
ALTER TABLE `mst_land` MODIFY COLUMN IF EXISTS  `land_isdisabled` tinyint(1) NOT NULL DEFAULT 0  AFTER `land_email`;
ALTER TABLE `mst_land` MODIFY COLUMN IF EXISTS  `land_geoloc` varchar(30)  DEFAULT ''  AFTER `land_isdisabled`;
ALTER TABLE `mst_land` MODIFY COLUMN IF EXISTS  `landtype_id` varchar(10) NOT NULL   AFTER `land_geoloc`;
ALTER TABLE `mst_land` MODIFY COLUMN IF EXISTS  `city_id` varchar(30) NOT NULL   AFTER `landtype_id`;
ALTER TABLE `mst_land` MODIFY COLUMN IF EXISTS  `territorial_id` varchar(10)    AFTER `city_id`;
ALTER TABLE `mst_land` MODIFY COLUMN IF EXISTS  `partner_id` varchar(30)    AFTER `territorial_id`;


ALTER TABLE `mst_land` ADD CONSTRAINT `land_name` UNIQUE IF NOT EXISTS  (`land_name`);

ALTER TABLE `mst_land` ADD KEY IF NOT EXISTS `landtype_id` (`landtype_id`);
ALTER TABLE `mst_land` ADD KEY IF NOT EXISTS `city_id` (`city_id`);
ALTER TABLE `mst_land` ADD KEY IF NOT EXISTS `territorial_id` (`territorial_id`);
ALTER TABLE `mst_land` ADD KEY IF NOT EXISTS `partner_id` (`partner_id`);

ALTER TABLE `mst_land` ADD CONSTRAINT `fk_mst_land_mst_landtype` FOREIGN KEY IF NOT EXISTS  (`landtype_id`) REFERENCES `mst_landtype` (`landtype_id`);
ALTER TABLE `mst_land` ADD CONSTRAINT `fk_mst_land_mst_city` FOREIGN KEY IF NOT EXISTS  (`city_id`) REFERENCES `mst_city` (`city_id`);
ALTER TABLE `mst_land` ADD CONSTRAINT `fk_mst_land_mst_territorial` FOREIGN KEY IF NOT EXISTS  (`territorial_id`) REFERENCES `mst_territorial` (`territorial_id`);
ALTER TABLE `mst_land` ADD CONSTRAINT `fk_mst_land_mst_partner` FOREIGN KEY IF NOT EXISTS  (`partner_id`) REFERENCES `mst_partner` (`partner_id`);





