
DROP TRIGGER IF EXISTS mst_cobgroup_before_update;

DELIMITER //

CREATE TRIGGER `mst_cobgroup_before_update` BEFORE UPDATE ON `mst_cobgroup` FOR EACH ROW BEGIN
	
	DECLARE PATHID VARCHAR(17);
	DECLARE CHILDCOUNT INT;
	DECLARE PARENT_PATHID VARCHAR(17);
	DECLARE PARENT_PATH VARCHAR(390);


	SET PATHID = OLD.cobgroup_pathid;
	SET NEW.cobgroup_id = OLD.cobgroup_id;
	SET NEW.cobgroup_pathid = OLD.cobgroup_pathid;

	IF NEW.cobgroup_parent=NEW.cobgroup_id THEN
		SIGNAL SQLSTATE '45000' SET 
		MESSAGE_TEXT = 'Kode parent tidak boleh sama dengan kode group';
	END IF;
	

	if (@cobgroup_skip_trigger is null or @cobgroup_skip_trigger<=0) then

		IF NEW.cobgroup_parent='--NULL--' THEN
	    	SET NEW.cobgroup_parent = NULL;
	    END IF;
	
	
		SELECT COUNT(*) 
		INTO CHILDCOUNT
		FROM mst_cobgroup WHERE cobgroup_parent = NEW.cobgroup_id;
		IF NEW.cobgroup_parent<>OLD.cobgroup_parent AND CHILDCOUNT>0 THEN
			SIGNAL SQLSTATE '45000' SET 
			MESSAGE_TEXT = 'Group yang punya anggota tidak bisa diubah parentnya';	
		END IF;
	
	
		IF NEW.cobgroup_parent IS NULL THEN
			SET NEW.cobgroup_path = NEW.cobgroup_pathid;
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