'use strict'

const dbtype = global.dbtype;
const comp = global.comp;

module.exports = {
	title: "Unit",
	autoid: false,

	persistent: {
		'mst_unit' : {
			primarykeys: ['unit_id'],
			comment: 'Daftar Unit',
			data: {
				unit_id: {text:'ID', type: dbtype.varchar(10), null:false, uppercase: true},
				unit_name: {text:'Unit', type: dbtype.varchar(60), null:false, uppercase: true},
				unit_descr: {text:'Descr', type: dbtype.varchar(90), null:true, suppresslist: true},
				unit_isdisabled: {text:'Disabled', type: dbtype.boolean, null:false, default:'0'},
				unitgroup_id: {
					text:'Unit Group', type: dbtype.varchar(10), null:false, suppresslist:true, 
					options:{required:true,invalidMessage:'Unit Group harus diisi', prompt:'-- PILIH --'},
					comp: comp.Combo({
						table: 'mst_unitgroup', 
						field_value: 'unitgroup_id', field_display: 'unitgroup_name', 
						api: 'ent/organisation/unitgroup/list',
						onDataLoadingHandler: false,
						onDataLoadedHandler: false,
						onSelectingHandler: false,
						onSelectedHandler: false
					})
				},
				dept_id: {
					text:'Dept', type: dbtype.varchar(30), null:false, suppresslist: true,
					options:{required:true,invalidMessage:'Department harus diisi', prompt:'-- PILIH --'},
					comp: comp.Combo({
						table: 'mst_dept', 
						field_value: 'dept_id', field_display: 'dept_name', 
						api: 'ent/organisation/dept/list',
						onDataLoadingHandler: true,
						onDataLoadedHandler: false,
						onSelectingHandler: false,
						onSelectedHandler: false
					})					
				},

				unit_isincallbrand: {text:'Include All Brand', type: dbtype.boolean, null:false, default:'0', suppresslist:true, options: {labelWidth:'200px'}},
				unit_isincallitemclass: {text:'Include All ItemClass', type: dbtype.boolean, null:false, default:'0', suppresslist:true, options: {labelWidth:'200px'}},
				

			},


			uniques: {
				'unit_name' : ['unit_name']
			},
			
		},

		'mst_unitbrand' : {
			primarykeys: ['unitbrand_id'],
			comment: 'Brand yang masuk ke dalam unit',
			data: {			
				unitbrand_id: {text:'ID', type: dbtype.varchar(14), null:false, suppresslist: true},
				brand_id: {
					suppresslist: false,
					options:{required:true,invalidMessage:'Brand harus diisi', prompt:'-- PILIH --'},
					text:'Brand', type: dbtype.varchar(10), null:false, 
					comp: comp.Combo({
						table: 'mst_brand', 
						field_value: 'brand_id', field_display: 'brand_name', 
						api: 'ent/affiliation/brand/list',
						onDataLoadingHandler: true,
						onDataLoadedHandler: false,
						onSelectingHandler: false,
						onSelectedHandler: false
					})
				},			
				unit_id: {text:'Unit', type: dbtype.varchar(10), null:false}
			},

			uniques: {
				'unitbrand_pair' : ['unit_id', 'brand_id']
			}	

		},

		'mst_unititemclass' : {
			primarykeys: ['unititemclass_id'],
			comment: 'ItemClass yang masuk ke dalam unit',
			data: {			
				unititemclass_id: {text:'ID', type: dbtype.varchar(14), null:false, suppresslist: true},
				itemclass_id: {
					suppresslist: false,
					options:{required:true,invalidMessage:'ItemClass harus diisi', prompt:'-- PILIH --'},
					text:'ItemClass', type: dbtype.varchar(14), null:false, 
					comp: comp.Combo({
						table: 'mst_itemclass', 
						field_value: 'itemclass_id', field_display: 'itemclass_name', 
						api: 'finact/items/itemclass/list',
						onDataLoadingHandler: true,
						onDataLoadedHandler: false,
						onSelectingHandler: false,
						onSelectedHandler: false
					})
				},			
				unit_id: {text:'Unit', type: dbtype.varchar(10), null:false}
			},

			uniques: {
				'unititemclass_pair' : ['unit_id', 'itemclass_id']
			}	

		},

		'mst_unitref' : {
			comment: 'Kode referensi unit untuk keperluan interfacing dengan system lain',
			primarykeys: ['unitref_id'],		
			data: {
				unitref_id: {text:'ID', type: dbtype.varchar(14), null:false, suppresslist: true},
				interface_id: { 
					text: 'Interface', type: dbtype.varchar(7), uppercase: true, null: false, 
					options: { required: true, invalidMessage: 'Interface harus diisi' }, 
					comp: comp.Combo({
						table: 'mst_interface', 
						field_value: 'interface_id', field_display: 'interface_name', field_display_name: 'interface_name', 
						api: 'ent/general/interface/list'})				
				
				},
				unitref_name: {text:'Name', type: dbtype.varchar(30), null:false},	
				unitref_code: {text:'Code', type: dbtype.varchar(30), null:false, uppercase: true},		
				unitref_otherdata: {text:'Data', type: dbtype.varchar(1000), null:true, suppresslist:true},			
				unit_id: {text:'Unit', type: dbtype.varchar(10), null:false},
			},
			uniques: {
				'unitref_pair': ['unit_id', 'interface_id']
			},			
		},

	},

	schema: {
		title: 'Unit',
		header: 'mst_unit',
		detils: {
			'brand': {
				title: 'Sellable Brands', table: 'mst_unitbrand', form: true, headerview: 'unit_name', 
				editorHandler: true,
				listHandler: true
			},
			'itemclass': {
				title: 'Sellable Item Class', table: 'mst_unititemclass', form: true, headerview: 'unit_name', 
				editorHandler: true,
				listHandler: true
			},
			'ref': {
				title: 'Reference', table: 'mst_unitref', form: true, headerview: 'unit_name', 
				editorHandler: true,
				listHandler: true
			},
		}
	}
}



