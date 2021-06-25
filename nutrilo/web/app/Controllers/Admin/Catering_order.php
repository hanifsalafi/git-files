<?php namespace App\Controllers\Admin;

use CodeIgniter\Controller;
use App\Models\Admin\Menu_model;
use App\Models\Admin\User_model;
use App\Models\Admin\Day_model;
use App\Models\Admin\Catering_order_batch_model;
use App\Models\Admin\Catering_order_detail_model;
use App\Models\Admin\Catering_order_item_model;
use App\Models\Admin\Catering_buyer_model;
use App\Libraries\Pdf;

class Catering_order extends Controller
{
	public function index()
	{
		$session = session();
		$batchId = $this->request->getGet('batch');

		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/login');
		} else{
			if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {
				$user_model = new User_model();
				$user = $user_model->getUserByUsername($session->get('username'))->getRow();

				$menuModel = new Menu_model();
				$dayModel = new Day_model();
				$batchModel = new Catering_order_batch_model();
				$dataBatch = $batchModel->getBatch($batchId)->getRow(0);
				$orderModel = new Catering_order_detail_model();
				$orderItem = new Catering_order_item_model();
				$buyerModel = new Catering_buyer_model();

                $data = [
					'batch' => $dataBatch,
					'days' => $dayModel->getDay(),
					'menus' => $menuModel->getMenuByBatch($batchId)->getResult(),
					'orders' => $orderModel->getOrderByBatch($batchId)->getResult(),
					'items' => $orderItem->getOrderItemByBatch($batchId)->getResult(),
					'buyerList' => $buyerModel->getBuyerActiveByBatch($batchId)->getResult(),
				];

				// print_r($data['buyerList']);
				
				echo view('Admin/Snippet_header');
				echo view('Admin/Catering_order_view', $data);
				echo view('Admin/Snippet_footer');
			}
			
		}
	}

	private function getDistanceDelivery($destination){
        $origin = "3.580994,98.662378"; //Jl. Darat No.14

        $apiKeyArray = array('yg8sdwemk0cretg7WPsuJUZzMwwNyRAH', '6eGMp1Iy9lnkAchyBnL3bLLIsZQMkEuG',
                'qVYbbzKcW3vxxb5E9TgeV0bJ7cV6248h', 'umiS0Rh0xc9l5m755eVl22nsIfUmDmKy',
                't7lYG6oewkhgrGzr3wHGF5ihwkFqqmAD', '2TGOT8VEOjOgsc9weEtvvT1JYkOvyGMH');
        $apiKey = $apiKeyArray[array_rand($apiKeyArray)];

        log_message('info', "GET DISTANCE DELIVERY");
        log_message('info', $origin.':'.$destination );
        
        $ch = curl_init();
        $headers  = ['Content-Type: application/json'];
        $url = 'https://api.tomtom.com/routing/1/calculateRoute/'. $origin .':'. $destination .'/json?key='.$apiKey;
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        $response = curl_exec($ch);
        curl_close($ch);

        log_message('info', json_encode($response));
        $valDistance = (array)json_decode($response, true)['routes'][0]['summary']['lengthInMeters'];
        log_message('info', json_encode($valDistance));

        return $valDistance[0];
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
                $model = new Catering_order_detail_model();
				$now_date = date("Y-m-d H:i:s");
				$batchId = $this->request->getPost('batch-id');
				
				$latlong = preg_replace('/\s+/', '', $this->request->getPost('latlong'));
				$latlongClean = $latlong;
				if (!strpos($latlong, '.')){
					$latlongSplit = preg_split("/\,/", $latlong);
					$latlongClean = $latlongSplit[0].".".$latlongSplit[1].",".$latlongSplit[2].".".$latlongSplit[3];
				};

				$checkLatlong = $this->getDistanceDelivery($latlongClean);
				$isOutOfRange = $checkLatlong > 8000 ? true : false;
				
				$data = array(
					'catering_order_batch_id' => $batchId,
					'day_id' => $this->request->getPost('day-id'),
					'time_order' => $this->request->getPost('time-order'),
					'buyer_id' => $this->request->getPost('buyer_id'),
					'phone' => $this->request->getPost('phone'),
					'address' => $this->request->getPost('address'),
					'latlong' => $latlongClean,
					'notes' => $this->request->getPost('notes'),
					'driver_notes' => $this->request->getPost('driver_notes'),
					'is_out_of_range' => $isOutOfRange,
                    'created_time' => $now_date
                );
				$result = $model->saveOrder($data);

				$menuModel = new Menu_model();
				$dataMenu = $menuModel->getMenu($this->request->getPost('menu_id'))->getRow(0);

				$itemData = array(
					'order_detail_id' => $result,
					'order_batch_id' => $batchId,
					'menu_id' => $dataMenu->id,
					'food_name' => $dataMenu->name,
					'quantity' => $this->request->getPost('quantity'),
				);

				$itemModel = new Catering_order_item_model();
				$resultItem = $itemModel->saveOrderItem($itemData);

				// print_r($result);
				return redirect()->to('/catering/order?batch='.$batchId);
            }
        }
	}
	
	public function update()
    {
        $session = session();
        
        helper('text');

		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/login');
		} else {
            if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {
				$user_model = new User_model();
				$user = $user_model->getUserByUsername($session->get('username'))->getRow();

                $model = new Catering_order_detail_model();
				$orderId = $this->request->getPost('order-id');

				$latlong = preg_replace('/\s+/', '', $this->request->getPost('latlong'));
				$latlongClean = $latlong;
				if (!strpos($latlong, '.')){
					$latlongSplit = preg_split("/\,/", $latlong);
					$latlongClean = $latlongSplit[0].".".$latlongSplit[1].",".$latlongSplit[2].".".$latlongSplit[3];
				};

				$data = array(
					'buyer_id' => $this->request->getPost('buyer_id'),
					'phone' => $this->request->getPost('phone'),
					'address' => $this->request->getPost('address'),
					'latlong' => $latlongClean,
					'notes' => $this->request->getPost('notes'),
					'driver_notes' => $this->request->getPost('driver_notes'),
                );
				$result = $model->updateOrder($data, $orderId);

				$batchId = $this->request->getPost('batch-id');

				$menuModel = new Menu_model();
				$dataMenu = $menuModel->getMenu($this->request->getPost('menu_id'))->getRow(0);

				$itemId = $this->request->getPost('food-id');
				$itemData = array(
					'menu_id' => $dataMenu->id,
					'food_name' => $dataMenu->name,
					'quantity' => $this->request->getPost('quantity'),
				);


				$itemModel = new Catering_order_item_model();
				$resultItem = $itemModel->updateOrderItem($itemData, $itemId);

                return redirect()->to('/catering/order?batch='.$batchId);
            }
        }
    }


	public function delete($batchId, $id)
    {
        $session = session();

		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/login');
		} else {
            if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {
                $model = new Catering_order_detail_model();
				$model->deleteOrder($id);
				
				$modelItem = new Catering_order_item_model();
				$modelItem->deleteItemByOrderDetail($id);

                return redirect()->to('/catering/order?batch='.$batchId);
            }
        }
        
	}
	
	public function printOrder(){
		$session = session();

		$batchId = $this->request->getGet('batch');
		$dayId = $this->request->getGet('day');
		$timeId = $this->request->getGet('time');
	
		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/admin/login');
		} else {
			$model = new Catering_order_detail_model();
			$dayModel = new Day_model();
			$batchModel = new Catering_order_batch_model();
			$buyerModel = new Catering_buyer_model();
			
			$orders = $model->getOrderByBatchDayTime($batchId, $dayId, $timeId)->getResult();
			$time_name = "";
			if ($timeId == 1) { 
				$time_name = "Lunch";
			} else { $time_name = "Dinner"; };

			$dayData = $dayModel->getDay($dayId)->getRow(0);
			$batchData = $batchModel->getBatch($batchId)->getRow(0);

			$filename = $dayData->name ."_". $time_name ."_". $batchData->name;

			$data = array(
				'orders' => $orders,
				'date' => $filename,
				'buyerList' => $buyerModel->getBuyerByBatch($batchId)->getResult(),
				'day' => $dayData,
				'time' => $time_name,
				'batch' => $batchData
			);
			
			echo view('Admin/Print_order', $data);
		}
	}

}
