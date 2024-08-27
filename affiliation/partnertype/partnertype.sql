-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_partnertype`;


CREATE TABLE IF NOT EXISTS `mst_partnertype` (
	`partnertype_id` varchar(10) NOT NULL , 
	`partnertype_name` varchar(60) NOT NULL , 
	`partnertype_descr` varchar(90) NOT NULL , 
	`partnertype_isempl` tinyint(1) NOT NULL DEFAULT 0, 
	`partnertype_isdisabled` tinyint(1) NOT NULL DEFAULT 0, 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `partnertype_name` (`partnertype_name`),
	PRIMARY KEY (`partnertype_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar Tipe Partner';


ALTER TABLE `mst_partnertype` ADD COLUMN IF NOT EXISTS  `partnertype_name` varchar(60) NOT NULL  AFTER `partnertype_id`;
ALTER TABLE `mst_partnertype` ADD COLUMN IF NOT EXISTS  `partnertype_descr` varchar(90) NOT NULL  AFTER `partnertype_name`;
ALTER TABLE `mst_partnertype` ADD COLUMN IF NOT EXISTS  `partnertype_isempl` tinyint(1) NOT NULL DEFAULT 0 AFTER `partnertype_descr`;
ALTER TABLE `mst_partnertype` ADD COLUMN IF NOT EXISTS  `partnertype_isdisabled` tinyint(1) NOT NULL DEFAULT 0 AFTER `partnertype_isempl`;


ALTER TABLE `mst_partnertype` MODIFY COLUMN IF EXISTS  `partnertype_name` varchar(60) NOT NULL   AFTER `partnertype_id`;
ALTER TABLE `mst_partnertype` MODIFY COLUMN IF EXISTS  `partnertype_descr` varchar(90) NOT NULL   AFTER `partnertype_name`;
ALTER TABLE `mst_partnertype` MODIFY COLUMN IF EXISTS  `partnertype_isempl` tinyint(1) NOT NULL DEFAULT 0  AFTER `partnertype_descr`;
ALTER TABLE `mst_partnertype` MODIFY COLUMN IF EXISTS  `partnertype_isdisabled` tinyint(1) NOT NULL DEFAULT 0  AFTER `partnertype_isempl`;


ALTER TABLE `mst_partnertype` ADD CONSTRAINT `partnertype_name` UNIQUE IF NOT EXISTS  (`partnertype_name`);







