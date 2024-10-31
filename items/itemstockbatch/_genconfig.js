'use strict'

const dbtype = global.dbtype;
const comp = global.comp;

module.exports = {
	title: "Itemstock Batch",
	autoid: true,

	persistent: {
		'mst_itemastockbatch': {
			comment: 'Daftar Batch Itemstock',
			primarykeys: ['itemstockbatch_id'],
			data: {
				itemstockbatch_id: { 
					text: 'ID', type: dbtype.varchar(14), uppercase: true, null: false, 
					options: { required: true, invalidMessage: 'ID harus diisi' } 
				},
				itemstockbatch_name: { 
					text: 'Asset Status', type: dbtype.varchar(60), null: false, uppercase: true, 
					options: { required: true, invalidMessage: 'Nama Status Asset harus diisi' } 
				},
				itemstockbatch_exp: {
					text:'Date Expired', type: dbtype.date
				},
				itemstockbatch_isdisabled: {
					text:'Disabled', type: dbtype.boolean, null:false, default:'1', suppresslist: true, options: {labelWidth:'300px'}
				},
			}
		},

	},

	schema: {
		header: 'mst_itemastockbatch',
		detils: {
		}
	}


}