-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_contacttype`;


CREATE TABLE IF NOT EXISTS `mst_contacttype` (
	`contacttype_id` varchar(10) NOT NULL , 
	`contacttype_name` varchar(30) NOT NULL , 
	`contacttype_descr` varchar(90)  , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `contacttype_name` (`contacttype_name`),
	PRIMARY KEY (`contacttype_id`)
) 
ENGINE=InnoDB
COMMENT='Master Tipe Contact';


ALTER TABLE `mst_contacttype` ADD COLUMN IF NOT EXISTS  `contacttype_name` varchar(30) NOT NULL  AFTER `contacttype_id`;
ALTER TABLE `mst_contacttype` ADD COLUMN IF NOT EXISTS  `contacttype_descr` varchar(90)   AFTER `contacttype_name`;


ALTER TABLE `mst_contacttype` MODIFY COLUMN IF EXISTS  `contacttype_name` varchar(30) NOT NULL   AFTER `contacttype_id`;
ALTER TABLE `mst_contacttype` MODIFY COLUMN IF EXISTS  `contacttype_descr` varchar(90)    AFTER `contacttype_name`;


ALTER TABLE `mst_contacttype` ADD CONSTRAINT `contacttype_name` UNIQUE IF NOT EXISTS  (`contacttype_name`);




INSERT INTO mst_contacttype (`contacttype_id`, `contacttype_name`, `_createby`, `_createdate`) VALUES ('EMAIL', 'EMAIL', 'root', NOW());
INSERT INTO mst_contacttype (`contacttype_id`, `contacttype_name`, `_createby`, `_createdate`) VALUES ('PHONE', 'PHONE', 'root', NOW());



