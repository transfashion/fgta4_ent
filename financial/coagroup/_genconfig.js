'use strict'

const dbtype = global.dbtype;
const comp = global.comp;

module.exports = {
	title: "COA Group",
	autoid: false,

	persistent: {
		'mst_coagroup': {
		comment: 'Daftar Grouping COA',
		primarykeys: ['coagroup_id'],
		data: {
			coagroup_id: { text: 'ID', type: dbtype.varchar(17), uppercase: true, null: false, options: { required: true, invalidMessage: 'ID harus diisi' } },
			coagroup_name: { text: 'Group COA', type: dbtype.varchar(90), uppercase: true, options: { required: true, invalidMessage: 'Nama Group COA harus diisi' } },
			coagroup_descr: { text: 'Descr', type: dbtype.varchar(255), suppresslist: true },
			coagroup_isparent: { text: 'Parent Dept', type: dbtype.boolean, null: false, default: '0', suppresslist: true },
			coagroup_isdisabled: { text: 'Disabled', type: dbtype.boolean, null: false, default: '0', suppresslist: true },
			coagroup_parent: {
				text: 'Parent', type: dbtype.varchar(17), null: true, suppresslist: true,
				options: { prompt: '-- PILIH --' },
				comp: comp.Combo({
					table: 'mst_coagroup',
					field_value: 'coagroup_id',
					field_display: 'coagroup_name',
					field_display_name: 'coagroup_parent_name',
					api: 'ent/financial/coagroup/list',
					onDataLoadingHandler: true,
					onDataLoadedHandler: false,
					onSelectingHandler: false,
					onSelectedHandler: true

				})
			},

			coamodel_id: {
				text: 'Model', type: dbtype.varchar(10), null: false,  suppresslist: true,
				options: { required: true, invalidMessage: 'Model harus diisi' },
				comp: comp.Combo({
					table: 'mst_coamodel',
					field_value: 'coamodel_id',
					field_display: 'coamodel_name',
					api: 'ent/financial/coamodel/list'
				})
			},

			coareport_id: {
				text: 'Report', type: dbtype.varchar(2), null: false, suppresslist: true,
				options: { required: true, invalidMessage: 'Report harus diisi' },
				comp: comp.Combo({
					table: 'mst_coareport',
					field_value: 'coareport_id',
					field_display: 'coareport_name',
					api: 'ent/financial/coareport/list'
				})
			},	

			coagroup_path: { text: 'Path', type: dbtype.varchar(340), null: false, uppercase: true, suppresslist: true, options: { disabled: true } },
			coagroup_pathid: { text: 'PathId', type: dbtype.varchar(17), null: false, uppercase: true, suppresslist: true, options: { disabled: true } },
			coagroup_level: { text: 'Level', type: dbtype.int(2), null: false, default: '0', suppresslist: true, options: { disabled: true } },
			coagroup_isexselect: { text: 'Exclude from Select', type: dbtype.boolean, null: false, default: '0', suppresslist: true, options: { labelWidth: '300px'} }
		},
		uniques: {
			'coagroup_name': ['coagroup_name'],
			'coagroup_path': ['coagroup_path', 'coagroup_pathid']
		},
		defaultsearch: ['coagroup_id', 'coagroup_name']
		}
	},

	schema: {
		title: 'COA Group',
		header: 'mst_coagroup',
		detils: {
		}
	}
}

