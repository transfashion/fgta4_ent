'use strict'

const dbtype = global.dbtype;
const comp = global.comp;

module.exports = {
	title: "Propinsi",
	autoid: false,

	persistent: {
		'mst_prov' : {
			primarykeys: ['prov_id'],
			comment: 'Daftar Propinsi',
			data: {
				prov_id: {text:'ID', type: dbtype.varchar(30), null:false, uppercase: true, options:{required:true,invalidMessage:'ID harus diisi'}},
				prov_name: {text:'Propinsi Name', type: dbtype.varchar(60), null:false, uppercase: true, options:{required:true,invalidMessage:'Nama Propinsi harus diisi'}},
				prov_capital: {text:'Capital City', type: dbtype.varchar(60), null:false, suppresslist: true},
				country_id: {
					suppresslist: true,
					options:{required:true,invalidMessage:'Country harus diisi', prompt:'-- PILIH --'},
					text:'Country', type: dbtype.varchar(30), null:false, 
					comp: comp.Combo({
						table: 'mst_country', 
						field_value: 'country_id', field_display: 'country_name', 
						api: 'ent/location/country/list'})
				},
			},

			defaultsearch : ['prov_id', 'prov_name'],

			uniques: {
				'prov_name' : ['prov_name']
			}
		}
	},

	schema: {
		title: 'Propinsi',
		header: 'mst_prov',
		detils: {}
	}
}

