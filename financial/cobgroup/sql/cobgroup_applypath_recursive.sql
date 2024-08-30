DROP PROCEDURE IF EXISTS cobgroup_applypath_recursive;

DELIMITER //


CREATE PROCEDURE cobgroup_applypath_recursive(
	IN in_cobgroup_id varchar(17)
)
BEGIN
	
	declare p_group_id varchar(17);
	declare EOF bool;	

	declare c_data cursor for
	select cobgroup_id from mst_cobgroup where cobgroup_parent=in_cobgroup_id;

	declare continue handler for not found
	set EOF = true;


	set p_group_id = in_cobgroup_id;
	call cobgroup_applypath(p_group_id);

	open c_data;
	lp: loop
		fetch c_data into p_group_id;
		if eof is true then
			leave lp;
		end if;
	
		call cobgroup_applypath_recursive(p_group_id);
	end loop;
	close c_data;




END //


DELIMITER ;