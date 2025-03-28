<?php

require_once __DIR__ . '/Database.php';

class Order {

    private $table = "orders";


    public function getAllOreders(){

        $query = "SELECT * FROM ".$this->table." ";
        $orders = Db::getInstance()->executeS($query);
        return $orders ;

    }
}





?>