<?php

$con = mysqli_connect('localhost', 'root', '7034', 'registrationdata');

if (!$con) {
    die("Connection Failed:" . mysqli_connect_error());
} else {
    echo "Connection successfully";
    
}
