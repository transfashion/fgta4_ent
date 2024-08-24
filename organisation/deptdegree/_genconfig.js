'use strict'

const dbtype = global.dbtype;
const comp = global.comp;

module.exports = {
	title: "Departement Degree",
	autoid: false,

	persistent: {
		'mst_deptdegree' : {
			primarykeys: ['deptdegree_id'],
			comment: 'Urutan/hierarki organisasi departement, direktorat, divisi, dept, dst',
			data: {
				deptdegree_id: {text:'ID', type: dbtype.varchar(10), null:false, uppercase: true},
				deptdegree_name: {text:'Degree/Level', type: dbtype.varchar(60), null:false, uppercase: true},
				deptdegree_descr: {text:'Descr', type: dbtype.varchar(90), null:true, uppercase: false, suppresslist: true},
				deptdegree_order: {text:'Order', type: dbtype.int(4), null:false, default:0},

				authlevel_id: {
					text:'Authorisation Level', type: dbtype.varchar(10), null:false,
					options:{required:true,invalidMessage:'Level Authorisasi harus diisi', prompt:'-- PILIH --'},
					comp: comp.Combo({
						table: 'mst_authlevel', 
						field_value: 'authlevel_id', field_display: 'authlevel_name', 
						api: 'ent/organisation/authlevel/list'
					})
				},	
			},

			defaultsearch: ['deptdegree_id', 'deptdegree_name'],

			uniques: {
				'deptdegree_name' : ['deptdegree_name']
            }
		},
	},

	schema: {
		title: 'Departement Degree',
		header: 'mst_deptdegree',
		detils: {}
	}
}

