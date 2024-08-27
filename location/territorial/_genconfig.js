'use strict'

const dbtype = global.dbtype;
const comp = global.comp;

module.exports = {
	title: "Territorial",
	autoid: false,

	persistent: {
		'mst_territorial' : {
			primarykeys: ['territorial_id'],
			comment: 'Master Territorial',
			data: {
				territorial_id: {text:'ID', type: dbtype.varchar(30), null:false, uppercase: true, options:{required:true,invalidMessage:'ID harus diisi'}},
				territorial_name: {text:'Territorial Name', type: dbtype.varchar(60), null:false, uppercase: true, options:{required:true,invalidMessage:'Nama Territorial harus diisi'}},
				territorial_descr: {text:'Descr', type: dbtype.varchar(90), null:true, suppresslist: true}
			},

			defaultsearch : ['territorial_id', 'territorial_name'],

			uniques: {
				'territorial_name' : ['territorial_name']
			}
		}
	},

	schema: {
		title: 'Territorial',
		header: 'mst_territorial',
		detils: {}
	}
}

