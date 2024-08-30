DROP PROCEDURE IF EXISTS cobgroup_reindex;

DELIMITER //


CREATE PROCEDURE cobgroup_reindex()
BEGIN
	
	declare p_group_id varchar(17);
	declare EOF bool;	

	declare c_data cursor for
	select cobgroup_id from mst_cobgroup where cobgroup_parent is null;

	declare continue handler for not found
	set EOF = true;

	set @cobgroup_skip_trigger = 1;
	set max_sp_recursion_depth = 10;


	update mst_cobgroup 
	set
	cobgroup_isparent = 0,
	cobgroup_pathid = rpad(cobgroup_id, 17, '-'),
	cobgroup_path = '',
	cobgroup_level = 0;

	open c_data;
	lp: loop
		fetch c_data into p_group_id;
		if eof is true then
			leave lp;
		end if;
	
		call cobgroup_applypath_recursive(p_group_id);
	end loop;
	close c_data;


	
	select
	'ERROR' as message,
	cobgroup_id, cobgroup_name , cobgroup_parent 	
	from 
	mst_cobgroup 
	where 
	cobgroup_path is null;
	

	set max_sp_recursion_depth = 0;
	set @cobgroup_skip_trigger = null;

	
END //



DELIMITER ;