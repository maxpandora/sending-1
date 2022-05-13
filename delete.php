<?php
require 'database.php';
    
$id = $_GET['id'];

function deleterecord(mysqli $conn, $id){ 
    // $sqldelete = "DELETE FROM `pakket` WHERE `id`= '".$id."'";
    $sqlupdate = "UPDATE pakket SET afgerond='1' WHERE id=$id";
    
    $result = $conn->query($sqlupdate);
    if(!$result){
        throw new Exception('cannot update');
        echo "cannot ";
    
      }
    } 

deleterecord($conn, $id);
header("location: /sending/sending/index.php");
die;
?>