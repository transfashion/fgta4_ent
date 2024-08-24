DROP PROCEDURE IF EXISTS deptgroup_applypath_recursive;

DELIMITER //


CREATE PROCEDURE deptgroup_applypath_recursive(
	IN in_deptgroup_id varchar(17)
)
BEGIN
	
	declare p_group_id varchar(17);
	declare EOF bool;	

	declare c_data cursor for
	select deptgroup_id from mst_deptgroup where deptgroup_parent=in_deptgroup_id;

	declare continue handler for not found
	set EOF = true;


	set p_group_id = in_deptgroup_id;
	call deptgroup_applypath(p_group_id);

	open c_data;
	lp: loop
		fetch c_data into p_group_id;
		if eof is true then
			leave lp;
		end if;
	
		call deptgroup_applypath_recursive(p_group_id);
	end loop;
	close c_data;


END //


DELIMITER ;