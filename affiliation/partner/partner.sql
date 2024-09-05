-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_partner`;
-- drop table if exists `mst_partnerastype`;
-- drop table if exists `mst_partnerbank`;
-- drop table if exists `mst_partnercontact`;
-- drop table if exists `mst_partnerref`;


CREATE TABLE IF NOT EXISTS `mst_partner` (
	`partner_id` varchar(14) NOT NULL , 
	`partnertype_id` varchar(10) NOT NULL , 
	`partnertype_isempl` tinyint(1) NOT NULL DEFAULT 0, 
	`empl_id` varchar(14)  , 
	`partner_name` varchar(60) NOT NULL , 
	`partner_addressline1` varchar(100) NOT NULL , 
	`partner_addressline2` varchar(100) NOT NULL , 
	`partner_addressline3` varchar(100) NOT NULL , 
	`partner_city` varchar(30) NOT NULL , 
	`partner_postcode` varchar(10) NOT NULL , 
	`partner_country` varchar(10) NOT NULL , 
	`partner_phone` varchar(30) NOT NULL , 
	`partner_mobilephone` varchar(30) NOT NULL , 
	`partner_email` varchar(150) NOT NULL , 
	`partner_npwp` varchar(30) NOT NULL , 
	`partner_isnonnpwp` tinyint(1) NOT NULL DEFAULT 0, 
	`partner_isgroup` tinyint(1) NOT NULL DEFAULT 0, 
	`partner_isdisabled` tinyint(1) NOT NULL DEFAULT 0, 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `partner_name` (`partner_name`),
	PRIMARY KEY (`partner_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar Partner (rekanan)';


ALTER TABLE `mst_partner` ADD COLUMN IF NOT EXISTS  `partnertype_id` varchar(10) NOT NULL  AFTER `partner_id`;
ALTER TABLE `mst_partner` ADD COLUMN IF NOT EXISTS  `partnertype_isempl` tinyint(1) NOT NULL DEFAULT 0 AFTER `partnertype_id`;
ALTER TABLE `mst_partner` ADD COLUMN IF NOT EXISTS  `empl_id` varchar(14)   AFTER `partnertype_isempl`;
ALTER TABLE `mst_partner` ADD COLUMN IF NOT EXISTS  `partner_name` varchar(60) NOT NULL  AFTER `empl_id`;
ALTER TABLE `mst_partner` ADD COLUMN IF NOT EXISTS  `partner_addressline1` varchar(100) NOT NULL  AFTER `partner_name`;
ALTER TABLE `mst_partner` ADD COLUMN IF NOT EXISTS  `partner_addressline2` varchar(100) NOT NULL  AFTER `partner_addressline1`;
ALTER TABLE `mst_partner` ADD COLUMN IF NOT EXISTS  `partner_addressline3` varchar(100) NOT NULL  AFTER `partner_addressline2`;
ALTER TABLE `mst_partner` ADD COLUMN IF NOT EXISTS  `partner_city` varchar(30) NOT NULL  AFTER `partner_addressline3`;
ALTER TABLE `mst_partner` ADD COLUMN IF NOT EXISTS  `partner_postcode` varchar(10) NOT NULL  AFTER `partner_city`;
ALTER TABLE `mst_partner` ADD COLUMN IF NOT EXISTS  `partner_country` varchar(10) NOT NULL  AFTER `partner_postcode`;
ALTER TABLE `mst_partner` ADD COLUMN IF NOT EXISTS  `partner_phone` varchar(30) NOT NULL  AFTER `partner_country`;
ALTER TABLE `mst_partner` ADD COLUMN IF NOT EXISTS  `partner_mobilephone` varchar(30) NOT NULL  AFTER `partner_phone`;
ALTER TABLE `mst_partner` ADD COLUMN IF NOT EXISTS  `partner_email` varchar(150) NOT NULL  AFTER `partner_mobilephone`;
ALTER TABLE `mst_partner` ADD COLUMN IF NOT EXISTS  `partner_npwp` varchar(30) NOT NULL  AFTER `partner_email`;
ALTER TABLE `mst_partner` ADD COLUMN IF NOT EXISTS  `partner_isnonnpwp` tinyint(1) NOT NULL DEFAULT 0 AFTER `partner_npwp`;
ALTER TABLE `mst_partner` ADD COLUMN IF NOT EXISTS  `partner_isgroup` tinyint(1) NOT NULL DEFAULT 0 AFTER `partner_isnonnpwp`;
ALTER TABLE `mst_partner` ADD COLUMN IF NOT EXISTS  `partner_isdisabled` tinyint(1) NOT NULL DEFAULT 0 AFTER `partner_isgroup`;


