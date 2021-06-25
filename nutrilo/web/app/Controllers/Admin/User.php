<?php namespace App\Controllers\Admin;

use CodeIgniter\Controller;
use App\Models\Admin\User_model;
use App\Models\Admin\Business_partner_model;

class User extends Controller
{

	public function index()
    {
		$session = session();

		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/admin/login');
		} else {
            if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {
                $model = new User_model();
                $data = [
                    'user' => $model->getUser(),
                    'segment' => 'user'
                ];

                echo view('Admin/Snippet_header');
                echo view('Admin/Snippet_sidebar', $data);
                echo view('Admin/User_view',$data);
                echo view('Admin/Snippet_footer');
            }
        }
    }

    public function logout(){
        $session = session();
        $role_id = $session->get('role_id'); 
        $array_items = ['username', 'logged_in', 'role_id'];
        $session->remove($array_items);
        if ($role_id == 2) {
            return redirect()->to('/admin/login');
        } else {
            return redirect()->to('/');
        }
    }
 
    public function add_new()
    {
        $session = session();

		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/login');
		} else {
            if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {
                $data = [
                    'segment' => 'user'
                ];
        
                echo view('Admin/Snippet_header');
                echo view('Admin/Snippet_sidebar', $data);
                echo view('Admin/User_add',$data);
                echo view('Admin/Snippet_footer');
            }
        }
    }
 
    public function save()
    {
        $session = session();
        
        if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/login');
		} else {
            if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {
                $model = new User_model();
                $now_date = date("Y-m-d H:i:s");

                $encrypt_pass = md5($this->request->getPost('password'));

                $data = array(
                    'username' => $this->request->getPost('username'),
                    'fullname' => $this->request->getPost('name'),
                    'email' => $this->request->getPost('email'),
                    'password' => $encrypt_pass,
                    'address' => $this->request->getPost('address'),
                    'phone' => $this->request->getPost('phone'),
                    'image_url' => $this->request->getPost('image_url'),
                    'created_time' => $now_date,
                    'updated_time' => $now_date,
                    'role_id' => 1
                );
                $result = $model->saveUser($data);
                return redirect()->to('/user');
            }
        }
    }

    public function edit($id)
    {
        $session = session();

        if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/login');
		} else {
            if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {
                $model = new User_model();
                $data = [
                    'user' => $model->getUser($id)->getRow(),
                    'segment' => 'user'
                ];

                echo view('Admin/Snippet_header');
                echo view('Admin/Snippet_sidebar', $data);
                echo view('Admin/User_edit',$data);
                echo view('Admin/Snippet_footer');
            }
        }
    }
 
    public function update()
    {
        $session = session();

		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/login');
		} else {
            if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {
                $model = new User_model();
                $id = $this->request->getPost('id');
                $data = array(
                    'username' => $this->request->getPost('username'),
                    'fullname' => $this->request->getPost('name'),
                    'email' => $this->request->getPost('email'),
                    'phone' => $this->request->getPost('phone'),
                    'address' => $this->request->getPost('address'),
                    'updated_time' => date("Y-m-d H:i:s")
                );
                $model->updateUser($data, $id);
                return redirect()->to('/user');
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
                $model = new User_model();
                $model->deleteUser($id);
                return redirect()->to('/user');
            }
        }
    }

    public function verification(){
        $session = session();

		if ($session->get('username') == NULL && $session->get('logged_in') == NULL){
			return redirect()->to('/login');
		} else {
            if ($session->get('role_id') != 2){
				return redirect()->to('/');
			} else {
                $user_model = new User_model();
				$user = $user_model->getUserByUsername($session->get('username'))->getRow();

                $id = $user->id;
                $data = array(
                    'fullname' => $this->request->getPost('name'),
                    'phone' => $this->request->getPost('phone'),
                    'address' => $this->request->getPost('address'),
                    'user_status_id' => 2,
                    'updated_time' => date("Y-m-d H:i:s")
                );
                $user_model->updateUser($data, $id);

                $partner_model = new Business_partner_model();
                $data_partner = array(
                    'user_id' => $id,
                    'business_name' => $this->request->getPost('business_name'),
                    'phone' => $this->request->getPost('business_phone'),
                    'address' => $this->request->getPost('business_address'),
                    'business_detail' => $this->request->getPost('business_desc'),
                    'created_time' => date("Y-m-d H:i:s"),
                    'updated_time' => date("Y-m-d H:i:s")
                );
                $partner_model->savePartner($data_partner);
                return redirect()->to('/');
            }
        }
    }
}
