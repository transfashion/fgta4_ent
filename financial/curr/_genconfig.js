'use strict'

const dbtype = global.dbtype;
const comp = global.comp;

module.exports = {
	title: "Currency",
	autoid: false,

	persistent: {
		'mst_curr' : {
			primarykeys: ['curr_id'],
			comment: 'Master Currency',
			data: {
				curr_id: {text:'ID', type: dbtype.varchar(10), null:false, uppercase: true},
				curr_name: {text:'Currency', type: dbtype.varchar(60), null:false, uppercase: true},
				curr_descr: {text:'Descr', type: dbtype.varchar(90), null:false},
				curr_isdisabled: {text:'Disabled', type: dbtype.boolean, null:false, default:'0'},
			},

			defaultsearch : ['curr_id', 'curr_name'],

			uniques: {
				'curr_name' : ['curr_name']
			}			
		},


		'mst_currrate' : {
			primarykeys: ['currrate_id'],
			comment: 'Rate Currency historical',
			data: {
				currrate_id: {text:'ID', type: dbtype.varchar(14), null:false, suppresslist: true},
				currrate_date: {text:'Date', type: dbtype.date, null:false},
				currrate_value: {text:'Value', type: dbtype.decimal(6,0), null:false, default:'0'},
				curr_id: {text:'ID', type: dbtype.varchar(10), null:false, uppercase: true},
			},

			uniques: {
				'currrate_date' : ['curr_id', 'currrate_date']
			}			
		},

		'mst_currref' : {
			comment: 'Kode referensi currency untuk keperluan interfacing dengan system lain',
			primarykeys: ['currref_id'],		
			data: {
				currref_id: {text:'ID', type: dbtype.varchar(14), null:false, suppresslist: true},
				interface_id: { 
					text: 'Interface', type: dbtype.varchar(7), uppercase: true, null: false, 
					options: { required: true, invalidMessage: 'Interface harus diisi' }, 
					comp: comp.Combo({
						table: 'mst_interface', 
						field_value: 'interface_id', field_display: 'interface_name', field_display_name: 'interface_name', 
						api: 'ent/general/interface/list'})				
				
				},
				currref_name: {text:'Name', type: dbtype.varchar(30), null:false},	
				currref_code: {text:'Code', type: dbtype.varchar(30), null:false, uppercase: true},		
				currref_otherdata: {text:'Data', type: dbtype.varchar(1000), null:true, suppresslist:true},	
				currref_notes: {text:'Notes', type: dbtype.varchar(255), null:true, suppresslist:true},		
				curr_id: {text:'Unit', type: dbtype.varchar(10), null:false, hidden: true},
			},
			uniques: {
				'currref_pair': ['curr_id', 'interface_id', 'currref_name']
			},			
		},
	},

	schema: {
		title: 'Currency',
		header: 'mst_curr',
		detils: {
			'rate' : {title: 'Currency Rate', table:'mst_currrate', form: true, headerview:'curr_name',
				editorHandler: true,
				listHandler: true
			},  
			'ref': {
				title: 'Reference', table: 'mst_currref', form: true, headerview: 'curr_name', 
				editorHandler: true,
				listHandler: true
			},
		}
	}
}



