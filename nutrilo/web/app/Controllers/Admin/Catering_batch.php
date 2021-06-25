<?php namespace App\Controllers\Admin;

use CodeIgniter\Controller;
use App\Models\Admin\Menu_model;
use App\Models\Admin\User_model;
use App\Models\Admin\Day_model;
use App\Models\Admin\Catering_order_batch_model;
use App\Models\Admin\Catering_order_detail_model;
use App\Libraries\Pdf;

class Catering_batch extends Controller
{
	public function index()
	{
		$session = session();

		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/login');
		} else{
			if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {
				$batchModel = new Catering_order_batch_model();

                $data = [
					'batchs' => $batchModel->getBatch(),
                ];

				echo view('Admin/Snippet_header');
				echo view('Admin/Catering_batch_view', $data);
				echo view('Admin/Snippet_footer');
			}
			
		}
    }

    public function save()
    {
        $session = session();
        
        helper('text');

		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/login');
		} else {
            if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {
				$model = new Catering_order_batch_model();
				$lastBatch = $model->getLastBatch()->getRow(0);
				$now_date = date("Y-m-d H:i:s");
				$batchNumber = $lastBatch->batch_number+1;
				$data = array(
					'name' => $this->request->getPost('name'),
					'duration' => $this->request->getPost('duration'),
					'batch_number' => $batchNumber,
                    'is_active' => 1,
                    'created_time' => $now_date
                );
				$result = $model->saveBatch($data);
				// print_r($result);
                return redirect()->to('/catering');
            }
        }
    }
}