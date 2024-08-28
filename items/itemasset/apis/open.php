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
 * ent/items/itemasset/apis/open.php
 *
 * ====
 * Open
 * ====
 * Menampilkan satu baris data/record sesuai PrimaryKey,
 * dari tabel header itemasset (mst_itemasset)
 *
 * Agung Nugroho <agung@fgta.net> http://www.fgta.net
 * Tangerang, 26 Maret 2021
 *
 * digenerate dengan FGTA4 generator
 * tanggal 28/08/2024
 */
$API = new class extends itemassetBase {
	
	public function execute($options) {
		$event = 'on-open';
		$tablename = 'mst_itemasset';
		$primarykey = 'itemasset_id';
		$userdata = $this->auth->session_get_user();

		$handlerclassname = "\\FGTA4\\apis\\itemasset_headerHandler";
		$hnd = null;
		if (class_exists($handlerclassname)) {
			$hnd = new itemasset_headerHandler($options);
			$hnd->caller = &$this;
			$hnd->db = $this->db;
			$hnd->auth = $this->auth;
			$hnd->reqinfo = $this->reqinfo;
			$hnd->event = $event;
		} else {
			$hnd = new \stdClass;
		}

		try {

			// cek apakah user boleh mengeksekusi API ini
			if (!$this->RequestIsAllowedFor($this->reqinfo, "open", $userdata->groups)) {
				throw new \Exception('your group authority is not allowed to do this action.');
			}

			if (method_exists(get_class($hnd), 'init')) {
				// init(object &$options) : void
				$hnd->init($options);
			}

			if (method_exists(get_class($hnd), 'PreCheckOpen')) {
				// PreCheckOpen($data, &$key, &$options)
				$hnd->PreCheckOpen($data, $key, $options);
			}

			$criteriaValues = [
				"itemasset_id" => " itemasset_id = :itemasset_id "
			];
			if (method_exists(get_class($hnd), 'buildOpenCriteriaValues')) {
				// buildOpenCriteriaValues(object $options, array &$criteriaValues) : void
				$hnd->buildOpenCriteriaValues($options, $criteriaValues);
			}
			$where = \FGTA4\utils\SqlUtility::BuildCriteria($options->criteria, $criteriaValues);
			$result = new \stdClass; 

			if (method_exists(get_class($hnd), 'prepareOpenData')) {
				// prepareOpenData(object $options, $criteriaValues) : void
				$hnd->prepareOpenData($options, $criteriaValues);
			}
			

			if (method_exists(get_class($hnd), 'prepareOpenData')) {
				// prepareOpenData(object $options, $criteriaValues) : void
				$hnd->prepareOpenData($options, $criteriaValues);
			}


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

			if (method_exists(get_class($hnd), 'SqlQueryOpenBuilder')) {
				// SqlQueryOpenBuilder(array &$sqlFieldList, string &$sqlFromTable, string &$sqlWhere, array &$params) : void
				$hnd->SqlQueryOpenBuilder($sqlFieldList, $sqlFromTable, $sqlWhere, $where->params);
			}
			$sqlFields = \FGTA4\utils\SqlUtility::generateSqlSelectFieldList($sqlFieldList);

			
			$sqlData = "
				select 
				$sqlFields 
				from 
				$sqlFromTable 
				$sqlWhere 
			";

			$stmt = $this->db->prepare($sqlData);
			$stmt->execute($where->params);
			$row  = $stmt->fetch(\PDO::FETCH_ASSOC);

			$record = [];
			foreach ($row as $key => $value) {
				$record[$key] = $value;
			}



			$result->record = array_merge($record, [
				'itemasset_purchasedate' => date("d/m/Y", strtotime($record['itemasset_purchasedate'])),
				'itemasset_lastsupportdate' => date("d/m/Y", strtotime($record['itemasset_lastsupportdate'])),
				'itemasset_currentvalue_date' => date("d/m/Y", strtotime($record['itemasset_currentvalue_date'])),
				
				// // jikalau ingin menambah atau edit field di result record, dapat dilakukan sesuai contoh sbb: 
				// 'tambahan' => 'dta',
				//'tanggal' => date("d/m/Y", strtotime($record['tanggal'])),
				//'gendername' => $record['gender']
				
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


				'_createby' => \FGTA4\utils\SqlUtility::Lookup($record['_createby'], $this->db, $GLOBALS['MAIN_USERTABLE'], 'user_id', 'user_fullname'),
				'_modifyby' => \FGTA4\utils\SqlUtility::Lookup($record['_modifyby'], $this->db, $GLOBALS['MAIN_USERTABLE'], 'user_id', 'user_fullname'),

			]);


			

			if (method_exists(get_class($hnd), 'DataOpen')) {
				//  DataOpen(array &$record) : void 
				$hnd->DataOpen($result->record);
			}

			return $result;
		} catch (\Exception $ex) {
			throw $ex;
		}
	}

};