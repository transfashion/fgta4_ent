'use strict'

const dbtype = global.dbtype;
const comp = global.comp;

module.exports = {
	title: "Property",
	autoid: false,

	persistent: {
		'mst_prop': {
			comment: 'Daftar Properties/Spesifikasi Item',
			primarykeys: ['prop_id'],
			data: {
				prop_id: { text: 'ID', type: dbtype.varchar(26), uppercase: true, null: false, options: { required: true, invalidMessage: 'ID harus diisi' } },
				prop_name: { text: 'Property Name', type: dbtype.varchar(90), null: false, uppercase: true, options: { required: true, invalidMessage: 'Nama spesifikasi harus diisi' } },
				prop_descr: { text: 'Descr', type: dbtype.varchar(255), suppresslist: true },
				prop_tags: { text: 'Tags', type: dbtype.varchar(255), suppresslist: true },
			},

			uniques: {
				'prop_name': ['prop_name']
			},
			defaultsearch: ['prop_id', 'prop_name', 'prop_tags'],
		},

	},

	schema: {
		header: 'mst_prop',
		detils: {
		}
	}


}