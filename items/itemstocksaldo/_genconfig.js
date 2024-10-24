'use strict'

const dbtype = global.dbtype;
const comp = global.comp;

module.exports = {
	title: "Item Stock",
	autoid: true,

	persistent: {
		'mst_itemstocksaldoperiode' : {
			comment: 'Saldo akhir stok pada suatu dept pada akhir bulan',
			primarykeys: ['itemstocksaldoperiode_id'],
			data: {
					
			}
		},

		'mst_itemstocksaldo' : {
			comment: 'Saldo akhir stok pda site pada akhir bulan',
			primarykeys: ['itemstocksaldo_id'],
			data: {

			}
		}


	},

	schema: {
		title: 'Item Stock',
		header: 'mst_itemstocksaldo',
		detils: {
		}
	}
}