<?php namespace App\Controllers\Admin;
 
use CodeIgniter\RESTful\ResourceController;
use App\Models\Admin\Catering_buyer_model;
use App\Models\Admin\Catering_order_detail_model;
use App\Models\Admin\Delivery_data_model;
use App\Models\Admin\Delivery_point_model;

class Rest_api extends ResourceController
{
    protected $format = 'json';

    public function index($keyword = NULL)
    {   
        $model = new Catering_buyer_model();

        $get = $model->getBuyerByName($keyword);
        // print_r($get->getResult('array'));
        
        if($get){
            $data = array();
            foreach ($get->getResult('array') as $row) {
                $buyer = [
                    'id' => $row['id'],
                    'name' => $row['name'],
                ];
                array_push($data, $buyer);
            }
            $response = [
                'status' => 200,
                'error' => false,
                'data' => $data,
            ];
            return $this->respond($response, 200);
        } else {
            $msg = ['message' => 'Not Found'];
            $response = [
                'status' => 404,
                'error' => false,
                'data' => $msg,
            ];
            return $this->respond($response, 404);
        }
    }

    public function setActiveBuyer($id)
    {   
        $model = new Catering_buyer_model();

        $data = [
            'is_active' => true
        ];

        $get = $model->updateBuyer($data, $id);
        
        if($get){
            $response = [
                'status' => 200,
                'error' => false
            ];
            return $this->respond($response, 200);
        } else {
            $response = [
                'status' => 404,
                'error' => true,
            ];
            return $this->respond($response, 404);
        }
    }

    public function setInactiveBuyer($id)
    {   
        $model = new Catering_buyer_model();

        $data = [
            'is_active' => false
        ];

        $get = $model->updateBuyer($data, $id);
        
        if($get){
            $response = [
                'status' => 200,
                'error' => false
            ];
            return $this->respond($response, 200);
        } else {
            $response = [
                'status' => 404,
                'error' => true,
            ];
            return $this->respond($response, 404);
        }
    }

    public function setFinishDelivery($id)
    {   
        $deliveryModel = new Delivery_data_model();
        $deliveryPointModel = new Delivery_point_model();

        $data = [
            'status' => true,
            'updated_time' => date("d-m-Y H:i:s")
        ];

        $get = $deliveryPointModel->updatePoint($data, $id);
        
        if($get){
            $response = [
                'status' => 200,
                'error' => false
            ];
            return $this->respond($response, 200);
        } else {
            $response = [
                'status' => 404,
                'error' => true,
            ];
            return $this->respond($response, 404);
        }
    }

    public function setLastFinishDelivery($id)
    {   
        $deliveryModel = new Delivery_data_model();
        $deliveryPointModel = new Delivery_point_model();

        $data = [
            'status' => true,
            'updated_time' => date("d-m-Y H:i:s")
        ];

        $get = $deliveryPointModel->updatePoint($data, $id);
        
        if($get){
            $dataUpdate = [
                'end_delivered' => date("d-m-Y H:i:s")
            ];
            $deliv = $deliveryModel->updateDelivery($dataUpdate, $get->getRow(0)->delivery_data_id);
            $response = [
                'status' => 200,
                'error' => false,
            ];
            return $this->respond($response, 200);
        } else {
            $response = [
                'status' => 404,
                'error' => true,
            ];
            return $this->respond($response, 404);
        }
    }

