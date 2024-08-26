DROP VIEW IF EXISTS view_userdept;

DELIMITER //


CREATE VIEW view_userdept AS
	
	select 
	    distinct 
	    AX.empl_id as empl_id,
	    AX.dept_id as dept_id,
	    BX.dept_name as dept_name
	from
	(
		
		(
			select empl_id, dept_id from mst_empl
    		
    		union all
    	
    		select empl_id, dept_id from mst_empldept
		)
    	
		union all
    
    	select
        A.empl_id, B.dept_id
		from
    	mst_empluser A join mst_dept B
		where
    	A.empluser_allowviewalldept = 1
    	
    ) AX join mst_dept BX on BX.dept_id = AX.dept_id
	
    where
    BX.dept_isdisabled = 0//



DELIMITER ;	    
