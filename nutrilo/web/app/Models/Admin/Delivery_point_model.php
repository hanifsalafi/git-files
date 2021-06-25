<?php namespace App\Models\Admin;
use CodeIgniter\Model;
 
class Delivery_point_model extends Model
{
    protected $table = 'delivery_point';
     
    public function getPoint($id = false)
    {
        if($id === false){
            return $this->findAll();
        }else {
            return $this->getWhere(['id' => $id]);
        }   
    }

    public function getPointDelivery($id)
    {
        return $this->getWhere(['delivery_data_id' => $id]);
    }

    public function savePoint($data)
    {
        $query = $this->db->table($this->table)->insert($data);
        if($query) {
            return $this->insertID();
        }
        return false;
    }

    public function updatePoint($data, $id)
    {
        $query = $this->db->table($this->table)->update($data, array('id' => $id));
        if($query) {
            return $this->getWhere(['id' => $id]);
        }
        return false;
    }
 
}