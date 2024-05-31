'use strict'

const dbtype = global.dbtype;
const comp = global.comp;

module.exports = {
	title: "Selector",
	autoid: false,

	persistent: {
		'mst_selector' : {
			primarykeys: ['selector_id'],
			comment: 'Selector',
			data: {
				selector_id: {text:'ID', type: dbtype.varchar(5), null:false, options:{required:true,invalidMessage:'ID harus diisi'}},
				selector_text: {text:'Text', type: dbtype.varchar(30), null:false, uppercase: true, options:{required:true,invalidMessage:'Nama Row Type harus diisi'}},
				selector_data: {text:'Data', type: dbtype.varchar(1225), null:false},
			},
			defaultsearch : ['selector_id', 'selector_text'],

		}

	},
	schema: {
		title: 'Selector',
		header: 'mst_selector',
		detils: {}
	}
}



