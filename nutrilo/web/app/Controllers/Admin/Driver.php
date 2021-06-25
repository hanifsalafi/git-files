<?php namespace App\Controllers\Admin;

use CodeIgniter\Controller;
use App\Models\Admin\Catering_order_detail_model;
use App\Models\Admin\Day_model;
use App\Models\Admin\Driver_record_model;
use App\Models\Admin\Delivery_data_model;
use App\Models\Admin\Delivery_point_model;
use Config\Services;

class Driver extends Controller
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
				echo view('Admin/Snippet_header');
				echo view('Admin/Driver_view');
				echo view('Admin/Snippet_footer');
			}
			
		}
    }


    private function hitApi($origins_array, $destinations_array){
        $apiKeyArray = array('yg8sdwemk0cretg7WPsuJUZzMwwNyRAH', '6eGMp1Iy9lnkAchyBnL3bLLIsZQMkEuG',
                'qVYbbzKcW3vxxb5E9TgeV0bJ7cV6248h', 'umiS0Rh0xc9l5m755eVl22nsIfUmDmKy',
                't7lYG6oewkhgrGzr3wHGF5ihwkFqqmAD', '2TGOT8VEOjOgsc9weEtvvT1JYkOvyGMH');
        $apiKey = $apiKeyArray[array_rand($apiKeyArray)];

        $origins_json = array($origins_array);
        $destinations_json = $destinations_array;
        $combine_json = array(
            'origins' => $origins_json,
            'destinations' => $destinations_json
        );

        $body_json = json_encode($combine_json);

        log_message('info', 'REQUEST POST {request}', ['request' => $body_json]);

        $ch = curl_init();
        $headers  = ['Content-Type: application/json'];
        $url = 'https://api.tomtom.com/routing/1/matrix/sync/json?key='.$apiKey.'&routeType=fastest&travelMode=car';
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $body_json);           
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        $results = json_decode(curl_exec($ch), true);
        curl_close($ch);

        log_message('info', 'RESPONSE POST {response}', ['response' => json_encode($results)]);


        return $results;
    }

    private function getShortestMap($origins, $destination_coordinat){
        $client = \Config\Services::curlrequest();

        $start_dest = 99999999;
        $key_min = 0;

        $apiKeyArray = array('yg8sdwemk0cretg7WPsuJUZzMwwNyRAH', '6eGMp1Iy9lnkAchyBnL3bLLIsZQMkEuG',
        'qVYbbzKcW3vxxb5E9TgeV0bJ7cV6248h', 'umiS0Rh0xc9l5m755eVl22nsIfUmDmKy',
        't7lYG6oewkhgrGzr3wHGF5ihwkFqqmAD', '2TGOT8VEOjOgsc9weEtvvT1JYkOvyGMH');
        $apiKey = $apiKeyArray[array_rand($apiKeyArray)];

        // print_r("GET SHORTEST");

        $valid_key = array();
        $destinations_array = [];
        foreach ($destination_coordinat as $key => $dest) {
           array_push($valid_key, $key);
            $dest_latlong = preg_split ("/\,/", $dest);
            $dest_array = array(
                "point" => array(
                    "latitude" => (float)$dest_latlong[0],
                    "longitude" => (float)$dest_latlong[1]
                )
            );
            array_push($destinations_array, $dest_array);
        };

        $origin_latlong = preg_split ("/\,/", $origins);
        $origins_array = array(
            "point" => array(
                "latitude" => (float)$origin_latlong[0],
                "longitude" => (float)$origin_latlong[1]
            )
        );

        log_message('info', "EXECUTE SHORTEST MAPS");
        $results = $this->hitApi($origins_array, $destinations_array);
        
        $matrix = $results['matrix'][0];

        for ($i =0; $i < count($matrix); $i++) { 
            $travelTime = $matrix[$i]['response']['routeSummary']['travelTimeInSeconds'];
            if ($travelTime < $start_dest){
                $start_dest = $travelTime;
                $key_min = $valid_key[$i];
            }
        }

        return array($key_min, $start_dest); 
    }

    private function recursiveAddress($origins, $destination_fix, $destination_coordinat, $totalTime){
        $timeDriving = 0;
        $keyMin = 0;
        
        $shortingResult = $this->getShortestMap($origins, $destination_coordinat);

        $keyMin = $shortingResult[0];
        $timeDriving = $shortingResult[1];
        
        $totalTime += $timeDriving;

        unset($destination_coordinat[$keyMin]);

        return array($keyMin, $destination_coordinat, $totalTime, $timeDriving);
    }
    
    public function setDriver()
	{
        $session = session();
        
        $batchId = $this->request->getGet('batch');
		$dayId = $this->request->getGet('day');
        $timeId = $this->request->getGet('time');

        $model = new Catering_order_detail_model();
        $orders = $model->getBuyerByBatchDayTime($batchId, $dayId, $timeId)->getResult();

        $dayModel = new Day_model();
        $dayData = $dayModel->getDay($dayId)->getRow(0);

        $time_name = "";
        if ($timeId == 1) { 
            $time_name = "Lunch";
        } else { $time_name = "Dinner"; };
        
        $origins_coordinat = "3.580994,98.662378"; //Jl. Darat No.14
        $destination_coordinat = array();

        foreach ($orders as $order) {
            $destination_coordinat += array($order->id => preg_replace('/\s+/', '', $order->latlong));
        };

        // Pencarian tujuan awal pengantaran
        $start_dest = 99999999;
        $key_min = 0;
        $origins = $origins_coordinat;
        $nextDestArray = $destination_coordinat;

        $arrayDriverAll = array();
        $arrayDriverSorted = array();

        $arrayTimePerDriver = array();
        $arrayTimePerStep = array();
        $totalTime = 0;

        while (count($nextDestArray) > 0) {

            $nextDest = [];
            $nextDest = $this->recursiveAddress($origins, $destination_coordinat, $nextDestArray, $totalTime);
          
            $nextDestArray = $nextDest[1];
            
            if (count($destination_coordinat) == 0) {
                array_push($arrayDriverAll, $arrayDriverSorted);
                $arrayDriverSorted = array();
                array_push($arrayTimePerDriver, $arrayTimePerStep);
                $arrayTimePerStep = array();
            } else {
                $next_key = $nextDest[0];
                $totalTime = $nextDest[2];
                array_push($arrayTimePerStep, $nextDest[3]);

                $origins = $destination_coordinat[$next_key];
                $arrayDriverSorted += array($next_key => $origins);

                if (count($nextDestArray) == 0) {
                    array_push($arrayDriverAll, $arrayDriverSorted);
                    $arrayDriverSorted = array();
                    array_push($arrayTimePerDriver, $arrayTimePerStep);
                    $arrayTimePerStep = array();
                }
            }

        };

        $data = [
            'batchId' => $batchId,
            'dayId' => $dayId,
            'timeId' => $timeId,
            'timeName' => $time_name,
            'orders' => $orders,
            'drivers' => $arrayDriverAll,
            'drivingTime' => $arrayTimePerDriver,
            'day' => $dayData
        ];

        // print_r($data);
        
        echo view('Admin/Snippet_header');
        echo view('Admin/Driver_view', $data);
        echo view('Admin/Snippet_footer');
    }

    public function driverOrder()
	{
        $session = session();
        
        $batchId = $this->request->getGet('batch');
		$dayId = $this->request->getGet('day');
        $timeId = $this->request->getGet('time');

        $model = new Catering_order_detail_model();
        $orders = $model->getBuyerByBatchDayTime($batchId, $dayId, $timeId)->getResult();

        $data = [
            'batchId' => $batchId,
            'dayId' => $dayId,
            'timeId' => $timeId,
            'orders' => $orders
        ];

        
        echo view('Admin/Snippet_header');
        echo view('Admin/Driver_order_view', $data);
        echo view('Admin/Snippet_footer');
    }


    
    private function recursiveAddress2($origins, $destination_fix, $destination_coordinat, $totalTime, $numDelivery){
        $client = \Config\Services::curlrequest();

        $timeDriving = 999999999;
        $keyMin = 0;

        $destinations_array = [];
        $valid_key = array();
        foreach ($destination_coordinat as $key => $dest) {
            array_push($valid_key, $key);
            $dest_latlong = preg_split ("/\,/", $dest);
            $dest_array = array(
                "point" => array(
                    "latitude" => (float)$dest_latlong[0],
                    "longitude" => (float)$dest_latlong[1]
                )
            );
            array_push($destinations_array, $dest_array);
        };
        $origin_latlong = preg_split ("/\,/", $origins);
        $origins_array = array(
            "point" => array(
                "latitude" => (float)$origin_latlong[0],
                "longitude" => (float)$origin_latlong[1]
            )
        );

        log_message('info', "EXECUTE  ROUTE");
        $results = $this->hitApi($origins_array, $destinations_array);
        $matrix = $results['matrix'][0];
        for ($i =0; $i < count($matrix); $i++) { 
            $travelTime = $matrix[$i]['response']['routeSummary']['travelTimeInSeconds'];
            if ($travelTime < $timeDriving){
                $timeDriving = $travelTime;
                $keyMin = $valid_key[$i];
            }
        }
        
        $totalTime += $timeDriving;
        $numDelivery++;

        unset($destination_coordinat[$keyMin]);

        return array($keyMin, $destination_coordinat, $totalTime, $timeDriving, $numDelivery);
    }

    private function getTimeDelivery($origin, $destination){
        $client = \Config\Services::curlrequest();

        $apiKeyArray = array('yg8sdwemk0cretg7WPsuJUZzMwwNyRAH', '6eGMp1Iy9lnkAchyBnL3bLLIsZQMkEuG',
                'qVYbbzKcW3vxxb5E9TgeV0bJ7cV6248h', 'umiS0Rh0xc9l5m755eVl22nsIfUmDmKy',
                't7lYG6oewkhgrGzr3wHGF5ihwkFqqmAD', '2TGOT8VEOjOgsc9weEtvvT1JYkOvyGMH');
        $apiKey = $apiKeyArray[array_rand($apiKeyArray)];

        log_message('info', "GET TIME DELIVERY");
        log_message('info', $origin.':'.$destination );
        
        $response = $client->request('GET', 'https://api.tomtom.com/routing/1/calculateRoute/'. $origin .':'. $destination .'/json?key='.$apiKey)->getBody();
        log_message('info', json_encode($response));
        $valDuration = (array)json_decode($response, true)['routes'][0]['summary']['travelTimeInSeconds'];
        $valDistance = (array)json_decode($response, true)['routes'][0]['summary']['lengthInMeters'];
        
        return array($valDuration[0], $valDistance[0]);
    }


    public function deliveryRoute(){
        $session = session();
        
        $route = $this->request->getGet('route');

        $routeRaw = preg_split ("/\,/", $route);

        $routeClean = [];
        $routeCleanSplit = [];
        foreach ($routeRaw as $rt) {
            $routeSplit = preg_split ("/\@/", $rt);
            array_push($routeClean, $routeSplit[0]);
            array_push($routeCleanSplit, $routeSplit);
        };

        $model = new Catering_order_detail_model();
        $orders = $model->getMultipleOrder($routeClean)->getResult();

        $origins_coordinat = "3.580994,98.662378"; //Jl. Darat No.14
        $next_destination = $origins_coordinat;
        $destination_coordinat = array();

        $totalDistance = 0;
        $arrayTimePerStep = array();
        $arrayDriverSorted = array();

        $destination_sorted = [];
        $total_time = 0;

        for ($i=0; $i < count($routeCleanSplit); $i++) { 
            foreach ($routeCleanSplit as $split){
                if ($split[1] == $i) {
                    $id = $split[0];
                    $latlong = $orders[array_search($id, array_column($orders, 'id'))]->latlong;
                    $timeAndDistance = $this->getTimeDelivery($next_destination, preg_replace('/\s+/', '', $latlong));
                    $next_destination = preg_replace('/\s+/', '', $latlong);
                    $totalDistance += $timeAndDistance[1];

                    array_push($arrayTimePerStep, $timeAndDistance[0]);
                    $arrayDriverSorted += array($id => $next_destination);
                    break;
                };
            };
        };

        $data = [
            'status' => 'setup',
            'route' => $route,
            'orders' => $orders,
            'drivers' => $arrayDriverSorted,
            'drivingTime' => $arrayTimePerStep,
            'totalDistance' => $totalDistance
        ];
        
        echo view('Admin/Snippet_header');
        echo view('Admin/Driver_deliver_view', $data);
        echo view('Admin/Snippet_footer');
    }

    public function startDriving(){
        $session = session();
        
        $route = $this->request->getPost('route');
        $deliveryTime = $this->request->getPost('drivingTime');
        $name = $this->request->getPost('driverName');
        $phone = $this->request->getPost('driverPhone');

        $deliveryModel = new Delivery_data_model();
        $deliveryPointModel = new Delivery_point_model();
        $orderModel = new Catering_order_detail_model();

        $deliveryTimeArr = json_decode($deliveryTime);

        $routeRaw = preg_split ("/\,/", $route);

        $routeClean = [];
        foreach ($routeRaw as $rt) {
            $routeSplit = preg_split ("/\@/", $rt);
            array_push($routeClean, $routeSplit);
        };

        $data = [
            'driver_name' => $name,
            'driver_phone' => $phone,
            'num_delivery' => count($routeClean),
            'start_delivered' => "-",
            'end_delivered' => "-",
            'delivery_date' => date("d-m-Y")
        ];

        $delivId = $deliveryModel->saveDelivery($data);

        $firstDelivOrderId = 0;

        $idx = 0;
        foreach ($routeClean as $rtc){
            if ($rtc[1] == 0){
                $firstDelivOrderId = $rtc[0];
            }

            $data = [
                'catering_order_detail_id' => $rtc[0],
                'delivery_data_id' => $delivId,
                'position' => $rtc[1],
                'delivery_time' => $deliveryTimeArr[$idx],
                'status' => false
            ];
    
            $pointId = $deliveryPointModel->savePoint($data);
            $idx++;
        }

        $url = "/admin/driver/delivery?id=".$delivId;

        return redirect()->to($url);
    }

    public function delivery(){
        $session = session();
        
        $delivId = $this->request->getGet('id');

        $deliveryModel = new Delivery_data_model();
        $deliveryPointModel = new Delivery_point_model();

        $delivData = $deliveryModel->getDelivery($delivId)->getRow(0);
        $delivPoint = $deliveryPointModel->getPointDelivery($delivId)->getResult();

        $routeClean = [];
        foreach ($delivPoint as $pt) {
            array_push($routeClean, $pt->catering_order_detail_id);
        };

        $model = new Catering_order_detail_model();
        $orders = $model->getMultipleOrder($routeClean)->getResult();

        $origins_coordinat = "3.580994,98.662378"; //Jl. Darat No.14
        $next_destination = $origins_coordinat;
        $destination_coordinat = array();

        $arrayTimePerStep = array();
        $arrayDriverSorted = array();

        $destination_sorted = [];
        $total_time = 0;

        for ($i=0; $i < count($delivPoint); $i++) { 
            foreach ($delivPoint as $point){
                if ($point->position == $i) {
                    $id = $point->catering_order_detail_id;
                    $latlong = $orders[array_search($id, array_column($orders, 'id'))]->latlong;
                    $next_destination = preg_replace('/\s+/', '', $latlong);
                    
                    array_push($arrayTimePerStep, $point->delivery_time);
                    $arrayDriverSorted += array($id => $next_destination);
                    break;
                };
            };
        };

        $data = [
            'status' => 'ontheway',
            'delivery' => $delivData,
            'deliveryPoint' => $delivPoint,
            'route' => $route,
            'orders' => $orders,
            'drivers' => $arrayDriverSorted,
            'drivingTime' => $arrayTimePerStep
        ];

        echo view('Admin/Snippet_header');
        echo view('Admin/Driver_deliver_view', $data);
        echo view('Admin/Snippet_footer');
    }
    

    public function saveRecord(){

        $name = $this->request->getPost('name');
        $package = $this->request->getPost('package');

        $dataArr = [];
        for ($i=0; $i < count($name) ; $i++) { 
            $driver = $name[$i].';'.$package[$i];
            array_push($dataArr, $driver);
        };

        $now_date = date("Y-m-d H:i:s");

        $data = [
            'delivery_date' => $now_date,
            'driver_data' => json_encode($dataArr)
        ];

        $driverRecordModel = new Driver_record_model();
        $driverRecordModel->saveDriver($data);

        $url = $this->request->getPost('url');

        return redirect()->to($url);
    }

}

ini_set('max_execution_time', 480);