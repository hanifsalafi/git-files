<?php namespace App\Models\Admin;
use CodeIgniter\Model;
 
class Ingredients_data_model extends Model
{
    protected $table = 'ingredients_data';
     
    public function getIngredients($id = false)
    {
        if($id === false){
            $this->db->table($this->table);
            $this->orderBy('name', 'ASC');
            
            return $this->get()->getResultArray();
        }else {
            return $this->getWhere(['id' => $id]);
        }   
    }

    public function saveIngredient($data)
    {
        $query = $this->db->table($this->table)->insert($data);
        return $query;
    }

    public function updateIngredient($data, $id)
    {
        $query = $this->db->table($this->table)->update($data, array('id' => $id));
        return $query;
    }

    public function deleteIngredient($id)
    {
        $query = $this->db->table($this->table)->delete(array('id' => $id));
        return $query;
    }
 
}