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
<div class="columns" style="display: flex; flex-direction: row;">
<?php

        
   $sql = "SELECT * FROM `product` WHERE `finished` = 0";
   $result = $conn->query($sql);
   
   if ($result->num_rows > 0) {
     // output data of each row

     
      echo "<div id='div1'> 
            <h1>queue players</h1>
            <table class='data-table' id='queuetable'>
            <input type='text' id='SearchInput' onkeyup='searchtable()'' placeholder='Search for namename...' title='Type in a name'>
            <tr>
            <th>id</th>
            <th>Selecteer</th>
            <th>Name</th>
            <th>desc</th>
            <th>productype</th>
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

        echo  "<form action='printdata.php' method='post'>";?>
        <tr><td class="data"><?= $row['id'] ?></td>
        <?php
        echo  " <td><input type='checkbox' onclick='checknow()' name='id[]' value='". $row['id']."'></td>";
        echo  "<td class='data'>". $row["name"]    . "</td>";
            ?>
            <td class="data"><?= $row['desc'] ?></td>
            <td class="data"><?= $row['productype'] ?> </td>
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
            echo  "</tr></table>";                
            echo  "<div id='hidebutton'>"; 
            echo  "<button type='submit' class='button' name='submit' value='print'><td class='data'><i class='fa fa-fw fa-copy'></i></a>print</button></td></form>";
            echo  "</div></div>";  

            
   }
  else {
     echo "<H3>De wachttrij is leeg</h3>";
  };

  $show_table_sql = "SHOW TABLE LIKE `product` FROM sending";

  $result2 = $conn->query($show_table_sql);
  if($result2 == FALSE) {
    echo "
<div id='div2'>
<div id='div3'>
<h1>Voeg player toe</h1>           
<form action='app/insert.php' method='post' class='form_1'>
<input type='text' name='name'     class='form-control'      placeholder='namename'                    required>
<input type='text' name='desc'    class='form-control'      placeholder='desc/Mac-adres'            required>
<input type='text' name='productype'       class='form-control'      placeholder='productype adres'       minlength='1'   required>
<input type='text' name='gateway'  class='form-control'      placeholder='Gateway'        minlength='1'   required> 
<input type='text' name='netmask'  class='form-control'      placeholder='Netmask'        minlength='1'   required> 
<input type='text' name='dns'      class='form-control'      placeholder='DNS Server'     minlength='1'   required>";

  // Connect to the database
  // Select all rows from the "users" table

  // Check if the query was successful
  



echo "<BR><BR>
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
