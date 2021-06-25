<?php namespace App\Models\Admin;
use CodeIgniter\Model;
 
class Menu_model extends Model
{
    protected $table = 'menu';
     
    public function getMenu($id = false)
    {
        if($id === false){
            return $this->findAll();
        }else {
            return $this->getWhere(['id' => $id]);
        }   
    }

    public function getMenuByBatch($id = false)
    {
        if($id === false){
            return $this->findAll();
        }else {
            return $this->getWhere(['order_batch_id' => $id]);
        }   
    }

    public function saveMenu($data)
    {
        $this->db->db_debug = false;
        $query = $this->db->table($this->table)->insert($data);
        return $query;
    }

    public function updateMenu($data, $id)
    {
        $query = $this->db->table($this->table)->update($data, array('id' => $id));
        return $query;
    }

    public function deleteMenu($id)
    {
        $query = $this->db->table($this->table)->delete(array('id' => $id));
        return $query;
    } 
 
}