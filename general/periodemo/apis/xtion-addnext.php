<?php namespace FGTA4\apis;

if (!defined('FGTA4')) {
	die('Forbiden');
}

require_once __ROOT_DIR.'/core/sqlutil.php';
require_once __DIR__ . '/xapi.base.php';

use \FGTA4\exceptions\WebException;
use \FGTA4\debug;


$API = new class extends periodemoBase {

	public function execute($id, $param) {
		$tablename = 'mst_periodemo';
		$primarykey = 'periodemo_id';
		$userdata = $this->auth->session_get_user();

		try {

			$currentdata = (object)[
				'header' => $this->get_header_row($id),
				'user' => $userdata
			];

			$this->db->setAttribute(\PDO::ATTR_AUTOCOMMIT,0);
			$this->db->beginTransaction();
			
			try {
				$cm =  $currentdata->header;

				$datestart = new \DateTime($cm->periodemo_dtend);
				$datestart->modify('+1 day');

				$dateend = new \DateTime($datestart->format('Y-m-d'));
				$dateend->modify('+1 month')->modify('-1 day');

				$moname = [
					'01' => 'JANUARI',
					'02' => 'FEBRUARI',
					'03' => 'MARET',
					'04' => 'APRIL',
					'05' => 'MEI',
					'06' => 'JUNI',
					'07' => 'JULI',
					'08' => 'AGUSTUS',
					'09' => 'SEPTEMBER',
					'10' => 'OKTOBER',
					'11' => 'NOVEMBER',
					'12' => 'DESEMBER'
				];

				$obj = new \stdClass;
				$obj->periodemo_id = $datestart->format('Ym');
				$obj->periodemo_name = $moname[$datestart->format('m')] . ' ' . $datestart->format('Y');
				$obj->periodemo_year = $datestart->format('Y');
				$obj->periodemo_month = (int)$datestart->format('m');
				$obj->periodemo_dtstart = $datestart->format('Y-m-d');
				$obj->periodemo_dtend = $dateend->format('Y-m-d');
				$obj->periodemo_prev = $id;
				$obj->_createby = $userdata->username;
				$obj->_createdate = date('Y-m-d H:i:s');

				$cmd = \FGTA4\utils\SqlUtility::CreateSQLInsert("mst_periodemo", $obj);
				$stmt = $this->db->prepare($cmd->sql);
				$stmt->execute($cmd->params);

				\FGTA4\utils\SqlUtility::WriteLog($this->db, $this->reqinfo->modulefullname, $tablename, $obj->periodemo_id , 'NEW', $userdata->username, (object)[]);

				$this->db->commit();
				return (object)[
					'success' => true,
					'dataresponse' => $dataresponse
				];
			} catch (\Exception $ex) {
				$this->db->rollBack();
				throw $ex;
			} finally {
				$this->db->setAttribute(\PDO::ATTR_AUTOCOMMIT,1);
			}
		} catch (\Exception $ex) {
			throw $ex;
		}
	}






};


