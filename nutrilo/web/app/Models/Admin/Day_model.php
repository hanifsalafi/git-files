<?php namespace App\Models\Admin;
use CodeIgniter\Model;
 
class Day_model extends Model
{
    protected $table = 'day';
     
    public function getDay($id = false)
    {
        if($id === false){
            return $this->findAll();
        }else{
            return $this->getWhere(['id' => $id]);
        }   
    }

}