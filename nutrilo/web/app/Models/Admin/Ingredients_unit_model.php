<?php namespace App\Models\Admin;
use CodeIgniter\Model;
 
class Ingredients_unit_model extends Model
{
    protected $table = 'ingredients_unit';
     
    public function getUnit($id = false)
    {
        if($id === false){
            return $this->findAll();
        }else{
            return $this->getWhere(['id' => $id]);
        }   
    }

}