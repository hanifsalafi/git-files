<?php namespace App\Controllers\Admin;

use App\Models\Admin\User_model;

class Home extends BaseController
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
				$user_model = new User_model();
				$user = $user_model->getUserByUsername($session->get('username'))->getRow();

				$data = [
					'user' => $user
				];

				echo view('Admin/Snippet_header');
				echo view('Admin/Dashboard_verified',$data);
				echo view('Admin/Snippet_footer');

				
			}
			
		}
	}

}
