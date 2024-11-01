'use strict'

const dbtype = global.dbtype;
const comp = global.comp;

module.exports = {
	title: "Item Stock",
	autoid: true,

	persistent: {
		'mst_itemstockperiode' : {
			comment: 'Saldo akhir stok pada suatu dept pada akhir bulan',
			primarykeys: ['itemstockperiode_id'],
			data: {
				itemstockperiode_id: { text: 'ID', type: dbtype.varchar(14), null: false, options: { required: true, invalidMessage: 'ID harus diisi' } },
				periodemo_id: { 
					text: 'Periode', type: dbtype.varchar(6),  null: false, unset:true,
					reference: {table: 'mst_periodemo', field_value: 'periodemo_id', field_display:'periodemo_name',  field_display_name:'periodemo_name'}, 
					options: { disabled: true, required: true} 
				},	
				dept_id: { 
					text: 'Dept', type: dbtype.varchar(30),  null: false, unset:true,
					reference: {table: 'mst_dept', field_value: 'dept_id', field_display:'dept_name',  field_display_name:'periodemo_name'}, 
					options: { disabled: true,  required: true} 
				},
				itemstockperiode_isclose: { text: 'Closed', type: dbtype.boolean, null: false, default: '0', suppresslist: true,  unset:true, options: { disabled: true } },
				itemstockperiode_closeby: { text: 'Closed By', type: dbtype.varchar(14), suppresslist: true, unset:true, options: { disabled: true }, hidden: true, lookup:'user' },
				itemstockperiode_closedate: { text: 'Closed Date', type: dbtype.datetime, suppresslist: true, unset:true, comp: comp.Textbox(), options: { disabled: true } , hidden: true},
			},
			uniques: {
				itemstockperiode_pair : ['periodemo_id', 'dept_id']
			}
		},

		'mst_itemstockcost' : {
			comment: 'Cost stok pada saat closing periode',
			primarykeys: ['itemstockcost_id'],
			data: {
				itemstockcost_id: { text: 'ID', type: dbtype.varchar(14), null: false, options: { required: true, invalidMessage: 'ID harus diisi' } },

				// owner
				dept_id: { 
					text: 'Dept', type: dbtype.varchar(30),  null: false, unset:true,
					reference: {table: 'mst_dept', field_value: 'dept_id', field_display:'dept_name',  field_display_name:'periodemo_name'}, 
					options: { disabled: true,  required: true} 
				},

				// item
				itemstock_id: { 
					text: 'Itemstock', type: dbtype.varchar(14),  null: false, unset:true,
					reference: {table: 'mst_itemstock', field_value: 'itemstock_id', field_display:'itemstock_name',  field_display_name:'room_name'}, 
					options: { disabled: true,  required: true} 
				},

				itemstockcost_valueperitem: { 
					text: 'Value per Item', type: dbtype.decimal(16,2), suppresslist: true, unset:true, options: { disabled: true } 
				},

				itemstockcost_saldoqty: { 
					text: 'LastQty', type: dbtype.decimal(14,2), suppresslist: true, unset:true, options: { disabled: true } 
				},
				
				itemstockcost_saldovalue: { 
					text: 'LastValue', type: dbtype.decimal(16,2), suppresslist: true, unset:true, options: { disabled: true } 
				},


				itemstockperiode_id: { text: 'ID', type: dbtype.varchar(14), null: false },
			},
			uniques: {
				itemstockcost_pair : ['itemstockcost_id', 'dept_id', 'itemstock_id']
			}
		},


		'mst_itemstocksaldo' : {
			comment: 'Saldo akhir stok pda site pada akhir bulan',
			primarykeys: ['itemstocksaldo_id'],
			data: {
				itemstocksaldo_id: { text: 'ID', type: dbtype.varchar(14), null: false, options: { required: true, invalidMessage: 'ID harus diisi' } },

				// owner
				dept_id: { 
					text: 'Dept', type: dbtype.varchar(30),  null: false, unset:true,
					reference: {table: 'mst_dept', field_value: 'dept_id', field_display:'dept_name',  field_display_name:'periodemo_name'}, 
					options: { disabled: true,  required: true} 
				},

				// location
				site_id: { 
					text: 'Site', type: dbtype.varchar(30),  null: false, unset:true,
					reference: {table: 'mst_site', field_value: 'site_id', field_display:'site_name',  field_display_name:'site_name'}, 
					options: { disabled: true,  required: true} 
				},



				room_id: { 
					text: 'Room', type: dbtype.varchar(30),  null: true, unset:true,
					reference: {table: 'mst_room', field_value: 'room_id', field_display:'room_name',  field_display_name:'room_name'}, 
					options: { disabled: true,  required: true} 
				},


				itemstockbatch_id: { 
					text: 'Batch', type: dbtype.varchar(14),  null: true, unset:true,
					reference: {table: 'mst_itemstockbatch', field_value: 'itemstockbatch_id', field_display:'itemstockbatch_name',  field_display_name:'itemstockbatch_name'}, 
					options: { disabled: true,  required: true} 
				},



				itemstock_id: { 
					text: 'Room', type: dbtype.varchar(14),  null: false, unset:true,
					reference: {table: 'mst_itemstock', field_value: 'itemstock_id', field_display:'itemstock_name',  field_display_name:'itemstock_name'}, 
					options: { disabled: true,  required: true} 
				},


				itemstocksaldo_valueperitem: { 
					text: 'Value per Item', type: dbtype.decimal(16,2), suppresslist: true, unset:true, options: { disabled: true } 
				},

				// quantity and value
				itemstocksaldo_qty: { 
					text: 'LastQty', type: dbtype.decimal(14,2), suppresslist: true, unset:true, options: { disabled: true } 
				},
				
				itemstocksaldo_value: { 
					text: 'LastValue', type: dbtype.decimal(16,2), suppresslist: true, unset:true, options: { disabled: true } 
				},

				itemstockperiode_id: { text: 'ID', type: dbtype.varchar(14), null: false },
			},
			uniques: {
				itemstocksaldo_pair : ['itemstocksaldo_id', 'dept_id', 'site_id', 'room_id', 'itemstockbatch_id', 'itemstock_id']
			}
		}


	},

	schema: {
		title: 'Item Stock',
		header: 'mst_itemstockperiode',
		detils: {
			'cost' : {title: 'Cost', table: 'mst_itemstockcost', form: true, headerview: 'periodemo_id',editorHandler: true,listHandler: true },
			'saldo' : {title: 'Saldo', table: 'mst_itemstocksaldo', form: true, headerview: 'periodemo_id',editorHandler: true,listHandler: true },
		}
	}
}