DROP TRIGGER IF EXISTS mst_cobgroup_before_insert;

DELIMITER //


CREATE TRIGGER `mst_cobgroup_before_insert` BEFORE INSERT ON `mst_cobgroup` FOR EACH ROW BEGIN

	DECLARE PATHID VARCHAR(17);
	DECLARE PARENT_PATHID VARCHAR(17);
	DECLARE PARENT_PATH VARCHAR(390);

	IF NEW.cobgroup_parent=NEW.cobgroup_id THEN
		SIGNAL SQLSTATE '45000' SET 
		MESSAGE_TEXT = 'Kode parent tidak boleh sama dengan kode group';
	END IF;


	if (@cobgroup_skip_trigger is null or @cobgroup_skip_trigger<=0) then
	
		SET NEW.cobgroup_pathid = NEW.cobgroup_id;
	
		SET PATHID = RPAD(NEW.cobgroup_pathid, 17, '-');
		SET NEW.cobgroup_pathid = PATHID;
	
		if NEW.cobgroup_parent IS NULL then
			SET NEW.cobgroup_path = PATHID;
			SET NEW.cobgroup_level = 1;
		ELSE
			SELECT cobgroup_pathid, cobgroup_path 
			INTO PARENT_PATHID, PARENT_PATH
			FROM mst_cobgroup WHERE cobgroup_id = NEW.cobgroup_parent;	
				
			SET NEW.cobgroup_path = CONCAT(PARENT_PATH, PATHID);
			SET NEW.cobgroup_level = (LENGTH(NEW.cobgroup_path) / 17);
		
		END IF;

	end if;

END //

DELIMITER ;
