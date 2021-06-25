<?php namespace App\Models\Admin;
use CodeIgniter\Model;
 
class Shopping_plan_list_model extends Model
{
    protected $table = 'shopping_plan_list';
     
    public function getPlanList($id = false)
    {
        if($id === false){
            return $this->findAll();
        }else{
            return $this->getWhere(['id' => $id]);
        }   
    }

    public function getPlanListByPlanId($id = false)
    {
        if($id === false){
            return $this->findAll();
        }else{
            return $this->getWhere(['shopping_plan_id' => $id]);
        }   
    }

    public function getUnrealizedPlan(){
        $this->db->table($this->table);
        $this->select('shopping_plan_list.*');
        $this->join('shopping_plan', 'shopping_plan.id  = shopping_plan_list.shopping_plan_id');
        return $this->getWhere(['status' => 1]);
    }

    public function savePlanList($data)
    {
        $query = $this->db->table($this->table)->insert($data);
        return $query;
    }

    public function updatePlanList($data, $id)
    {
        $query = $this->db->table($this->table)->update($data, array('id' => $id));
        return $query;
    }

    public function deletePlanList($id)
    {
        $query = $this->db->table($this->table)->delete(array('id' => $id));
        return $query;
    } 

    public function deletePlanItemByData($id)
    {
        $query = $this->db->table($this->table)->delete(array('shopping_plan_id' => $id));
        return $query;
    } 
 
}