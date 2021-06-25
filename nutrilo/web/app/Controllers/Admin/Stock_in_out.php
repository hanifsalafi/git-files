<?php namespace App\Controllers\Admin;

use CodeIgniter\Controller;
use App\Models\Admin\Ingredients_data_model;
use App\Models\Admin\Ingredients_data_history_model;
use App\Models\Admin\Ingredients_unit_model;
use App\Models\Admin\Ingredients_category_model;
use App\Models\Admin\In_stock_model;
use App\Models\Admin\Out_stock_model;
use App\Models\Admin\Payment_type_model;
use App\Models\Admin\Reason_out_stock_model;
use App\Models\Admin\Shopping_list_model;
use App\Models\Admin\Shopping_list_item_model;

class Stock_in_out extends Controller
{
	public function inStock()
	{
		$session = session();

		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/login');
		} else{
			if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {
                $ingredientModel = new Ingredients_data_model();
                $stockModel = new In_stock_model();
                $unitModel = new Ingredients_unit_model();
                $shoppingListItemModel = new Shopping_list_item_model();

                $ingredientData = $ingredientModel->getIngredients();
                $stockData = $stockModel->getStock();
                $units = $unitModel->getUnit();
                $listItemNotInStock = $shoppingListItemModel->getListItemNotInStock()->getResult();

                $data = [
                    'stocks' => $stockData,
                    'ingredients' => $ingredientData,
                    'units' => $units,
                    'item_not_in_stock' => $listItemNotInStock,
                ];

				echo view('Admin/Snippet_header');
				echo view('Admin/In_stock_view', $data);
				echo view('Admin/Snippet_footer');
			}
			
		}
    }

    public function addItemToStock(){
        $session = session();

		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/login');
		} else{
			if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {
                $ingredientModel = new Ingredients_data_model();
                $stockModel = new In_stock_model();
                $unitModel = new Ingredients_unit_model();
                $shoppingListItemModel = new Shopping_list_item_model();

                $ingredientData = $ingredientModel->getIngredients();
                $stockData = $stockModel->getStock();
                $units = $unitModel->getUnit();
                $listItemNotInStock = $shoppingListItemModel->getListItemNotInStock()->getResult();
                $groupListItemNotInStock = $shoppingListItemModel->getCountListItemNotInStock()->getResult();
                
                $data = [
                    'stocks' => $stockData,
                    'ingredients' => $ingredientData,
                    'units' => $units,
                    'item_not_in_stock' => $listItemNotInStock,
                    'group_item_not_in_stock' => $groupListItemNotInStock
                ];

				echo view('Admin/Snippet_header');
				echo view('Admin/In_stock_add_shopping_list_view', $data);
				echo view('Admin/Snippet_footer');
			}
			
		}
    }

    public function saveItemToStock(){
        $session = session();

		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/login');
		} else{
			if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {

                $inStockModel = new In_stock_model();
                $shoppingListItemModel = new Shopping_list_item_model();

                $item = $this->request->getPost('item_id');
                $ingredient = $this->request->getPost('ingredient_id');
                $quantity = $this->request->getPost('quantity');

                for ($i=0; $i < count($ingredient); $i++) { 
                    $data = [
                        'ingredient_id' => $ingredient[$i],
                        'entry_date' => $this->request->getPost('entry_date'),
                        'quantity' => $quantity[$i],
                        'shopping_list_id' => $this->request->getPost('shopping_list_id'),
                        'supplier_name' => $this->request->getPost('supplier_name'),
                        'supplier_phone' => $this->request->getPost('supplier_phone'),
                        'other_info' => "-",
                    ];

                    $result = $inStockModel->saveStock($data);

                    if($result) {
                        $updateItem = $shoppingListItemModel->putItemInStock($item[$i]);
                    };
                }

				return redirect()->to('/stock/in-stock');
			}
			
		}
    }
    
    public function addInStock()
    {
        $session = session();

		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/login');
		} else{
			if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {

                $ingredientModel = new Ingredients_data_model();
                $paymentTypeModel = new Payment_type_model();
                $unitModel = new Ingredients_unit_model();

                $ingredients = $ingredientModel->getIngredients();
                $payments = $paymentTypeModel->getPaymentType();
                $units = $unitModel->getUnit();

                $data = [
                    'title' => 'Tambah',
                    'ingredients' => $ingredients,
                    'payments' => $payments,
                    'units' => $units
                ];

				echo view('Admin/Snippet_header');
				echo view('Admin/In_stock_add_view', $data);
				echo view('Admin/Snippet_footer');
			}
		}
    }

    public function editInStock()
    {
        $session = session();

		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/login');
		} else{
			if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {
                $stockId = $this->request->getGet('id');

                $ingredientModel = new Ingredients_data_model();
                $paymentTypeModel = new Payment_type_model();
                $unitModel = new Ingredients_unit_model();
                $stockModel = new In_stock_model();
                
                $ingredients = $ingredientModel->getIngredients();
                $payments = $paymentTypeModel->getPaymentType();
                $units = $unitModel->getUnit();
                $stockData = $stockModel->getStock($stockId)->getRow(0);

                $data = [
                    'title' => 'Edit',
                    'ingredients' => $ingredients,
                    'payments' => $payments,
                    'units' => $units,
                    'stock' => $stockData
                ];

				echo view('Admin/Snippet_header');
				echo view('Admin/In_stock_add_view', $data);
				echo view('Admin/Snippet_footer');
			}
		}
    }

    public function saveInStock()
    {
        $session = session();

		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/login');
		} else{
			if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {

                $inStockModel = new In_stock_model();

                $data = [
                    'ingredient_id' => $this->request->getPost('ingredient_id'),
                    'entry_date' => $this->request->getPost('entry_date'),
                    'quantity' => $this->request->getPost('quantity'),
                    'supplier_name' => $this->request->getPost('supplier_name'),
                    'supplier_phone' => $this->request->getPost('supplier_phone'),
                    'other_info' => $this->request->getPost('other_info'),
                ];

                $result = $inStockModel->saveStock($data);

				return redirect()->to('/stock/in-stock');
			}
			
		}
    }

    public function updateInStock()
    {
        $session = session();

		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/login');
		} else{
			if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {

                $inStockModel = new In_stock_model();

                $data = [
                    'ingredient_id' => $this->request->getPost('ingredient_id'),
                    'entry_date' => $this->request->getPost('entry_date'),
                    'quantity' => $this->request->getPost('quantity'),
                    'supplier_name' => $this->request->getPost('supplier_name'),
                    'supplier_phone' => $this->request->getPost('supplier_phone'),
                    'other_info' => $this->request->getPost('other_info'),
                ];

                $result = $inStockModel->updateStock($data, $this->request->getPost('stock_id'));

				return redirect()->to('/stock/in-stock');
			}
			
		}
    }
    
    public function deleteInStock()
    {
        $session = session();

		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/login');
		} else {
            if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {

                $stockId = $this->request->getGet('id');

                $model = new In_stock_model();
				$model->deleteStock($stockId);

                return redirect()->to('/stock/in-stock');
            }
        }   
    }

    public function outStock()
	{
		$session = session();

		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/login');
		} else{
			if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {
                $ingredientModel = new Ingredients_data_model();
                $stockModel = new Out_stock_model();
                $reasonModel = new Reason_out_stock_model();
                $unitModel = new Ingredients_unit_model();

                $ingredientData = $ingredientModel->getIngredients();
                $stockData = $stockModel->getStock();
                $reasons = $reasonModel->getReason();
                $units = $unitModel->getUnit();

                $data = [
                    'stocks' => $stockData,
                    'ingredients' => $ingredientData,
                    'reasons' => $reasons,
                    'units' => $units
                ];

				echo view('Admin/Snippet_header');
				echo view('Admin/Out_stock_view', $data);
				echo view('Admin/Snippet_footer');
			}
			
		}
    }

    public function addOutStock()
    {
        $session = session();

		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/login');
		} else{
			if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {

                $ingredientModel = new Ingredients_data_model();
                $reasonModel = new Reason_out_stock_model();
                $unitModel = new Ingredients_unit_model();

                $ingredients = $ingredientModel->getIngredients();
                $reasons = $reasonModel->getReason();
                $units = $unitModel->getUnit();

                $data = [
                    'title' => 'Tambah',
                    'ingredients' => $ingredients,
                    'reasons' => $reasons,
                    'units' => $units,
                ];

				echo view('Admin/Snippet_header');
				echo view('Admin/Out_stock_add_view', $data);
				echo view('Admin/Snippet_footer');
			}
		}
    }

    public function saveOutStock()
    {
        $session = session();

		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/login');
		} else{
			if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {

                $outStockModel = new Out_stock_model();

                $data = [
                    'ingredient_id' => $this->request->getPost('ingredient_id'),
                    'out_date' => $this->request->getPost('out_date'),
                    'quantity' => $this->request->getPost('quantity'),
                    'consumer_name' => $this->request->getPost('consumer_name'),
                    'consumer_phone' => $this->request->getPost('consumer_phone'),
                    'reason_out_stock_id' => $this->request->getPost('reason_out_stock'),
                    'other_info' => $this->request->getPost('other_info'),
                ];

                $result = $outStockModel->saveStock($data);

				return redirect()->to('/stock/out-stock');
			}
			
		}
    }

    public function editOutStock()
    {
        $session = session();

		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/login');
		} else{
			if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {
                $stockId = $this->request->getGet('id');

                $ingredientModel = new Ingredients_data_model();
                $unitModel = new Ingredients_unit_model();
                $stockModel = new Out_stock_model();
                $reasonModel = new Reason_out_stock_model();
                
                $ingredients = $ingredientModel->getIngredients();
                $units = $unitModel->getUnit();
                $stockData = $stockModel->getStock($stockId)->getRow(0);
                $reasons = $reasonModel->getReason();

                $data = [
                    'title' => 'Edit',
                    'ingredients' => $ingredients,
                    'units' => $units,
                    'stock' => $stockData,
                    'reasons' => $reasons
                ];

				echo view('Admin/Snippet_header');
				echo view('Admin/Out_stock_add_view', $data);
				echo view('Admin/Snippet_footer');
			}
		}
    }

    public function updateOutStock()
    {
        $session = session();

		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/login');
		} else{
			if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {

                $stockModel = new Out_stock_model();

                $data = [
                    'ingredient_id' => $this->request->getPost('ingredient_id'),
                    'out_date' => $this->request->getPost('out_date'),
                    'quantity' => $this->request->getPost('quantity'),
                    'consumer_name' => $this->request->getPost('consumer_name'),
                    'consumer_phone' => $this->request->getPost('consumer_phone'),
                    'reason_out_stock_id' => $this->request->getPost('reason_out_stock'),
                    'other_info' => $this->request->getPost('other_info'),
                ];

                $result = $stockModel->updateStock($data, $this->request->getPost('stock_id'));

				return redirect()->to('/stock/out-stock');
			}
			
		}
    }

    public function deleteOutStock()
    {
        $session = session();

		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/login');
		} else {
            if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {

                $stockId = $this->request->getGet('id');

                $model = new Out_stock_model();
				$model->deleteStock($stockId);

                return redirect()->to('/stock/out-stock');
            }
        }   
    }
    

}
