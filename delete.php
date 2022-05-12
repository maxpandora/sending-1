<?php
require 'database.php';

    
$id = 9;

function deleterecord(mysqli $conn, $id){ 
    $sqldelete = "DELETE FROM `pakket` WHERE `id`= '".$id."'";
    
    $result = $conn->query($sqldelete);
    if(!$result){
        throw new Exception('cannot delete');
        echo "cannot delete";
    
      }
    } 

deleterecord($conn, $id);
header("location: /sending/index.php");
die;
?>