-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_partnertype`;
-- drop table if exists `mst_partnertypeaccbudget`;


CREATE TABLE IF NOT EXISTS `mst_partnertype` (
	`partnertype_id` varchar(10) NOT NULL , 
	`partnertype_name` varchar(60) NOT NULL , 
	`partnertype_descr` varchar(90) NOT NULL , 
	`partnercategory_id` varchar(10)  , 
	`itemclass_id` varchar(14)  , 
	`unbill_accbudget_id` varchar(20)  , 
	`unbill_coa_id` varchar(20)  , 
	`payable_accbudget_id` varchar(20)  , 
	`payable_coa_id` varchar(20)  , 
	`arunbill_accbudget_id` varchar(20)  , 
	`arunbill_coa_id` varchar(20)  , 
	`ar_accbudget_id` varchar(20)  , 
	`ar_coa_id` varchar(20)  , 
	`partnertype_isempl` tinyint(1) NOT NULL DEFAULT 0, 
	`partnertype_ishaveae` tinyint(1) NOT NULL DEFAULT 0, 
	`partnertype_ishavecollector` tinyint(1) NOT NULL DEFAULT 0, 
	`partnertype_isdisabled` tinyint(1) NOT NULL DEFAULT 0, 
	`_createby` varchar(13) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(13)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `partnertype_name` (`partnertype_name`),
	PRIMARY KEY (`partnertype_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar Tipe Partner';


ALTER TABLE `mst_partnertype` ADD COLUMN IF NOT EXISTS  `partnertype_name` varchar(60) NOT NULL  AFTER `partnertype_id`;
ALTER TABLE `mst_partnertype` ADD COLUMN IF NOT EXISTS  `partnertype_descr` varchar(90) NOT NULL  AFTER `partnertype_name`;
ALTER TABLE `mst_partnertype` ADD COLUMN IF NOT EXISTS  `partnercategory_id` varchar(10)   AFTER `partnertype_descr`;
ALTER TABLE `mst_partnertype` ADD COLUMN IF NOT EXISTS  `itemclass_id` varchar(14)   AFTER `partnercategory_id`;
ALTER TABLE `mst_partnertype` ADD COLUMN IF NOT EXISTS  `unbill_accbudget_id` varchar(20)   AFTER `itemclass_id`;
ALTER TABLE `mst_partnertype` ADD COLUMN IF NOT EXISTS  `unbill_coa_id` varchar(20)   AFTER `unbill_accbudget_id`;
ALTER TABLE `mst_partnertype` ADD COLUMN IF NOT EXISTS  `payable_accbudget_id` varchar(20)   AFTER `unbill_coa_id`;
ALTER TABLE `mst_partnertype` ADD COLUMN IF NOT EXISTS  `payable_coa_id` varchar(20)   AFTER `payable_accbudget_id`;
ALTER TABLE `mst_partnertype` ADD COLUMN IF NOT EXISTS  `arunbill_accbudget_id` varchar(20)   AFTER `payable_coa_id`;
ALTER TABLE `mst_partnertype` ADD COLUMN IF NOT EXISTS  `arunbill_coa_id` varchar(20)   AFTER `arunbill_accbudget_id`;
ALTER TABLE `mst_partnertype` ADD COLUMN IF NOT EXISTS  `ar_accbudget_id` varchar(20)   AFTER `arunbill_coa_id`;
ALTER TABLE `mst_partnertype` ADD COLUMN IF NOT EXISTS  `ar_coa_id` varchar(20)   AFTER `ar_accbudget_id`;
ALTER TABLE `mst_partnertype` ADD COLUMN IF NOT EXISTS  `partnertype_isempl` tinyint(1) NOT NULL DEFAULT 0 AFTER `ar_coa_id`;
ALTER TABLE `mst_partnertype` ADD COLUMN IF NOT EXISTS  `partnertype_ishaveae` tinyint(1) NOT NULL DEFAULT 0 AFTER `partnertype_isempl`;
ALTER TABLE `mst_partnertype` ADD COLUMN IF NOT EXISTS  `partnertype_ishavecollector` tinyint(1) NOT NULL DEFAULT 0 AFTER `partnertype_ishaveae`;
ALTER TABLE `mst_partnertype` ADD COLUMN IF NOT EXISTS  `partnertype_isdisabled` tinyint(1) NOT NULL DEFAULT 0 AFTER `partnertype_ishavecollector`;


