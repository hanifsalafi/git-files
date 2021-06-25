<?php namespace App\Models\Admin;
use CodeIgniter\Model;
 
class User_model extends Model
{
    protected $table = 'user';
     
    public function getUser($id = false)
    {
        if($id === false){
            return $this->findAll();
        }else {
            return $this->getWhere(['id' => $id]);
        }   
    }

    public function getUserByUsername($username) {
        return $this->getWhere(['username' => $username]);
    }

    public function getUserByParam($fullname, $email, $phone) {
        return $this->getWhere(['fullname' => $fullname, 'email' => $email, 'phone' => $phone]);
    }

    public function saveUser($data)
    {
        if($this->db->table($this->table)->insert($data)){
            return $this->insertID();
        }
        return false;
    }

    public function updateUser($data, $id)
    {
        $query = $this->db->table($this->table)->update($data, array('id' => $id));
        return $query;
    }

    public function deleteUser($id)
    {
        $query = $this->db->table($this->table)->delete(array('id' => $id));
        return $query;
    } 

    public function check_login($username, $password)
    {
        $this->select('id');
        $this->from($table);
        $this->where($username);
        $this->where($password);
        $this->limit(1);
        $query = $this->db->table($this->table)->get();
        // print_r($username, $password);
        $query = $this->getWhere(['username' => $username, 'password' => $password]);

        // $query = $this->getWhere(['username' => $username]);
        // $query = $this->getWhere(['password' => $password]);
        print_r(count($query->getResult()));
        // print_r($query->getResult());
        // if ($query->getResult() != nu) {
        //     return FALSE;
        // } else {
        //     return $query->result();
        // }
    }
 
}