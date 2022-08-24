<?php
    include 'database.php';
    
$id = $_GET['id'];

function deleterecord(mysqli $conn, $id){ 
    // $sqldelete = "DELETE FROM `wapenlijst` WHERE `id`= '".$id."'";
    $sqlupdate = "UPDATE wapenlijst SET finished='1' WHERE id=$id";
    
    $result = $conn->query($sqlupdate);
    if(!$result){
        throw new Exception('cannot update');
        echo "cannot ";
    
      }
    } 

deleterecord($conn, $id);
header("location: /sending/index.php");
die;
?>