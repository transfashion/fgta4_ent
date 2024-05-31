'use strict'

const dbtype = global.dbtype;
const comp = global.comp;

module.exports = {
	title: "Curr Source",
	autoid: false,

	persistent: {
		'mst_currsource' : {
			primarykeys: ['currsource_id'],
			comment: 'Sumber rate mata uang',
			data: {
				currsource_id: {text:'ID', type: dbtype.varchar(2), null:false, uppercase: true, options:{required:true,invalidMessage:'ID harus diisi'}},
				currsource_name: {text:'Name', type: dbtype.varchar(30), null:false, uppercase: true, options:{required:true,invalidMessage:'Nama harus diisi'}},
			},

			defaultsearch : ['currsource_id', 'currsource_name'],

			uniques: {
				'currsource_name' : ['currsource_name']
			},

			values: [
				{currsource_id:'BC', currsource_name:'BEA CUKAI'},
				{currsource_id:'BI', currsource_name:'BANK INDONESIA'},
				{currsource_id:'SR', currsource_name:'CORPORATE STANDARD'},
			],			
		}
	},

	schema: {
		title: 'Rate Source',
		header: 'mst_currsource',
		detils: {}
	}
}

