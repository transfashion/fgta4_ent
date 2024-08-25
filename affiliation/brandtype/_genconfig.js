'use strict'

const dbtype = global.dbtype;
const comp = global.comp;

module.exports = {
	title: "Brand Type",
	autoid: false,

	persistent: {
		'mst_brandtype' : {
			primarykeys: ['brandtype_id'],
			comment: 'Daftar Tipe Brand',
			data: {
				brandtype_id: {text:'ID', type: dbtype.varchar(10), null:false, uppercase: true, options:{required:true,invalidMessage:'ID harus diisi'}},
				brandtype_name: {text:'Brand Type', type: dbtype.varchar(60), null:false, uppercase: true, options:{required:true,invalidMessage:'Nama Type Brand harus diisi'}},
				brandtype_descr: {text:'Descr', type: dbtype.varchar(90), null:false, suppresslist: true}
			},
			
			uniques: {
				'brandtype_name' : ['brandtype_name']
			},

		},
	},

	schema: {
		title: 'Brand Type',
		header: 'mst_brandtype',
		detils: {}
	}
}