ALTER TABLE `mst_partnertype` MODIFY COLUMN IF EXISTS  `partnertype_name` varchar(60) NOT NULL  AFTER `partnertype_id`;
ALTER TABLE `mst_partnertype` MODIFY COLUMN IF EXISTS  `partnertype_descr` varchar(90) NOT NULL  AFTER `partnertype_name`;
ALTER TABLE `mst_partnertype` MODIFY COLUMN IF EXISTS  `partnercategory_id` varchar(10)   AFTER `partnertype_descr`;
ALTER TABLE `mst_partnertype` MODIFY COLUMN IF EXISTS  `itemclass_id` varchar(14)   AFTER `partnercategory_id`;
ALTER TABLE `mst_partnertype` MODIFY COLUMN IF EXISTS  `unbill_accbudget_id` varchar(20)   AFTER `itemclass_id`;
ALTER TABLE `mst_partnertype` MODIFY COLUMN IF EXISTS  `unbill_coa_id` varchar(20)   AFTER `unbill_accbudget_id`;
ALTER TABLE `mst_partnertype` MODIFY COLUMN IF EXISTS  `payable_accbudget_id` varchar(20)   AFTER `unbill_coa_id`;
ALTER TABLE `mst_partnertype` MODIFY COLUMN IF EXISTS  `payable_coa_id` varchar(20)   AFTER `payable_accbudget_id`;
ALTER TABLE `mst_partnertype` MODIFY COLUMN IF EXISTS  `arunbill_accbudget_id` varchar(20)   AFTER `payable_coa_id`;
ALTER TABLE `mst_partnertype` MODIFY COLUMN IF EXISTS  `arunbill_coa_id` varchar(20)   AFTER `arunbill_accbudget_id`;
ALTER TABLE `mst_partnertype` MODIFY COLUMN IF EXISTS  `ar_accbudget_id` varchar(20)   AFTER `arunbill_coa_id`;
ALTER TABLE `mst_partnertype` MODIFY COLUMN IF EXISTS  `ar_coa_id` varchar(20)   AFTER `ar_accbudget_id`;
ALTER TABLE `mst_partnertype` MODIFY COLUMN IF EXISTS  `partnertype_isempl` tinyint(1) NOT NULL DEFAULT 0 AFTER `ar_coa_id`;
ALTER TABLE `mst_partnertype` MODIFY COLUMN IF EXISTS  `partnertype_ishaveae` tinyint(1) NOT NULL DEFAULT 0 AFTER `partnertype_isempl`;
ALTER TABLE `mst_partnertype` MODIFY COLUMN IF EXISTS  `partnertype_ishavecollector` tinyint(1) NOT NULL DEFAULT 0 AFTER `partnertype_ishaveae`;
ALTER TABLE `mst_partnertype` MODIFY COLUMN IF EXISTS  `partnertype_isdisabled` tinyint(1) NOT NULL DEFAULT 0 AFTER `partnertype_ishavecollector`;


ALTER TABLE `mst_partnertype` ADD CONSTRAINT `partnertype_name` UNIQUE IF NOT EXISTS  (`partnertype_name`);

ALTER TABLE `mst_partnertype` ADD KEY IF NOT EXISTS `partnercategory_id` (`partnercategory_id`);
ALTER TABLE `mst_partnertype` ADD KEY IF NOT EXISTS `itemclass_id` (`itemclass_id`);
ALTER TABLE `mst_partnertype` ADD KEY IF NOT EXISTS `unbill_accbudget_id` (`unbill_accbudget_id`);
ALTER TABLE `mst_partnertype` ADD KEY IF NOT EXISTS `unbill_coa_id` (`unbill_coa_id`);
ALTER TABLE `mst_partnertype` ADD KEY IF NOT EXISTS `payable_accbudget_id` (`payable_accbudget_id`);
ALTER TABLE `mst_partnertype` ADD KEY IF NOT EXISTS `payable_coa_id` (`payable_coa_id`);
ALTER TABLE `mst_partnertype` ADD KEY IF NOT EXISTS `arunbill_accbudget_id` (`arunbill_accbudget_id`);
ALTER TABLE `mst_partnertype` ADD KEY IF NOT EXISTS `arunbill_coa_id` (`arunbill_coa_id`);
ALTER TABLE `mst_partnertype` ADD KEY IF NOT EXISTS `ar_accbudget_id` (`ar_accbudget_id`);
ALTER TABLE `mst_partnertype` ADD KEY IF NOT EXISTS `ar_coa_id` (`ar_coa_id`);

