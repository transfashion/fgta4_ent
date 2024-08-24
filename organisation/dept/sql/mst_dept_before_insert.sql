DROP TRIGGER IF EXISTS mst_dept_before_insert;

DELIMITER //


CREATE TRIGGER `mst_dept_before_insert` BEFORE INSERT ON `mst_dept` FOR EACH ROW BEGIN

	DECLARE PATHID VARCHAR(30);
	DECLARE PARENT_PATHID VARCHAR(30);
	DECLARE PARENT_PATH VARCHAR(390);

	IF NEW.dept_parent=NEW.dept_id THEN
		SIGNAL SQLSTATE '45000' SET 
		MESSAGE_TEXT = 'Kode parent tidak boleh sama dengan kode group';
	END IF;


	if (@dept_skip_trigger is null or @dept_skip_trigger<=0) then
	
		SET NEW.dept_pathid = NEW.dept_id;
	
		SET PATHID = RPAD(NEW.dept_pathid, 30, '-');
		SET NEW.dept_pathid = PATHID;
	
		IF NEW.dept_parent IS NULL THEN
			SET NEW.dept_path = PATHID;
			SET NEW.dept_level = 1;
		ELSE
			SELECT dept_pathid, dept_path 
			INTO PARENT_PATHID, PARENT_PATH
			FROM mst_dept WHERE dept_id = NEW.dept_parent;	
				
			SET NEW.dept_path = CONCAT(PARENT_PATH, PATHID);
			SET NEW.dept_level = (LENGTH(NEW.dept_path) / 30);
		
		END IF;
	end if;

END //


DELIMITER ;