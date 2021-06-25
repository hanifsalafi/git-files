<?php namespace App\Models\Admin;
use CodeIgniter\Model;
 
class Transaction_model extends Model
{
    protected $table = 'transaction';
     
    public function getTransaction($id = false)
    {
        if($id === false){
            // $this->;
            // return $this->db->table($this->table)->orderBy('id', 'DESC')->get()->getResult();
            return $this->findAll();
        }else {
            return $this->getWhere(['id' => $id]);
        }   
    }

    public function getTransactionByOrderNumber($order_number)
    {
        return $this->getWhere(['order_number' => $order_number]);
    }

    public function saveTransaction($data)
    {
        $query = $this->db->table($this->table)->insert($data);
        if($query) {
            return $this->insertID();
        }
        return false;
    }

    public function updateTransaction($data, $id)
    {
        $query = $this->db->table($this->table)->update($data, array('id' => $id));
        return $query;
    }

 
}