<?php namespace App\Models\Admin;
use CodeIgniter\Model;
 
class Order_status_model extends Model
{
    protected $table = 'order_status';
     
    public function getStatus($id = false)
    {
        if($id === false){
            return $this->findAll();
        }else{
            return $this->getWhere(['id' => $id]);
        }   
    }

}