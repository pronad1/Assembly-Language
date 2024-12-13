<?php

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    include 'connect.php';

    if (isset($_POST['signup'])) {
        $username = $_POST['username'];
        $password = md5($_POST['password']);
        $cpassword = md5($_POST['cpassword']);

        // $sql="insert into `data` (username,password) values('$username','$password')";
        // $result=mysqli_query($con,$sql);

        // if($result){
        //     echo "Data inserted successfully";
        // }else{
        //     die(mysqli_error($con));
        // }



        $sql = "select * from `data` where username='$username' ";
        $result = mysqli_query($con, $sql);
        if ($result) {
            $num = mysqli_num_rows($result);
            if ($num) {
                echo "User already exist";
            } else {

                if ($password === $cpassword) {
                    $sql = "insert into `data` (username,password) values('$username','$password')";
                    $result = mysqli_query($con, $sql);
                    if ($result) {
                        echo "Sign Up Successfully";
                    }
                } else {
                    echo "Password didn't match";
                }
            }
        }
    }
}
