-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_coatype`;


CREATE TABLE IF NOT EXISTS `mst_coatype` (
	`coatype_id` varchar(10) NOT NULL , 
	`coatype_name` varchar(30)  , 
	`coatype_isdisabled` tinyint(1) NOT NULL DEFAULT 0, 
	`coatype_descr` varchar(90)  , 
	`coatype_order` int(1) NOT NULL DEFAULT 0, 
	`coareport_id` varchar(2) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `coatype_name` (`coatype_name`),
	PRIMARY KEY (`coatype_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar tipe-tipe COA';


ALTER TABLE `mst_coatype` ADD COLUMN IF NOT EXISTS  `coatype_name` varchar(30)   AFTER `coatype_id`;
ALTER TABLE `mst_coatype` ADD COLUMN IF NOT EXISTS  `coatype_isdisabled` tinyint(1) NOT NULL DEFAULT 0 AFTER `coatype_name`;
ALTER TABLE `mst_coatype` ADD COLUMN IF NOT EXISTS  `coatype_descr` varchar(90)   AFTER `coatype_isdisabled`;
ALTER TABLE `mst_coatype` ADD COLUMN IF NOT EXISTS  `coatype_order` int(1) NOT NULL DEFAULT 0 AFTER `coatype_descr`;
ALTER TABLE `mst_coatype` ADD COLUMN IF NOT EXISTS  `coareport_id` varchar(2) NOT NULL  AFTER `coatype_order`;


ALTER TABLE `mst_coatype` MODIFY COLUMN IF EXISTS  `coatype_name` varchar(30)    AFTER `coatype_id`;
ALTER TABLE `mst_coatype` MODIFY COLUMN IF EXISTS  `coatype_isdisabled` tinyint(1) NOT NULL DEFAULT 0  AFTER `coatype_name`;
ALTER TABLE `mst_coatype` MODIFY COLUMN IF EXISTS  `coatype_descr` varchar(90)    AFTER `coatype_isdisabled`;
ALTER TABLE `mst_coatype` MODIFY COLUMN IF EXISTS  `coatype_order` int(1) NOT NULL DEFAULT 0  AFTER `coatype_descr`;
ALTER TABLE `mst_coatype` MODIFY COLUMN IF EXISTS  `coareport_id` varchar(2) NOT NULL   AFTER `coatype_order`;


ALTER TABLE `mst_coatype` ADD CONSTRAINT `coatype_name` UNIQUE IF NOT EXISTS  (`coatype_name`);

ALTER TABLE `mst_coatype` ADD KEY IF NOT EXISTS `coareport_id` (`coareport_id`);

ALTER TABLE `mst_coatype` ADD CONSTRAINT `fk_mst_coatype_mst_coareport` FOREIGN KEY IF NOT EXISTS  (`coareport_id`) REFERENCES `mst_coareport` (`coareport_id`);





