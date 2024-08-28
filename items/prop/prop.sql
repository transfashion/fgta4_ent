-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_prop`;


CREATE TABLE IF NOT EXISTS `mst_prop` (
	`prop_id` varchar(26) NOT NULL , 
	`prop_name` varchar(90) NOT NULL , 
	`prop_descr` varchar(255)  , 
	`prop_tags` varchar(255)  , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `prop_name` (`prop_name`),
	PRIMARY KEY (`prop_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar Properties/Spesifikasi Item';


ALTER TABLE `mst_prop` ADD COLUMN IF NOT EXISTS  `prop_name` varchar(90) NOT NULL  AFTER `prop_id`;
ALTER TABLE `mst_prop` ADD COLUMN IF NOT EXISTS  `prop_descr` varchar(255)   AFTER `prop_name`;
ALTER TABLE `mst_prop` ADD COLUMN IF NOT EXISTS  `prop_tags` varchar(255)   AFTER `prop_descr`;


ALTER TABLE `mst_prop` MODIFY COLUMN IF EXISTS  `prop_name` varchar(90) NOT NULL   AFTER `prop_id`;
ALTER TABLE `mst_prop` MODIFY COLUMN IF EXISTS  `prop_descr` varchar(255)    AFTER `prop_name`;
ALTER TABLE `mst_prop` MODIFY COLUMN IF EXISTS  `prop_tags` varchar(255)    AFTER `prop_descr`;


ALTER TABLE `mst_prop` ADD CONSTRAINT `prop_name` UNIQUE IF NOT EXISTS  (`prop_name`);







