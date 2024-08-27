-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_landtype`;


CREATE TABLE IF NOT EXISTS `mst_landtype` (
	`landtype_id` varchar(10) NOT NULL , 
	`landtype_name` varchar(60) NOT NULL , 
	`landtype_descr` varchar(90)  , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `landtype_name` (`landtype_name`),
	PRIMARY KEY (`landtype_id`)
) 
ENGINE=InnoDB
COMMENT='Master Land Type';


ALTER TABLE `mst_landtype` ADD COLUMN IF NOT EXISTS  `landtype_name` varchar(60) NOT NULL  AFTER `landtype_id`;
ALTER TABLE `mst_landtype` ADD COLUMN IF NOT EXISTS  `landtype_descr` varchar(90)   AFTER `landtype_name`;


ALTER TABLE `mst_landtype` MODIFY COLUMN IF EXISTS  `landtype_name` varchar(60) NOT NULL   AFTER `landtype_id`;
ALTER TABLE `mst_landtype` MODIFY COLUMN IF EXISTS  `landtype_descr` varchar(90)    AFTER `landtype_name`;


ALTER TABLE `mst_landtype` ADD CONSTRAINT `landtype_name` UNIQUE IF NOT EXISTS  (`landtype_name`);




INSERT INTO mst_landtype (`landtype_id`, `landtype_name`, `_createby`, `_createdate`) VALUES ('MLL', 'MALL', 'root', NOW());
INSERT INTO mst_landtype (`landtype_id`, `landtype_name`, `_createby`, `_createdate`) VALUES ('KTR', 'PERKANTORAN', 'root', NOW());
INSERT INTO mst_landtype (`landtype_id`, `landtype_name`, `_createby`, `_createdate`) VALUES ('HTL', 'HOTEL', 'root', NOW());
INSERT INTO mst_landtype (`landtype_id`, `landtype_name`, `_createby`, `_createdate`) VALUES ('SPC', 'SPORTCLUB', 'root', NOW());



