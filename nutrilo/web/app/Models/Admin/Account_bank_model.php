<?php namespace App\Models\Admin;
use CodeIgniter\Model;
 
class Account_bank_model extends Model
{
    protected $table = 'account_bank';
     
    public function getPayment($id = false)
    {
        if($id === false){
            return $this->findAll();
        }else {
            return $this->getWhere(['id' => $id]);
        }   
    }

 
}