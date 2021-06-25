<?php namespace App\Models\Admin;
use CodeIgniter\Model;
 
class Address_model extends Model
{
    protected $table = 'address';
     
    public function getAddress($id = false)
    {
        if($id === false){
            return $this->findAll();
        }else{
            return $this->getWhere(['id' => $id]);
        }   
    }

    public function getAddressByTransactionId($id) {
        return $this->getWhere(['transaction_id' => $id]);
    }

    public function saveAddress($data)
    {
        $query = $this->db->table($this->table)->insert($data);
        return $query;
    }


}