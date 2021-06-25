<?php namespace App\Models\Admin;
use CodeIgniter\Model;
 
class Product_history_model extends Model
{
    protected $table = 'product_history';
     
    public function getProductHistory($id = false)
    {
        if($id === false){
            return $this->findAll();
        }else{
            return $this->getWhere(['id' => $id]);
        }   
    }

    public function saveProductHistory($data)
    {
        $query = $this->db->table($this->table)->insert($data);
        return $query;
    }

    public function deleteProductHistory($id)
    {
        $query = $this->db->table($this->table)->delete(array('id' => $id));
        return $query;
    } 
 
}