<?php namespace App\Models\Admin;
use CodeIgniter\Model;
 
class Member_model extends Model
{
    protected $table = 'membership';
     
    public function getMember($card_number = false)
    {
        if($id === false){
            return $this->findAll();
        }else {
            return $this->getWhere(['card_number' => $card_number]);
        }   
    }

    public function saveMember($data)
    {
        $this->db->db_debug = false;
        $query = $this->db->table($this->table)->insert($data);
        return $query;
    }

    public function updateMember($data, $card_number)
    {
        $query = $this->db->table($this->table)->update($data, array('card_number' => $card_number));
        return $query;
    }

    public function deleteMember($card_number)
    {
        $data = [
            'is_deleted' => true
        ];
        $query = $this->db->table($this->table)->update($data, array('card_number' => $card_number));
        return $query;
    } 
 
}