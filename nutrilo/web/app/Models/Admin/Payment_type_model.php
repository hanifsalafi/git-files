<?php namespace App\Models\Admin;
use CodeIgniter\Model;
 
class Payment_type_model extends Model
{
    protected $table = 'payment_type';
     
    public function getPaymentType($id = false)
    {
        if($id === false){
            return $this->findAll();
        }else {
            return $this->getWhere(['id' => $id]);
        }   
    }
 
}