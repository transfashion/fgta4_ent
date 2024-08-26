-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_familyrelation`;


CREATE TABLE IF NOT EXISTS `mst_familyrelation` (
	`familyrelation_id` varchar(3) NOT NULL , 
	`familyrelation_name` varchar(60) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `familyrelation_name` (`familyrelation_name`),
	PRIMARY KEY (`familyrelation_id`)
) 
ENGINE=InnoDB
COMMENT='Family relation';


ALTER TABLE `mst_familyrelation` ADD COLUMN IF NOT EXISTS  `familyrelation_name` varchar(60) NOT NULL  AFTER `familyrelation_id`;


ALTER TABLE `mst_familyrelation` MODIFY COLUMN IF EXISTS  `familyrelation_name` varchar(60) NOT NULL   AFTER `familyrelation_id`;


ALTER TABLE `mst_familyrelation` ADD CONSTRAINT `familyrelation_name` UNIQUE IF NOT EXISTS  (`familyrelation_name`);




INSERT INTO mst_familyrelation (`familyrelation_id`, `familyrelation_name`, `_createby`, `_createdate`) VALUES ('S', 'SUAMI', 'root', NOW());
INSERT INTO mst_familyrelation (`familyrelation_id`, `familyrelation_name`, `_createby`, `_createdate`) VALUES ('I', 'ISTRI', 'root', NOW());
INSERT INTO mst_familyrelation (`familyrelation_id`, `familyrelation_name`, `_createby`, `_createdate`) VALUES ('A', 'ANAK', 'root', NOW());



