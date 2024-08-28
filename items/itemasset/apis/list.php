<?php namespace FGTA4\apis;

if (!defined('FGTA4')) {
	die('Forbiden');
}

require_once __ROOT_DIR.'/core/sqlutil.php';
require_once __DIR__ . '/xapi.base.php';

if (is_file(__DIR__ .'/data-header-handler.php')) {
	require_once __DIR__ .'/data-header-handler.php';
}



use \FGTA4\exceptions\WebException;

/**
 * ent/items/itemasset/apis/list.php
 *
 * ========
 * DataList
 * ========
 * Menampilkan data-data pada tabel header itemasset (mst_itemasset)
 * sesuai dengan parameter yang dikirimkan melalui variable $option->criteria
 *
 * Agung Nugroho <agung@fgta.net> http://www.fgta.net
 * Tangerang, 26 Maret 2021
 *
 * digenerate dengan FGTA4 generator
 * tanggal 28/08/2024
 */
$API = new class extends itemassetBase {

	public function execute($options) {

		$userdata = $this->auth->session_get_user();

		$handlerclassname = "\\FGTA4\\apis\\itemasset_headerHandler";
		if (class_exists($handlerclassname)) {
			$hnd = new itemasset_headerHandler($options);
			$hnd->caller = &$this;
			$hnd->db = $this->db;
			$hnd->auth = $this->auth;
			$hnd->reqinfo = $this->reqinfo;
		} else {
			$hnd = new \stdClass;
		}


		try {
		
			// cek apakah user boleh mengeksekusi API ini
			if (!$this->RequestIsAllowedFor($this->reqinfo, "list", $userdata->groups)) {
				throw new \Exception('your group authority is not allowed to do this action.');
			}

			if (method_exists(get_class($hnd), 'init')) {
				// init(object &$options) : void
				$hnd->init($options);
			}

			$criteriaValues = [
				"search" => " A.itemasset_id LIKE CONCAT('%', :search, '%') OR A.itemasset_name LIKE CONCAT('%', :search, '%') "
			];

			if (method_exists(get_class($hnd), 'buildListCriteriaValues')) {
				// ** buildListCriteriaValues(object &$options, array &$criteriaValues) : void
				//    apabila akan modifikasi parameter2 untuk query
				//    $criteriaValues['fieldname'] = " A.fieldname = :fieldname";  <-- menambahkan field pada where dan memberi parameter value
				//    $criteriaValues['fieldname'] = "--";                         <-- memberi parameter value tanpa menambahkan pada where
				//    $criteriaValues['fieldname'] = null                          <-- tidak memberi efek pada query secara langsung, parameter digunakan untuk keperluan lain 
				//
				//    untuk memberikan nilai default apabila paramter tidak dikirim
				//    // \FGTA4\utils\SqlUtility::setDefaultCriteria($options->criteria, '--fieldscriteria--', '--value--');
				$hnd->buildListCriteriaValues($options, $criteriaValues);
			}

			$where = \FGTA4\utils\SqlUtility::BuildCriteria($options->criteria, $criteriaValues);
			
			$maxrow = 30;
			$offset = (property_exists($options, 'offset')) ? $options->offset : 0;

			/* prepare DbLayer Temporay Data Helper if needed */
			if (method_exists(get_class($hnd), 'prepareListData')) {
				// ** prepareListData(object $options, array $criteriaValues) : void
				//    misalnya perlu mebuat temporary table,
				//    untuk membuat query komplex dapat dibuat disini	
				$hnd->prepareListData($options, $criteriaValues);
			}


			/* Data Query Configuration */
			$sqlFieldList = [
				'itemasset_id' => 'A.`itemasset_id`', 'item_id' => 'A.`item_id`', 'itemasset_name' => 'A.`itemasset_name`', 'itemasset_merk' => 'A.`itemasset_merk`',
				'itemasset_type' => 'A.`itemasset_type`', 'itemasset_serial' => 'A.`itemasset_serial`', 'itemasset_descr' => 'A.`itemasset_descr`', 'itemstatus_id' => 'A.`itemstatus_id`',
				'itemasset_statusnote' => 'A.`itemasset_statusnote`', 'itemasset_ischeckout' => 'A.`itemasset_ischeckout`', 'itemasset_ismoveable' => 'A.`itemasset_ismoveable`', 'itemasset_isdisabled' => 'A.`itemasset_isdisabled`',
				'itemasset_iswrittenof' => 'A.`itemasset_iswrittenof`', 'itemgroup_id' => 'A.`itemgroup_id`', 'itemmodel_id' => 'A.`itemmodel_id`', 'itemclass_id' => 'A.`itemclass_id`',
				'itemasset_baselocation' => 'A.`itemasset_baselocation`', 'site_id' => 'A.`site_id`', 'owner_dept_id' => 'A.`owner_dept_id`', 'maintainer_dept_id' => 'A.`maintainer_dept_id`',
				'location_dept_id' => 'A.`location_dept_id`', 'location_site_id' => 'A.`location_site_id`', 'location_room_id' => 'A.`location_room_id`', 'location_empl_id' => 'A.`location_empl_id`',
				'partner_id' => 'A.`partner_id`', 'itemasset_purchasedate' => 'A.`itemasset_purchasedate`', 'itemasset_lastsupportdate' => 'A.`itemasset_lastsupportdate`', 'itemasset_purchasevalue' => 'A.`itemasset_purchasevalue`',
				'curr_id' => 'A.`curr_id`', 'itemasset_purchasevalue_idr' => 'A.`itemasset_purchasevalue_idr`', 'asset_coa_id' => 'A.`asset_coa_id`', 'depremodel_id' => 'A.`depremodel_id`',
				'cost_coa_id' => 'A.`cost_coa_id`', 'itemasset_depreage' => 'A.`itemasset_depreage`', 'itemasset_depreresidu' => 'A.`itemasset_depreresidu`', 'itemasset_currentvalue_idr' => 'A.`itemasset_currentvalue_idr`',
				'itemasset_currentvalue_date' => 'A.`itemasset_currentvalue_date`', 'itemasset_usevaluerate' => 'A.`itemasset_usevaluerate`', 'itemasset_writeoffby' => 'A.`itemasset_writeoffby`', 'itemasset_writeoffdate' => 'A.`itemasset_writeoffdate`',
				'itemasset_writeoffref' => 'A.`itemasset_writeoffref`', '_createby' => 'A.`_createby`', '_createdate' => 'A.`_createdate`', '_modifyby' => 'A.`_modifyby`',
				'_createby' => 'A.`_createby`', '_createdate' => 'A.`_createdate`', '_modifyby' => 'A.`_modifyby`', '_modifydate' => 'A.`_modifydate`'
			];
			$sqlFromTable = "mst_itemasset A";
			$sqlWhere = $where->sql;
			$sqlLimit = "LIMIT $maxrow OFFSET $offset";

			if (method_exists(get_class($hnd), 'SqlQueryListBuilder')) {
				// ** SqlQueryListBuilder(array &$sqlFieldList, string &$sqlFromTable, string &$sqlWhere, array &$params) : void
				//    menambah atau memodifikasi field-field yang akan ditampilkan
				//    apabila akan memodifikasi join table
				//    apabila akan memodifikasi nilai parameter
				$hnd->SqlQueryListBuilder($sqlFieldList, $sqlFromTable, $sqlWhere, $where->params);
			}
			
			// filter select columns
			if (!property_exists($options, 'selectFields')) {
				$options->selectFields = [];
			}
			$columsSelected = $this->SelectColumns($sqlFieldList, $options->selectFields);
			$sqlFields = \FGTA4\utils\SqlUtility::generateSqlSelectFieldList($columsSelected);


			/* Sort Configuration */
			if (!property_exists($options, 'sortData')) {
				$options->sortData = [];
			}
			if (!is_array($options->sortData)) {
				if (is_object($options->sortData)) {
					$options->sortData = (array)$options->sortData;
				} else {
					$options->sortData = [];
				}
			}

		


			if (method_exists(get_class($hnd), 'sortListOrder')) {
				// ** sortListOrder(array &$sortData) : void
				//    jika ada keperluan mengurutkan data
				//    $sortData['fieldname'] = 'ASC/DESC';
				$hnd->sortListOrder($options->sortData);
			}
			$sqlOrders = \FGTA4\utils\SqlUtility::generateSqlSelectSort($options->sortData);


			/* Compose SQL Query */
			$sqlCount = "select count(*) as n from $sqlFromTable $sqlWhere";
			$sqlData = "
				select 
				$sqlFields 
				from 
				$sqlFromTable 
				$sqlWhere 
				$sqlOrders 
				$sqlLimit
			";

			/* Execute Query: Count */
			$stmt = $this->db->prepare($sqlCount );
			$stmt->execute($where->params);
			$row  = $stmt->fetch(\PDO::FETCH_ASSOC);
			$total = (float) $row['n'];

			/* Execute Query: Retrieve Data */
			$stmt = $this->db->prepare($sqlData);
			$stmt->execute($where->params);
			$rows  = $stmt->fetchall(\PDO::FETCH_ASSOC);


			$handleloop = false;
			if (method_exists(get_class($hnd), 'DataListLooping')) {
				$handleloop = true;
			}

			/* Proces result */
			$records = [];
			foreach ($rows as $row) {
				$record = [];
				foreach ($row as $key => $value) {
					$record[$key] = $value;
				}


				/*
				$record = array_merge($record, [
					// // jikalau ingin menambah atau edit field di result record, dapat dilakukan sesuai contoh sbb: 
					//'tanggal' => date("d/m/y", strtotime($record['tanggal'])),
				 	//'tambahan' => 'dta'
					'item_name' => \FGTA4\utils\SqlUtility::Lookup($record['item_id'], $this->db, 'mst_item', 'item_id', 'item_name'),
					'itemstatus_name' => \FGTA4\utils\SqlUtility::Lookup($record['itemstatus_id'], $this->db, 'mst_itemstatus', 'itemstatus_id', 'itemstatus_name'),
					'itemgroup_name' => \FGTA4\utils\SqlUtility::Lookup($record['itemgroup_id'], $this->db, 'mst_itemgroup', 'itemgroup_id', 'itemgroup_name'),
					'itemmodel_name' => \FGTA4\utils\SqlUtility::Lookup($record['itemmodel_id'], $this->db, 'mst_itemmodel', 'itemmodel_id', 'itemmodel_name'),
					'itemclass_name' => \FGTA4\utils\SqlUtility::Lookup($record['itemclass_id'], $this->db, 'mst_itemclass', 'itemclass_id', 'itemclass_name'),
					'site_name' => \FGTA4\utils\SqlUtility::Lookup($record['site_id'], $this->db, 'mst_site', 'site_id', 'site_name'),
					'owner_dept_name' => \FGTA4\utils\SqlUtility::Lookup($record['owner_dept_id'], $this->db, 'mst_dept', 'dept_id', 'dept_name'),
					'maintainer_dept_name' => \FGTA4\utils\SqlUtility::Lookup($record['maintainer_dept_id'], $this->db, 'mst_dept', 'dept_id', 'dept_name'),
					'dept_name' => \FGTA4\utils\SqlUtility::Lookup($record['location_dept_id'], $this->db, 'mst_dept', 'dept_id', 'dept_name'),
					'site_name' => \FGTA4\utils\SqlUtility::Lookup($record['location_site_id'], $this->db, 'mst_site', 'site_id', 'site_name'),
					'location_room_name' => \FGTA4\utils\SqlUtility::Lookup($record['location_room_id'], $this->db, 'mst_room', 'room_id', 'room_name'),
					'empl_name' => \FGTA4\utils\SqlUtility::Lookup($record['location_empl_id'], $this->db, 'mst_empl', 'empl_id', 'empl_name'),
					'partner_name' => \FGTA4\utils\SqlUtility::Lookup($record['partner_id'], $this->db, 'mst_partner', 'partner_id', 'partner_name'),
					'curr_name' => \FGTA4\utils\SqlUtility::Lookup($record['curr_id'], $this->db, 'mst_curr', 'curr_id', 'curr_name'),
					'asset_coa_name' => \FGTA4\utils\SqlUtility::Lookup($record['asset_coa_id'], $this->db, 'mst_coa', 'coa_id', 'coa_name'),
					'depremodel_name' => \FGTA4\utils\SqlUtility::Lookup($record['depremodel_id'], $this->db, 'mst_depremodel', 'depremodel_id', 'depremodel_name'),
					'cost_coa_name' => \FGTA4\utils\SqlUtility::Lookup($record['cost_coa_id'], $this->db, 'mst_coa', 'coa_id', 'coa_name'),
					'itemasset_writeoffby' => \FGTA4\utils\SqlUtility::Lookup($record['itemasset_writeoffby'], $this->db, $GLOBALS['MAIN_USERTABLE'], 'user_id', 'user_fullname'),
					 
				]);
				*/


				// lookup data id yang refer ke table lain
				$this->addFields('item_name', 'item_id', $record, 'mst_item', 'item_name', 'item_id');
				$this->addFields('itemstatus_name', 'itemstatus_id', $record, 'mst_itemstatus', 'itemstatus_name', 'itemstatus_id');
				$this->addFields('itemgroup_name', 'itemgroup_id', $record, 'mst_itemgroup', 'itemgroup_name', 'itemgroup_id');
				$this->addFields('itemmodel_name', 'itemmodel_id', $record, 'mst_itemmodel', 'itemmodel_name', 'itemmodel_id');
				$this->addFields('itemclass_name', 'itemclass_id', $record, 'mst_itemclass', 'itemclass_name', 'itemclass_id');
				$this->addFields('site_name', 'site_id', $record, 'mst_site', 'site_name', 'site_id');
				$this->addFields('owner_dept_name', 'owner_dept_id', $record, 'mst_dept', 'dept_name', 'dept_id');
				$this->addFields('maintainer_dept_name', 'maintainer_dept_id', $record, 'mst_dept', 'dept_name', 'dept_id');
				$this->addFields('dept_name', 'location_dept_id', $record, 'mst_dept', 'dept_name', 'dept_id');
				$this->addFields('site_name', 'location_site_id', $record, 'mst_site', 'site_name', 'site_id');
				$this->addFields('location_room_name', 'location_room_id', $record, 'mst_room', 'room_name', 'room_id');
				$this->addFields('empl_name', 'location_empl_id', $record, 'mst_empl', 'empl_name', 'empl_id');
				$this->addFields('partner_name', 'partner_id', $record, 'mst_partner', 'partner_name', 'partner_id');
				$this->addFields('curr_name', 'curr_id', $record, 'mst_curr', 'curr_name', 'curr_id');
				$this->addFields('asset_coa_name', 'asset_coa_id', $record, 'mst_coa', 'coa_name', 'coa_id');
				$this->addFields('depremodel_name', 'depremodel_id', $record, 'mst_depremodel', 'depremodel_name', 'depremodel_id');
				$this->addFields('cost_coa_name', 'cost_coa_id', $record, 'mst_coa', 'coa_name', 'coa_id');
				$this->addFields('itemasset_writeoffby', 'itemasset_writeoffby', $record, $GLOBALS['MAIN_USERTABLE'], 'user_fullname', 'user_id');
					 


				if ($handleloop) {
					// ** DataListLooping(array &$record) : void
					//    apabila akan menambahkan field di record
					$hnd->DataListLooping($record);
				}

				array_push($records, $record);
			}

			/* modify and finalize records */
			if (method_exists(get_class($hnd), 'DataListFinal')) {
				// ** DataListFinal(array &$records) : void
				//    finalisasi data list
				$hnd->DataListFinal($records);
			}

			// kembalikan hasilnya
			$result = new \stdClass; 
			$result->total = $total;
			$result->offset = $offset + $maxrow;
			$result->maxrow = $maxrow;
			$result->records = $records;
			return $result;
		} catch (\Exception $ex) {
			throw $ex;
		}
	}

};