<?php
require 'database.php';
    
$id = $_GET['id'];

function eraserecord(mysqli $conn, $id){ 
    $sqlerase = "DELETE FROM pakket WHERE `pakket`.`id` = $id";
    
    $result = $conn->query($sqlerase);
    if(!$result){
        throw new Exception('cannot erase');
        echo "cannot delete";
    
      }
    } 

        
    eraserecord($conn, $id);
header("location: ../finished.php");
die;
?>