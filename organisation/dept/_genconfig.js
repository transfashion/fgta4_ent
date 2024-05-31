
'use strict'

const dbtype = global.dbtype;
const comp = global.comp;

module.exports = {
	title: "Departement",
	autoid: false,
	variance: {
		"view" : {"title":"Departemen (View)"},
	},

	persistent: {
		'mst_dept' : {
			primarykeys: ['dept_id'],
			comment: 'Daftar Departement',
			data: {
				dept_id: {text:'ID', type: dbtype.varchar(30), null:false, uppercase: true, options:{required:true,invalidMessage:'ID Group harus diisi'}},
				dept_name: {text:'Dept Name', type: dbtype.varchar(60), null:false, uppercase: true, options:{required:true,invalidMessage:'Nama Group harus diisi'}},
				dept_descr: {text:'Descr', type: dbtype.varchar(90), null:true, uppercase: false, suppresslist: true},
				dept_isdisabled: {caption:'Status', text:'Disabled', type: dbtype.boolean, null:false, default:'0'},
				dept_isparent: {text:'Parent Dept', type: dbtype.boolean, null:false, default:'0'},

				dept_isassetowner: {caption:'Item Management', text:'Asset Owner', type: dbtype.boolean, null:false, default:'0',  suppresslist: true, options:{labelWidth:'300px'}},
				dept_isassetmaintainer: {text:'Asset Maintainer', type: dbtype.boolean, null:false, default:'0',  suppresslist: true, options:{labelWidth:'300px'}},
				dept_isstockowner: {text:'Stock Owner', type: dbtype.boolean, null:false, default:'0',  suppresslist: true, options:{labelWidth:'300px'}},
				dept_isnonitemowner: {text:'Non Item Owner', type: dbtype.boolean, null:false, default:'0',  suppresslist: true, options:{labelWidth:'300px'}},
				dept_ispartnerselect: {text:'Partner Selector', type: dbtype.boolean, null:false, default:'0',  suppresslist: true, options:{labelWidth:'300px'}},

				dept_isbudgetmandatory: {caption:'Project Management', text:'Budget Mandatory', type: dbtype.boolean, null:false, default:'0', options:{labelWidth:'300px'}},
				dept_issingleprojectbudget: {text:'Single Project Budget', type: dbtype.boolean, null:false, default:'0', options:{labelWidth:'300px'}},
				dept_path: {text:'Path', type: dbtype.varchar(390), null:false, uppercase: false, suppresslist: true, options:{disabled:true}},
				dept_level: {text:'Level', type: dbtype.int(2), null:false, default:'0', uppercase: false, suppresslist: true, options:{disabled:true}},

				unit_id: {
					text: 'Unit', type: dbtype.varchar(10), null:false,  suppresslist: true,
					options:{required:true,invalidMessage:'Unit harus diisi', prompt:'-- PILIH --'},
					// tips: 'Maintainer Dept yang akan manage distribusi tipe item ini',
					// tipstype: 'visible',
					//options:{prompt:'NONE'},
					comp: comp.Combo({
						title: 'Pilih Unit',
						table: 'mst_unit', 
						field_value: 'unit_id', field_display: 'unit_name', field_display_name: 'unit_name',
						api: 'ent/organisation/unit/list',
						onDataLoadingHandler: false,
						onDataLoadedHandler: false,
						onSelectingHandler: false,
						onSelectedHandler: false							
					})				
				},

				deptgroup_id: {
					text:'Group', type: dbtype.varchar(10), null:false, uppercase: true, suppresslist: true,
					options:{required:true,invalidMessage:'Group harus diisi', prompt:'-- PILIH --'},
					comp: comp.Combo({
						table: 'mst_deptgroup', 
						field_value: 'deptgroup_id', field_display: 'deptgroup_name', 
						api: 'ent/organisation/deptgroup/list-selector'})				
				},

				dept_parent: {
					text:'Parent', type: dbtype.varchar(30), null:true, uppercase: true, suppresslist: true,
					options:{prompt:'NONE'},
					comp: comp.Combo({
						table: 'mst_dept', 
						field_value: 'dept_id', field_display: 'dept_name', field_display_name: 'dept_parent_name', 
						api: 'ent/organisation/dept/list'})					
				},

				depttype_id: {
					text:'Type', type: dbtype.varchar(10), null:false, uppercase: true, suppresslist: true,
					options:{required:true,invalidMessage:'Type Department harus diisi', prompt:'-- PILIH --'},
					comp: comp.Combo({
						table: 'mst_depttype', 
						field_value: 'depttype_id', field_display: 'depttype_name', 
						api: 'ent/organisation/depttype/list'})				
				},

				deptmodel_id: {
					text:'Model', type: dbtype.varchar(10), null:false, uppercase: true, suppresslist: true,
					options:{required:true,invalidMessage:'Model Department harus diisi', prompt:'-- PILIH --'},
					comp: comp.Combo({
						table: 'mst_deptmodel', 
						field_value: 'deptmodel_id', field_display: 'deptmodel_name', 
						api: 'ent/organisation/deptmodel/list'})				
				},

				auth_id: {
					text:'Authorisasi', type: dbtype.varchar(30), null:false, uppercase: true, suppresslist: true,
					options:{required:true,invalidMessage:'Authorisasi harus diisi', prompt:'-- PILIH --'},
					comp: comp.Combo({
						table: 'mst_auth', 
						field_value: 'auth_id', field_display: 'auth_name', 
						api: 'ent/organisation/auth/list'})				
				},

				project_id: {
					text: 'Project', type: dbtype.varchar(30), null: true,
					options: { prompt: 'NONE' },
					comp: comp.Combo({
						table: 'mst_project',
						field_value: 'project_id', field_display: 'project_name',
						api: 'finact/master/project/list'
					})
				}				
			},

			defaultsearch: ['dept_id', 'dept_name'],

			uniques: {
				'dept_name' : ['dept_name']
            }
			
		},

	},

	schema: {
		title: 'Department',
		header: 'mst_dept',
		detils: {}
	}
}



/*

DROP TRIGGER IF EXISTS mst_dept_before_insert; 

DELIMITER $$
$$

CREATE DEFINER=`root`@`localhost` TRIGGER mst_dept_before_insert
BEFORE INSERT
   ON mst_dept FOR EACH ROW
   
BEGIN

	DECLARE DEPT_PATH VARCHAR(390);
	DECLARE DEPT_LEVEL INT(2);

	SELECT deptgroup_path, deptgroup_level 
	INTO DEPT_PATH, DEPT_LEVEL
	FROM mst_deptgroup WHERE deptgroup_id = NEW.deptgroup_id;	

	SET NEW.dept_path = DEPT_PATH;
	SET NEW.dept_level = DEPT_LEVEL+1;

END;

$$
DELIMITER ;




DROP TRIGGER IF EXISTS mst_dept_before_update; 

DELIMITER $$
$$

CREATE DEFINER=`root`@`localhost` TRIGGER mst_dept_before_update
BEFORE UPDATE
   ON mst_dept FOR EACH ROW
   
BEGIN

	DECLARE DEPT_PATH VARCHAR(390);
	DECLARE DEPT_LEVEL INT(2);

	SELECT deptgroup_path, deptgroup_level 
	INTO DEPT_PATH, DEPT_LEVEL
	FROM mst_deptgroup WHERE deptgroup_id = NEW.deptgroup_id;	

	SET NEW.dept_path = DEPT_PATH;
	SET NEW.dept_level = DEPT_LEVEL+1;

END;

$$
DELIMITER ;


*/