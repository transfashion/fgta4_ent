-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_doc`;
-- drop table if exists `mst_docauth`;


CREATE TABLE IF NOT EXISTS `mst_doc` (
	`doc_id` varchar(30) NOT NULL , 
	`doc_name` varchar(30) NOT NULL , 
	`doc_code` varchar(30) NOT NULL , 
	`doc_isdisabled` tinyint(1) NOT NULL DEFAULT 0, 
	`doc_descr` varchar(90)  , 
	`doc_config` varchar(2000)  , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `doc_name` (`doc_name`),
	PRIMARY KEY (`doc_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar Dokumen';


ALTER TABLE `mst_doc` ADD COLUMN IF NOT EXISTS  `doc_name` varchar(30) NOT NULL  AFTER `doc_id`;
ALTER TABLE `mst_doc` ADD COLUMN IF NOT EXISTS  `doc_code` varchar(30) NOT NULL  AFTER `doc_name`;
ALTER TABLE `mst_doc` ADD COLUMN IF NOT EXISTS  `doc_isdisabled` tinyint(1) NOT NULL DEFAULT 0 AFTER `doc_code`;
ALTER TABLE `mst_doc` ADD COLUMN IF NOT EXISTS  `doc_descr` varchar(90)   AFTER `doc_isdisabled`;
ALTER TABLE `mst_doc` ADD COLUMN IF NOT EXISTS  `doc_config` varchar(2000)   AFTER `doc_descr`;


ALTER TABLE `mst_doc` MODIFY COLUMN IF EXISTS  `doc_name` varchar(30) NOT NULL   AFTER `doc_id`;
ALTER TABLE `mst_doc` MODIFY COLUMN IF EXISTS  `doc_code` varchar(30) NOT NULL   AFTER `doc_name`;
ALTER TABLE `mst_doc` MODIFY COLUMN IF EXISTS  `doc_isdisabled` tinyint(1) NOT NULL DEFAULT 0  AFTER `doc_code`;
ALTER TABLE `mst_doc` MODIFY COLUMN IF EXISTS  `doc_descr` varchar(90)    AFTER `doc_isdisabled`;
ALTER TABLE `mst_doc` MODIFY COLUMN IF EXISTS  `doc_config` varchar(2000)    AFTER `doc_descr`;


ALTER TABLE `mst_doc` ADD CONSTRAINT `doc_name` UNIQUE IF NOT EXISTS  (`doc_name`);







CREATE TABLE IF NOT EXISTS `mst_docauth` (
	`docauth_id` varchar(14) NOT NULL , 
	`docauth_caption` varchar(90)  , 
	`authlevel_id` varchar(10) NOT NULL , 
	`auth_id` varchar(10)  , 
	`docauth_descr` varchar(255)  , 
	`docauth_order` int(4) NOT NULL DEFAULT 0, 
	`docauth_value` int(4) NOT NULL DEFAULT 100, 
	`docauth_min` int(4) NOT NULL DEFAULT 0, 
	`doc_id` varchar(30) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `docauth_id` (`doc_id`, `authlevel_id`, `auth_id`),
	UNIQUE KEY `docauth_order` (`doc_id`, `docauth_order`),
	PRIMARY KEY (`docauth_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar Authorisasi dokumen.';


ALTER TABLE `mst_docauth` ADD COLUMN IF NOT EXISTS  `docauth_caption` varchar(90)   AFTER `docauth_id`;
ALTER TABLE `mst_docauth` ADD COLUMN IF NOT EXISTS  `authlevel_id` varchar(10) NOT NULL  AFTER `docauth_caption`;
ALTER TABLE `mst_docauth` ADD COLUMN IF NOT EXISTS  `auth_id` varchar(10)   AFTER `authlevel_id`;
ALTER TABLE `mst_docauth` ADD COLUMN IF NOT EXISTS  `docauth_descr` varchar(255)   AFTER `auth_id`;
ALTER TABLE `mst_docauth` ADD COLUMN IF NOT EXISTS  `docauth_order` int(4) NOT NULL DEFAULT 0 AFTER `docauth_descr`;
ALTER TABLE `mst_docauth` ADD COLUMN IF NOT EXISTS  `docauth_value` int(4) NOT NULL DEFAULT 100 AFTER `docauth_order`;
ALTER TABLE `mst_docauth` ADD COLUMN IF NOT EXISTS  `docauth_min` int(4) NOT NULL DEFAULT 0 AFTER `docauth_value`;
ALTER TABLE `mst_docauth` ADD COLUMN IF NOT EXISTS  `doc_id` varchar(30) NOT NULL  AFTER `docauth_min`;


ALTER TABLE `mst_docauth` MODIFY COLUMN IF EXISTS  `docauth_caption` varchar(90)    AFTER `docauth_id`;
ALTER TABLE `mst_docauth` MODIFY COLUMN IF EXISTS  `authlevel_id` varchar(10) NOT NULL   AFTER `docauth_caption`;
ALTER TABLE `mst_docauth` MODIFY COLUMN IF EXISTS  `auth_id` varchar(10)    AFTER `authlevel_id`;
ALTER TABLE `mst_docauth` MODIFY COLUMN IF EXISTS  `docauth_descr` varchar(255)    AFTER `auth_id`;
ALTER TABLE `mst_docauth` MODIFY COLUMN IF EXISTS  `docauth_order` int(4) NOT NULL DEFAULT 0  AFTER `docauth_descr`;
ALTER TABLE `mst_docauth` MODIFY COLUMN IF EXISTS  `docauth_value` int(4) NOT NULL DEFAULT 100  AFTER `docauth_order`;
ALTER TABLE `mst_docauth` MODIFY COLUMN IF EXISTS  `docauth_min` int(4) NOT NULL DEFAULT 0  AFTER `docauth_value`;
ALTER TABLE `mst_docauth` MODIFY COLUMN IF EXISTS  `doc_id` varchar(30) NOT NULL   AFTER `docauth_min`;


ALTER TABLE `mst_docauth` ADD CONSTRAINT `docauth_id` UNIQUE IF NOT EXISTS  (`doc_id`, `authlevel_id`, `auth_id`);
ALTER TABLE `mst_docauth` ADD CONSTRAINT `docauth_order` UNIQUE IF NOT EXISTS  (`doc_id`, `docauth_order`);

ALTER TABLE `mst_docauth` ADD KEY IF NOT EXISTS `authlevel_id` (`authlevel_id`);
ALTER TABLE `mst_docauth` ADD KEY IF NOT EXISTS `auth_id` (`auth_id`);
ALTER TABLE `mst_docauth` ADD KEY IF NOT EXISTS `doc_id` (`doc_id`);

ALTER TABLE `mst_docauth` ADD CONSTRAINT `fk_mst_docauth_mst_authlevel` FOREIGN KEY IF NOT EXISTS  (`authlevel_id`) REFERENCES `mst_authlevel` (`authlevel_id`);
ALTER TABLE `mst_docauth` ADD CONSTRAINT `fk_mst_docauth_mst_auth` FOREIGN KEY IF NOT EXISTS  (`auth_id`) REFERENCES `mst_auth` (`auth_id`);
ALTER TABLE `mst_docauth` ADD CONSTRAINT `fk_mst_docauth_mst_doc` FOREIGN KEY IF NOT EXISTS (`doc_id`) REFERENCES `mst_doc` (`doc_id`);





