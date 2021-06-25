<?php namespace App\Models\Admin;
use CodeIgniter\Model;
 
class Catering_order_detail_model extends Model
{
    protected $table = 'catering_order_detail';
     
    public function getOrder($id = false)
    {
        if($id === false){
            return $this->findAll();
        }else {
            return $this->getWhere(['id' => $id]);
        }   
    }

    // public function getOrderByBatch($id = false)
    // {
    //     if($id === false){
    //         return $this->findAll();
    //     }else {
    //         return $this->getWhere(['catering_order_batch_id' => $id]);
    //     }   
    // }

    public function getOrderByBatch($batchId) {
        $this->db->table($this->table);
        $this->select('catering_order_detail.id, catering_order_batch_id, day_id, time_order, catering_order_detail.phone, catering_order_detail.address, catering_order_detail.latlong, catering_order_detail.notes, catering_order_detail.driver_notes, buyer_id, name, catering_buyer.phone as default_phone, catering_buyer.address AS default_address, catering_buyer.latlong AS default_latlong, catering_buyer.notes AS default_notes, catering_buyer.driver_notes AS default_driver_notes');
        $this->join('catering_buyer', 'catering_order_detail.buyer_id = catering_buyer.id');
        return $this->getWhere(['catering_order_batch_id' => $batchId]);
    }

    // public function getOrderByBatchDayTime($batchId, $dayId, $timeId)
    // {
    //     if($id === false){
    //         return $this->findAll();
    //     }else {
    //         return $this->getWhere(['catering_order_batch_id' => $batchId, 'day_id' => $dayId, 'time_order' => $timeId]);
    //     }   
    // }

    public function saveOrder($data)
    {
        $query = $this->db->table($this->table)->insert($data);
        if($query) {
            return $this->insertID();
        }
        return false;
    }

    public function updateOrder($data, $id)
    {
        $query = $this->db->table($this->table)->update($data, array('id' => $id));
        return $query;
    }

    public function deleteOrder($id)
    {
        $query = $this->db->table($this->table)->delete(array('id' => $id));
        return $query;
    } 

    public function getOrderByBatchDayTime($batchId, $dayId, $timeId)
    {
        $this->db->table($this->table);
        $this->select('*');
        $this->join('catering_order_item', 'catering_order_item.order_detail_id = catering_order_detail.id');
        return $this->getWhere(['catering_order_batch_id' => $batchId, 'day_id' => $dayId, 'time_order' => $timeId]);
    }
 
    public function getBuyerByBatchDayTime($batchId, $dayId, $timeId)
    {
        $this->db->table($this->table);
        $this->select('catering_order_detail.id, catering_order_batch_id, day_id, time_order, catering_order_detail.phone, catering_order_detail.address, catering_order_detail.latlong, catering_order_detail.notes, buyer_id, name, catering_buyer.phone as default_phone, catering_buyer.address AS default_address, catering_buyer.latlong AS default_latlong, catering_buyer.notes AS default_notes, catering_buyer.driver_notes AS default_driver_notes, catering_buyer.driver_notes AS default_driver_notes');
        $this->join('catering_buyer', 'catering_order_detail.buyer_id = catering_buyer.id');
        return $this->getWhere(['catering_order_batch_id' => $batchId, 'day_id' => $dayId, 'time_order' => $timeId]);
    }

    public function getMultipleOrder($data)
    {
        $this->db->table($this->table);
        $this->select('catering_order_detail.id, catering_order_batch_id, day_id, time_order, is_out_of_range, catering_order_detail.phone,  catering_order_detail.address, catering_order_detail.latlong, catering_order_detail.notes, catering_order_detail.driver_notes, buyer_id, name, catering_buyer.phone AS default_phone, catering_buyer.address AS default_address, catering_buyer.latlong AS default_latlong, catering_buyer.notes AS default_notes, catering_buyer.driver_notes AS default_driver_notes, catering_buyer.driver_notes AS default_driver_notes');
        $this->join('catering_buyer', 'catering_order_detail.buyer_id = catering_buyer.id');
        $this->whereIn('catering_order_detail.id', $data);
        return $this->get();
    }

    public function getOrderById($id)
    {
        $this->db->table($this->table);
        $this->select('catering_order_detail.id, catering_order_batch_id, day_id, time_order, catering_order_detail.phone, catering_order_detail.address, catering_order_detail.latlong, catering_order_detail.notes, buyer_id, name, catering_buyer.phone AS default_phone, catering_buyer.address AS default_address, catering_buyer.latlong AS default_latlong, catering_buyer.notes AS default_notes, catering_buyer.driver_notes AS default_driver_notes, catering_buyer.driver_notes AS default_driver_notes');
        $this->join('catering_buyer', 'catering_order_detail.buyer_id = catering_buyer.id');
        return $this->getWhere(['catering_order_detail.id' => $id]);
    }
}