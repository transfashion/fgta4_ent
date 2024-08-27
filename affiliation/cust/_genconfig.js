'use strict'

const dbtype = global.dbtype;
const comp = global.comp;

module.exports = {
	title: "Customer",
	autoid: true,

	persistent: {
		'mst_cust' : {
			primarykeys: ['cust_id'],
			comment: 'Daftar Customer',
			data: {
				cust_id: {text:'ID', type: dbtype.varchar(14), null:false},
				cust_name: {text:'Name', type: dbtype.varchar(60), null:false, options:{required:true,invalidMessage:'Name harus diisi'}},
				cust_phone: {text:'Phone Number', type: dbtype.varchar(60), null:true},
				cust_email: {text:'Email', type: dbtype.varchar(60), null:true},
				cust_isdisabled: {text:'Disabled', type: dbtype.boolean, null:false, default:'0'},
				cust_ishasbirthinfo: {
					text:'Has Birth Information', type: dbtype.boolean, null:false, default:'0', suppresslist: true, options: {labelWidth:'300px'},
				},
				cust_birthdate: {text:'Birth Date', type: dbtype.date, null:true, suppresslist: true, options:{required:true,invalidMessage:'Tanggal lahir harus diisi'}},
				cust_isrecvoffer: {caption:'Offer', text:'Allow Receive Offer', type: dbtype.boolean, null:false, default:'1', suppresslist: true, options: {labelWidth:'300px'}},
				cust_reasonrejectoffer: {text:'Reject Reason', type: dbtype.varchar(255), null:true, suppresslist: true},
			},
			defaultsearch : ['cust_id', 'cust_name'],
			uniques: {
				'cust_phone' : ['cust_phone'],
				'cust_email' : ['cust_email'],
			}
		}
	},

	schema: {
		title: 'Customer',
		header: 'mst_cust',
		detils: {}
	}
}