ALTER TABLE `mst_partnertype` ADD CONSTRAINT `fk_mst_partnertype_mst_partnercategory` FOREIGN KEY IF NOT EXISTS  (`partnercategory_id`) REFERENCES `mst_partnercategory` (`partnercategory_id`);
ALTER TABLE `mst_partnertype` ADD CONSTRAINT `fk_mst_partnertype_mst_itemclass` FOREIGN KEY IF NOT EXISTS  (`itemclass_id`) REFERENCES `mst_itemclass` (`itemclass_id`);
ALTER TABLE `mst_partnertype` ADD CONSTRAINT `fk_mst_partnertype_mst_accbudget` FOREIGN KEY IF NOT EXISTS  (`unbill_accbudget_id`) REFERENCES `mst_accbudget` (`accbudget_id`);
ALTER TABLE `mst_partnertype` ADD CONSTRAINT `fk_mst_partnertype_mst_coa` FOREIGN KEY IF NOT EXISTS  (`unbill_coa_id`) REFERENCES `mst_coa` (`coa_id`);
ALTER TABLE `mst_partnertype` ADD CONSTRAINT `fk_mst_partnertype_mst_accbudget_2` FOREIGN KEY IF NOT EXISTS  (`payable_accbudget_id`) REFERENCES `mst_accbudget` (`accbudget_id`);
ALTER TABLE `mst_partnertype` ADD CONSTRAINT `fk_mst_partnertype_mst_coa_2` FOREIGN KEY IF NOT EXISTS  (`payable_coa_id`) REFERENCES `mst_coa` (`coa_id`);
ALTER TABLE `mst_partnertype` ADD CONSTRAINT `fk_mst_partnertype_mst_accbudget_3` FOREIGN KEY IF NOT EXISTS  (`arunbill_accbudget_id`) REFERENCES `mst_accbudget` (`accbudget_id`);
ALTER TABLE `mst_partnertype` ADD CONSTRAINT `fk_mst_partnertype_mst_coa_3` FOREIGN KEY IF NOT EXISTS  (`arunbill_coa_id`) REFERENCES `mst_coa` (`coa_id`);
ALTER TABLE `mst_partnertype` ADD CONSTRAINT `fk_mst_partnertype_mst_accbudget_4` FOREIGN KEY IF NOT EXISTS  (`ar_accbudget_id`) REFERENCES `mst_accbudget` (`accbudget_id`);
ALTER TABLE `mst_partnertype` ADD CONSTRAINT `fk_mst_partnertype_mst_coa_4` FOREIGN KEY IF NOT EXISTS  (`ar_coa_id`) REFERENCES `mst_coa` (`coa_id`);





CREATE TABLE IF NOT EXISTS `mst_partnertypeaccbudget` (
	`partnertypeaccbudget_id` varchar(14) NOT NULL , 
	`projectmodel_id` varchar(10)  , 
	`unbill_accbudget_id` varchar(20)  , 
	`unbill_coa_id` varchar(20)  , 
	`payable_accbudget_id` varchar(20)  , 
	`payable_coa_id` varchar(20)  , 
	`arunbill_accbudget_id` varchar(20)  , 
	`arunbill_coa_id` varchar(20)  , 
	`ar_accbudget_id` varchar(20)  , 
	`ar_coa_id` varchar(20)  , 
	`partnertype_id` varchar(14) NOT NULL , 
	`_createby` varchar(13) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(13)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `partnertypeaccbudget_pair` (`partnertype_id`, `projectmodel_id`),
	PRIMARY KEY (`partnertypeaccbudget_id`)
) 
ENGINE=InnoDB
COMMENT='Account yang direlasikan ke itemclass ini';


