<?php namespace App\Controllers\Admin;

use CodeIgniter\Controller;
use App\Models\Admin\Day_model;
use App\Models\Admin\Menu_model;
use App\Models\Admin\Menu_category_model;
use App\Models\Admin\Catering_order_batch_model;
use App\Models\Admin\Catering_order_item_model;
use App\Libraries\Pdf;

class Menu extends Controller
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
				$categoryModel = new Menu_category_model();
				$menuModel = new Menu_model();
				$dayModel = new Day_model();
				
                $data = [
					'batch' => $batchModel->getBatch($batchId)->getRow(0),
					'category' => $categoryModel->getCategory(),
					'menus' => $menuModel->getMenuByBatch($batchId)->getResult(),
					'days' => $dayModel->getDay()
                ];

				echo view('Admin/Snippet_header');
				echo view('Admin/Menu_view', $data);
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
				$categoryModel = new Menu_category_model();
				$menuModel = new Menu_model();
				$dayModel = new Day_model();
				
                $data = [
					'title' => 'Tambah',
					'batch' => $batchModel->getBatch($batchId)->getRow(0),
					'category' => $categoryModel->getCategory(),
					'menus' => $menuModel->getMenu(),
					'days' => $dayModel->getDay()
                ];

				echo view('Admin/Snippet_header');
				echo view('Admin/Menu_view', $data);
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
                $batchId = $this->request->getGet('batch');

				$menuModel = new Menu_model();
				
				$batchId = $this->request->getPost('batch-id');

                $data = [
					'name' => $this->request->getPost('name'),
					'category_id' => $this->request->getPost('category_id'),
					'order_batch_id' => $batchId,
					'day_id' => $this->request->getPost('day_id'),
					'time_id' => $this->request->getPost('time_id'),
				];
				
				$result = $menuModel->saveMenu($data);

				return redirect()->to('/catering/menu?batch='.$batchId);
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
				$menuModel = new Menu_model();
				
				$menuId = $this->request->getPost('menu-id');
				$batchId = $this->request->getPost('batch-id');

                $data = [
					'name' => $this->request->getPost('name'),
					'category_id' => $this->request->getPost('category_id'),
					'order_batch_id' => $batchId,
					'day_id' => $this->request->getPost('day_id'),
					'time_id' => $this->request->getPost('time_id'),
				];
				
				$result = $menuModel->updateMenu($data, $menuId);

				return redirect()->to('/catering/menu?batch='.$batchId);
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
				$menuId = $this->request->getGet('id');
				$batchId = $this->request->getGet('batch');

                $model = new Menu_model();
				$model->deleteMenu($menuId);
				
				$modelItem = new Catering_order_item_model();
				$itemHasMenu = $modelItem->getOrderItemByMenu($menuId)->getResult();

				foreach ($itemHasMenu as $item) {
					$modelItem->deleteMenuInItem($item->id);
				}
				

                return redirect()->to('/catering/menu?batch='.$batchId);
            }
        }
        
	}
}