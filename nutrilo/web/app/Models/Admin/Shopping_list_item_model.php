<?php namespace App\Models\Admin;
use CodeIgniter\Model;
 
class Shopping_list_item_model extends Model
{
    protected $table = 'shopping_list_item';
     
    public function getListItem($id = false)
    {
        if($id === false){
            return $this->findAll();
        }else{
            return $this->getWhere(['id' => $id]);
        }   
    }

    public function getListItemById($id = false)
    {
        if($id === false){
            return $this->findAll();
        }else{
            return $this->getWhere(['shopping_list_id' => $id]);
        }   
    }

    public function getListItemNotInStock()
    {
        $this->db->table($this->table);
        $this->select('shopping_list_item.id, shopping_list_id, ingredient_id, quantity, unit_price, total_price, is_in_stock, number_reference, name, shopping_date');
        $this->join('shopping_list', 'shopping_list.id = shopping_list_item.shopping_list_id');
        $this->orderBy('shopping_list_id');
        return $this->getWhere(['shopping_list_item.is_in_stock' => false]);
    }

    public function getCountListItemNotInStock()
    {
        $this->db->table($this->table);
        $this->select('shopping_list_item.id, shopping_list_id, ingredient_id, quantity, unit_price, total_price, is_in_stock, number_reference, name, shopping_date');
        $this->join('shopping_list', 'shopping_list.id = shopping_list_item.shopping_list_id', 'left');
        $this->groupBy('shopping_list_id');
        $this->orderBy('shopping_list_id');
        return $this->getWhere(['shopping_list_item.is_in_stock' => false]);
    }


    // public function getListItemNotInStock()
    // {
    //     $this->db->table($this->table);
    //     $this->select('shopping_list_item.*');
    //     $this->join('shopping_list', 'shopping_list.id  = shopping_list_item.shopping_list_id');
    //     return $this->getWhere(['status' => 1]);
    // }

    public function saveListItem($data)
    {
        $query = $this->db->table($this->table)->insert($data);
        if($query) {
            return $this->insertID();
        }
        return false;
    }

    public function putItemInStock($id)
    {
        $data = [
            'is_in_stock' => true
        ];
        $query = $this->db->table($this->table)->update($data, array('id' => $id));
        return $query;
    }

    public function updateListItem($data, $id)
    {
        $query = $this->db->table($this->table)->update($data, array('id' => $id));
        return $query;
    }

    public function deleteListItem($id)
    {
        $query = $this->db->table($this->table)->delete(array('id' => $id));
        return $query;
    } 

    public function deleteListItemByData($listId)
    {
        $query = $this->db->table($this->table)->delete(array('shopping_list_id' => $listId));
        return $query;
    } 
 
}