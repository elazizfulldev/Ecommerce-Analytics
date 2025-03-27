<?php 


require_once __DIR__ . '/../models/User.php';
class UserController {
    public function getUsers() {
        $user = new User();
        $users = $user->getAllUsers();
        echo json_encode($users);
        echo('test1');
    }


    public function index(){
        echo('test');
    }
}







?>