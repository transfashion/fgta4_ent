<?php namespace FGTA4\apis;

if (!defined('FGTA4')) {
	die('Forbiden');
}

require_once __ROOT_DIR.'/core/sqlutil.php';
// require_once __ROOT_DIR . "/core/sequencer.php";
require_once __DIR__ . '/xapi.base.php';

if (is_file(__DIR__ .'/data-header-handler.php')) {
	require_once __DIR__ .'/data-header-handler.php';
}


use \FGTA4\exceptions\WebException;

$API = new class extends siteBase {
    public function execute($site_id) {
       
		$c='';
		try {
            try {
				$DB_CONFIG = DB_CONFIG[$GLOBALS['TBDBW']];
				$DB_CONFIG['param'] = DB_CONFIG_PARAM[$GLOBALS['MAINDBTYPE']];		
				$this->dbfrm = new \PDO(
							$DB_CONFIG['DSN'], 
							$DB_CONFIG['user'], 
							$DB_CONFIG['pass'], 
							$DB_CONFIG['param']
				);
			} catch (\Exception $ex) {
				throw new \Exception("Cannot connect to TBDB.\r\n " . $ex->getMessage());
			}


			// cek kelengkapan data site
			$sql = "select * from mst_site where site_id = :site_id ";
			$stmt = $this->db->prepare($sql );
			$stmt->execute([':site_id'=>$site_id]);
			$row  = $stmt->fetch(\PDO::FETCH_ASSOC);
			$site_code = $row['site_code'];
			if ($site_code=='') {
				throw new \Exception('site code belum diisi');
			}

			$SITEDATA = $row;


			// cek data site
			$sql = "select siteref_code from mst_siteref where site_id=:site_id and interface_id ='TB' and siteref_name ='branch_id'";
			$stmt = $this->db->prepare($sql );
			$stmt->execute([':site_id'=>$site_id]);
			$row  = $stmt->fetch(\PDO::FETCH_ASSOC);
			if ($row==null) {
				throw new \Exception("Referensi branch_id Transbrowser untuk site ini tidak ditemukan. Buat dulu di bagian Referensi.\r\n ");
			}

			$branch_id = $row['siteref_code'];
			$regions = [];

			// ambil semua unit dari site ini
			$sql = "select unit_id from mst_siteunit where site_id=:site_id";
			$stmt = $this->db->prepare($sql );
			$stmt->execute([':site_id'=>$site_id]);
			$rows  = $stmt->fetchall(\PDO::FETCH_ASSOC);
			
			
			$sqlunitref = "select unitref_code from mst_unitref  where unit_id = :unit_id and interface_id='TB' and unitref_name = 'region_id' ";
			$stmtunitref = $this->db->prepare($sqlunitref );
			foreach ($rows as $row) {
				$unit_id = $row['unit_id'];
				$stmtunitref->execute([':unit_id'=>$unit_id]);
				$rowunit  = $stmtunitref->fetch(\PDO::FETCH_ASSOC);
				if ($rowunit==null) {
					throw new \Exception("Referensi region_id Transbrowser untuk unit $unit_id ini tidak ditemukan. Buat dulu di Referensi di <b>unit</b>.\r\n ");
				}
				
				$region_id = $rowunit['unitref_code'];
				$regions[] = $region_id;

				// tambahkan 3600 untuk keperluan paperbag
				if ($unit_id=='COR') {
					$regions[] = '03600';
				}
			}

			$this->dbfrm->exec("SET ANSI_NULLS ON");
			$this->dbfrm->exec("SET CONCAT_NULL_YIELDS_NULL ON");
			$this->dbfrm->exec("SET ANSI_WARNINGS ON");
			$this->dbfrm->exec("SET ANSI_PADDING ON");
			$this->dbfrm->exec("SET QUOTED_IDENTIFIER ON"); 

			// cek site di TB
			$sql = "select site_id from master_site where site_id = :site_id";
			$stmt = $this->dbfrm->prepare($sql);
			$stmt->execute([':site_id'=>$site_id]);
			$row  = $stmt->fetch(\PDO::FETCH_ASSOC);
			if ($row==null) {
				// ambil info 
				$sqlSiteInfo = "
					select A.site_id, A.land_id as location_id, B.land_name as location_name, B.city_id, B.territorial_id as area_id
					from mst_site A left join mst_land B on B.land_id = A.land_id                
					where
					A.site_id = :site_id;
				";
				$stmtSiteInfo = $this->db->prepare($sqlSiteInfo);
				$stmtSiteInfo->execute([':site_id'=>$site_id]);
				$rowSiteInfo = $stmtSiteInfo->fetch(\PDO::FETCH_ASSOC);

				// buat dulu site di TransBrowser
				$newSite = [
					':site_id' => $site_id,
					':site_name' => $SITEDATA['site_name'],
					':location_id' => $rowSiteInfo['location_id'],
					':location_name' => $rowSiteInfo['location_name'],
					':city_id' => $rowSiteInfo['city_id'],
					':area_id' => $rowSiteInfo['area_id'],
					':site_code' =>  $SITEDATA['site_code'],
					':sitemodel_id' => $SITEDATA['sitemodel_id']
				];
				
				$sqlNewSite = "
					SET ANSI_NULLS ON;
					SET CONCAT_NULL_YIELDS_NULL ON;
					SET ANSI_WARNINGS ON;
					SET ANSI_PADDING ON;

					insert into master_site
					(site_id, site_name, location_id, location_name, city_id, area_id, site_code, sitemodel_id)
					values
					(:site_id, :site_name, :location_id, :location_name, :city_id, :area_id, :site_code, :sitemodel_id);
				";
				$stmtNewSite = $this->dbfrm->prepare($sqlNewSite);
				$stmtNewSite->execute($newSite);

			}



			// cek sitemap
			$sqlSitemapCek = "select sitemap_id from master_sitemap where sitemap_id = :sitemap_id";
			$stmtSitemapCek = $this->dbfrm->prepare($sqlSitemapCek);

			// cek regionbranch
			$sqlRegionbranchCek = "select * from master_regionbranch where region_id=:region_id and branch_id=:branch_id";
			$stmtRegionbranchCek =  $this->dbfrm->prepare($sqlRegionbranchCek);


			// cek saldo
			$sqlSaldoCek = "select * from transaksi_hesaldo where saldo_id = :saldo_id";
			$stmtSaldoCek = $this->dbfrm->prepare($sqlSaldoCek);

			// siapkan untuk insert sitemap
			$sqlSitemapIns = "insert into master_sitemap (sitemap_id) values (:sitemap_id)";
			$stmtSitemapIns = $this->dbfrm->prepare($sqlSitemapIns);
			
			
			// insert regionbranch
			$sqlRegionbranchIns = "
				insert into master_regionbranch
				(region_id, branch_id, sitemap_id, regionbranch_codes, regionbranch_codesal)
				values
				(:region_id, :branch_id, :sitemap_id, :regionbranch_codes, :regionbranch_codesal)
			";
			$stmtRegionbranchIns = $this->dbfrm->prepare($sqlRegionbranchIns);


			// insert saldo
			$sqlSaldoIns = "
				insert into transaksi_hesaldo
				(saldo_id, saldo_isdisabled, saldo_createby, region_id, branch_id)
				values
				(:saldo_id, 0, 'kalista', :region_id, :branch_id)
			";
			$stmtSaldoIns = $this->dbfrm->prepare($sqlSaldoIns);
			
			foreach ($regions as $region_id) {
				// insert data sitemap
				$sitemap_id = "$region_id:$branch_id";
				$stmtSitemapCek->execute([':sitemap_id'=>$sitemap_id]);
				$rowSitemap  = $stmtSitemapCek->fetch(\PDO::FETCH_ASSOC);
				if ($rowSitemap==null) {
					$stmtSitemapIns->execute([':sitemap_id'=>$sitemap_id]);
				}

				// insert regionbranch
				$stmtRegionbranchCek->execute([':region_id'=>$region_id, ':branch_id'=>$branch_id]);
				$rowRegionbranchCek = $stmtRegionbranchCek->fetch(\PDO::FETCH_ASSOC);
				if ($rowRegionbranchCek==null) {
					$rbdata = [
						':region_id' => $region_id,
						':branch_id' => $branch_id,
						':sitemap_id' => $sitemap_id,
						':regionbranch_codes' => $site_id,
						':regionbranch_codesal' => $site_code
					];
					$stmtRegionbranchIns->execute($rbdata);
				}

				// insert saldo
				$saldo_id = "20100131-$region_id-$branch_id";
				$stmtSaldoCek->execute([':saldo_id'=>$saldo_id]);
				$rowSaldoCek = $stmtSaldoCek->fetch(\PDO::FETCH_ASSOC);
				if ($rowSaldoCek==null) {
					$saldoData = [
						':saldo_id' => $saldo_id,
						':region_id' => $region_id,
						':branch_id' => $branch_id
 					];
					$stmtSaldoIns->execute($saldoData);
				}

			}

            return $site_id;
        }  catch (\Exception $ex) {
            throw $ex;
        }
    }
};