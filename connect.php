<?php

$con = mysqli_connect('localhost', 'root', '', 'registrationdata');

if (!$con) {
    die("Connection Failed:" . mysqli_connect_error());
} 
    
?>