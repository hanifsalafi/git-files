<?php namespace App\Models\Admin;
use CodeIgniter\Model;
 
class Catering_buyer_model extends Model
{
    protected $table = 'catering_buyer';
     
    public function getBuyer($id = false)
    {
        if($id === false){
            return $this->findAll();
        }else {
            return $this->getWhere(['id' => $id]);
        }   
    }

    public function getAllBuyerByBatch($id = false)
    {
        if($id === false){
            return $this->findAll();
        }else {
            return $this->getWhere(['order_batch_id' => $id]);
        }   
    }

    public function getBuyerByName($keyword) {
        $que = $this->db->table($this->table)->select('id, name');
        $query = $que->like('name', $keyword);
        $records = $query->where("id IN ( SELECT MAX(id) FROM catering_buyer GROUP BY name)");
         
        return $records->get();
    }

    public function getBuyerByBatch($batchId)
    {
        $this->db->table($this->table);
        $this->select('catering_buyer.id, name, catering_buyer.phone, catering_buyer.address, catering_buyer.latlong, catering_buyer.notes, catering_buyer.driver_notes, catering_buyer.nutritional_needs, catering_buyer.order_package_id, catering_order_detail.phone as edited_phone, catering_order_detail.address as edited_address, catering_order_detail.latlong as edited_latlong, catering_order_detail.notes as edited_notes, catering_order_detail.driver_notes as edited_driver_notes');
        $this->join('catering_order_detail', 'catering_order_detail.buyer_id = catering_buyer.id', 'left');
        $this->groupBy('id');
        return $this->getWhere(['catering_buyer.order_batch_id' => $batchId]);
    }

    public function getBuyerActiveByBatch($batchId)
    {
        $this->db->table($this->table);
        $this->select('catering_buyer.id, name, catering_buyer.phone, catering_buyer.address, catering_buyer.latlong, catering_buyer.notes, catering_buyer.driver_notes, catering_buyer.nutritional_needs, catering_buyer.order_package_id, catering_order_detail.phone as edited_phone, catering_order_detail.address as edited_address, catering_order_detail.latlong as edited_latlong, catering_order_detail.notes as edited_notes, catering_order_detail.driver_notes as edited_driver_notes');
        $this->join('catering_order_detail', 'catering_order_detail.buyer_id = catering_buyer.id', 'left');
        $this->groupBy('id');
        return $this->getWhere(['catering_buyer.order_batch_id' => $batchId, 'catering_buyer.is_active' => true]);
    }

    public function saveBuyer($data)
    {
        $this->db->db_debug = false;
        $query = $this->db->table($this->table)->insert($data);
        return $query;
    }

    public function updateBuyer($data, $id)
    {
        $query = $this->db->table($this->table)->update($data, array('id' => $id));
        return $query;
    }

    public function deleteBuyer($id)
    {
        $query = $this->db->table($this->table)->delete(array('id' => $id));
        return $query;
    } 
 
}