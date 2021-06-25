<?php namespace App\Models\Admin;
use CodeIgniter\Model;
 
class Ingredients_category_model extends Model
{
    protected $table = 'ingredients_category';
     
    public function getCategory($id = false)
    {
        if($id === false){
            return $this->findAll();
        }else{
            return $this->getWhere(['id' => $id]);
        }   
    }

}