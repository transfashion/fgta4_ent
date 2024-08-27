-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_territorial`;


CREATE TABLE IF NOT EXISTS `mst_territorial` (
	`territorial_id` varchar(30) NOT NULL , 
	`territorial_name` varchar(60) NOT NULL , 
	`territorial_descr` varchar(90)  , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `territorial_name` (`territorial_name`),
	PRIMARY KEY (`territorial_id`)
) 
ENGINE=InnoDB
COMMENT='Master Territorial';


ALTER TABLE `mst_territorial` ADD COLUMN IF NOT EXISTS  `territorial_name` varchar(60) NOT NULL  AFTER `territorial_id`;
ALTER TABLE `mst_territorial` ADD COLUMN IF NOT EXISTS  `territorial_descr` varchar(90)   AFTER `territorial_name`;


ALTER TABLE `mst_territorial` MODIFY COLUMN IF EXISTS  `territorial_name` varchar(60) NOT NULL   AFTER `territorial_id`;
ALTER TABLE `mst_territorial` MODIFY COLUMN IF EXISTS  `territorial_descr` varchar(90)    AFTER `territorial_name`;


ALTER TABLE `mst_territorial` ADD CONSTRAINT `territorial_name` UNIQUE IF NOT EXISTS  (`territorial_name`);







