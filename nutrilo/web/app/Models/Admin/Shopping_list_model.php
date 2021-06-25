<?php namespace App\Models\Admin;
use CodeIgniter\Model;
 
class Shopping_list_model extends Model
{
    protected $table = 'shopping_list';
     
    public function getList($id = false)
    {
        if($id === false){
            return $this->findAll();
        }else{
            return $this->getWhere(['id' => $id]);
        }   
    }

    public function saveList($data)
    {
        $query = $this->db->table($this->table)->insert($data);
        if($query) {
            return $this->insertID();
        }
        return false;
    }

    public function updateList($data, $id)
    {
        $query = $this->db->table($this->table)->update($data, array('id' => $id));
        return $query;
    }

    public function deleteList($id)
    {
        $query = $this->db->table($this->table)->delete(array('id' => $id));
        return $query;
    } 
 
}