ALTER TABLE `mst_partnertypeaccbudget` ADD COLUMN IF NOT EXISTS  `projectmodel_id` varchar(10)   AFTER `partnertypeaccbudget_id`;
ALTER TABLE `mst_partnertypeaccbudget` ADD COLUMN IF NOT EXISTS  `unbill_accbudget_id` varchar(20)   AFTER `projectmodel_id`;
ALTER TABLE `mst_partnertypeaccbudget` ADD COLUMN IF NOT EXISTS  `unbill_coa_id` varchar(20)   AFTER `unbill_accbudget_id`;
ALTER TABLE `mst_partnertypeaccbudget` ADD COLUMN IF NOT EXISTS  `payable_accbudget_id` varchar(20)   AFTER `unbill_coa_id`;
ALTER TABLE `mst_partnertypeaccbudget` ADD COLUMN IF NOT EXISTS  `payable_coa_id` varchar(20)   AFTER `payable_accbudget_id`;
ALTER TABLE `mst_partnertypeaccbudget` ADD COLUMN IF NOT EXISTS  `arunbill_accbudget_id` varchar(20)   AFTER `payable_coa_id`;
ALTER TABLE `mst_partnertypeaccbudget` ADD COLUMN IF NOT EXISTS  `arunbill_coa_id` varchar(20)   AFTER `arunbill_accbudget_id`;
ALTER TABLE `mst_partnertypeaccbudget` ADD COLUMN IF NOT EXISTS  `ar_accbudget_id` varchar(20)   AFTER `arunbill_coa_id`;
ALTER TABLE `mst_partnertypeaccbudget` ADD COLUMN IF NOT EXISTS  `ar_coa_id` varchar(20)   AFTER `ar_accbudget_id`;
ALTER TABLE `mst_partnertypeaccbudget` ADD COLUMN IF NOT EXISTS  `partnertype_id` varchar(14) NOT NULL  AFTER `ar_coa_id`;


ALTER TABLE `mst_partnertypeaccbudget` MODIFY COLUMN IF EXISTS  `projectmodel_id` varchar(10)   AFTER `partnertypeaccbudget_id`;
ALTER TABLE `mst_partnertypeaccbudget` MODIFY COLUMN IF EXISTS  `unbill_accbudget_id` varchar(20)   AFTER `projectmodel_id`;
ALTER TABLE `mst_partnertypeaccbudget` MODIFY COLUMN IF EXISTS  `unbill_coa_id` varchar(20)   AFTER `unbill_accbudget_id`;
ALTER TABLE `mst_partnertypeaccbudget` MODIFY COLUMN IF EXISTS  `payable_accbudget_id` varchar(20)   AFTER `unbill_coa_id`;
ALTER TABLE `mst_partnertypeaccbudget` MODIFY COLUMN IF EXISTS  `payable_coa_id` varchar(20)   AFTER `payable_accbudget_id`;
ALTER TABLE `mst_partnertypeaccbudget` MODIFY COLUMN IF EXISTS  `arunbill_accbudget_id` varchar(20)   AFTER `payable_coa_id`;
ALTER TABLE `mst_partnertypeaccbudget` MODIFY COLUMN IF EXISTS  `arunbill_coa_id` varchar(20)   AFTER `arunbill_accbudget_id`;
ALTER TABLE `mst_partnertypeaccbudget` MODIFY COLUMN IF EXISTS  `ar_accbudget_id` varchar(20)   AFTER `arunbill_coa_id`;
ALTER TABLE `mst_partnertypeaccbudget` MODIFY COLUMN IF EXISTS  `ar_coa_id` varchar(20)   AFTER `ar_accbudget_id`;
ALTER TABLE `mst_partnertypeaccbudget` MODIFY COLUMN IF EXISTS  `partnertype_id` varchar(14) NOT NULL  AFTER `ar_coa_id`;


ALTER TABLE `mst_partnertypeaccbudget` ADD CONSTRAINT `partnertypeaccbudget_pair` UNIQUE IF NOT EXISTS  (`partnertype_id`, `projectmodel_id`);

