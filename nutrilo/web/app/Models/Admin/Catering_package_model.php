<?php namespace App\Models\Admin;
use CodeIgniter\Model;
 
class Catering_package_model extends Model
{
    protected $table = 'catering_package';
     
    public function getPackage($id = false)
    {
        if($id === false){
            return $this->findAll();
        }else {
            return $this->getWhere(['id' => $id]);
        }   
    }

 
}