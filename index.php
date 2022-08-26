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
<title>pakket</title>
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
      echo      "<div id='div1'>";
      echo      "<h1>Amersfoort pakket</h1>";
      echo      "<h4>Ben jij misschien onterecht van het leven ontnomen door een wapen die hier niet<BR>";
      echo      "staat gekoppeld aan een speler meld het bij de staff team</h4>";
      echo      "<hr>";
      echo      "<table class='data-table' id='queuetable'>";
      echo      "<input type='text' id='SearchInput' onkeyup='searchtable()'' placeholder='Check op steamID' title='Type in a name'>";
      echo      "<tr>";
      echo      "<th>SteamID</th>";
      echo      "<th>Discord ID</th>";
      echo      "<th>Wapen</th>";
      echo      "<th>Sinds</th>";
      if($defaultuser) {
      echo      "<th>Actie</th>";
     
      echo      "<th></th>";
      echo      "<th></th>";
      echo      "<th></th>";
      echo      "</tr>";
    }
            while($row = $result->fetch_assoc()) {

        echo  "<form action='printdata.php' method='post'>";
        echo  "<tr>";
        echo  "<td class='data'>". $row["host"]    . "</td>";
              ?>
            <td class="data"><?= $row['ether'] ?></td>
            <td class="data"><?= $row['netwerk'] ?></td>
            <td class="data"><?= $row['date'] ?></td>

<?php
if($defaultuser) {
            echo "<td class='data'><a href=\"/sending/app/delete.php?id=".$row['id']."\"><i class='fa fa-fw fa-send'></i></a>
                  <td class='data'><a href=\"/sending/edit.php?id=".$row['id']."\"><i class='fa fa-fw fa-pencil'></i></a><BR></td>
                  <td class='data'><a href=\"/sending/app/duplicate.php?id=".$row['id']."\"><i class='fa fa-fw fa-copy'></i></a></td>
                  </td>"; 

            }}
            echo  "</tr></table>";                
            echo  "<div id='hidebutton'>"; 
            echo  "</div></div>";  

            
   }
  else {
     echo "<H3>De wachttrij is leeg</h3>";
  };
  
  $checkroleadmin = "SELECT * FROM `users` WHERE `role` = 1";
  $checkadmin = $conn->query($checkroleadmin);

  if($defaultuser) {
   
  $show_table_sql = "SHOW TABLE LIKE `pakket` FROM sending";

  $result2 = $conn->query($show_table_sql);
  if($result2 == FALSE) {
 
    echo "
<div id='div2'>
<div id='div3'>
<h1>pakket</h1>           
<form action='app/insert.php' method='post' class='form_1'>
<input type='text' name='host'     class='form-control'      placeholder='SteamID'                    required>
<input type='text' name='ether'    class='form-control'      placeholder='Discord ID'            required>

<BR><BR>
<label></label  placeholder='wapen'>
<select name='netwerk'> 
<option type='text' name='netwerk' value='Honkbal knuppel'>  Honkbal knuppel          </option>
<option type='text' name='netwerk' value='Mes'>  Mes          </option>
<option type='text' name='netwerk' value='Pistol'>  Pistol          </option>
<option type='text' name='netwerk' value='Desert Eagle '>  Desert Eagle          </option>
<option type='text' name='netwerk' value='Skorpion'>  Skorpion          </option>
<option type='text' name='netwerk' value='AK-47 '>AK-47        </option>
<a>   
</a> <input type='submit' class='btn' name='submit' value='Submit'></form>

</select>
   <BR>  <BR>

</th>
";
if($defaultuser) {
  echo "<a href='createaccount.php'>Registreer een nieuwe Wapenlijsthouder? <I></I></a>";
  }   

  echo " </div></div>";
      
}
  else {
    echo " Eerste keer op Sending?"; 
      ?>
      <form action="app/tablecreate.php">
       <input type="submit" value="Maak de database aan"/>
      </form>  
          <?php
          };

        } 

   $conn->close();
   
?>
</script>
</div>
</body>
</html>
