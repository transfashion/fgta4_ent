'use strict'

const dbtype = global.dbtype;
const comp = global.comp;

module.exports = {
	title: "Item Model",
	autoid: false,

	permissions: [
		'ALLOW_ALLDEPT_IN_ITEMMODEL'
	],

	persistent: {
		'mst_itemmodel': {
			comment: 'Daftar Model Item',
			primarykeys: ['itemmodel_id'],
			data: {
				itemmodel_id: { text: 'ID', type: dbtype.varchar(10), uppercase: true, null: false, options: { required: true, invalidMessage: 'ID harus diisi' } },
				itemmodel_name: { text: 'Item Model', type: dbtype.varchar(90), null: false, uppercase: true, options: { required: true, invalidMessage: 'Nama model harus diisi' } },
				itemmodel_descr: { text: 'Descr', type: dbtype.varchar(255), suppresslist: true },
				
				itemmodel_isintangible: { text: 'Intangiable', type: dbtype.boolean, null: false, default:0, suppresslist: true },
				itemmodel_issellable: { text: 'Sellable', type: dbtype.boolean, null: false, default:0, suppresslist: true },
				itemmodel_isnonitem: { text: 'Non Item', type: dbtype.boolean, null: false, default:0, suppresslist: true },
				itemmodel_ishasmainteinerdept: { text: 'Has Maintainer Dept', type: dbtype.boolean, null: false, default: '0' , suppresslist: true, options:{ labelWidth:'300px'}},
				itemmodel_ismultidept: { text: 'Own By Multidept', type: dbtype.boolean, null: false, default: '0' , suppresslist: true, options:{ labelWidth:'300px'}},
			
				dept_id: {
					text: 'Dept', type: dbtype.varchar(30), null:true, suppresslist: true,
					options:{prompt:'NONE'},
					comp: comp.Combo({
						title: 'Pilih Item Manager Departemen',
						table: 'mst_dept', 
						field_value: 'dept_id', field_display: 'dept_name', 
						api: 'ent/organisation/dept/list',
						onDataLoadingHandler: true,
						onDataLoadedHandler: false,
						onSelectingHandler: false,
						onSelectedHandler: false	
					})				
				},


				itemmanage_id: { 
					text: 'Manage As', type: dbtype.varchar(2), uppercase: true, null: false, 
					options: { required: true, invalidMessage: 'Manage As harus diisi' } ,
					comp: comp.Combo({
						title: 'Item akan di Manage sebagai',
						table: 'mst_itemmanage', 
						field_value: 'itemmanage_id', field_display: 'itemmanage_name', field_display_name: 'itemmanage_name', 
						api: 'ent/items/itemmanage/list',
						onDataLoadingHandler: false,
						onDataLoadedHandler: false,
						onSelectingHandler: false,
						onSelectedHandler: true	
					})					
				},
				itemmanage_isasset: { 
					text: 'Manage As Asset ', type: dbtype.boolean, null: false, default: '0' , suppresslist: true, options:{ disabled: true, labelWidth:'300px'}},

			},

			uniques: {
				'itemmodel_name': ['itemmodel_name']
			},
			defaultsearch: ['itemmodel_id', 'itemmodel_name'],
		},


		'mst_itemmodelprop' : {
			comment: 'Template Properti / Spesifikasi item',
			primarykeys: ['itemmodelprop_id'],		
			data: {
				itemmodelprop_id: {text:'ID', type: dbtype.varchar(14), null:false, uppercase: true, suppresslist: true},
				prop_id: { 
					text: 'Properti', type: dbtype.varchar(26), null: false, 
					options: { required: true, invalidMessage: 'Item Property harus diisi' }, 
					comp: comp.Combo({
						table: 'mst_prop', 
						field_value: 'prop_id', field_display: 'prop_name', field_display_name: 'prop_name', 
						api: 'ent/items/prop/list'
					})				
				
				},
				itemmodelprop_order: {text:'Order', type: dbtype.int(4), null:false, default:0},
				itemmodel_id: {text:'Model', type: dbtype.varchar(10), null:false, uppercase: true},		
			}
		},		

	},

	schema: {
		title: 'Item Model',
		header: 'mst_itemmodel',
		detils: {
			'prop': {
				title: 'Properties', table: 'mst_itemmodelprop', form: true, headerview: 'itemmodel_name' ,
				editorHandler: true,
				listHandler: true
			},			
		}
	}


}