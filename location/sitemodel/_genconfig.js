'use strict'

const dbtype = global.dbtype;
const comp = global.comp;

module.exports = {
	title: "Site Model",
	icon : "icon-sitemodel-white.png",
	autoid: false,

	persistent: {
		'mst_sitemodel' : {
			primarykeys: ['sitemodel_id'],
			comment: 'Master Site Model',
			data: {
				sitemodel_id: {text:'ID', type: dbtype.varchar(10), null:false, uppercase: true, options:{required:true,invalidMessage:'ID harus diisi'}},
				sitemodel_name: {text:'Site Model Name', type: dbtype.varchar(60), null:false, uppercase: true, options:{required:true,invalidMessage:'Nama Model Site harus diisi'}},
				sitemodel_descr: {text:'Descr', type: dbtype.varchar(90), null:true, suppresslist: true}
			},

			defaultsearch : ['sitemodel_id', 'sitemodel_name'],

			uniques: {
				'sitemodel_name' : ['sitemodel_name']
			}
		}
	},

	schema: {
		title: 'Site Model',
		header: 'mst_sitemodel',
		detils: {}
	}
}

