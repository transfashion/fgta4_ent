'use strict'

const dbtype = global.dbtype;
const comp = global.comp;

module.exports = {
	title: "HR Jobs",
	autoid: false,
	icon :  "icon-hrjob-white.png",
	notes: `job ini ada di model dan section yang mana kalau section kosong, posisi job ini ada di level departemen`,

	persistent: {
		'mst_hrjob' : {
			primarykeys: ['hrjob_id'],
			comment: 'Daftar Master Job',
			data: {

				hrjob_id: {text:'ID', type: dbtype.varchar(20), null:false, uppercase: true, options:{required:true,invalidMessage:'ID harus diisi'}},
				hrjob_name: {text:'Job Name', type: dbtype.varchar(60), null:false, uppercase: true, options:{required:true,invalidMessage:'Nama Job harus diisi'}},
				hrjob_descr: {text:'Descr', type: dbtype.varchar(90), null:true, suppresslist: true},
				hrjob_isdisabled: {text:'Disabled', type: dbtype.boolean, null:false, default:'0'},
	
				hrgrd_id: {
					text:'Grade', type: dbtype.varchar(10), null:false, uppercase: true, suppresslist: true,
					options:{required:true,invalidMessage:'Grade harus diisi', prompt:'-- PILIH --'},
					comp: comp.Combo({
						table: 'mst_hrgrd', 
						field_value: 'hrgrd_id', field_display: 'hrgrd_name', 
						api: 'ent/organisation/hrgrd/list'})				
				},

				deptmodel_id: {
					text:'Dept Model', type: dbtype.varchar(10), null:false, uppercase: true, suppresslist: true,
					options:{required:true,invalidMessage:'Model Department harus diisi', prompt:'-- PILIH --'},
					comp: comp.Combo({
						table: 'mst_deptmodel', 
						field_value: 'deptmodel_id', field_display: 'deptmodel_name', 
						api: 'ent/organisation/deptmodel/list'})				
				},
			},

			defaultsearch: ['hrjob_id', 'hrjob_name'],

			uniques: {
				'hrjob_name' : ['hrjob_name']
			},
		}

	
	},

	schema: {
		title: 'HR Jobs',
		header: 'mst_hrjob',
		detils: {
		}
	}
}





