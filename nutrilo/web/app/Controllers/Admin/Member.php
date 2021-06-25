<?php namespace App\Controllers\Admin;

use CodeIgniter\Controller;
use App\Models\Admin\Member_model;
use App\Models\Admin\User_model;

class Member extends Controller
{
	public function index()
	{
		$session = session();

		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/admin/login');
		} else{
			if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {
				echo view('Admin/Snippet_header');
				echo view('Admin/Member_view');
				echo view('Admin/Snippet_footer');
			}
			
		}
	}

	public function register()
	{
		$session = session();

		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/admin/login');
		} else{
			if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {
				echo view('Admin/Snippet_header');
				echo view('Admin/Member_register_view');
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
                $model = new Member_model();
                $now_date = date("Y-m-d");
				$card_number = random_string('nozero', 15);
				$data = array(
					'card_number' => $card_number,
					'is_delete' => 0,
                    'created_time' => $now_date,
                );
                $result = $model->saveMember($data);
                return redirect()->to('/member');
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

                $model = new Member_model();
                $now_date = date("Y-m-d");
				$card_number = $this->request->getPost('card_number');
				$data = array(
					'name' => $this->request->getPost('name'),
					'phone' => $this->request->getPost('phone'),
					'business_partner_id' => $user->id,
                    'submit_date' => $now_date,
				);
				$result = $model->updateMember($data, $card_number);
		
                return redirect()->to('/member');
            }
        }
    }

}
