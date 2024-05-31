'use strict'

const dbtype = global.dbtype;
const comp = global.comp;

module.exports = {
	title: "Properties Type",
	autoid: false,

	persistent: {
		'mst_orgproptype' : {
			primarykeys: ['orgproptype_id'],
			comment: 'Properties Type, utnuk Item, Item Stock dan Item Asset',
			data: {
				orgproptype_id: {text:'ID', type: dbtype.varchar(20), null:false, uppercase: true, options:{required:true,invalidMessage:'ID harus diisi'}},
				orgproptype_name: {text:'Nama', type: dbtype.varchar(30), null:false, uppercase: false, options:{required:true,invalidMessage:'Nama Tipe Properti harus diisi'}},
				orgproptype_group: {text:'Group', type: dbtype.varchar(20), null:false, uppercase: false, suppresslist: true},
				orgproptype_descr: { text: 'Descr', type: dbtype.varchar(90), suppresslist: true },
				orgproptype_order: { text: 'Order', type: dbtype.int(7), default:0, suppresslist: true },
				orgproptype_isitem: { caption:'Available at', text: 'Item', type: dbtype.boolean, null: false, default: '0' , suppresslist: true},
				orgproptype_isitemstock: { text: 'Item Stock', type: dbtype.boolean, null: false, default: '0' , suppresslist: true },
				orgproptype_isitemasset: { text: 'Item Asset', type: dbtype.boolean, null: false, default: '0' , suppresslist: true },
				orgproptype_ispropitemdisabled: {caption:'Editor', text: 'Disabled in Item', type: dbtype.boolean, null: false, default: '0' , suppresslist: true, options: {labelWidth: '300px'}},
				orgproptype_ispropitemstockdisabled: { text: 'Disabled in Stock', type: dbtype.boolean, null: false, default: '0' , suppresslist: true, options: {labelWidth: '300px'}},
				orgproptype_ispropitemassetdisabled: { text: 'Disabled in Asset', type: dbtype.boolean, null: false, default: '0' , suppresslist: true, options: {labelWidth: '300px'}},
			},

			defaultsearch : ['orgproptype_id', 'orgproptype_name'],

			uniques: {
				'orgproptype_name' : ['orgproptype_name']
			}			
		}
	},

	schema: {
		title: 'Properties Type',
		header: 'mst_orgproptype',
		detils: {}
	}
	
}