ALTER TABLE `mst_partner` MODIFY COLUMN IF EXISTS  `partnertype_id` varchar(10) NOT NULL   AFTER `partner_id`;
ALTER TABLE `mst_partner` MODIFY COLUMN IF EXISTS  `partnertype_isempl` tinyint(1) NOT NULL DEFAULT 0  AFTER `partnertype_id`;
ALTER TABLE `mst_partner` MODIFY COLUMN IF EXISTS  `empl_id` varchar(14)    AFTER `partnertype_isempl`;
ALTER TABLE `mst_partner` MODIFY COLUMN IF EXISTS  `partner_name` varchar(60) NOT NULL   AFTER `empl_id`;
ALTER TABLE `mst_partner` MODIFY COLUMN IF EXISTS  `partner_addressline1` varchar(100) NOT NULL   AFTER `partner_name`;
ALTER TABLE `mst_partner` MODIFY COLUMN IF EXISTS  `partner_addressline2` varchar(100) NOT NULL   AFTER `partner_addressline1`;
ALTER TABLE `mst_partner` MODIFY COLUMN IF EXISTS  `partner_addressline3` varchar(100) NOT NULL   AFTER `partner_addressline2`;
ALTER TABLE `mst_partner` MODIFY COLUMN IF EXISTS  `partner_city` varchar(30) NOT NULL   AFTER `partner_addressline3`;
ALTER TABLE `mst_partner` MODIFY COLUMN IF EXISTS  `partner_postcode` varchar(10) NOT NULL   AFTER `partner_city`;
ALTER TABLE `mst_partner` MODIFY COLUMN IF EXISTS  `partner_country` varchar(10) NOT NULL   AFTER `partner_postcode`;
ALTER TABLE `mst_partner` MODIFY COLUMN IF EXISTS  `partner_phone` varchar(30) NOT NULL   AFTER `partner_country`;
ALTER TABLE `mst_partner` MODIFY COLUMN IF EXISTS  `partner_mobilephone` varchar(30) NOT NULL   AFTER `partner_phone`;
ALTER TABLE `mst_partner` MODIFY COLUMN IF EXISTS  `partner_email` varchar(150) NOT NULL   AFTER `partner_mobilephone`;
ALTER TABLE `mst_partner` MODIFY COLUMN IF EXISTS  `partner_npwp` varchar(30) NOT NULL   AFTER `partner_email`;
ALTER TABLE `mst_partner` MODIFY COLUMN IF EXISTS  `partner_isnonnpwp` tinyint(1) NOT NULL DEFAULT 0  AFTER `partner_npwp`;
ALTER TABLE `mst_partner` MODIFY COLUMN IF EXISTS  `partner_isgroup` tinyint(1) NOT NULL DEFAULT 0  AFTER `partner_isnonnpwp`;
ALTER TABLE `mst_partner` MODIFY COLUMN IF EXISTS  `partner_isdisabled` tinyint(1) NOT NULL DEFAULT 0  AFTER `partner_isgroup`;


ALTER TABLE `mst_partner` ADD CONSTRAINT `partner_name` UNIQUE IF NOT EXISTS  (`partner_name`);

ALTER TABLE `mst_partner` ADD KEY IF NOT EXISTS `partnertype_id` (`partnertype_id`);
ALTER TABLE `mst_partner` ADD KEY IF NOT EXISTS `empl_id` (`empl_id`);
ALTER TABLE `mst_partner` ADD KEY IF NOT EXISTS `partner_country` (`partner_country`);

ALTER TABLE `mst_partner` ADD CONSTRAINT `fk_mst_partner_mst_partnertype` FOREIGN KEY IF NOT EXISTS  (`partnertype_id`) REFERENCES `mst_partnertype` (`partnertype_id`);
ALTER TABLE `mst_partner` ADD CONSTRAINT `fk_mst_partner_mst_empl` FOREIGN KEY IF NOT EXISTS  (`empl_id`) REFERENCES `mst_empl` (`empl_id`);
ALTER TABLE `mst_partner` ADD CONSTRAINT `fk_mst_partner_mst_country` FOREIGN KEY IF NOT EXISTS  (`partner_country`) REFERENCES `mst_country` (`country_id`);





