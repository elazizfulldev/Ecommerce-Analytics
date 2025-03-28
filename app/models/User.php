<?php
require_once __DIR__ . '/Database.php';

class User {
    
    private $table = "users";

   

    public function getAllUsers() {
        
        $query = "SELECT u.id, u.name, u.email FROM  ". $this->table ." u " ;
        $users = Db::getInstance()->executeS($query);
        return $users ;
    }
}
?>
