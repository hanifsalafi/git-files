<?php namespace App\Models\Admin;
use CodeIgniter\Model;
 
class Menu_category_model extends Model
{
    protected $table = 'menu_category';
     
    public function getCategory($id = false)
    {
        if($id === false){
            return $this->findAll();
        }else {
            return $this->getWhere(['id' => $id]);
        }   
    }

 
}