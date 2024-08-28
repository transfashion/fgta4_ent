'use strict'

const dbtype = global.dbtype;
const comp = global.comp;

module.exports = {
	title: "Item Property",
	autoid: false,

	persistent: {
		'mst_itemprop': {
			comment: 'Daftar Properties/Spesifikasi Item',
			primarykeys: ['itemprop_id'],
			data: {
				itemprop_id: { text: 'ID', type: dbtype.varchar(10), uppercase: true, null: false, options: { required: true, invalidMessage: 'ID harus diisi' } },
				itemprop_name: { text: 'Property Name', type: dbtype.varchar(90), null: false, uppercase: true, options: { required: true, invalidMessage: 'Nama spesifikasi harus diisi' } },
				itemprop_descr: { text: 'Descr', type: dbtype.varchar(255), suppresslist: true },
				itemprop_tags: { text: 'Tags', type: dbtype.varchar(255), suppresslist: true },
			},

			uniques: {
				'itemprop_name': ['itemprop_name']
			},
			defaultsearch: ['itemprop_id', 'itemprop_name', 'itemprop_tags'],
		},

	},

	schema: {
		header: 'mst_itemprop',
		detils: {
		}
	}


}