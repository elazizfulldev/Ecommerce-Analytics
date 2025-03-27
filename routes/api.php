<?php
require_once __DIR__ .'/../app/controllers/UserController.php';





if (isset($_GET['url'])) {
    $url = $_GET['url'];
    
    
    if($url == "public/users"){
       
        $controller = new UserController();
        $controller->getUsers();
        
    }
} 
?>