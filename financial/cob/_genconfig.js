'use strict'

const dbtype = global.dbtype;
const comp = global.comp;

module.exports = {
	title: "Budget Account",
	autoid: false,

	persistent: {
		'mst_cob': {
			comment: 'Daftar Chart Of Budget',
			primarykeys: ['cob_id'],
			data: {
				cob_id: { text: 'ID', type: dbtype.varchar(17), uppercase: false, null: false, options: { required: true, invalidMessage: 'ID harus diisi' } },

				cobgroup_id: {
					text: 'Group', type: dbtype.varchar(17), null: false, uppercase: false, suppresslist: true,
					options: { required: true, invalidMessage: 'Group Budget harus diisi' },
					comp: comp.Combo({
						table: 'mst_cobgroup',
						field_value: 'cobgroup_id',
						field_display: 'cobgroup_name',
						api: 'ent/financial/cobgroup/list',
						onDataLoadingHandler: true,
						onDataLoadedHandler: false,
						onSelectingHandler: false,
						onSelectedHandler: true
					})
				},

				cob_name: { text: 'Nama Budget', type: dbtype.varchar(255), uppercase: false, options: { required: true, invalidMessage: 'Nama COA harus diisi' } },
				cob_nameshort: { text: 'Nama Pendek', type: dbtype.varchar(255), uppercase: false, options: { required: true, invalidMessage: 'Nama Pendek harus diisi' } },
				cob_descr: { text: 'Descr', type: dbtype.varchar(255), suppresslist: true },
				cob_isdisabled: { text: 'Disabled', type: dbtype.boolean, null: false, default: '0' },
			},

			defaultsearch: ['cob_id', 'cob_name'],
		
			uniques: {
				'cob_name': ['cob_name']
			}
		}	
	},

	schema: {
		title:"Chart Of Budget",
		header: 'mst_cob',
		detils: {
		}
	}
}