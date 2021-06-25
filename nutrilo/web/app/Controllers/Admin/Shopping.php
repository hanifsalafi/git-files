<?php namespace App\Controllers\Admin;

use CodeIgniter\Controller;
use App\Models\Admin\Menu_model;
use App\Models\Admin\User_model;
use App\Models\Admin\Shopping_plan_model;
use App\Models\Admin\Shopping_plan_list_model;
use App\Models\Admin\Shopping_list_model;
use App\Models\Admin\Shopping_list_item_model;
use App\Models\Admin\Ingredients_data_model;
use App\Models\Admin\Ingredients_data_history_model;
use App\Models\Admin\Ingredients_unit_model;
use App\Models\Admin\Ingredients_category_model;
use App\Models\Admin\In_stock_model;
use App\Models\Admin\Out_stock_model;
use App\Models\Admin\Payment_type_model;
use App\Libraries\Pdf;

class Shopping extends Controller
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
				echo view('Admin/Shopping_view');
				echo view('Admin/Snippet_footer');
			}
			
		}
    }

    public function shoppingPlan(){
        $session = session();

		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/login');
		} else{
			if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {
                $shoppingPlanModel = new Shopping_plan_model();
                $shoppingPlanListModel = new Shopping_plan_list_model();
                $ingredientModel = new Ingredients_data_model();
                $unitModel = new Ingredients_unit_model();

                $ingredients = $ingredientModel->getIngredients();
                $units = $unitModel->getUnit();

                $data = [
                    'shopping_plan' => $shoppingPlanModel->getPlan(),
                    'shopping_plan_list' => $shoppingPlanListModel->getPlanList(),
                    'ingredients' => $ingredients,
                    'units' => $units
                ];
                

                echo view('Admin/Snippet_header');
				echo view('Admin/Shopping_plan_view', $data);
				echo view('Admin/Snippet_footer');
			}
			
		}
    }

    public function shoppingPlanAdd(){
        $session = session();

		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/login');
		} else{
			if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {
                $ingredientModel = new Ingredients_data_model();
                $ingredients = $ingredientModel->getIngredients();

                $unitModel = new Ingredients_unit_model();
                $unit = $unitModel->getUnit();

                $data = [
                    'title' => 'Tambah',
                    'ingredients' => $ingredients,
                    'units' => $unit,
                    'item_list' => []
                ];
                
                echo view('Admin/Snippet_header');
				echo view('Admin/Shopping_plan_add_view', $data);
				echo view('Admin/Snippet_footer');
			}
			
		}
    }

    public function shoppingPlanEdit(){
        $session = session();

		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/login');
		} else{
			if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {
                $planId = $this->request->getGet('id');

                $ingredientModel = new Ingredients_data_model();
                $ingredients = $ingredientModel->getIngredients();

                $unitModel = new Ingredients_unit_model();
                $unit = $unitModel->getUnit();
                
                $shoppingPlanModel = new Shopping_plan_model();
                $plan = $shoppingPlanModel->getPlan($planId)->getRow(0);

                $shoppingPlanListModel = new Shopping_plan_list_model();
                $items = $shoppingPlanListModel->getPlanListByPlanId($planId)->getResult();

                $data = [
                    'title' => 'Edit',
                    'ingredients' => $ingredients,
                    'units' => $unit,
                    'plan' => $plan,
                    'item_list' => $items
                ];
                
                echo view('Admin/Snippet_header');
				echo view('Admin/Shopping_plan_add_view', $data);
				echo view('Admin/Snippet_footer');
			}
			
		}
    }

    public function saveShoppingPlan()
    {
        $session = session();
        
        helper('text');

		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/login');
		} else {
            if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {
                $ingredientModel = new Ingredients_data_model();
                $shoopingPlanModel = new Shopping_plan_model();
                $shoopingPlanListModel = new Shopping_plan_list_model();

                $now_date = date("Y-m-d H:i:s");

                $name = $this->request->getPost('name');
                $shopping_date = $this->request->getPost('shopping_date');
                $shopping_date = $this->request->getPost('shopping_date');
                $other_info = $this->request->getPost('other_info');
                $ingredients = $this->request->getPost('ingredients');
                $quantity = $this->request->getPost('quantity');

                $dataPlan = [
                    'name' => $name,
                    'shopping_date' => $shopping_date,
                    'other_info' => $other_info,
                    'status' => 1, //1=belum dibelanjakan, 2=sudah dibelanjakan
                ];

                $resultId = $shoopingPlanModel->savePlan($dataPlan);

                if ($resultId != "") {
                    for ($i=0; $i < count($quantity); $i++) { 
                        $itemList = [
                            'shopping_plan_id' => $resultId,
                            'ingredient_id' => $ingredients[$i],
                            'quantity' => $quantity[$i],
                        ];
    
                        $shoopingPlanListModel->savePlanList($itemList);
                    };
    
                };

				return redirect()->to('/shopping/plan');
            }
        }
    }

    public function updateShoppingPlan()
    {
        $session = session();
        
        helper('text');

		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/login');
		} else {
            if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {

                $planId = $this->request->getPost('plan_id');
                
                $ingredientModel = new Ingredients_data_model();
                $shoopingPlanModel = new Shopping_plan_model();
                $shoopingPlanListModel = new Shopping_plan_list_model();

                $now_date = date("Y-m-d H:i:s");

                $name = $this->request->getPost('name');
                $shopping_date = $this->request->getPost('shopping_date');
                $other_info = $this->request->getPost('other_info');
                $ingredients = $this->request->getPost('ingredients');
                $quantity = $this->request->getPost('quantity');

                $dataPlan = [
                    'name' => $name,
                    'shopping_date' => $shopping_date,
                    'other_info' => $other_info,
                    'status' => 1, //1=belum dibelanjakan, 2=sudah dibelanjakan
                ];

                $resultId = $shoopingPlanModel->updatePlan($dataPlan, $planId);
                $resultDelete = $shoopingPlanListModel->deletePlanItemByData($planId);

                for ($i=0; $i < count($quantity); $i++) { 
                    $itemList = [
                        'shopping_plan_id' => $planId,
                        'ingredient_id' => $ingredients[$i],
                        'quantity' => $quantity[$i],
                    ];

                    $shoopingPlanListModel->savePlanList($itemList);
                };

				return redirect()->to('/shopping/plan');
            }
        }
    }

    public function deleteShoppingPlan()
    {
        $session = session();

		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/login');
		} else {
            if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {

                $planId = $this->request->getGet('id');

                $shoppingPlanModel = new Shopping_plan_model();
                $shoppingPlanListModel = new Shopping_plan_list_model();

                $resultDelete = $shoppingPlanListModel->deletePlanItemByData($planId);
                $result = $shoppingPlanModel->deletePlan($planId);

                return redirect()->to('/shopping/plan');
            }
        }   
    }

    public function shoppingAction(){

        $session = session();

		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/login');
		} else{
			if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {
                $shoppingListModel = new Shopping_list_model();
                $shoppingListItemModel = new Shopping_list_item_model();
                $shoppingPlanModel = new Shopping_plan_model();
                $shoppingPlanListModel = new Shopping_plan_list_model();
                $ingredientModel = new Ingredients_data_model();
                $unitModel = new Ingredients_unit_model();
                $paymentType = new Payment_type_model();

                $unrealizedPlan = $shoppingPlanModel->getUnrealizedPlan()->getResult();
                $unrealizedPlanItem = $shoppingPlanListModel->getUnrealizedPlan()->getResult();
                $ingredients = $ingredientModel->getIngredients();
                $units = $unitModel->getUnit();

                $data = [
                    'unrealized_plan' =>  $unrealizedPlan,
                    'unrealized_plan_item' => $unrealizedPlanItem,
                    'shopping_list' => $shoppingListModel->getList(),
                    'shopping_list_item' => $shoppingListItemModel->getListItem(),
                    'ingredients' => $ingredients,
                    'units' => $units
                ];

                // print_r($data['shopping_list_item']);

                echo view('Admin/Snippet_header');
				echo view('Admin/Shopping_list_view', $data);
				echo view('Admin/Snippet_footer');
			}
			
		}
    }
    
    public function shoppingActionAdd(){
        $session = session();

		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/login');
		} else{
			if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {
                $shoppingListModel = new Shopping_list_model();
                $shoppingPlanModel = new Shopping_plan_model();
                $shoppingPlanListModel = new Shopping_plan_list_model();
                $ingredientModel = new Ingredients_data_model();
                $unitModel = new Ingredients_unit_model();
                $paymentType = new Payment_type_model();

                $unrealizedPlan = $shoppingPlanModel->getUnrealizedPlan()->getResult();
                $ingredients = $ingredientModel->getIngredients();
                $payments = $paymentType->getPaymentType();
                $units = $unitModel->getUnit();

                $data = [
                    'title' => 'Tambah',
                    'unrealized_plan' =>  $unrealizedPlan,
                    'shopping_plan_list' => $shoppingPlanListModel->getPlanList(),
                    'ingredients' => $ingredients,
                    'units' => $units,
                    'payments' => $payments,
                    'data_item' => [],
                ];

                // print_r($data['unrealized_plan']);
                
                echo view('Admin/Snippet_header');
				echo view('Admin/Shopping_list_add_view', $data);
				echo view('Admin/Snippet_footer');
			}
			
		}
    }

    public function saveShoppingList()
    {
        $session = session();
        
        helper('text');

		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/login');
		} else {
            if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {
                $ingredientModel = new Ingredients_data_model();
                $shoopingListModel = new Shopping_list_model();
                $shoopingListItemModel = new Shopping_list_item_model();
                $shoppingPlanModel = new Shopping_plan_model();

                $now_date = date("Y-m-d H:i:s");
                $code = random_string('nozero', 15);

                $shopping_plan_id = $this->request->getPost('shopping_plan_id');
                $name = $this->request->getPost('name');
                $phone = $this->request->getPost('phone');
                $shopping_date = $this->request->getPost('shopping_date');
                $shopping_place = $this->request->getPost('shopping_place');
                $payment_type = $this->request->getPost('payment_type');
                $money_source = $this->request->getPost('money_source');
                $other_info = $this->request->getPost('other_info');
                $ingredients = $this->request->getPost('ingredients');
                $quantity = $this->request->getPost('quantity');
                $unit_price = $this->request->getPost('unit_price');
                $total_price = $this->request->getPost('total_price');
                $total_costs = $this->request->getPost('total_costs');
                $other_costs = $this->request->getPost('other_costs');
                $other_costs_detail = $this->request->getPost('other_costs_detail');

                $dataShopping = [
                    'shopping_plan_id' => $shopping_plan_id,
                    'number_reference' => $code,
                    'name' => $name,
                    'phone' => $phone,
                    'shopping_date' => $shopping_date,
                    'shopping_place' => $shopping_place,
                    'payment_type_id' => $payment_type,
                    'total_costs' => $total_costs,
                    'money_source' => $money_source,
                    'other_costs' => $other_costs,
                    'other_costs_detail' => $other_costs_detail,
                    'other_info' => $other_info,
                    'status' => 1, //1 = belum lunas, 2=sudah lunas
                ];

                $resultId = $shoopingListModel->saveList($dataShopping);

                if  ($shopping_plan_id != null) {
                    $shoppingPlanModel->updateShopped($shopping_plan_id);
                }

                if ($resultId != "") {
                    for ($i=0; $i < count($quantity); $i++) { 
                        $itemList = [
                            'ingredient_id' => $ingredients[$i],
                            'shopping_list_id' => $resultId,
                            'quantity' => $quantity[$i],
                            'unit_price' => $unit_price[$i],
                            'total_price' => $total_price[$i],
                        ];
    
                        $shoopingListItemModel->saveListItem($itemList);
                    };
                };

				return redirect()->to('/shopping/data');
            }
        }
    }

    public function shoppingActionEdit(){
        $session = session();

		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/login');
		} else{
			if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {

                $id = $this->request->getGet('id');

                $shoppingListModel = new Shopping_list_model();
                $shoppingListItemModel = new Shopping_list_item_model();
                $shoppingPlanListModel = new Shopping_plan_list_model();
                $ingredientModel = new Ingredients_data_model();
                $unitModel = new Ingredients_unit_model();
                $paymentType = new Payment_type_model();

                $shoppingData = $shoppingListModel->getList($id)->getRow(0);
                $shoppingDataItem = $shoppingListItemModel->getListItemById($id)->getResult();

                $ingredients = $ingredientModel->getIngredients();
                $payments = $paymentType->getPaymentType();
                $units = $unitModel->getUnit();

                $data = [
                    'title' => 'Edit',
                    'data' =>  $shoppingData,
                    'data_item' => $shoppingDataItem,
                    'ingredients' => $ingredients,
                    'units' => $units,
                    'payments' => $payments
                ];

                // print_r($data['unrealized_plan']);
                
                echo view('Admin/Snippet_header');
				echo view('Admin/Shopping_list_add_view', $data);
				echo view('Admin/Snippet_footer');
			}
			
		}
    }

    public function updateShoppingList()
    {
        $session = session();
        
        helper('text');

		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/login');
		} else {
            if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {
                $ingredientModel = new Ingredients_data_model();
                $shoppingListModel = new Shopping_list_model();
                $shoppingListItemModel = new Shopping_list_item_model();

                $shopId = $this->request->getPost('id');

                $now_date = date("Y-m-d H:i:s");             

                $shopping_plan_id = $this->request->getPost('shopping_plan_id');
                $name = $this->request->getPost('name');
                $shopping_date = $this->request->getPost('shopping_date');
                $shopping_place = $this->request->getPost('shopping_place');
                $payment_type = $this->request->getPost('payment_type');
                $money_source = $this->request->getPost('money_source');
                $other_info = $this->request->getPost('other_info');
                $ingredients = $this->request->getPost('ingredients');
                $quantity = $this->request->getPost('quantity');
                $unit_price = $this->request->getPost('unit_price');
                $total_price = $this->request->getPost('total_price');
                $total_costs = $this->request->getPost('total_costs');
                $other_costs = $this->request->getPost('other_costs');
                $other_costs_detail = $this->request->getPost('other_costs_detail');

                $dataShopping = [
                    'shopping_plan_id' => $shopping_plan_id,
                    'name' => $name,
                    'shopping_date' => $shopping_date,
                    'shopping_place' => $shopping_place,
                    'payment_type_id' => $payment_type,
                    'total_costs' => $total_costs,
                    'money_source' => $money_source,
                    'other_costs' => $other_costs,
                    'other_costs_detail' => $other_costs_detail,
                    'other_info' => $other_info,
                    'status' => 1, //1 = belum lunas, 2=sudah lunas
                ];

                print_r($dataShopping);

                $resultId = $shoppingListModel->updateList($dataShopping, $shopId);
                $resultDelete = $shoppingListItemModel->deleteListItemByData($shopId);

                print_r($quantity);
            
                for ($i=0; $i < count($quantity); $i++) { 
                    $itemList = [
                        'ingredient_id' => $ingredients[$i],
                        'shopping_list_id' => $shopId,
                        'quantity' => $quantity[$i],
                        'unit_price' => $unit_price[$i],
                        'total_price' => $total_price[$i],
                    ];

                    $shoppingListItemModel->saveListItem($itemList);
                };

				return redirect()->to('/shopping/data');
            }
        }
    }

    public function deleteShopping()
    {
        $session = session();

		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/login');
		} else {
            if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {

                $shopId = $this->request->getGet('id');

                $shoppingListModel = new Shopping_list_model();
                $shoppingListItemModel = new Shopping_list_item_model();

                $resultDelete = $shoppingListItemModel->deleteListItemByData($shopId);
                $result = $shoppingListModel->deleteList($shopId);

                return redirect()->to('/shopping/data');
            }
        }   
    }

    public function shoppingActionAddPlan(){
        $session = session();

		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/login');
		} else{
			if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {

                $id = $this->request->getGet('id');

                $shoppingListModel = new Shopping_list_model();
                $shoppingListItemModel = new Shopping_list_item_model();
                $shoppingPlanModel = new Shopping_plan_model();
                $shoppingPlanListModel = new Shopping_plan_list_model();
                $ingredientModel = new Ingredients_data_model();
                $unitModel = new Ingredients_unit_model();
                $paymentType = new Payment_type_model();

                $planData = $shoppingPlanModel->getPlan($id)->getRow(0);
                $planListData = $shoppingPlanListModel->getPlanListByPlanId($id)->getResult();

                $ingredients = $ingredientModel->getIngredients();
                $payments = $paymentType->getPaymentType();
                $units = $unitModel->getUnit();

                $data = [
                    'planData' =>  $planData,
                    'planList' => $planListData,
                    'ingredients' => $ingredients,
                    'units' => $units,
                    'payments' => $payments
                ];

                // print_r($data['unrealized_plan']);
                
                echo view('Admin/Snippet_header');
				echo view('Admin/Shopping_plan_add_list_view', $data);
				echo view('Admin/Snippet_footer');
			}
			
		}
    }

};