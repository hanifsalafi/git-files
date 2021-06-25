<?php namespace App\Models\Admin;
use CodeIgniter\Model;
 
class Catering_order_item_model extends Model
{
    protected $table = 'catering_order_item';
     
    public function getOrderItem($id = false)
    {
        if($id === false){
            return $this->findAll();
        }else {
            return $this->getWhere(['id' => $id]);
        }   
    }

    public function getOrderItemByBatch($id = false)
    {
        if($id === false){
            return $this->findAll();
        }else {
            return $this->getWhere(['order_batch_id' => $id]);
        }   
    }

    public function getOrderItemByDetail($id = false)
    {
        if($id === false){
            return $this->findAll();
        }else {
            return $this->getWhere(['order_detail_id' => $id]);
        }   
    }

    public function getOrderItemByMenu($id = false)
    {
        if($id === false){
            return $this->findAll();
        }else {
            return $this->getWhere(['menu_id' => $id]);
        }   
    }

    public function saveOrderItem($data)
    {
        $query = $this->db->table($this->table)->insert($data);
        return $query;
    }

    public function updateOrderItem($data, $id)
    {
        $query = $this->db->table($this->table)->update($data, array('id' => $id));
        return $query;
    }

    public function deleteItem($id)
    {
        $query = $this->db->table($this->table)->delete(array('id' => $id));
        return $query;
    } 

    public function deleteMenuInItem($id)
    {
        $data = [
            'menu_id' => null,
            'food_name' => null,
        ];

        $query = $this->db->table($this->table)->update($data, array('id' => $id));
        return $query;
    } 


    public function deleteItemByOrderDetail($id = false)
    {
        $query = $this->db->table($this->table)->delete(array('order_detail_id' => $id));
        return $query;
    }

 
}