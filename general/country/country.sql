-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_country`;


CREATE TABLE IF NOT EXISTS `mst_country` (
	`country_id` varchar(10) NOT NULL , 
	`country_name` varchar(60) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `country_name` (`country_name`),
	PRIMARY KEY (`country_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar Negara';


ALTER TABLE `mst_country` ADD COLUMN IF NOT EXISTS  `country_name` varchar(60) NOT NULL  AFTER `country_id`;


ALTER TABLE `mst_country` MODIFY COLUMN IF EXISTS  `country_name` varchar(60) NOT NULL  AFTER `country_id`;


ALTER TABLE `mst_country` ADD CONSTRAINT `country_name` UNIQUE IF NOT EXISTS  (`country_name`);







