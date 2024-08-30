-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_cob`;


CREATE TABLE IF NOT EXISTS `mst_cob` (
	`cob_id` varchar(17) NOT NULL , 
	`cobgroup_id` varchar(17) NOT NULL , 
	`cob_name` varchar(255)  , 
	`cob_nameshort` varchar(255)  , 
	`cob_descr` varchar(255)  , 
	`cob_isdisabled` tinyint(1) NOT NULL DEFAULT 0, 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `cob_name` (`cob_name`),
	PRIMARY KEY (`cob_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar Chart Of Budget';


ALTER TABLE `mst_cob` ADD COLUMN IF NOT EXISTS  `cobgroup_id` varchar(17) NOT NULL  AFTER `cob_id`;
ALTER TABLE `mst_cob` ADD COLUMN IF NOT EXISTS  `cob_name` varchar(255)   AFTER `cobgroup_id`;
ALTER TABLE `mst_cob` ADD COLUMN IF NOT EXISTS  `cob_nameshort` varchar(255)   AFTER `cob_name`;
ALTER TABLE `mst_cob` ADD COLUMN IF NOT EXISTS  `cob_descr` varchar(255)   AFTER `cob_nameshort`;
ALTER TABLE `mst_cob` ADD COLUMN IF NOT EXISTS  `cob_isdisabled` tinyint(1) NOT NULL DEFAULT 0 AFTER `cob_descr`;


ALTER TABLE `mst_cob` MODIFY COLUMN IF EXISTS  `cobgroup_id` varchar(17) NOT NULL   AFTER `cob_id`;
ALTER TABLE `mst_cob` MODIFY COLUMN IF EXISTS  `cob_name` varchar(255)    AFTER `cobgroup_id`;
ALTER TABLE `mst_cob` MODIFY COLUMN IF EXISTS  `cob_nameshort` varchar(255)    AFTER `cob_name`;
ALTER TABLE `mst_cob` MODIFY COLUMN IF EXISTS  `cob_descr` varchar(255)    AFTER `cob_nameshort`;
ALTER TABLE `mst_cob` MODIFY COLUMN IF EXISTS  `cob_isdisabled` tinyint(1) NOT NULL DEFAULT 0  AFTER `cob_descr`;


ALTER TABLE `mst_cob` ADD CONSTRAINT `cob_name` UNIQUE IF NOT EXISTS  (`cob_name`);

ALTER TABLE `mst_cob` ADD KEY IF NOT EXISTS `cobgroup_id` (`cobgroup_id`);

ALTER TABLE `mst_cob` ADD CONSTRAINT `fk_mst_cob_mst_cobgroup` FOREIGN KEY IF NOT EXISTS  (`cobgroup_id`) REFERENCES `mst_cobgroup` (`cobgroup_id`);





