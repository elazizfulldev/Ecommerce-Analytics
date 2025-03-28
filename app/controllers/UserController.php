<?php 


require_once __DIR__ . '/../models/User.php';
class UserController {
    public function getUsers() {
        $user = new User();
        $users = $user->getAllUsers();
        echo json_encode($users);
        
    }


    public function index(){
        echo('test');
    }
}







?>