    public function sendSMS($name, $phone, $minute){
        // $userkey = '66943876f48c';
        // $passkey = '24d3f79d7863e340b59d3e5a';
        // $telepon = $phone;
        // $message = 'Hai '. $name .'. Makanan dari NUTRILO akan sampai dalam '. $minute .' menit. Mohon untuk bersiap menunggu. Jika ada kendala, silahkan hubungi kontak Nutrilo di Whatsapp. Terimakasih :)';
        // $url = 'https://console.zenziva.net/reguler/api/sendsms/';
        // $curlHandle = curl_init();
        // curl_setopt($curlHandle, CURLOPT_URL, $url);
        // curl_setopt($curlHandle, CURLOPT_HEADER, 0);
        // curl_setopt($curlHandle, CURLOPT_RETURNTRANSFER, 1);
        // curl_setopt($curlHandle, CURLOPT_SSL_VERIFYHOST, 2);
        // curl_setopt($curlHandle, CURLOPT_SSL_VERIFYPEER, 0);
        // curl_setopt($curlHandle, CURLOPT_TIMEOUT,30);
        // curl_setopt($curlHandle, CURLOPT_POST, 1);
        // curl_setopt($curlHandle, CURLOPT_POSTFIELDS, array(
        //     'userkey' => $userkey,
        //     'passkey' => $passkey,
        //     'to' => $telepon,
        //     'message' => $message
        // ));
        // $results = json_decode(curl_exec($curlHandle), true);
        // curl_close($curlHandle);

        $userkey = '66943876f48c';
        $passkey = '24d3f79d7863e340b59d3e5a';
        $telepon = $phone;
        $day   = date('l');
        $dayIDN = array('Monday'  => 'Senin',
           'Tuesday'  => 'Selasa',
           'Wednesday' => 'Rabu',
           'Thursday' => 'Kamis',
           'Friday' => 'Jumat',
           'Saturday' => 'Sabtu',
           'Sunday' => 'Minggu');
        $eatTime = "lunch";
        if (date("H") > 15){
            $eatTime = "dinner";
        };
        $message = "Hai *". $name ."*. \r\nSelamat hari ".$dayIDN[$day].":) \r\nMakanan ".$eatTime." dari *NUTRILO* akan sampai dalam *". $minute ." menit*. Mohon untuk bersiap menunggu. \r\nJika ada kendala, silahkan hubungi kontak *NUTRILO* di 085275486193. Terimakasih :) \r\n\r\n*- Don't Reply -*";
        $url = 'https://console.zenziva.net/wareguler/api/sendWA/';
        $curlHandle = curl_init();
        curl_setopt($curlHandle, CURLOPT_URL, $url);
        curl_setopt($curlHandle, CURLOPT_HEADER, 0);
        curl_setopt($curlHandle, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($curlHandle, CURLOPT_SSL_VERIFYHOST, 2);
        curl_setopt($curlHandle, CURLOPT_SSL_VERIFYPEER, 0);
        curl_setopt($curlHandle, CURLOPT_TIMEOUT,30);
        curl_setopt($curlHandle, CURLOPT_POST, 1);
        curl_setopt($curlHandle, CURLOPT_POSTFIELDS, array(
            'userkey' => $userkey,
            'passkey' => $passkey,
            'to' => $telepon,
            'message' => $message
        ));
        $results = json_decode(curl_exec($curlHandle), true);
        curl_close($curlHandle);

        if ($results['status'] == "1") {
            $response = [
                'status' => 200,
                'error' => false,
                'data' => $results
            ];
            return $this->respond($response, 200);
        } else {
            $response = [
                'status' => 200,
                'error' => true,
                'data' => $results
            ];
            return $this->respond($response, 200);
        }
    }

    public function sendFirstSMS($name, $phone, $minute, $deliv_id){
        // $userkey = '66943876f48c';
        // $passkey = '24d3f79d7863e340b59d3e5a';
        // $telepon = $phone;
        // $message = 'Hai '. $name .'. Makanan dari NUTRILO akan sampai dalam '. $minute .' menit. Mohon untuk bersiap menunggu. Jika ada kendala, silahkan hubungi kontak Nutrilo di Whatsapp. Terimakasih :)';
        // $url = 'https://console.zenziva.net/reguler/api/sendsms/';
        // $curlHandle = curl_init();
        // curl_setopt($curlHandle, CURLOPT_URL, $url);
        // curl_setopt($curlHandle, CURLOPT_HEADER, 0);
        // curl_setopt($curlHandle, CURLOPT_RETURNTRANSFER, 1);
        // curl_setopt($curlHandle, CURLOPT_SSL_VERIFYHOST, 2);
        // curl_setopt($curlHandle, CURLOPT_SSL_VERIFYPEER, 0);
        // curl_setopt($curlHandle, CURLOPT_TIMEOUT,30);
        // curl_setopt($curlHandle, CURLOPT_POST, 1);
        // curl_setopt($curlHandle, CURLOPT_POSTFIELDS, array(
        //     'userkey' => $userkey,
        //     'passkey' => $passkey,
        //     'to' => $telepon,
        //     'message' => $message
        // ));
        // $results = json_decode(curl_exec($curlHandle), true);
        
        $userkey = '66943876f48c';
        $passkey = '24d3f79d7863e340b59d3e5a';
        $telepon = $phone;
        $day   = date('l');
        $dayIDN = array('Monday'  => 'Senin',
           'Tuesday'  => 'Selasa',
           'Wednesday' => 'Rabu',
           'Thursday' => 'Kamis',
           'Friday' => 'Jumat',
           'Saturday' => 'Sabtu',
           'Sunday' => 'Minggu');
        $eatTime = "lunch";
        if (date("H") > 15){
            $eatTime = "dinner";
        };
        $message = "Hai *". $name ."*. \r\nSelamat hari ".$dayIDN[$day].":) \r\nMakanan ".$eatTime." dari *NUTRILO* akan sampai dalam *". $minute ." menit*. Mohon untuk bersiap menunggu. \r\nJika ada kendala, silahkan hubungi kontak *NUTRILO* di 085275486193. Terimakasih :) \r\n\r\n*- Don't Reply -*";
        $url = 'https://console.zenziva.net/wareguler/api/sendWA/';
        $curlHandle = curl_init();
        curl_setopt($curlHandle, CURLOPT_URL, $url);
        curl_setopt($curlHandle, CURLOPT_HEADER, 0);
        curl_setopt($curlHandle, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($curlHandle, CURLOPT_SSL_VERIFYHOST, 2);
        curl_setopt($curlHandle, CURLOPT_SSL_VERIFYPEER, 0);
        curl_setopt($curlHandle, CURLOPT_TIMEOUT,30);
        curl_setopt($curlHandle, CURLOPT_POST, 1);
        curl_setopt($curlHandle, CURLOPT_POSTFIELDS, array(
            'userkey' => $userkey,
            'passkey' => $passkey,
            'to' => $telepon,
            'message' => $message
        ));
        $results = json_decode(curl_exec($curlHandle), true);
        curl_close($curlHandle);

        $deliveryModel = new Delivery_data_model();
        $dataUpdate = [
            'start_delivered' => date("d-m-Y H:i:s")
        ];
        $deliv = $deliveryModel->updateDelivery($dataUpdate, $deliv_id);
        
        if($deliv){
            if ($results['status'] == "1") {
                $response = [
                    'status' => 200,
                    'error' => false,
                    'data' => $results
                ];
                return $this->respond($response, 200);
            } else {
                $response = [
                    'status' => 200,
                    'error' => true,
                    'data' => $results
                ];
                return $this->respond($response, 200);
            }
        } else {
            $response = [
                'status' => 404,
                'error' => true,
            ];
            return $this->respond($response, 404);
        }
    }

    public function apiTest(){
        $client = \Config\Services::curlrequest();

        $origin = ",";
        $dest = ",98.624088";

        $origins_array = array(
            "point" => array(
                "latitude" => 3.581005,
                "longitude" => 98.662336
            )
        );
        $destinations_array = [];
        array_push($destinations_array, array("point" => array(
            "latitude" => 3.567440,
            "longitude" => 98.628398
        )));
        array_push($destinations_array, array("point" => array(
            "latitude" => 3.567330,
            "longitude" => 98.655318
        )));

        $origins_json = array($origins_array);
        $destinations_json = $destinations_array;
        $combine_json = array(
            'origins' => $origins_json,
            'destinations' => $destinations_json
        );
        $body_json = json_encode($combine_json);

        // $response = $client->setBody($body_json)->request('POST', 'https://api.tomtom.com/routing/1/matrix/sync/json?key=umiS0Rh0xc9l5m755eVl22nsIfUmDmKy&routeType=fastest&travelMode=car')->getBody();

        $ch = curl_init();
        $headers  = [
            'Content-Type: application/json'
        ];

        $url = 'https://api.tomtom.com/routing/1/matrix/sync/json?key=umiS0Rh0xc9l5m755eVl22nsIfUmDmKy&routeType=fastest&travelMode=car';
        
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $body_json);           
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
       
        $results = json_decode(curl_exec($ch), true);
        curl_close($ch);
            
        $response = [
            'status' => 200,
            'error' => false,
            'data' =>  $results 
        ];
        return $this->respond($response, 200);
    }
    
    public function sendSMSToAdmin($time, $sms){
        $userkey = '66943876f48c';
        $passkey = '24d3f79d7863e340b59d3e5a';
        $telepon = "085275486193";
        $day   = date('l');
        $dayIDN = array('Monday'  => 'Senin',
           'Tuesday'  => 'Selasa',
           'Wednesday' => 'Rabu',
           'Thursday' => 'Kamis',
           'Friday' => 'Jumat',
           'Saturday' => 'Sabtu',
           'Sunday' => 'Minggu');
        $eatTime = "lunch";
        if ($time == 1){
            $eatTime = "lunch";
        } else {
            $eatTime = "dinner";
        };
        $message = "*Pengiriman ".$eatTime." ".$dayIDN[$day]."*\r\n\r\n".$sms;
        $url = 'https://console.zenziva.net/wareguler/api/sendWA/';
        $curlHandle = curl_init();
        curl_setopt($curlHandle, CURLOPT_URL, $url);
        curl_setopt($curlHandle, CURLOPT_HEADER, 0);
        curl_setopt($curlHandle, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($curlHandle, CURLOPT_SSL_VERIFYHOST, 2);
        curl_setopt($curlHandle, CURLOPT_SSL_VERIFYPEER, 0);
        curl_setopt($curlHandle, CURLOPT_TIMEOUT,30);
        curl_setopt($curlHandle, CURLOPT_POST, 1);
        curl_setopt($curlHandle, CURLOPT_POSTFIELDS, array(
            'userkey' => $userkey,
            'passkey' => $passkey,
            'to' => $telepon,
            'message' => $message
        ));
        $results = json_decode(curl_exec($curlHandle), true);
        curl_close($curlHandle);

        if ($results['status'] == "1") {
            $response = [
                'status' => 200,
                'error' => false,
                'data' => $results
            ];
            return $this->respond($response, 200);
        } else {
            $response = [
                'status' => 200,
                'error' => true,
                'data' => $results
            ];
            return $this->respond($response, 200);
        }
    }

    public function placeOrder($points, $time){
        $curl = curl_init(); 

        // URL & TOKEN TEST
        // $url = 'https://robotapitest.mrspeedy.co/api/business/1.1/create-order';
        // $token = 'X-DV-Auth-Token: EA6B9DB6AECC32898048BAEB1F8255623D3031CE';

        // URL & TOKEN PRODUCTION
        $url = 'https://robot.mrspeedy.co/api/business/1.1/create-order';
        $token = 'X-DV-Auth-Token: 5172EFAF776CCEF5CE920782C7CC86C6C0996C4E';

        curl_setopt($curl, CURLOPT_URL, $url); 
        curl_setopt($curl, CURLOPT_CUSTOMREQUEST, 'POST'); 
        curl_setopt($curl, CURLOPT_HTTPHEADER, [$token]); 
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true); 

       
        $data = [ 
            'matter' => 'Makanan', 
            'is_client_notification_enabled' => true,
            'is_contact_person_notification_enabled' => true,
            'is_motobox_required' => true,
            // 'is_route_optimizer_enabled ' => true,
            // 'payment_method' => "non_cash",
            'points' => $points, 
        ]; 

        log_message('info', 'REQUEST POST {request}', ['request' => json_encode($data)]);
        
        $json = json_encode($data, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES); 
        curl_setopt($curl, CURLOPT_POSTFIELDS, $json); 

        $result = curl_exec($curl);
        
        log_message('info', 'RESPONSE POST {response}', ['response' => $result]);

        $resultData = json_decode($result ,true);

        return $resultData;
    }

    public function createOrder($time, $numOrder, $detailOrder){

        $model = new Catering_order_detail_model();
        
        $detailOrderSplit = preg_split ("/\,/", $detailOrder);

        $groupArray = array_fill(0, $numOrder, []);
        
        for ($i=0; $i < count($detailOrderSplit); $i++) { 
            $orderSplit = preg_split ("/\@/", $detailOrderSplit[$i]);
            $orderId = $orderSplit[0];
            array_push($groupArray[$orderSplit[1]], $orderId);
        }

        if ($time == 1) {
            $startDatetime = date("Y-m-d")."T"."10:05:00+07:00";
            $finishDatetime = date("Y-m-d")."T"."10:30:00+07:00";
            $pickupNotes = "PICK UP JAM 10.15. ";
        } else {
            $startDatetime = date("Y-m-d")."T"."16:30:00+07:00";
            $finishDatetime = date("Y-m-d")."T"."17:00:00+07:00";
            $pickupNotes = "PICK UP JAM 16.45. ";
        }

        $startPoint = [
            'client_order_id' => "nutrilo",
            'address' => "Jl. Darat No. 14, Petisah Hulu, Medan",
            'note' => $pickupNotes,
            'latitude' => "3.580994",
            'longitude' => "98.662378",
            'required_start_datetime' => $startDatetime,
            'required_finish_datetime' => $finishDatetime,
            'contact_person' => [ 
                'name' => "Nutrilo",
                'phone' => "085275486193",
            ],
        ];        

        $resultOrderArray = [];
        $smsText = "";
        for ($i=0; $i < $numOrder; $i++) { 
            log_message('info', 'LOOP {counter}', ['counter' => $i]);
            
            $detailOrderArray = $model->getMultipleOrder($groupArray[$i])->getResult();

            $detailOrderData = [];
            foreach ($groupArray[$i] as $orderIdGroup) {
                foreach ($detailOrderArray as $detailOrderVal) {
                    if ($detailOrderVal->id == $orderIdGroup){
                        array_push($detailOrderData, $detailOrderVal);
                    }
                }
            }

            $pointsArr = [];
            $orderDetailIdArr = [];
            $index = 0;
            $namesString = "";
            foreach ($detailOrderData as $detail) {
                array_push($orderDetailIdArr, $detail->id);
                $latlong = preg_replace('/\s+/', '', $detail->latlong);
                $latlongSplit = preg_split("/\,/", $latlong);

                if ($index == 0){
                    if ($time == 1) {
                        $notesDefault = "SAMPAI DI CUSTOMER SEBELUM JAM 11.00. ";
                        $startDatetime = date("Y-m-d")."T"."10:30:00+07:00";
                        $finishDatetime = date("Y-m-d")."T"."11:00:00+07:00";
                    } else {
                        $notesDefault = "SAMPAI DI CUSTOMER SEBELUM JAM 17.30. ";
                        $startDatetime = date("Y-m-d")."T"."17:00:00+07:00";
                        $finishDatetime = date("Y-m-d")."T"."17:30:00+07:00";
                    }
                } else if ($index == 1) {
                    if ($time == 1) {
                        $notesDefault = "SAMPAI DI CUSTOMER SEBELUM JAM 11.30. ";
                        $startDatetime = date("Y-m-d")."T"."10:30:00+07:00";
                        $finishDatetime = date("Y-m-d")."T"."11:30:00+07:00";
                    } else {
                        $notesDefault = "SAMPAI DI CUSTOMER SEBELUM JAM 18.30. ";
                        $startDatetime = date("Y-m-d")."T"."17:00:00+07:00";
                        $finishDatetime = date("Y-m-d")."T"."18:30:00+07:00";
                    }
                } else {
                    if ($time == 1) {
                        $notesDefault = "SAMPAI DI CUSTOMER SEBELUM JAM 12.00. ";
                        $startDatetime = date("Y-m-d")."T"."10:30:00+07:00";
                        $finishDatetime = date("Y-m-d")."T"."11:30:00+07:00";
                    } else {
                        $notesDefault = "SAMPAI DI CUSTOMER SEBELUM JAM 19.00. ";
                        $startDatetime = date("Y-m-d")."T"."17:00:00+07:00";
                        $finishDatetime = date("Y-m-d")."T"."18:30:00+07:00";
                    }
                }
                $index++;
                
                $pointData = [
                    'client_order_id' => strtolower($detail->name),
                    'address' => $detail->address, 
                    'note' => $notesDefault."\r\n".$detail->address.". "."\r\n".$detail->driver_notes,
                    'latitude' => $latlongSplit[0],
                    'longitude' => $latlongSplit[1],
                    'required_start_datetime' => $startDatetime,
                    'required_finish_datetime' => $finishDatetime,
                    'contact_person' => [ 
                        'name' => $detail->name,
                        'phone' => $detail->phone,
                    ],
                ];
                array_push($pointsArr, $pointData);
                
                $namesString .= "[".$index."] ".$detail->name."\r\n";
            }
            array_unshift($pointsArr, $startPoint);
            $result = $this->placeOrder($pointsArr, $time);
            
            if ($result['order']['order_id'] > 0){
                $smsText .= "*Driver ".($i+1)."*\r\n".$namesString."\r\n";
            }

            $resultOrder = [
                'order_id' => $result['order']['order_id'],
                'order_detail_id' => $orderDetailIdArr
            ];
            array_push($resultOrderArray, $resultOrder);
        }
        
        $this->sendSMSToAdmin($time, $smsText);
        log_message('info', 'NOTIF {notif}', ['notif' => $smsText]);

        $response = [
            'success' => true,
            'status' => 200,
            'data' => $resultOrderArray,
            'point' => $groupArray,
            'error' => false,
        ];
        return $this->respond($response, 200);
    }

    public function calculateOrder($points){
        $curl = curl_init(); 

        // URL & TOKEN TEST
        // $url = 'https://robotapitest.mrspeedy.co/api/business/1.1/calculate-order';
        // $token = 'X-DV-Auth-Token: EA6B9DB6AECC32898048BAEB1F8255623D3031CE';

        // URL & TOKEN PRODUCTION
        $url = 'https://robot.mrspeedy.co/api/business/1.1/calculate-order';
        $token = 'X-DV-Auth-Token: 5172EFAF776CCEF5CE920782C7CC86C6C0996C4E';

        curl_setopt($curl, CURLOPT_URL, $url); 
        curl_setopt($curl, CURLOPT_CUSTOMREQUEST, 'POST'); 
        curl_setopt($curl, CURLOPT_HTTPHEADER, [$token]); 
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true); 
       
        $data = [ 
            'matter' => 'Makanan',
            'points' => $points, 
        ]; 

        log_message('info', 'ORDER CALCULATION {request}', ['request' => json_encode($data)]);
                
        $json = json_encode($data, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES); 
        curl_setopt($curl, CURLOPT_POSTFIELDS, $json); 

        $result = curl_exec($curl);

        log_message('info', 'RESPONSE ORDER CALCULATION {response}', ['response' => $result]);

        $resultData = json_decode($result ,true);

        return $resultData;
    }

