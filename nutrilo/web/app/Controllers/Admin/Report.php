<?php namespace App\Controllers\Admin;

use CodeIgniter\Controller;

class Report extends Controller
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
				echo view('Admin/Report_view');
				echo view('Admin/Snippet_footer');
			}
			
		}
	}

}
