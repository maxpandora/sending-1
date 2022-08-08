<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script language="JavaScript" type="text/javascript" src="script.js"></script>
</head>
<body>
  
</body>
</html>
<!DOCTYPE html>
<html lang="nl">
<meta charset="UTF-8">
<title>queue</title>
<head>
<link  rel="icon" type="image/x-icon"  href="images/logo.ico">
<?php 
// benodigde php scripten
include 'navbar.php';
include 'app/database.php';
?>
<body>
<div id="wrapper">
<?php


        
   $sql = "SELECT * FROM `pakket` WHERE `finished` = 0";
   $result = $conn->query($sql);
   
   if ($result->num_rows > 0) {
     // output data of each row
      echo "<div id='div1'> 
            <table class='data-table' >
            <h1>queue players</h1>
            <tr>
            <th>Selecteer</th>
            <th>Name</th>
            <th>Ether</th>
            <th>Ip</th>
            <th>Gateways</th>
            <th>Netmask</th>
            <th>Dns</th>
            <th>Type</th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            </tr>
            ";
            
            while($row = $result->fetch_assoc()) {

        echo  "<form action='printdata.php' method='post'>";
        echo  "<tr> <td><input type='checkbox' onclick='checknow()' name='id[]' value='". $row['id']."'></td>";
        echo  "<td class='data'>". $row["host"]    . "</td>";
              ?>
            <td class="data"><?= $row['ether'] ?></td>
            
            <td class="data"><?= $row['ip'] ?> </td>
            <td class="data"><?= $row['gateway'] ?></td>
            <td class="data"><?= $row['netmask'] ?></td>
            <td class="data"><?= $row['dns'] ?> </td>
            <td class="data"><?= $row['netwerk'] ?></td>
<?php
            echo "<td class='data'><a href=\"/sending/app/delete.php?id=".$row['id']."\"><i class='fa fa-fw fa-send'></i></a>
                  <td class='data'><a href=\"/sending/edit.php?id=".$row['id']."\"><i class='fa fa-fw fa-pencil'></i></a><BR></td>
                  <td class='data'><a href=\"/sending/print.php?print=".$row['id']."\"><i class='fa fa-fw fa-print'></i></a></td>
                  <td class='data'><a href=\"/sending/app/duplicate.php?id=".$row['id']."\"><i class='fa fa-fw fa-copy'></i></a></td>
                  </td>"; 

            }
            echo  "</table>";                
            echo  "<div id='hidebutton'>"; 
            echo  "<button type='submit' class='button' name='submit' value='print'><td class='data'><i class='fa fa-fw fa-copy'></i></a>print</button></td></form>";

            echo  "</div></div>";  

            
   }
  else {
     echo "<H3>De wachttrij is leeg</h3>";
  };

  $show_table_sql = "SHOW TABLE LIKE `pakket` FROM sending";

  $result2 = $conn->query($show_table_sql);
  if($result2 == FALSE) {
    echo "
<div id='div2'>
<div id='div3'>
<h1>Voeg player toe</h1>           
<form action='app/insert.php' method='post' class='form_1'>
<input type='text' name='host'     class='form-control'      placeholder='Hostname'                    required>
<input type='text' name='ether'    class='form-control'      placeholder='Ether/Mac-adres'            required>
<input type='text' name='ip'       class='form-control'      placeholder='Ip adres'       minlength='1'   required>
<input type='text' name='gateway'  class='form-control'      placeholder='Gateway'        minlength='1'   required> 
<input type='text' name='netmask'  class='form-control'      placeholder='Netmask'        minlength='1'   required> 
<input type='text' name='dns'      class='form-control'      placeholder='DNS Server'     minlength='1'   required>
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
      <form action="app/tablecreate.php">
       <input type="submit" value="Maak de database aan"/>
      </form>  
          <?php
          };



   $conn->close();
   
?>
</script>
</div>
</body>
</html>
