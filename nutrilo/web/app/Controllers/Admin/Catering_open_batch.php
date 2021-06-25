<?php namespace App\Controllers\Admin;

use CodeIgniter\Controller;
use App\Models\Admin\Catering_order_batch_model;

class Catering_open_batch extends Controller
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

                $batchId = $this->request->getGet('batch');

                $batchModel = new Catering_order_batch_model();
				$dataBatch = $batchModel->getBatch($batchId)->getRow(0);

                $data = [
                    'batch' => $dataBatch
                ];

				echo view('Admin/Snippet_header');
				echo view('Admin/Catering_open_batch_view', $data);
				echo view('Admin/Snippet_footer');
			}
			
		}
	}

}
