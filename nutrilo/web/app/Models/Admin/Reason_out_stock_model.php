<?php namespace App\Models\Admin;
use CodeIgniter\Model;
 
class Reason_out_stock_model extends Model
{
    protected $table = 'reason_out_stock';
     
    public function getReason($id = false)
    {
        if($id === false){
            return $this->findAll();
        }else {
            return $this->getWhere(['id' => $id]);
        }   
    }
 
}