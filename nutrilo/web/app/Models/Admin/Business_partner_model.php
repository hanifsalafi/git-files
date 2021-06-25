<?php namespace App\Models\Admin;
use CodeIgniter\Model;
 
class Business_partner_model extends Model
{
    protected $table = 'business_partner';
     
    public function getPartner($id = false)
    {
        if($id === false){
            return $this->findAll();
        }else {
            return $this->getWhere(['id' => $id]);
        }   
    }

    public function savePartner($data)
    {
        $this->db->db_debug = false;
        $query = $this->db->table($this->table)->insert($data);
        return $query;
    }

    public function updatePartner($data, $id)
    {
        $query = $this->db->table($this->table)->update($data, array('id' => $id));
        return $query;
    }
 
}