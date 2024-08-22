-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_area`;


CREATE TABLE IF NOT EXISTS `mst_area` (
	`area_id` varchar(30) NOT NULL , 
	`area_name` varchar(60) NOT NULL , 
	`area_descr` varchar(90)  , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `area_name` (`area_name`),
	PRIMARY KEY (`area_id`)
) 
ENGINE=InnoDB
COMMENT='Master Area';


ALTER TABLE `mst_area` ADD COLUMN IF NOT EXISTS  `area_name` varchar(60) NOT NULL  AFTER `area_id`;
ALTER TABLE `mst_area` ADD COLUMN IF NOT EXISTS  `area_descr` varchar(90)   AFTER `area_name`;


ALTER TABLE `mst_area` MODIFY COLUMN IF EXISTS  `area_name` varchar(60) NOT NULL   AFTER `area_id`;
ALTER TABLE `mst_area` MODIFY COLUMN IF EXISTS  `area_descr` varchar(90)    AFTER `area_name`;


ALTER TABLE `mst_area` ADD CONSTRAINT `area_name` UNIQUE IF NOT EXISTS  (`area_name`);




INSERT INTO mst_area (`area_id`, `area_name`, `_createby`, `_createdate`) VALUES ('DK', 'DALAM KOTA', 'root', NOW());
INSERT INTO mst_area (`area_id`, `area_name`, `_createby`, `_createdate`) VALUES ('LK', 'LUAR KOTA', 'root', NOW());