ALTER TABLE `mst_partnertypeaccbudget` ADD KEY IF NOT EXISTS `projectmodel_id` (`projectmodel_id`);
ALTER TABLE `mst_partnertypeaccbudget` ADD KEY IF NOT EXISTS `unbill_accbudget_id` (`unbill_accbudget_id`);
ALTER TABLE `mst_partnertypeaccbudget` ADD KEY IF NOT EXISTS `unbill_coa_id` (`unbill_coa_id`);
ALTER TABLE `mst_partnertypeaccbudget` ADD KEY IF NOT EXISTS `payable_accbudget_id` (`payable_accbudget_id`);
ALTER TABLE `mst_partnertypeaccbudget` ADD KEY IF NOT EXISTS `payable_coa_id` (`payable_coa_id`);
ALTER TABLE `mst_partnertypeaccbudget` ADD KEY IF NOT EXISTS `arunbill_accbudget_id` (`arunbill_accbudget_id`);
ALTER TABLE `mst_partnertypeaccbudget` ADD KEY IF NOT EXISTS `arunbill_coa_id` (`arunbill_coa_id`);
ALTER TABLE `mst_partnertypeaccbudget` ADD KEY IF NOT EXISTS `ar_accbudget_id` (`ar_accbudget_id`);
ALTER TABLE `mst_partnertypeaccbudget` ADD KEY IF NOT EXISTS `ar_coa_id` (`ar_coa_id`);
ALTER TABLE `mst_partnertypeaccbudget` ADD KEY IF NOT EXISTS `partnertype_id` (`partnertype_id`);

ALTER TABLE `mst_partnertypeaccbudget` ADD CONSTRAINT `fk_mst_partnertypeaccbudget_mst_projectmodel` FOREIGN KEY IF NOT EXISTS  (`projectmodel_id`) REFERENCES `mst_projectmodel` (`projectmodel_id`);
ALTER TABLE `mst_partnertypeaccbudget` ADD CONSTRAINT `fk_mst_partnertypeaccbudget_mst_accbudget` FOREIGN KEY IF NOT EXISTS  (`unbill_accbudget_id`) REFERENCES `mst_accbudget` (`accbudget_id`);
ALTER TABLE `mst_partnertypeaccbudget` ADD CONSTRAINT `fk_mst_partnertypeaccbudget_mst_coa` FOREIGN KEY IF NOT EXISTS  (`unbill_coa_id`) REFERENCES `mst_coa` (`coa_id`);
ALTER TABLE `mst_partnertypeaccbudget` ADD CONSTRAINT `fk_mst_partnertypeaccbudget_mst_accbudget_2` FOREIGN KEY IF NOT EXISTS  (`payable_accbudget_id`) REFERENCES `mst_accbudget` (`accbudget_id`);
ALTER TABLE `mst_partnertypeaccbudget` ADD CONSTRAINT `fk_mst_partnertypeaccbudget_mst_coa_2` FOREIGN KEY IF NOT EXISTS  (`payable_coa_id`) REFERENCES `mst_coa` (`coa_id`);
ALTER TABLE `mst_partnertypeaccbudget` ADD CONSTRAINT `fk_mst_partnertypeaccbudget_mst_accbudget_3` FOREIGN KEY IF NOT EXISTS  (`arunbill_accbudget_id`) REFERENCES `mst_accbudget` (`accbudget_id`);
ALTER TABLE `mst_partnertypeaccbudget` ADD CONSTRAINT `fk_mst_partnertypeaccbudget_mst_coa_3` FOREIGN KEY IF NOT EXISTS  (`arunbill_coa_id`) REFERENCES `mst_coa` (`coa_id`);
ALTER TABLE `mst_partnertypeaccbudget` ADD CONSTRAINT `fk_mst_partnertypeaccbudget_mst_accbudget_4` FOREIGN KEY IF NOT EXISTS  (`ar_accbudget_id`) REFERENCES `mst_accbudget` (`accbudget_id`);
ALTER TABLE `mst_partnertypeaccbudget` ADD CONSTRAINT `fk_mst_partnertypeaccbudget_mst_coa_4` FOREIGN KEY IF NOT EXISTS  (`ar_coa_id`) REFERENCES `mst_coa` (`coa_id`);
ALTER TABLE `mst_partnertypeaccbudget` ADD CONSTRAINT `fk_mst_partnertypeaccbudget_mst_partnertype` FOREIGN KEY IF NOT EXISTS (`partnertype_id`) REFERENCES `mst_partnertype` (`partnertype_id`);





