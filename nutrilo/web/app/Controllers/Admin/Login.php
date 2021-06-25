<?php namespace App\Controllers\Admin;

use CodeIgniter\Controller;
use App\Models\Admin\User_model;
use App\Controllers\Admin\Home;

class Login extends Controller 
{

    public function index() {
        $session = session();

        if ($session->get('username') != NULL && $session->get('logged_in') != NULL){
			return redirect()->to('/');
        } else {
            $data = [
                'message' => 'null'
            ];
    
            echo view('Admin/Login_view', $data);
        }
    }

    public function login_validation() {
        $session = session();

        $model = new User_model();

        $username =  $this->request->getPost('username');
        $password = $this->request->getPost('password');
        $encrypt_pass = md5($password);

        $user = $model->getUserByUsername($username)->getRow();
       
        if($user->password == $encrypt_pass) {
            if ($user->is_deleted == true){
                $data = [
                    'message' => 'Username sudah tidak aktif'
                ];
                echo view('Admin/Login_view', $data);
            } else {
                $newdata = [
                    'username'  => $username,
                    'logged_in' => TRUE,
                    'role_id' => $user->role_id
                ];
                $session->set($newdata);
                return redirect()->to('/');
            }
        } else {
            $data = [
                'message' => 'Username atau password salah !!! '
            ];
            echo view('Admin/Login_view', $data);
        }
    }

    public function register(){
        $session = session();

        $model = new User_model();
        $now_date = date("Y-m-d H:i:s");

        $encrypt_pass = md5($this->request->getPost('password'));

        $data = array(
            'username' => $this->request->getPost('username'),
            'fullname' => $this->request->getPost('name'),
            'email' => $this->request->getPost('email'),
            'password' => $encrypt_pass,
            'created_time' => $now_date,
            'updated_time' => $now_date,
            'role_id' => 2
        );
        $getUser = $model->getUserByUsername($this->request->getPost('username'))->getRow(0);
        if($getUser) {
            $data = [
                'error_code' => 1,
                'message' => 'Username telah digunakan'
            ];
            echo view("Admin/Login_view", $data);
        } else {
            $result = $model->saveUser($data);
            $message = $result == true ? 'Akun berhasil dibuat' : 'Akun gagal dibuat';
            $data = [
                'message' => $message
            ];
            echo view("Admin/Login_view", $data);
        }
    }
}