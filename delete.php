<?php
require 'database.php';
    
$id = $_GET['id'];

function updaterecord(mysqli $conn, $id){ 
    // $sqlupdate = "update FROM `pakket` WHERE `id`= '".$id."'";
    $sqlupdate = "UPDATE pakket SET afgerond='1' WHERE id=$id";
    
    $result = $conn->query($sqlupdate);
    if(!$result){
        throw new Exception('cannot update');
        echo "cannot ";
    
      }
    } 

updaterecord($conn, $id);
header("location: /sending/index.php");
die;
?>