<?php

require_once __DIR__ . '/Database.php';


class Products {

private $table = "products";


public function getAllProducts(){

    $query = "SELECT * FROM products ";
    $products = Db::getInstance()->executeS($query);
    return $products ;
}




}





?>