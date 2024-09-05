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
				unit_id: {text:'ID', type: dbtype.varchar(10), null:false, uppercase: true, options:{required:true,invalidMessage:'Unit ID harus diisi'}},

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

				unit_name: {text:'Unit Name', type: dbtype.varchar(60), null:false, uppercase: true, options:{required:true,invalidMessage:'Nama Unit harus diisi'}},
				unit_descr: {text:'Descr', type: dbtype.varchar(90), null:true, suppresslist: true},

				// dept_id: {
				// 	text:'Dept', type: dbtype.varchar(30), null:true, suppresslist: true,
				// 	options:{required:false, prompt:'NONE'},
				// 	// options:{required:true,invalidMessage:'Department harus diisi', prompt:'-- PILIH --'},
				// 	comp: comp.Combo({
				// 		table: 'mst_dept', 
				// 		field_value: 'dept_id', field_display: 'dept_name', 
				// 		api: 'ent/organisation/dept/list',
				// 		onDataLoadingHandler: true,
				// 		onDataLoadedHandler: false,
				// 		onSelectingHandler: false,
				// 		onSelectedHandler: false
				// 	})					
				// },

				unit_isdisabled: {text:'Disabled', type: dbtype.boolean, null:false, default:'0'}
			},


			uniques: {
				'unit_name' : ['unit_name']
			},
			
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
				unitref_otherdata: {
					text:'Data', type: dbtype.varchar(1000), null:true, suppresslist:true,
					tips: 'pisahkan code dan nilai dengan semicolon (;) <b>contoh:</b> code1:nilai1; code2:nilai2; code3:nilai3',
					tipstype: 'visible'
				},	
				unitref_notes: {text:'Notes', type: dbtype.varchar(255), null:true, suppresslist:true},		
				unit_id: {text:'Unit', type: dbtype.varchar(10), null:false, hidden: true},
			},
			uniques: {
				'unitref_pair': ['interface_id', 'unitref_name', 'unitref_code']
			},			
		},

	},

	schema: {
		title: 'Unit',
		header: 'mst_unit',
		detils: {
			'ref': {
				title: 'Reference', table: 'mst_unitref', form: true, headerview: 'unit_name', 
				editorHandler: true,
				listHandler: true
			},
		}
	}
}



