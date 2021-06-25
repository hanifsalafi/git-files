<?php namespace App\Models\Admin;
use CodeIgniter\Model;
 
class Product_model extends Model
{
    protected $table = 'product';
     
    public function getProduct($id = false)
    {
        if($id === false){
            return $this->findAll();
        }else {
            return $this->getWhere(['id' => $id]);
        }   
    }

    public function getProductByCategory($category) {
        return $this->getWhere(['category_id' => $category, 'is_deleted' => false]);
    }

    public function getProductByCode($code) {
        return $this->getWhere(['code' => $code]);
    }

    public function getProductBySlug($slug) {
        return $this->getWhere(['slug' => $slug, 'is_deleted' => false]);
    }

    public function getProductCount($category) {
        if ($category == 0) {
            return $this->db->table($this->table)->countAll();
        } else {
            $query = $this->getWhere(['category_id' => $category, 'is_deleted' => false]);
            return $query->resultID->num_rows;
        }
    }

    public function getProductByTitle($keyword) {
        $que = $this->db->table($this->table)->select('id, name, slug');
        $query = $que->like('name', $keyword);
        $records = $query->getWhere(['is_deleted' => false]);
         
        return $records;
    }

    public function getProductPerPage($category, $limit, $page) {
        // $que =  $this->db->table($this->table)->limit($limit, $page);
        // $query = $que->getWhere(['is_active' => true]);

        $que =  $this->db->table($this->table)->limit($limit, $page);
        if ($category != 0) {
            $query = $que->getWhere(['category_id' => $category,'is_deleted' => false]);
        } else {
            $query = $que->getWhere(['is_deleted' => false]);
        }
         
        return $query;
    }

    public function saveProduct($data)
    {
        $this->db->db_debug = false;
        $query = $this->db->table($this->table)->insert($data);
        return $query;
    }

    public function updateProduct($data, $id)
    {
        $query = $this->db->table($this->table)->update($data, array('id' => $id));
        return $query;
    }

    public function deleteProduct($id)
    {
        $data = [
            'is_deleted' => true
        ];
        $query = $this->db->table($this->table)->update($data, array('id' => $id));
        return $query;
    } 
 
}