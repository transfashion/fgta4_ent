-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_selector`;


CREATE TABLE IF NOT EXISTS `mst_selector` (
	`selector_id` varchar(5) NOT NULL , 
	`selector_text` varchar(30) NOT NULL , 
	`selector_data` varchar(1225) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	PRIMARY KEY (`selector_id`)
) 
ENGINE=InnoDB
COMMENT='Selector';


ALTER TABLE `mst_selector` ADD COLUMN IF NOT EXISTS  `selector_text` varchar(30) NOT NULL  AFTER `selector_id`;
ALTER TABLE `mst_selector` ADD COLUMN IF NOT EXISTS  `selector_data` varchar(1225) NOT NULL  AFTER `selector_text`;


ALTER TABLE `mst_selector` MODIFY COLUMN IF EXISTS  `selector_text` varchar(30) NOT NULL   AFTER `selector_id`;
ALTER TABLE `mst_selector` MODIFY COLUMN IF EXISTS  `selector_data` varchar(1225) NOT NULL   AFTER `selector_text`;









