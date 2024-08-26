'use strict'

const dbtype = global.dbtype;
const comp = global.comp;

module.exports = {
	title: "HR Relation",
	autoid: false,

	persistent: {
		'mst_familyrelation' : {
			primarykeys: ['familyrelation_id'],
			comment: 'Family relation',
			data: {
				familyrelation_id: {text:'ID', type: dbtype.varchar(3), null:false, uppercase: true},
				familyrelation_name: {text:'Relation Name', type: dbtype.varchar(60), null:false, uppercase: true, options:{required:true,invalidMessage:'Nama Relasi harus diisi'}},
			},

			defaultsearch : ['familyrelation_id', 'familyrelation_name'],

			uniques: {
				'familyrelation_name' : ['familyrelation_name']
			},

			values: [
				{familyrelation_id:'S', familyrelation_name:'SUAMI'},
				{familyrelation_id:'I', familyrelation_name:'ISTRI'},
				{familyrelation_id:'A', familyrelation_name:'ANAK'},
			],			
		}
	},

	schema: {
		title: 'Family Relation',
		header: 'mst_familyrelation',
		detils: {}
	}
}

