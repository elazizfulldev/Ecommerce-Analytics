<?php

require_once __DIR__ . '/../models/Product.php';


class ProductController{


    public function getProduct(){

        $product = new Products() ;
        $products = $product->getAllProducts();
        echo json_encode($products);
    }

}


?>