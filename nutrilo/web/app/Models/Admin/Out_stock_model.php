<?php namespace App\Models\Admin;
use CodeIgniter\Model;
 
class Out_stock_model extends Model
{
    protected $table = 'out_stock';
     
    public function getStock($id = false)
    {
        if($id === false){
            return $this->findAll();
        }else {
            return $this->getWhere(['id' => $id]);
        }   
    }

    public function getStockQuantity()
    {
        $this->db->table($this->table);
        $this->select('ingredient_id');
        $this->groupBy('ingredient_id');
        $this->selectSum('quantity', 'stock');
        return $this->get();
    }

    public function saveStock($data)
    {
        $this->db->db_debug = false;
        $query = $this->db->table($this->table)->insert($data);
        return $query;
    }

    public function updateStock($data, $id)
    {
        $query = $this->db->table($this->table)->update($data, array('id' => $id));
        return $query;
    }

    public function deleteStock($id)
    {
        $query = $this->db->table($this->table)->delete(array('id' => $id));
        return $query;
    } 
 
}