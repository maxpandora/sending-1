<?php
require 'database.php';
require('fpdf.php');

if(isset($_POST['submit']))
 $id=$_POST['id'];
{
        $all_id = $_POST['id'];
        $extract_id = implode(', ' , $all_id);
      
        echo ($extract_id);
                 {
           $sql = "SELECT * FROM `pakket` WHERE `id` IN ($extract_id)";
           $rows = array();
           $result = $conn-> query($sql);
           while($row = mysqli_fetch_array($result)) {

               $rows[] = $row;

            
           }    
              foreach ($rows as $row => $value) {
                echo "<BR>";
                print_r($value['host']);
                print_r($value['netwerk']);                
                print_r($value['ip']);                
                print_r($value['dns']);                
         
              }

}}
?>