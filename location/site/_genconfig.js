'use strict'

const dbtype = global.dbtype;
const comp = global.comp;

module.exports = {
	title: "Site",
	icon: "icon-site-white.png",
	autoid: false,

	creatorname: "Agung Nugroho",
	creatoremail: "agung.dhewe@gmail.com", 
	description: `
		program untuk entry site
	`,

	variance: {
		"view" : { title:"Site (View)", data: {}},
	},

	/*
	fgtalibs: {
		grid: 'fgta4grid-v1.1.mjs',
		form: 'fgta4form-v1.1.mjs',
		pages: 'fgta4pages-v1.1.mjs',
		pageslider: 'fgta4pageslider-v1.1.mjs',
		slideselect: 'fgta4slideselect-v1.1.mjs',
	},
	*/

	jsonOverwrite: true,
	
	persistent: {
		'mst_site' : {
			primarykeys: ['site_id'],
			comment: 'Daftar Site',
			data: {
				site_id: {text:'ID', type: dbtype.varchar(30), null:false, uppercase: true, options:{required:true,invalidMessage:'ID harus diisi'}},
				site_nameshort: {text:'Short Name', type: dbtype.varchar(90), null:false, uppercase: true, suppresslist: true, options:{required:true,invalidMessage:'Short Name harus diisi'}},
				site_code: {text:'Site Code', type: dbtype.varchar(3), null:true, suppresslist: true},
				site_name: {text:'Site Name', type: dbtype.varchar(90), null:false, uppercase: true, options:{required:true,invalidMessage:'Nama Site harus diisi'}},
				site_descr: {text:'Descr', type: dbtype.varchar(250), null:true, suppresslist: true},
				site_address: {text:'Address', type: dbtype.varchar(250), null:true, suppresslist: true, options:{required:true,invalidMessage:'Alamat harus diisi'}},
				site_phone: {text:'Phone', type: dbtype.varchar(30), null:true, uppercase: true, suppresslist: true},	
				site_email: {text:'Email', type: dbtype.varchar(150), null:true, lowercase: true, suppresslist: true, options:{validType:'email',invalidMessage:'Email harus salah'}},				
				site_sqmwide: {text:'Wide (sqm)', type: dbtype.decimal(12,2), null:false, uppercase: true, suppresslist: true, default:'0'},				
				site_isdisabled: {text:'Disabled', type: dbtype.boolean, null:false, suppresslist: false, default:'0'},
				site_geoloc: {text:'Geo Location', type: dbtype.varchar(30), null:true, suppresslist: true, default:"''"},
				site_opendate: {text:'Date', type: dbtype.date, null:true, suppresslist: true},
				sitemodel_id: {
					suppresslist: true,
					options:{required:true,invalidMessage:'Sitemodel harus diisi', prompt:'-- PILIH --'},
					text:'Site Model', type: dbtype.varchar(10), null:false, 
					comp: comp.Combo({
						title: 'Pilih Model Site',
						table: 'mst_sitemodel', 
						field_value: 'sitemodel_id', field_display: 'sitemodel_name', 
						api: 'ent/location/sitemodel/list'})
				},

				land_id: {
					suppresslist: true,
					options:{required:true,invalidMessage:'Land harus diisi', prompt:'-- PILIH --'},
					text:'Land', type: dbtype.varchar(30), null:false, 
					comp: comp.Combo({
						title: 'Pilih Land',
						table: 'mst_land', 
						field_value: 'land_id', field_display: 'land_name', 
						api: 'ent/location/land/list'
					})
				},

				unit_id: {
					suppresslist: true,
					options:{required:true,invalidMessage:'Unit harus diisi', prompt:'-- PILIH --'},
					text:'Unit', type: dbtype.varchar(10), null:false, 
					comp: comp.Combo({
						title: 'Pilih unit owner',
						table: 'mst_unit', 
						field_value: 'unit_id', field_display: 'unit_name', 
						api: 'ent/organisation/unit/list'
					})
				},

				dept_id: {
					suppresslist: true,
					options:{required:true,invalidMessage:'Departemen harus diisi', prompt:'-- PILIH --'},
					text:'Dept', type: dbtype.varchar(30), null:false, 
					comp: comp.Combo({
						title: 'Pilih departement owner',
						table: 'mst_dept', 
						field_value: 'dept_id', field_display: 'dept_name', 
						api: 'ent/organisation/dept/list'
					})
				}

			},

			defaultsearch : ['site_id', 'site_name'],
			uniques: {
				'site_name' : ['site_name'],
				'site_nameshort' : ['site_nameshort'],
				'site_code' : ['site_code']
			}			
		},


		'mst_siteunit' : {
			primarykeys: ['siteunit_id'],
			comment: 'Daftar unit yang dimiliki site',
			data: {			
				siteunit_id: {text:'ID', type: dbtype.varchar(14), null:false, uppercase: true, suppresslist: true},
				unit_id: {
					suppresslist: false,
					options:{required:true,invalidMessage:'Unit harus diisi', prompt:'-- PILIH --'},
					text:'Unit', type: dbtype.varchar(10), null:false, 
					comp: comp.Combo({
						table: 'mst_unit', 
						field_value: 'unit_id', field_display: 'unit_name', 
						api: 'ent/organisation/unit/list'
					})
				},			
				site_id: {text:'Site', type: dbtype.varchar(14), null:false, hidden: true},
			},

			uniques: {
				'siteunit_pair': ['site_id', 'unit_id']
			}	

		},

		'mst_siteevent' : {
			primarykeys: ['siteevent_id'],
			comment: 'Daftar Site Event',
			data: {
				siteevent_id: {text:'ID', type: dbtype.varchar(14), null:false, suppresslist: true},
				siteevent_name: {text:'Event Name', type: dbtype.varchar(60), null:false, suppresslist: false, uppercase: true, options:{required:true,invalidMessage:'Event Name harus diisi'}},
				siteevent_date: {text:'Date', type: dbtype.date, null:false, suppresslist: false},
				siteevent_enabling: {text:'Enabling', type: dbtype.boolean, null:false, suppresslist: true, default:'0'},
				siteevent_disabling: {text:'Disabling', type: dbtype.boolean, null:false, suppresslist: true, default:'0'},
				site_id: {text:'Site', type: dbtype.varchar(14), null:false, hidden: true},
			},
			defaultsearch : ['siteevent_name']
		},

		'mst_siteref' : {
			comment: 'Kode referensi site untuk keperluan interfacing dengan system lain',
			primarykeys: ['siteref_id'],		
			data: {
				siteref_id: {text:'ID', type: dbtype.varchar(14), null:false, suppresslist: true},
				interface_id: { 
					text: 'Interface', type: dbtype.varchar(7), null: false, 
					options: { required: true, invalidMessage: 'Interface harus diisi' }, 
					comp: comp.Combo({
						table: 'mst_interface', 
						field_value: 'interface_id', field_display: 'interface_name', field_display_name: 'interface_name', 
						api: 'ent/general/interface/list'})				
				
				},
				siteref_name: {text:'Name', type: dbtype.varchar(30), null:false},		
				siteref_code: {text:'Code', type: dbtype.varchar(255), null:true},	
				siteref_otherdata: {
					text:'Data', type: dbtype.varchar(1000), null:true, suppresslist:true,
					tips: 'pisahkan code dan nilai dengan semicolon (;) <b>contoh:</b> code1:nilai1; code2:nilai2; code3:nilai3',
					tipstype: 'visible'				
				},	
				siteref_notes: {text:'Notes', type: dbtype.varchar(255), null:true},			
				site_id: {text:'Site', type: dbtype.varchar(14), null:false, hidden: true},
			},
			uniques: {
				'siteref_pair': ['interface_id', 'siteref_name', 'siteref_code']
			},			
		}		


	},

	schema: {
		title: 'Site',
		header: 'mst_site',
		detils: {
			'unit' : {title: 'Unit', table:'mst_siteunit', form: true, headerview:'site_name', editorHandler: true, listHandler: true},
			'event' : {title: 'Event', table:'mst_siteevent', form: true, headerview:'site_name', editorHandler: true, listHandler: true},
			'ref' : {title: 'Referensi', table:'mst_siteref', form: true, headerview:'site_name', editorHandler: true, listHandler: true},
		}
	}
}

