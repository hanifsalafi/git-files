<?php namespace App\Models\Admin;
use CodeIgniter\Model;
 
class Catering_order_batch_model extends Model
{
    protected $table = 'catering_order_batch';
     
    public function getBatch($id = false)
    {
        if($id === false){
            return $this->findAll();
        }else {
            return $this->getWhere(['id' => $id]);
        }   
    }

    public function getBatchBetween($between)
    {
        $this->db->table($this->table);
        $this->select('*');
        $query = $this->where($between);
        return $query->get();
    }

    public function getLastBatch()
    {
        $this->db->table($this->table);
        $this->select('*');
        $this->orderBy('id', 'DESC');
        $this->limit(1);
        $query = $this->get();
        return $query;
    }

    public function saveBatch($data)
    {
        $this->db->db_debug = false;
        $query = $this->db->table($this->table)->insert($data);
        return $query;
    }

    // public function updateBatch($data, $id)
    // {
    //     $query = $this->db->table($this->table)->update($data, array('id' => $id));
    //     return $query;
    // }

    public function deleteBatch($id)
    {
        $data = [
            'is_deleted' => true
        ];
        $query = $this->db->table($this->table)->update($data, array('id' => $id));
        return $query;
    } 
 
}