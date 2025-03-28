<?php

require_once __DIR__ . '/../models/Order.php';

class OrderController {


    public function getOrders(){

        $order = new Order() ; 
        $orders = $order->getAllOreders() ; 
        echo json_encode($orders);
    }
}






?>