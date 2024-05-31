'use strict'

const dbtype = global.dbtype;
const comp = global.comp;

module.exports = {
	title: "Brand",
	autoid: true,
	variance: {
		"manual-id-input" : {"title":"Brand (Manual-ID)"},
		"viewonly" : {"title":"Brand (View)"},
	},

	persistent: {
		'mst_brand' : {
			primarykeys: ['brand_id'],
			comment: 'Daftar Brand',
			data: {
				brand_id: {text:'ID', type: dbtype.varchar(14), null:false},
				brand_name: {text:'Brand Name', type: dbtype.varchar(60), null:false, uppercase: true},
				brand_nameshort: {text:'Short Name', type: dbtype.varchar(10), null:false, uppercase: true},
				brand_descr: {text:'Descr', type: dbtype.varchar(90), null:true, suppresslist: true},
				brand_isdisabled: {text:'Disabled', type: dbtype.boolean, null:false, default:'0'},
				brand_grouping01: {text:'Grouping 01', type: dbtype.varchar(60), null:true, uppercase: true, suppresslist: true},
				brand_grouping02: {text:'Grouping 02', type: dbtype.varchar(60), null:true, uppercase: true, suppresslist: true},	
				brandtype_id: {
					text:'Type', type: dbtype.varchar(10), null:false, uppercase: true, 
					options:{required:true,invalidMessage:'Type harus diisi'},
					comp: comp.Combo({
						table: 'mst_brandtype', 
						field_value: 'brandtype_id', field_display: 'brandtype_name', 
						api: 'ent/affiliation/brandtype/list'})					
				
				},
				
				unit_id: {
					suppresslist: true,
					text:'Unit', type: dbtype.varchar(10), null:true, uppercase: true, 
					options:{required:false},
					comp: comp.Combo({
						table: 'mst_unit', 
						field_value: 'unit_id', field_display: 'unit_name', 
						api: 'ent/organisation/unit/list'})					
				
				},
				
				partner_id: {
					suppresslist: true,
					options:{prompt:'NONE'},
					text:'Partner', type: dbtype.varchar(30), null:true, 
					comp: comp.Combo({
						table: 'mst_partner', 
						field_value: 'partner_id', field_display: 'partner_name', 
						api: 'ent/affiliation/partner/list'
					})
				},	
						
			},

			defaultsearch : ['brand_id', 'brand_name'],

			uniques: {
				'brand_name' : ['brand_name'],
				'brand_nameshort' : ['brand_nameshort'],
			}
		},

		'mst_brandpartner' : {
			primarykeys: ['brandpartner_id'],
			comment: 'Daftar Partner Brand',
			data: {
				brandpartner_id: {text:'ID', type: dbtype.varchar(14), null:false, uppercase: true, suppresslist: true},
				partner_id: {
					text:'Partner', type: dbtype.varchar(14), null:false, uppercase: true,
					options:{required:true,invalidMessage:'Partner harus diisi'},
					comp: comp.Combo({
						table: 'mst_partner', 
						field_value: 'partner_id', field_display: 'partner_name', 
						api: 'ent/mst/partner/list'})
			
				},
				brand_id: {text:'Brand', type: dbtype.varchar(14), null:false, hidden: true},				
			},

			uniques: {
				'brandpartner_name' : ['brand_id', 'partner_id']
			}
		},


		'mst_brandref' : {
			comment: 'Kode referensi brand untuk keperluan interfacing dengan system lain',
			primarykeys: ['brandref_id'],		
			data: {
				brandref_id: {text:'ID', type: dbtype.varchar(14), null:false, suppresslist: true},
				interface_id: { 
					text: 'Interface', type: dbtype.varchar(7), uppercase: true, null: false, 
					options: { required: true, invalidMessage: 'Interface harus diisi' }, 
					comp: comp.Combo({
						table: 'mst_interface', 
						field_value: 'interface_id', field_display: 'interface_name', field_display_name: 'interface_name', 
						api: 'ent/general/interface/list'})				
				
				},
				brandref_name: {text:'Name', type: dbtype.varchar(30), null:false},		
				brandref_code: {text:'Code', type: dbtype.varchar(255), null:false},		
				
				dept_id: { 
					text: 'Dept', type: dbtype.varchar(30), null: true,  suppresslist: true,
					options: { },
					comp: comp.Combo({
						table: 'mst_dept',
						field_value: 'dept_id', field_display: 'dept_name',
						api: 'ent/organisation/dept/list'
					})
				},
				
				unit_id: { 
					text: 'Unit', type: dbtype.varchar(10), null: true,  suppresslist: true,
					options: { },
					comp: comp.Combo({
						table: 'mst_unit',
						field_value: 'unit_id', field_display: 'unit_name',
						api: 'ent/organisation/unit/list'
					})
				},

				brand_id: {text:'Partner', type: dbtype.varchar(14), null:false, hidden: true},
			},
			uniques: {
				'brandref_pair': ['brand_id', 'interface_id', 'brandref_name']
			},			
		}

	},

	schema: {
		title: 'Brand',
		header: 'mst_brand',
		detils: {
			'partner' : {title: 'Other Partners', table:'mst_brandpartner', form: true, headerview:'brand_name'},
			'ref' : {title: 'Referensi', table:'mst_brandref', form: true, headerview:'brand_name', editorHandler: true, listHandler: true},
		}
	}
}



