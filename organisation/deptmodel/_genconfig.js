'use strict'

const dbtype = global.dbtype;
const comp = global.comp;

module.exports = {
	title: "Departement Model",
	autoid: false,

	persistent: {
		'mst_deptmodel' : {
			primarykeys: ['deptmodel_id'],
			comment: 'Daftar Model Departement',
			data: {
				deptmodel_id: {text:'ID', type: dbtype.varchar(10), null:false, uppercase: true},
				deptmodel_name: {text:'Dept Model', type: dbtype.varchar(60), null:false, uppercase: true},
				deptmodel_descr: {text:'Descr', type: dbtype.varchar(90), null:true, uppercase: false, suppresslist: true},
				deptmodel_isdisabled: {text:'Disabled', type: dbtype.boolean, null:false, default:'0'},	
				
				deptmodel_isrevenuecenter: {
					text:'Revenue Center', type: dbtype.boolean, suppresslist: true, null:false, default:'0',
					options:{labelWidth:'200px'}
				},
				
				deptmodel_iscostcenter: {
					text:'Cost Center', type: dbtype.boolean,  suppresslist: true, null:false, default:'0',
					options:{labelWidth:'200px'}
				},
			},

			defaultsearch: ['deptmodel_id', 'deptmodel_name'],

			uniques: {
				'deptmodel_name' : ['deptmodel_name']
            },
		},
	},

	schema: {
		title: 'Department Model',
		header: 'mst_deptmodel',
		detils: {}
	}
}

