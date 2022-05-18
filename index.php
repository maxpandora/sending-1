<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">
<title>Wachtrij</title>
<link rel="stylesheet" href="stylesheet.css">
<?php require_once 'navbari.php';?>
<body>
  <div class="div-1">
  <h1>Wachtrij players</h1>
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
      echo "
            <table class='table2'><tr>
            <th>Id</th>
            <th>Name</th>
            <th>Ip</th>
            <th>Gateway</th>
            <th>Netmask</th>
            <th>Dns</th>
            <th>DHCP/STATIC</th>
            <th>Datum</th>
            <th>Actie</th>
            </tr>";

        while($row = $result->fetch_assoc()) {
          echo "<tr><td>" . $row["id"]. "</td>";
          echo "<td>" .     $row["host"] . "</td>";
          echo "<td>".      $row["ip"]. "</td>";
          echo "<td>" .     $row["gateway"]. "</td>";
          echo "<td>".      $row["netmask"]. "</td>";
          echo "<td>".      $row["dns"]. "</td>";
          echo "<td>".      $row["netwerk"]. "</td>";
          echo "<td>".      $row["date"]. "</td>";
          echo "<td><a href=\"/sending/sending/delete.php?id=".$row['id']."\">Afgerond</a>
          <a href=\"/sending/sending/edit.php?id=".$row['id']."\">Bewerk</a></td>";
             }
   } else {
     echo "<H3>De wachttrij is leeg</h3>";
  };

  $test = "SHOW TABLE LIKE `pakket` FROM sending";
  $result2 = $conn->query($test);

  if($result2 == FALSE) {

      }

  else {
    echo " als dit je eerste installatie is"; 
    echo '<form action="http://localhost/sending/sending/tablecreate.php">
       <input type="submit" value="Maak de database aan"/>
      </form>';   
          };



   $conn->close();
   ?>  
</div>
 <!-- formulier die naar wordt gebruikt om de gegevens in de db op teslaan door insert.php:70 -->
            <div class="div-2">

                    <div class="form-div">
                        <h1>Voeg player Toe</h1>
                                     
                    <div class="form-group">
                    <form action="insert.php" method="post" class="form_1">
                            
                            <input type="text" name="host" class="form-control"     placeholder="Hostname"    required>         
                            <input type="text" name="ip" class="form-control"       placeholder="Ip adres"    required>
                            <input type="text" name="gateway" class="form-control"  placeholder="Gateway"     required>                                                
                            <input type="text" name="netmask" class="form-control"  placeholder="Netmask"     required>                    
                            <input type="text" name="dns" class="form-control"      placeholder="DNS Server"  required>
                            <BR> <BR>
                            <label></label  placeholder="DHCP OF STATIC">
                            <select name="netwerk"> 
                            <option type="text" name="netwerk" value="DHCP">DHCP</option>
                            <option type="text" name="netwerk" value="Static">Static</option><a>     </a> <input type="submit" class="btn" name="submit" value="Submit"></form>
                        </select>
                        <BR>  <BR>
                        
                    </div>       
                    </div>    
            </div></div>
            </th></table>
</body>
</html>


