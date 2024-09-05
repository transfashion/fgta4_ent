'use strict'

const dbtype = global.dbtype;
const comp = global.comp;

// onDataLoadingHandler: true,
// onDataLoadedHandler: true,
// onSelectingHandler: true,
// onSelectedHandler: true


module.exports = {
	title: "Partner",
	autoid: true,

	persistent: {
		'mst_partner' : {
			primarykeys: ['partner_id'],
			comment: 'Daftar Partner (rekanan)',
			data: {
				partner_id: {text:'ID', type: dbtype.varchar(14), null:false},

				partnertype_id: {
					text:'Type', type: dbtype.varchar(10), null:false, 
					options:{required:true,invalidMessage:'Type harus diisi'},
					comp: comp.Combo({
						table: 'mst_partnertype', 
						field_value: 'partnertype_id', field_display: 'partnertype_name', 
						api: 'ent/affiliation/partnertype/list',
						// onDataLoadingHandler: true,
						// onDataLoadedHandler: true,
						// onSelectingHandler: true,
						onSelectedHandler: true
					})					
				},	

				partnertype_isempl: {
					class: 'employee',
					text:'Link To Employee', type: dbtype.boolean, null:false, default:'0', suppresslist: true, options: {disabled: true, labelWidth: '300px'}},	

				empl_id: {
					class: 'employee',
					text:'Employee Name', type: dbtype.varchar(14), null:true, suppresslist: true,
					options:{prompt:'NONE'},
					comp: comp.Combo({
						table: 'mst_empl', 
						field_value: 'empl_id', field_display: 'empl_name', 
						api: 'ent/organisation/empl/list',
						onDataLoadingHandler: true,
						// onDataLoadedHandler: true,
						// onSelectingHandler: true,
						onSelectedHandler: true
					})
				},

				partner_name: {
					id: 'pnl_edit-partner_name',
					uppercase: true,
					text:'Name', type: dbtype.varchar(60), null:false, options:{required:true,invalidMessage:'Name harus diisi'}},

				partner_addressline1: {
					id: "pnl_edit-partner_addressline1",
					text:'Address', type: dbtype.varchar(100), null:false, suppresslist: true,  options:{required:true,invalidMessage:'Alamat harus diisi'}},
				partner_addressline2: {
					id: "pnl_edit-partner_addressline2",
					text:'&nbsp;', type: dbtype.varchar(100), null:false, suppresslist: true},
				partner_addressline3: {
					id: "pnl_edit-partner_addressline3",
					text:'&nbsp;', type: dbtype.varchar(100), null:false, suppresslist: true},
				
				
				partner_city: {text:'City', type: dbtype.varchar(30), null:false, uppercase: true, suppresslist: true, options:{required:true,invalidMessage:'City harus diisi'}},
				partner_postcode: {text:'Post Code', type: dbtype.varchar(10), null:false, suppresslist: true},

				partner_country: {
					text:'Country', type: dbtype.varchar(10), null:false, uppercase: true, suppresslist: true,
					options:{required:true,invalidMessage:'Country harus diisi'},
					comp: comp.Combo({
						table: 'mst_country', 
						field_value: 'country_id', field_display: 'country_name', field_display_name:'country_name',
						api: 'ent/location/country/list'})					
				},

				partner_phone: {text:'Phone', type: dbtype.varchar(30), null:false,  suppresslist: true, options:{required:true,invalidMessage:'Phone harus diisi'},},	
				partner_mobilephone: {text:'HP', type: dbtype.varchar(30), null:false,  suppresslist: true},
				partner_email: {text:'Email', type: dbtype.varchar(150), null:false, lowercase: true, suppresslist: true},				
				partner_npwp: {text:'NPWP', type: dbtype.varchar(30), null:false,  suppresslist: true},
				partner_isnonnpwp: {text:'Non NPWP', type: dbtype.boolean, null:false, default:'0', suppresslist: true},
				partner_isgroup: {text:'Group Partner', type: dbtype.boolean, null:false, default:'0', suppresslist: true},
				partner_isdisabled: {text:'Disabled', type: dbtype.boolean, null:false, default:'0'},

			},

			defaultsearch : ['partner_id', 'partner_name'],

			uniques: {
				'partner_name' : ['partner_name']
			}
		},


		'mst_partnerastype' : {
			primarykeys: ['partnerastype_id'],
			comment: 'Daftar Type lain yang dimiliki partner',
			data: {
				partnerastype_id: {text:'ID', type: dbtype.varchar(14), null:false},
				partnertype_id: {
					text:'Type', type: dbtype.varchar(10), null:false, 
					options:{required:true,invalidMessage:'Type harus diisi'},
					comp: comp.Combo({
						table: 'mst_partnertype', 
						field_value: 'partnertype_id', field_display: 'partnertype_name', 
						api: 'ent/affiliation/partnertype/list'})					
				
				},
				partner_id: {text:'Partner', type: dbtype.varchar(14), null:false},
			},
			uniques: {
				'partnerastype_pair' : ['partner_id', 'partnertype_id']
			}			
		},		


		'mst_partnerbank' : {
			primarykeys: ['partnerbank_id'],
			comment: 'Daftar Bank yang dimiliki suatu Partner (rekanan)',
			data: {
				partnerbank_id: {text:'ID', type: dbtype.varchar(14), null:false},
				partnerbank_accnum: {text:'Account Number', type: dbtype.varchar(30), null:false, uppercase: true},
				partnerbank_accname: {text:'Account Name', type: dbtype.varchar(90), null:false, uppercase: true},
				partnerbank_isdisabled: {text:'Disabled', type: dbtype.boolean, null:false, default:'0'},
				bank_id: {
					text:'Bank', type: dbtype.varchar(14), null:false, uppercase: true,
					options:{required:true,invalidMessage:'Bank harus diisi'},
					comp: comp.Combo({
						table: 'mst_bank', 
						field_value: 'bank_id', field_display: 'bank_name', 
						api: 'ent/financial/bank/list'})
			
				},
				partner_id: {text:'Partner', type: dbtype.varchar(14), null:false},
			},
			uniques: {
				'partnerbank_accnum' : ['bank_id', 'partnerbank_accnum']
			}			
		},

		'mst_partnercontact' : {
			primarykeys: ['partnercontact_id'],
			comment: 'Daftar kontak yang dimiliki suatu Partner (rekanan)',
			data: {
				partnercontact_id: {text:'ID', type: dbtype.varchar(14), null:false},
				partnercontact_name: {text:'Name', type: dbtype.varchar(100), null:false, uppercase: true, options:{required:true,invalidMessage:'Name harus diisi'}},
				partnercontact_position: {text:'Position', type: dbtype.varchar(30), null:false, uppercase: true, options:{required:true,invalidMessage:'Position harus diisi'}},
				partnercontact_mobilephone: {text:'HP', type: dbtype.varchar(30), null:false, uppercase: true, options:{required:true,invalidMessage:'HP harus diisi'}},
				partnercontact_email: {text:'Email', type: dbtype.varchar(150), null:false, lowercase: true, options:{required:true,validType: ['email'],invalidMessage:'Email harus diisi'}},
				partnecontact_isdisabled: {text:'Disabled', type: dbtype.boolean, null:false, default:'0', options:{labelWidth:'300px'}},
				partnecontact_iscontract: {text:'PIC - Contract', type: dbtype.boolean, null:false, default:'0', options:{labelWidth:'300px'}},
				partnecontact_isinvoice: {text:'PIC - Invoice', type: dbtype.boolean, null:false, default:'0', options:{labelWidth:'300px'}},
				partner_id: {text:'Partner', type: dbtype.varchar(14), null:false},
			},
			uniques: {
				'partnercontact_mobilephone' : ['partner_id', 'partnercontact_mobilephone']
			}			
		},



		'mst_partnerref' : {
			comment: 'Kode referensi partner untuk keperluan interfacing dengan system lain',
			primarykeys: ['partnerref_id'],		
			data: {
				partnerref_id: {text:'ID', type: dbtype.varchar(14), null:false, suppresslist: true},
				interface_id: { 
					text: 'Interface', type: dbtype.varchar(7), uppercase: true, null: false, 
					options: { required: true, invalidMessage: 'Interface harus diisi' }, 
					comp: comp.Combo({
						table: 'mst_interface', 
						field_value: 'interface_id', field_display: 'interface_name', field_display_name: 'interface_name', 
						api: 'ent/general/interface/list'
					})				
				
				},
				partnerref_name: {text:'Name', type: dbtype.varchar(30), null:false},	
				partnerref_code: {text:'Code', type: dbtype.varchar(30), null:false, uppercase: true},	
				partnerref_otherdata: {text:'Data', type: dbtype.varchar(1000), null:true, suppresslist:true},	
				partnerref_notes: {text:'Notes', type: dbtype.varchar(255), null:true, suppresslist:true},			
				partner_id: {text:'Partner', type: dbtype.varchar(14), null:false},
			},
			uniques: {
				'partnerref_pair': ['partner_id', 'interface_id', 'partnerref_name']
			},			
		}


	},

	schema: {
		title: 'Partner',
		header: 'mst_partner',
		detils: {
			'type' : {title: 'Type', table:'mst_partnerastype', form: true, headerview:'partner_name', editorHandler: true, listHandler: true},
			'bank' : {title: 'Bank', table:'mst_partnerbank', form: true, headerview:'partner_name', editorHandler: true, listHandler: true},
			'contact' : {title: 'Contact', table:'mst_partnercontact', form: true, headerview:'partner_name', editorHandler: true, listHandler: true},
			'ref': {title: 'Referensi', table: 'mst_partnerref', form: true, headerview: 'partner_name', editorHandler: true, listHandler: true },
		}
	}
}
