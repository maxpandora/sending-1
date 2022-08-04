<?php
require 'database.php';
if(isset($_POST['submit']))

// $id=$_POST['id'];


if(isset($_POST['submit']))
{
    $all_id = $_POST['id'];
    $extract_id = implode(',' , $all_id);


   $query = "SELECT * FROM `pakket` WHERE id=($extract_id)";
    $query_run = mysqli_query($conn, $query);

    if(!$query_run)
    {
      $host = "SELECT `host` FROM `pakket` WHERE `id` IN ('$extract_id')";
      $result = mysqli_query($conn, $host);
     
      while ($hosts=mysqli_fetch_array($result)) {
         $all_hosts[]  = array("host" => $hosts[0]);
       }

      // $host = "SELECT * FROM `pakket` WHERE id=($extract_id)";
      // $host = "SELECT * FROM `pakket` WHERE id=($extract_id)";
      // $host = "SELECT * FROM `pakket` WHERE id=($extract_id)";
      // $host = "SELECT * FROM `pakket` WHERE id=($extract_id)";
      // $host = "SELECT * FROM `pakket` WHERE id=($extract_id)";
      // $host = "SELECT * FROM `pakket` WHERE id=($extract_id)";
   }
    else
    {

    }
}
?>