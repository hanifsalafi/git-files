<?php namespace App\Controllers\Admin;

use CodeIgniter\Controller;
use App\Models\Admin\Catering_order_batch_model;
use App\Models\Admin\Catering_package_model;
use App\Models\Admin\Account_bank_model;
use App\Models\Admin\Catering_buyer_model;
use App\Models\Admin\Day_model;
use Config\Services;

class Catering_buyer extends Controller
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
                $allBatch = $batchModel->getBatch();
                $dataBatch = $batchModel->getBatch($batchId)->getRow(0);
                
                $buyerModel = new Catering_buyer_model();
                $buyerList = $buyerModel->getAllBuyerByBatch($batchId)->getResult();

                $packageModel = new Catering_package_model();
                $allPackage = $packageModel->getPackage();

                $paymentModel = new Account_bank_model();
                $payments = $paymentModel->getPayment();

                $dayModel = new Day_model();
                $days = $dayModel->getDay();

                $data = [
                    'batch' => $dataBatch,
                    'allBatch' => $allBatch,
                    'buyerList' => $buyerList,
                    'package' => $allPackage,
                    'days' => $days,
                    'payments' => $payments
                ];

				echo view('Admin/Snippet_header');
				echo view('Admin/Catering_buyer_view', $data);
				echo view('Admin/Snippet_footer');
			}
			
		}
    }

    public function add()
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
                $allBatch = $batchModel->getBatch();
                
                $packageModel = new Catering_package_model();
                $allPackage = $packageModel->getPackage();

                $paymentModel = new Account_bank_model();
                $payment = $paymentModel->getPayment();

                $buyerModel = new Catering_buyer_model();
                $buyerList = $buyerModel->getBuyer();
                
                $data = [
                    'title' => 'Tambah',
                    'batch' => $dataBatch,
                    'batchs' => $allBatch,
                    'packages' => $allPackage,
                    'payments' => $payment,
                    'buyers' => $buyerList
                ];

				echo view('Admin/Snippet_header');
				echo view('Admin/Catering_buyer_add_view', $data);
				echo view('Admin/Snippet_footer');
			}
			
		}
    }
    
    public function edit()
	{
		$session = session();

		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/login');
		} else{
			if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {
                $buyerId = $this->request->getGet('id');

                $buyerModel = new Catering_buyer_model();

                $buyer = $buyerModel->getBuyer($buyerId)->getRow(0);

                $batchId = $buyer->order_batch_id;

                $batchModel = new Catering_order_batch_model();
                $dataBatch = $batchModel->getBatch($batchId)->getRow(0);
                $allBatch = $batchModel->getBatch();
                
                $packageModel = new Catering_package_model();
                $allPackage = $packageModel->getPackage();

                $paymentModel = new Account_bank_model();
                $payment = $paymentModel->getPayment();

                $buyerModel = new Catering_buyer_model();
                $buyerList = $buyerModel->getBuyer();                
               
                $data = [
                    'title' => 'Edit',
                    'buyer' => $buyer,
                    'batch' => $dataBatch,
                    'batchs' => $allBatch,
                    'packages' => $allPackage,
                    'payments' => $payment,
                    'buyers' => $buyerList
                ];

				echo view('Admin/Snippet_header');
				echo view('Admin/Catering_buyer_add_view', $data);
				echo view('Admin/Snippet_footer');
			}
			
		}
    }
    
    public function save()
	{
		$session = session();

		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/login');
		} else{
			if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {

                $batchModel = new Catering_order_batch_model();
                $buyerModel = new Catering_buyer_model();

                $batchId = $this->request->getPost('batch_id');
                $allBatch = $batchModel->getBatch();
                $dataBatch = $batchModel->getBatch($batchId)->getRow(0);

                $batch_now = $dataBatch->batch_number;
                $batch_end_id = $this->request->getPost('batch_end_id');
                $batch_end = $allBatch[array_search($batch_end_id, array_column($allBatch, 'id'))]['batch_number'];

                $between = "batch_number BETWEEN ".$batch_now." AND ".$batch_end;
                $batchBetween = $batchModel->getBatchBetween($between)->getResult();
                
				$latlong = preg_replace('/\s+/', '', $this->request->getPost('latlong'));
				$latlongClean = $latlong;
				if (!strpos($latlong, '.')){
					$latlongSplit = preg_split("/\,/", $latlong);
					$latlongClean = $latlongSplit[0].".".$latlongSplit[1].",".$latlongSplit[2].".".$latlongSplit[3];
				};

                foreach ($batchBetween as $batch) {
                    # code...
                    $data = [
                        'name' => $this->request->getPost('name'),
                        'phone' => $this->request->getPost('phone'),
                        'address' => $this->request->getPost('address'),
                        'latlong' => $latlongClean,
                        'order_batch_id' => $batch->id,
                        'order_package_id' => $this->request->getPost('order_package'),
                        'quantity' => $this->request->getPost('quantity'),
                        'nutritional_needs' => $this->request->getPost('nutrition_need'),
                        'payment_to' => $this->request->getPost('payment_to'),
                        'payment_amount' => $this->request->getPost('payment_amount'),
                        'payment_date' => $this->request->getPost('payment_date'),
                        'batch_start_id' => $this->request->getPost('batch_start_id'),
                        'day_start' => $this->request->getPost('day_start'),
                        'batch_end_id' => $this->request->getPost('batch_end_id'),
                        'day_end' => $this->request->getPost('day_end'),
                        'notes' => $this->request->getPost('notes'),
                        'driver_notes' => $this->request->getPost('driver_notes')
                    ];

                    $result = $buyerModel->saveBuyer($data);
                    
                };

                return redirect()->to('/catering/buyer?batch='.$batchId);
			}
			
		}
    }

    public function update()
	{
		$session = session();

		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/login');
		} else{
			if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {

                $buyerModel = new Catering_buyer_model();

                $batchId = $this->request->getPost('batch_id');

                $latlong = preg_replace('/\s+/', '', $this->request->getPost('latlong'));
				$latlongClean = $latlong;
				if (!strpos($latlong, '.')){
					$latlongSplit = preg_split("/\,/", $latlong);
					$latlongClean = $latlongSplit[0].".".$latlongSplit[1].",".$latlongSplit[2].".".$latlongSplit[3];
				};

                $data = [
                    'name' => $this->request->getPost('name'),
                    'phone' => $this->request->getPost('phone'),
                    'address' => $this->request->getPost('address'),
                    'latlong' => $latlongClean,
                    'order_batch_id' => $batchId,
                    'order_package_id' => $this->request->getPost('order_package'),
                    'quantity' => $this->request->getPost('quantity'),
                    'nutritional_needs' => $this->request->getPost('nutrition_need'),
                    'payment_to' => $this->request->getPost('payment_to'),
                    'payment_amount' => $this->request->getPost('payment_amount'),
                    'payment_date' => $this->request->getPost('payment_date'),
                    'batch_start_id' => $this->request->getPost('batch_start_id'),
                    'day_start' => $this->request->getPost('day_start'),
                    'batch_end_id' => $this->request->getPost('batch_end_id'),
                    'day_end' => $this->request->getPost('day_end'),
                    'notes' => $this->request->getPost('notes'),
                    'driver_notes' => $this->request->getPost('driver_notes'),
                ];

                $result = $buyerModel->updateBuyer($data, $this->request->getPost('buyer_id'));

                return redirect()->to('/catering/buyer?batch='.$batchId);
			}
			
		}
    }

    public function delete()
    {
        $session = session();

		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/login');
		} else {
            if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {

                $buyerId = $this->request->getGet('id');
                $batchId = $this->request->getGet('batch');

                $model = new Catering_buyer_model();
                $model->deleteBuyer($buyerId);

                return redirect()->to('/catering/buyer?batch='.$batchId);
            }
        }
        
	}

}

ini_set('max_execution_time', 480);