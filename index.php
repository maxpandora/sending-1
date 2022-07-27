<!DOCTYPE html>
<html lang="nl">
<meta charset="UTF-8">
<title>Wachtrij</title>
<link rel="stylesheet" href="stylesheet.css">
<?php include 'navbar.php';?>
<body>
<div id="wrapper">
<?php

    $servername='localhost';
    $username='root';
    $password='';
    $dbname = "sending";
    $conn=mysqli_connect($servername,$username,$password,"$dbname");
      if(!$conn){
          die('Could not Connect MySql Server:' .mysql_error());
        }
        
   $sql = "SELECT * FROM `pakket` WHERE `afgerond` = 0";
   $result = $conn->query($sql);
   
   if ($result->num_rows > 0) {
     // output data of each row
      echo "<div id='div1'> 
            <table class='data-table'>
            <h1 class='h1dark'>Wachtrij players</h1>
            <tr>
<<<<<<< HEAD
            <th>Alles</th>
=======
>>>>>>> parent of 6a89449 (dev Checkbox added)
            <th>Id</th>
            <th>Name</th>
            <th>Ether</th>
            <th>Ip</th>
            <th>Gateway</th>
            <th>Netmask</th>
            <th>Dns</th>
            <th>DHCP/STATIC</th>
            <th>Datum</th>
            <th>Actie</th>
            </tr>";
            
            while($row = $result->fetch_assoc()) {
              echo "<tr><td>"          .     $row["id"]. "</td>";
              echo "<td class='data'>" .     $row["host"] . "</td>";
              echo "<td class='data'>" .     $row["ether"] . "</td>";
              echo "<td class='data'>".      $row["ip"]. "</td>";
              echo "<td class='data'>" .     $row["gateway"]. "</td>";
              echo "<td class='data'>".      $row["netmask"]. "</td>";
              echo "<td class='data'>".      $row["dns"]. "</td>";
              echo "<td class='data'>".      $row["netwerk"]. "</td>";
              echo "<td class='data'>".      $row["date"]. "</td>";
              echo "<td class='data'><ol><li><a href=\"/sending/delete.php?id=".$row['id']."\">Afgerond</a></li>
              <li><a href=\"/sending/edit.php?id=".$row['id']."\">Bewerk</a></li><BR>
              <li><a href=\"/sending/print.php?print=".$row['id']."\">Print</a></li>
              <li><a href=\"/sending/duplicate.php?id=".$row['id']."\">Dupliceren</a></li></ol></td>"; }
              echo "</table>
              </div>";
               
   }
  else {
     echo "<H3>De wachttrij is leeg</h3>";
  };

  $verbindingdatabase = "SHOW TABLE LIKE `pakket` FROM sending";

  $result2 = $conn->query($verbindingdatabase);
  if($result2 == FALSE) {
    echo "
<div id='div2'>
<div id='div3'>
<h1>Voeg player toe</h1>           
<form action='insert.php' method='post' class='form_1'>
<input type='text' name='host'    class='form-control'      placeholder='Hostname'                    required>
<input type='text' name='ether'    class='form-control'      placeholder='Ether/Mac-adres'            required>
<input type='text' name='ip'      class='form-control'      placeholder='Ip adres'    minlength='1'   required>
<input type='text' name='gateway' class='form-control'      placeholder='Gateway'     minlength='1'   required> 
<input type='text' name='netmask' class='form-control'      placeholder='Netmask'     minlength='1'   required> 
<input type='text' name='dns'     class='form-control'      placeholder='DNS Server'  minlength='1'   required>
<BR><BR>
<label></label  placeholder='DHCP OF STATIC'>
<select name='netwerk'> 
<option type='text' name='netwerk' value='DHCP'>DHCP</option>
<option type='text' name='netwerk' value='Static'>Static</option><a>   
</a> <input type='submit' class='btn' name='submit' value='Submit'></form>
</select>
   <BR>  <BR>

</th>
</div></div>";
      }
  else {
    echo " Eerste keer op Sending?"; 
      ?>
      <form action="http://localhost/sending/tablecreate.php">
       <input type="submit" value="Maak de database aan"/>
      </form>  
          <?php
          };



   $conn->close();
   
?>
</div>
</body>
</html>
