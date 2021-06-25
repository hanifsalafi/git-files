<?php namespace App\Models\Admin;
use CodeIgniter\Model;
 
class Ingredients_history_model extends Model
{
    protected $table = 'ingredients_history';
     
    public function getHistory($id = false)
    {
        if($id === false){
            return $this->findAll();
        }else {
            return $this->getWhere(['id' => $id]);
        }   
    }

    public function getHistoryByIngredient($id = false)
    {
        if($id === false){
            return $this->findAll();
        }else {
            return $this->getWhere(['ingredient_id' => $id]);
        }   
    }

    public function saveHistory($data)
    {
        $query = $this->db->table($this->table)->insert($data);
        return $query;
    }

    public function updateHistory($data, $id)
    {
        $query = $this->db->table($this->table)->update($data, array('id' => $id));
        return $query;
    }

    public function deleteHistory($id)
    {
        $query = $this->db->table($this->table)->delete(array('id' => $id));
        return $query;
    }
 
}