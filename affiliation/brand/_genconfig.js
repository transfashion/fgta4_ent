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
						
			},

			defaultsearch : ['brand_id', 'brand_name'],

			uniques: {
				'brand_name' : ['brand_name'],
				'brand_nameshort' : ['brand_nameshort'],
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
				brandref_otherdata: {
					text:'Data', type: dbtype.varchar(1000), null:true, suppresslist:true,
					tips: 'pisahkan code dan nilai dengan semicolon (;) <b>contoh:</b> code1:nilai1; code2:nilai2; code3:nilai3',
					tipstype: 'visible'
				},	
				brandref_notes: {text:'Notes', type: dbtype.varchar(255), null:true, suppresslist:true},			
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
			// 'partner' : {title: 'Other Partners', table:'mst_brandpartner', form: true, headerview:'brand_name'},
			'ref' : {title: 'Referensi', table:'mst_brandref', form: true, headerview:'brand_name', editorHandler: true, listHandler: true},
		}
	}
}



