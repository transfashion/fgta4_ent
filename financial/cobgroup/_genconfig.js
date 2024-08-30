'use strict'

const dbtype = global.dbtype;
const comp = global.comp;

module.exports = {
	title: "Budget Account Group",
	autoid: false,

	persistent: {
		'mst_cobgroup': {
		comment: 'Daftar Grouping Budget Account',
		primarykeys: ['cobgroup_id'],
		data: {
			cobgroup_id: { text: 'ID', type: dbtype.varchar(17), uppercase: true, null: false, options: { required: true, invalidMessage: 'ID harus diisi' } },
			cobgroup_name: { text: 'Group Budget', type: dbtype.varchar(90), uppercase: true, options: { required: true, invalidMessage: 'Nama Group COA harus diisi' } },
			cobgroup_descr: { text: 'Descr', type: dbtype.varchar(255), suppresslist: true },
			cobgroup_isparent: { text: 'Group Is Parent', type: dbtype.boolean, null: false, default: '0', suppresslist: true, options:{labelWidth:'200px'} },
			cobgroup_isdisabled: { text: 'Disabled', type: dbtype.boolean, null: false, default: '0', suppresslist: true },
			cobgroup_parent: {
				text: 'Parent', type: dbtype.varchar(17), null: true, suppresslist: true,
				options: { prompt: '-- PILIH --' },
				comp: comp.Combo({
					table: 'mst_cobgroup',
					field_value: 'cobgroup_id',
					field_display: 'cobgroup_name',
					field_display_name: 'cobgroup_parent_name',
					api: 'ent/financial/cobgroup/list',
					onDataLoadingHandler: true,
					onDataLoadedHandler: false,
					onSelectingHandler: false,
					onSelectedHandler: true

				})
			},
			cobgroup_path: { text: 'Path', type: dbtype.varchar(340), null: false, uppercase: true, suppresslist: true, options: { disabled: true } },
			cobgroup_pathid: { text: 'PathId', type: dbtype.varchar(17), null: false, uppercase: true, suppresslist: true, options: { disabled: true } },
			cobgroup_level: { text: 'Level', type: dbtype.int(2), null: false, default: '0', suppresslist: true, options: { disabled: true } },
		},
		uniques: {
			'cobgroup_name': ['cobgroup_name'],
			'cobgroup_path': ['cobgroup_path', 'cobgroup_pathid']
		},
		defaultsearch: ['cobgroup_id', 'cobgroup_name']
		}
	},

	schema: {
		title: 'Budget Group',
		header: 'mst_cobgroup',
		detils: {
		}
	}
}

