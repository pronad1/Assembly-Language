<?php

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    include 'connect.php';

    if (isset($_POST['login'])){
        $username = $_POST['username'];
        $password = md5($_POST['password']);

        $sql="Select * from `data` where username='$username' and password='$password' ";

        $result = mysqli_query($con, $sql);
        if ($result){
            $num = mysqli_num_rows($result);

            if($num>0){
                echo "Login Successful";
            }else{
                echo "Invalid credentials";
            }
        }
    }
}

?>