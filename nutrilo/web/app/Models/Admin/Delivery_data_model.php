<?php namespace App\Models\Admin;
use CodeIgniter\Model;
 
class Delivery_data_model extends Model
{
    protected $table = 'delivery_data';
     
    public function getDelivery($id = false)
    {
        if($id === false){
            return $this->findAll();
        }else {
            return $this->getWhere(['id' => $id]);
        }   
    }

    public function saveDelivery($data)
    {
        $query = $this->db->table($this->table)->insert($data);
        if($query) {
            return $this->insertID();
        }
        return false;
    }

    public function updateDelivery($data, $id)
    {
        $query = $this->db->table($this->table)->update($data, array('id' => $id));
        return $query;
    }
 
}