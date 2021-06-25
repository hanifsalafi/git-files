<?php namespace App\Models\Admin;
use CodeIgniter\Model;
 
class Shopping_plan_model extends Model
{
    protected $table = 'shopping_plan';
     
    public function getPlan($id = false)
    {
        if($id === false){
            return $this->findAll();
        }else{
            return $this->getWhere(['id' => $id]);
        }   
    }

    public function getUnrealizedPlan()
    {
        if($id === false){
            return $this->findAll();
        }else{
            return $this->getWhere(['status' => 1]);
        }   
    }

    public function savePlan($data)
    {
        $query = $this->db->table($this->table)->insert($data);
        if($query) {
            return $this->insertID();
        }
        return false;
    }

    public function updatePlan($data, $id)
    {
        $query = $this->db->table($this->table)->update($data, array('id' => $id));
        return $query;
    }

    
    public function updateShopped($id)
    {
        $data = [
            'status' => 2
        ];
        $query = $this->db->table($this->table)->update($data, array('id' => $id));
        return $query;
    }

    public function deletePlan($id)
    {
        $query = $this->db->table($this->table)->delete(array('id' => $id));
        return $query;
    } 
 
}