CREATE TABLE IF NOT EXISTS `mst_partnerastype` (
	`partnerastype_id` varchar(14) NOT NULL , 
	`partnertype_id` varchar(10) NOT NULL , 
	`partner_id` varchar(14) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `partnerastype_pair` (`partner_id`, `partnertype_id`),
	PRIMARY KEY (`partnerastype_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar Type lain yang dimiliki partner';


ALTER TABLE `mst_partnerastype` ADD COLUMN IF NOT EXISTS  `partnertype_id` varchar(10) NOT NULL  AFTER `partnerastype_id`;
ALTER TABLE `mst_partnerastype` ADD COLUMN IF NOT EXISTS  `partner_id` varchar(14) NOT NULL  AFTER `partnertype_id`;


ALTER TABLE `mst_partnerastype` MODIFY COLUMN IF EXISTS  `partnertype_id` varchar(10) NOT NULL   AFTER `partnerastype_id`;
ALTER TABLE `mst_partnerastype` MODIFY COLUMN IF EXISTS  `partner_id` varchar(14) NOT NULL   AFTER `partnertype_id`;


ALTER TABLE `mst_partnerastype` ADD CONSTRAINT `partnerastype_pair` UNIQUE IF NOT EXISTS  (`partner_id`, `partnertype_id`);

ALTER TABLE `mst_partnerastype` ADD KEY IF NOT EXISTS `partnertype_id` (`partnertype_id`);
ALTER TABLE `mst_partnerastype` ADD KEY IF NOT EXISTS `partner_id` (`partner_id`);

ALTER TABLE `mst_partnerastype` ADD CONSTRAINT `fk_mst_partnerastype_mst_partnertype` FOREIGN KEY IF NOT EXISTS  (`partnertype_id`) REFERENCES `mst_partnertype` (`partnertype_id`);
ALTER TABLE `mst_partnerastype` ADD CONSTRAINT `fk_mst_partnerastype_mst_partner` FOREIGN KEY IF NOT EXISTS (`partner_id`) REFERENCES `mst_partner` (`partner_id`);





CREATE TABLE IF NOT EXISTS `mst_partnerbank` (
	`partnerbank_id` varchar(14) NOT NULL , 
	`partnerbank_accnum` varchar(30) NOT NULL , 
	`partnerbank_accname` varchar(90) NOT NULL , 
	`partnerbank_isdisabled` tinyint(1) NOT NULL DEFAULT 0, 
	`bank_id` varchar(14) NOT NULL , 
	`partner_id` varchar(14) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `partnerbank_accnum` (`bank_id`, `partnerbank_accnum`),
	PRIMARY KEY (`partnerbank_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar Bank yang dimiliki suatu Partner (rekanan)';


ALTER TABLE `mst_partnerbank` ADD COLUMN IF NOT EXISTS  `partnerbank_accnum` varchar(30) NOT NULL  AFTER `partnerbank_id`;
ALTER TABLE `mst_partnerbank` ADD COLUMN IF NOT EXISTS  `partnerbank_accname` varchar(90) NOT NULL  AFTER `partnerbank_accnum`;
ALTER TABLE `mst_partnerbank` ADD COLUMN IF NOT EXISTS  `partnerbank_isdisabled` tinyint(1) NOT NULL DEFAULT 0 AFTER `partnerbank_accname`;
ALTER TABLE `mst_partnerbank` ADD COLUMN IF NOT EXISTS  `bank_id` varchar(14) NOT NULL  AFTER `partnerbank_isdisabled`;
ALTER TABLE `mst_partnerbank` ADD COLUMN IF NOT EXISTS  `partner_id` varchar(14) NOT NULL  AFTER `bank_id`;


ALTER TABLE `mst_partnerbank` MODIFY COLUMN IF EXISTS  `partnerbank_accnum` varchar(30) NOT NULL   AFTER `partnerbank_id`;
ALTER TABLE `mst_partnerbank` MODIFY COLUMN IF EXISTS  `partnerbank_accname` varchar(90) NOT NULL   AFTER `partnerbank_accnum`;
ALTER TABLE `mst_partnerbank` MODIFY COLUMN IF EXISTS  `partnerbank_isdisabled` tinyint(1) NOT NULL DEFAULT 0  AFTER `partnerbank_accname`;
ALTER TABLE `mst_partnerbank` MODIFY COLUMN IF EXISTS  `bank_id` varchar(14) NOT NULL   AFTER `partnerbank_isdisabled`;
ALTER TABLE `mst_partnerbank` MODIFY COLUMN IF EXISTS  `partner_id` varchar(14) NOT NULL   AFTER `bank_id`;


ALTER TABLE `mst_partnerbank` ADD CONSTRAINT `partnerbank_accnum` UNIQUE IF NOT EXISTS  (`bank_id`, `partnerbank_accnum`);

ALTER TABLE `mst_partnerbank` ADD KEY IF NOT EXISTS `bank_id` (`bank_id`);
ALTER TABLE `mst_partnerbank` ADD KEY IF NOT EXISTS `partner_id` (`partner_id`);

ALTER TABLE `mst_partnerbank` ADD CONSTRAINT `fk_mst_partnerbank_mst_bank` FOREIGN KEY IF NOT EXISTS  (`bank_id`) REFERENCES `mst_bank` (`bank_id`);
ALTER TABLE `mst_partnerbank` ADD CONSTRAINT `fk_mst_partnerbank_mst_partner` FOREIGN KEY IF NOT EXISTS (`partner_id`) REFERENCES `mst_partner` (`partner_id`);





CREATE TABLE IF NOT EXISTS `mst_partnercontact` (
	`partnercontact_id` varchar(14) NOT NULL , 
	`partnercontact_name` varchar(100) NOT NULL , 
	`partnercontact_position` varchar(30) NOT NULL , 
	`partnercontact_mobilephone` varchar(30) NOT NULL , 
	`partnercontact_email` varchar(150) NOT NULL , 
	`partnecontact_isdisabled` tinyint(1) NOT NULL DEFAULT 0, 
	`partnecontact_iscontract` tinyint(1) NOT NULL DEFAULT 0, 
	`partnecontact_isinvoice` tinyint(1) NOT NULL DEFAULT 0, 
	`partner_id` varchar(14) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `partnercontact_mobilephone` (`partner_id`, `partnercontact_mobilephone`),
	PRIMARY KEY (`partnercontact_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar kontak yang dimiliki suatu Partner (rekanan)';


ALTER TABLE `mst_partnercontact` ADD COLUMN IF NOT EXISTS  `partnercontact_name` varchar(100) NOT NULL  AFTER `partnercontact_id`;
ALTER TABLE `mst_partnercontact` ADD COLUMN IF NOT EXISTS  `partnercontact_position` varchar(30) NOT NULL  AFTER `partnercontact_name`;
ALTER TABLE `mst_partnercontact` ADD COLUMN IF NOT EXISTS  `partnercontact_mobilephone` varchar(30) NOT NULL  AFTER `partnercontact_position`;
ALTER TABLE `mst_partnercontact` ADD COLUMN IF NOT EXISTS  `partnercontact_email` varchar(150) NOT NULL  AFTER `partnercontact_mobilephone`;
ALTER TABLE `mst_partnercontact` ADD COLUMN IF NOT EXISTS  `partnecontact_isdisabled` tinyint(1) NOT NULL DEFAULT 0 AFTER `partnercontact_email`;
ALTER TABLE `mst_partnercontact` ADD COLUMN IF NOT EXISTS  `partnecontact_iscontract` tinyint(1) NOT NULL DEFAULT 0 AFTER `partnecontact_isdisabled`;
ALTER TABLE `mst_partnercontact` ADD COLUMN IF NOT EXISTS  `partnecontact_isinvoice` tinyint(1) NOT NULL DEFAULT 0 AFTER `partnecontact_iscontract`;
ALTER TABLE `mst_partnercontact` ADD COLUMN IF NOT EXISTS  `partner_id` varchar(14) NOT NULL  AFTER `partnecontact_isinvoice`;


ALTER TABLE `mst_partnercontact` MODIFY COLUMN IF EXISTS  `partnercontact_name` varchar(100) NOT NULL   AFTER `partnercontact_id`;
ALTER TABLE `mst_partnercontact` MODIFY COLUMN IF EXISTS  `partnercontact_position` varchar(30) NOT NULL   AFTER `partnercontact_name`;
ALTER TABLE `mst_partnercontact` MODIFY COLUMN IF EXISTS  `partnercontact_mobilephone` varchar(30) NOT NULL   AFTER `partnercontact_position`;
ALTER TABLE `mst_partnercontact` MODIFY COLUMN IF EXISTS  `partnercontact_email` varchar(150) NOT NULL   AFTER `partnercontact_mobilephone`;
ALTER TABLE `mst_partnercontact` MODIFY COLUMN IF EXISTS  `partnecontact_isdisabled` tinyint(1) NOT NULL DEFAULT 0  AFTER `partnercontact_email`;
ALTER TABLE `mst_partnercontact` MODIFY COLUMN IF EXISTS  `partnecontact_iscontract` tinyint(1) NOT NULL DEFAULT 0  AFTER `partnecontact_isdisabled`;
ALTER TABLE `mst_partnercontact` MODIFY COLUMN IF EXISTS  `partnecontact_isinvoice` tinyint(1) NOT NULL DEFAULT 0  AFTER `partnecontact_iscontract`;
ALTER TABLE `mst_partnercontact` MODIFY COLUMN IF EXISTS  `partner_id` varchar(14) NOT NULL   AFTER `partnecontact_isinvoice`;


ALTER TABLE `mst_partnercontact` ADD CONSTRAINT `partnercontact_mobilephone` UNIQUE IF NOT EXISTS  (`partner_id`, `partnercontact_mobilephone`);

ALTER TABLE `mst_partnercontact` ADD KEY IF NOT EXISTS `partner_id` (`partner_id`);

ALTER TABLE `mst_partnercontact` ADD CONSTRAINT `fk_mst_partnercontact_mst_partner` FOREIGN KEY IF NOT EXISTS (`partner_id`) REFERENCES `mst_partner` (`partner_id`);





CREATE TABLE IF NOT EXISTS `mst_partnerref` (
	`partnerref_id` varchar(14) NOT NULL , 
	`interface_id` varchar(7) NOT NULL , 
	`partnerref_name` varchar(30) NOT NULL , 
	`partnerref_code` varchar(30) NOT NULL , 
	`partnerref_otherdata` varchar(1000)  , 
	`partnerref_notes` varchar(255)  , 
	`partner_id` varchar(14) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `partnerref_pair` (`partner_id`, `interface_id`, `partnerref_name`),
	PRIMARY KEY (`partnerref_id`)
) 
ENGINE=InnoDB
COMMENT='Kode referensi partner untuk keperluan interfacing dengan system lain';


ALTER TABLE `mst_partnerref` ADD COLUMN IF NOT EXISTS  `interface_id` varchar(7) NOT NULL  AFTER `partnerref_id`;
ALTER TABLE `mst_partnerref` ADD COLUMN IF NOT EXISTS  `partnerref_name` varchar(30) NOT NULL  AFTER `interface_id`;
ALTER TABLE `mst_partnerref` ADD COLUMN IF NOT EXISTS  `partnerref_code` varchar(30) NOT NULL  AFTER `partnerref_name`;
ALTER TABLE `mst_partnerref` ADD COLUMN IF NOT EXISTS  `partnerref_otherdata` varchar(1000)   AFTER `partnerref_code`;
ALTER TABLE `mst_partnerref` ADD COLUMN IF NOT EXISTS  `partnerref_notes` varchar(255)   AFTER `partnerref_otherdata`;
ALTER TABLE `mst_partnerref` ADD COLUMN IF NOT EXISTS  `partner_id` varchar(14) NOT NULL  AFTER `partnerref_notes`;


ALTER TABLE `mst_partnerref` MODIFY COLUMN IF EXISTS  `interface_id` varchar(7) NOT NULL   AFTER `partnerref_id`;
ALTER TABLE `mst_partnerref` MODIFY COLUMN IF EXISTS  `partnerref_name` varchar(30) NOT NULL   AFTER `interface_id`;
ALTER TABLE `mst_partnerref` MODIFY COLUMN IF EXISTS  `partnerref_code` varchar(30) NOT NULL   AFTER `partnerref_name`;
ALTER TABLE `mst_partnerref` MODIFY COLUMN IF EXISTS  `partnerref_otherdata` varchar(1000)    AFTER `partnerref_code`;
ALTER TABLE `mst_partnerref` MODIFY COLUMN IF EXISTS  `partnerref_notes` varchar(255)    AFTER `partnerref_otherdata`;
ALTER TABLE `mst_partnerref` MODIFY COLUMN IF EXISTS  `partner_id` varchar(14) NOT NULL   AFTER `partnerref_notes`;


ALTER TABLE `mst_partnerref` ADD CONSTRAINT `partnerref_pair` UNIQUE IF NOT EXISTS  (`partner_id`, `interface_id`, `partnerref_name`);

ALTER TABLE `mst_partnerref` ADD KEY IF NOT EXISTS `interface_id` (`interface_id`);
ALTER TABLE `mst_partnerref` ADD KEY IF NOT EXISTS `partner_id` (`partner_id`);

ALTER TABLE `mst_partnerref` ADD CONSTRAINT `fk_mst_partnerref_mst_interface` FOREIGN KEY IF NOT EXISTS  (`interface_id`) REFERENCES `mst_interface` (`interface_id`);
ALTER TABLE `mst_partnerref` ADD CONSTRAINT `fk_mst_partnerref_mst_partner` FOREIGN KEY IF NOT EXISTS (`partner_id`) REFERENCES `mst_partner` (`partner_id`);





