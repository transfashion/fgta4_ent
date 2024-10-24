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
				jurnal_isclose: { text: 'Closed', type: dbtype.boolean, null: false, default: '0', suppresslist: true,  unset:true, options: { disabled: true } },
				jurnal_closeby: { text: 'Closed By', type: dbtype.varchar(14), suppresslist: true, unset:true, options: { disabled: true }, hidden: true, lookup:'user' },
				jurnal_closedate: { text: 'Closed Date', type: dbtype.datetime, suppresslist: true, unset:true, comp: comp.Textbox(), options: { disabled: true } , hidden: true},
			}
		},

		'mst_itemstocksaldo' : {
			comment: 'Saldo akhir stok pda site pada akhir bulan',
			primarykeys: ['itemstocksaldo_id'],
			data: {
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


				itemstockperiode_id: { text: 'ID', type: dbtype.varchar(14), null: false },
			}
		}


	},

	schema: {
		title: 'Item Stock',
		header: 'mst_itemstockperiode',
		detils: {
		}
	}
}