<?php namespace App\Controllers\Admin;

use CodeIgniter\Controller;
use App\Models\Admin\Ingredients_data_model;
use App\Models\Admin\Ingredients_data_history_model;
use App\Models\Admin\Ingredients_unit_model;
use App\Models\Admin\Ingredients_category_model;
use App\Models\Admin\In_stock_model;
use App\Models\Admin\Out_stock_model;


class Stock extends Controller
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
				echo view('Admin/Stock_view');
				echo view('Admin/Snippet_footer');
			}
			
		}
    }
    
    public function showData()
    {
        $session = session();

		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/login');
		} else{
			if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {

                $categoryModel = new Ingredients_category_model();
                $unitModel = new Ingredients_unit_model();
                $dataModel = new Ingredients_data_model();

                $category = $categoryModel->getCategory();
                $unit = $unitModel->getUnit();
                $dataIngredient = $dataModel->getIngredients();

                $data = [
                    'category' => $category,
                    'unit' => $unit,
                    'data' => $dataIngredient
                ];

				echo view('Admin/Snippet_header');
				echo view('Admin/Stock_data_view', $data);
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
                $model = new Ingredients_data_model();
                $code = random_string('nozero', 12);
                
				$data = array(
                    'code' => $code,
					'name' => $this->request->getPost('name'),
					'description' => $this->request->getPost('description'),
					'category_id' => $this->request->getPost('category_id'),
					'unit_id' => $this->request->getPost('unit_id'),
					'purchase_price' => $this->request->getPost('purchase_price'),
					'latest_price_date' => $this->request->getPost('latest_date'),
                );
                $result = $model->saveIngredient($data);
                
				return redirect()->to('/stock/data');
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
                $model = new Ingredients_data_model();
				$data = array(
					'name' => $this->request->getPost('name'),
					'description' => $this->request->getPost('description'),
					'category_id' => $this->request->getPost('category_id'),
					'unit_id' => $this->request->getPost('unit_id'),
					'purchase_price' => $this->request->getPost('purchase_price'),
					'latest_price_date' => $this->request->getPost('latest_date'),
					'stock_limit' => $this->request->getPost('stock_limit'),
					'updated_time' => date("Y-m-d H:i:s")
                );
                $result = $model->updateIngredient($data, $this->request->getPost('data-id'));
                
				return redirect()->to('/stock/data');
            }
        }
    }
    
    public function delete($id)
    {
        $session = session();

		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/login');
		} else {
            if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {

                $model = new Ingredients_data_model();
				$model->deleteIngredient($id);

                return redirect()->to('/stock/data');
            }
        }   
    }

    public function showStock(){
		$session = session();

		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/login');
		} else{
			if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {

				$categoryModel = new Ingredients_category_model();
                $unitModel = new Ingredients_unit_model();
				$dataModel = new Ingredients_data_model();
				$inStockModel = new In_stock_model();
				$outStockModel = new Out_stock_model();

                $category = $categoryModel->getCategory();
                $unit = $unitModel->getUnit();
				$ingredients = $dataModel->getIngredients();
				$inStock = $inStockModel->getStockQuantity();
				$outStock = $outStockModel->getStockQuantity();

                $data = [
                    'category' => $category,
                    'units' => $unit,
					'data' => $ingredients,
					'in_stock' => $inStock->getResult(),
					'out_stock' => $outStock->getResult()
				];	
				
				// print_r($data['in_stock']);

				echo view('Admin/Snippet_header');
				echo view('Admin/Stock_quantity_view', $data);
				echo view('Admin/Snippet_footer');
			}
			
		}
	}

}
