<?php namespace App\Models\Admin;
use CodeIgniter\Model;
 
class Driver_record_model extends Model
{
    protected $table = 'driver_record';
     
    public function getDriver($id = false)
    {
        if($id === false){
            return $this->findAll();
        }else {
            return $this->getWhere(['id' => $id]);
        }   
    }

    public function saveDriver($data)
    {
        $this->db->db_debug = false;
        $query = $this->db->table($this->table)->insert($data);
        return $query;
    }
 
}