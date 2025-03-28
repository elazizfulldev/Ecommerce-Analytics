<?php
require_once __DIR__ .'/../app/controllers/UserController.php';
require_once __DIR__ .'/../app/controllers/ProductController.php';
require_once __DIR__ .'/../app/controllers/OrderController.php';





if (isset($_GET['url'])) {
    $url = $_GET['url'];
    $url = explode('/', trim($url, '/'));
    
    
    if($url[1] == "users"){
       
        $UserController = new UserController();
        $UserController->getUsers();
        
    }

    if($url[1] == "products"){

        $ProductController = new ProductController();
        
        $ProductController->getProduct();

    }

    if($url[1] == "orders"){

        $OrderController = new OrderController();
        
        $OrderController->getOrders();

    }
} 
?>