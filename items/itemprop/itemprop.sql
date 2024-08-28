-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_itemprop`;


CREATE TABLE IF NOT EXISTS `mst_itemprop` (
	`itemprop_id` varchar(10) NOT NULL , 
	`itemprop_name` varchar(90) NOT NULL , 
	`itemprop_descr` varchar(255)  , 
	`itemprop_tags` varchar(255)  , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `itemprop_name` (`itemprop_name`),
	PRIMARY KEY (`itemprop_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar Properties/Spesifikasi Item';


ALTER TABLE `mst_itemprop` ADD COLUMN IF NOT EXISTS  `itemprop_name` varchar(90) NOT NULL  AFTER `itemprop_id`;
ALTER TABLE `mst_itemprop` ADD COLUMN IF NOT EXISTS  `itemprop_descr` varchar(255)   AFTER `itemprop_name`;
ALTER TABLE `mst_itemprop` ADD COLUMN IF NOT EXISTS  `itemprop_tags` varchar(255)   AFTER `itemprop_descr`;


ALTER TABLE `mst_itemprop` MODIFY COLUMN IF EXISTS  `itemprop_name` varchar(90) NOT NULL   AFTER `itemprop_id`;
ALTER TABLE `mst_itemprop` MODIFY COLUMN IF EXISTS  `itemprop_descr` varchar(255)    AFTER `itemprop_name`;
ALTER TABLE `mst_itemprop` MODIFY COLUMN IF EXISTS  `itemprop_tags` varchar(255)    AFTER `itemprop_descr`;


ALTER TABLE `mst_itemprop` ADD CONSTRAINT `itemprop_name` UNIQUE IF NOT EXISTS  (`itemprop_name`);







