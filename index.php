<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">
<title>verstuurde pakjes</title>
<link rel="stylesheet" href="stylesheet.css">

<body>
  <div class="div-1">
  <h1>Verstuurde players</h1>
<?php
    $servername='localhost';
    $username='root';
    $password='';
    $dbname = "sending";
    $conn=mysqli_connect($servername,$username,$password,"$dbname");
      if(!$conn){
          die('Could not Connect MySql Server:' .mysql_error());
        }
        




   $sql = "SELECT * FROM `pakket` WHERE 1";
   $result = $conn->query($sql);
   
   if ($result->num_rows > 0) {
     // output data of each row
     while($row = $result->fetch_assoc()) {

      echo "
            <table class='table2'><tr>
            <th>id</th>
            <th>Name</th>
            <th>ip</th>
            <th>gateway</th>
            <th>netmask</th>
            <th>dns</th>
            <th>DHCP/STATIC</th>
            <th>date</th>
            </tr>";

        while($row = $result->fetch_assoc()) {
          echo "<tr><td>" . $row["id"]. "</td><td>" . $row["host"] . "</td>" . "<td>". $row["ip"]. "</td><td>" . $row["gateway"]. "</td><td>". $row["netmask"]. "</td><td>". $row["dns"]. "</td><td>". $row["netwerk"]. "</td><td>". $row["date"]. 
          "</td></tr>";
        }
   }
   } else {
     echo "0 results";
   }
   $conn->close();
   ?>  
</div>

            <div class="div-2">

                    <div class="form-div">
                        <h2>Invoeren player</h2>
                                     
                    <div class="form-group">
                    <form action="insert.php" method="post" class="form_1">
                            
                            <input type="text" name="host" class="form-control" placeholder="Hostname">         
                            <input type="text" name="ip" class="form-control"  placeholder="Ip adres">
                            <input type="text" name="gateway" class="form-control" placeholder="Gateway">                                                
                            <input type="text" name="netmask" class="form-control" placeholder="Netmask">                    
                            <input type="text" name="dns" class="form-control" placeholder="DNS Server">
                            <label></label  placeholder="DHCP OF STATIC">
                            <select name="netwerk">
                            <option type="text" name="netwerk" value="DHCP">DHCP</option>
                            <option type="text" name="netwerk" value="Static">Static</option>
                        </select>
                       
                        <input type="submit" class="btn" name="submit" value="Submit"></form>
                    </div>       
                    </div>    
            </div></div>
            </th></table>
</body>
</html>



