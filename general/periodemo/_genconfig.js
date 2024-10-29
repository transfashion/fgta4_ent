'use strict'

const dbtype = global.dbtype;
const comp = global.comp;

module.exports = {
	title: "Periode Bulanan",
	autoid: true,

	persistent: {
		'mst_periodemo': {
			comment: 'Daftar Periode Bulanan',
			primarykeys: ['periodemo_id'],
			data: {
				periodemo_id: { text: 'ID', type: dbtype.varchar(6), uppercase: true, null: false, options: { disabled: true } },
				periodemo_name: { text: 'Periode Name', type: dbtype.varchar(30), uppercase: true, null: false, options: { disabled: true } },
				periodemo_isclosed: { text: 'Closed', type: dbtype.boolean, null: false, default: '0', unset:true, options: { disabled: true } },
				periodemo_year: { text: 'Year', type: dbtype.int(4), null: false, suppresslist: true, options: { required: true, invalidMessage: 'Tahun harus diisi' } },
				periodemo_month: { text: 'Month', type: dbtype.int(2), null: false, suppresslist: true, options: { required: true, invalidMessage: 'Bulan harus diisi' } },
				periodemo_dtstart: { text: 'Start Date', type: dbtype.date, null: false, suppresslist: true, options: { disabled: true } },
				periodemo_dtend: { text: 'End Date', type: dbtype.date, null: false, suppresslist: true, options: { disabled: true } },
				periodemo_prev: {
					text: 'Previous', type: dbtype.varchar(6), null: false, uppercase: true, suppresslist: true,
					options: { required: true, invalidMessage: 'Previous periode harus diisi' },
					comp: comp.Combo({
						table: 'mst_periodemo',
						field_value: 'periodemo_id', field_display: 'periodemo_name', field_display_name:'periodemo_prev_name', 
						api: 'ent/general/periodemo/list'
					})
				},
				periodemo_closeby: { text: 'Close By', type: dbtype.varchar(14), suppresslist: true, null: true, unset:true, lookup:'user', hidden:true, options: { disabled: true } },
				periodemo_closedate: { text: 'Close Date', type: dbtype.date, suppresslist: true, null: true, unset:true, hidden:true, options: { disabled: true } }
			},

			uniques: {
				'periodemo_prev': ['periodemo_prev']
			},

			defaultsearch: ['periodemo_id', 'periodemo_name']
		},

		'mst_periodemoref' : {
			comment: 'Kode referensi periodemo untuk keperluan interfacing dengan system lain',
			primarykeys: ['periodemoref_id'],		
			data: {
				periodemoref_id: {text:'ID', type: dbtype.varchar(14), null:false, suppresslist: true},
				interface_id: { 
					text: 'Interface', type: dbtype.varchar(7), uppercase: true, null: false, 
					options: { required: true, invalidMessage: 'Interface harus diisi' }, 
					comp: comp.Combo({
						table: 'mst_interface', 
						field_value: 'interface_id', field_display: 'interface_name', field_display_name: 'interface_name', 
						api: 'ent/general/interface/list'
					})				
				
				},
				periodemoref_name: {text:'Name', type: dbtype.varchar(30), null:false},	
				periodemoref_code: {text:'Code', type: dbtype.varchar(30), null:false, uppercase: true},	
				periodemoref_otherdata: {
					text:'Data', type: dbtype.varchar(1000), null:true, suppresslist:true,
					tips: 'pisahkan code dan nilai dengan semicolon (;) <b>contoh:</b> code1:nilai1; code2:nilai2; code3:nilai3',
					tipstype: 'visible'
				},	
				periodemoref_notes: {text:'Notes', type: dbtype.varchar(255), null:true, suppresslist:true},			
				periodemo_id: {text:'Periode', type: dbtype.varchar(6), null:false, hidden:true},
			},
			uniques: {
				'periodemoref_pair': ['interface_id', 'periodemoref_name', 'periodemoref_code']
			},			
		}		
	},

	schema: {
		header: 'mst_periodemo',
		detils: {
			'ref': {title: 'Referensi', table: 'mst_periodemoref', form: true, headerview: 'periodemo_name', editorHandler: true, listHandler: true },
		},
		xtions: {
			addnext: {
				buttonname: 'btn_addnext',
				buttontext: 'Add Next'
			},
			close: {
				buttonname: 'btn_close',
				buttontext: 'Close'
			},
			reopen: {
				buttonname: 'btn_reopen',
				buttontext: 'Reopen'
			}
		},
	}
}