    public function priceCalculation($detailOrder){
        $model = new Catering_order_detail_model();
        
        $detailOrderSplit = preg_split ("/\,/", $detailOrder);

        $detailOrderArray = $model->getMultipleOrder($detailOrderSplit)->getResult();
        
        $detailOrderData = [];
        foreach ($detailOrderSplit as $orderIdGroup) {
            foreach ($detailOrderArray as $detailOrderVal) {
                if ($detailOrderVal->id == $orderIdGroup){
                    array_push($detailOrderData, $detailOrderVal);
                }
            }
        }

        $startPoint = [
            'address' => "Jl. Darat No. 14, Petisah Hulu, Medan",
            'latitude' => "3.580994",
            'longitude' => "98.662378"
        ];      

        $pointsArr = [];
        foreach ($detailOrderData as $detail) {
            $latlong = preg_replace('/\s+/', '', $detail->latlong);
            $latlongSplit = preg_split("/\,/", $latlong);

            $pointData = [
                'address' => $detail->address,
                'latitude' => $latlongSplit[0],
                'longitude' => $latlongSplit[1],
            ];
            array_push($pointsArr, $pointData);
        }
        array_unshift($pointsArr, $startPoint);
        $result = $this->calculateOrder($pointsArr);

        $response = [
            'success' => true,
            'status' => 200,
            'price' => $result['order']['delivery_fee_amount'],
        ];
        return $this->respond($response, 200);
    }
    
}