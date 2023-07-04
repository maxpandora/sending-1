<?php include_once 'sessionstart.php'; ?>

<!DOCTYPE html>
<html lang="nl">
  <meta charset="UTF-8">
  <title>Players</title>
  <head>
    <link rel="icon" type="image/x-icon" href="images/logo.ico">
    <?php 
      // benodigde php scripten
      include 'navbar.php';
      include 'app/database.php';

      $sql = "SELECT * FROM `pakket` WHERE `finished` = 0";
      $result = $conn->query($sql);

      $show_table_sql = "SHOW TABLE LIKE `pakket` FROM sending";
      $result2 = $conn->query($show_table_sql);

      $sqlUser = "SELECT id, username FROM users";
      $resultUser = mysqli_query($conn, $sqlUser);
    ?>
  </head>

  <body>
    <div class="columns" style="display: flex; flex-direction: row;">
      
      <?php if ($result->num_rows > 0): ?>
        <div id='div1'> 
          <h1>Player voorraad</h1>
          <table class='data-table' id='queuetable'>
            <input type='text' id='SearchInput' onkeyup='searchtable()' placeholder='Search for hostname...' title='Type in a name'>
            <tr>
              <th>id</th>
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
              <th></th>
            </tr>
            <?php while($row = $result->fetch_assoc()): ?>
              <form action='printdata.php' method='post'>
                <tr>
                  <td class="data"><?= $row['id'] ?></td>
                  <td><input type='checkbox' onclick='checknow()' name='id[]' value='<?= $row['id'] ?>'></td>
                  <td class='data'><?= $row['host'] ?></td>
                  <td class="data"><?= $row['ether'] ?></td>
                  <td class="data"><?= $row['ip'] ?></td>
                  <td class="data"><?= $row['gateway'] ?></td>
                  <td class="data"><?= $row['netmask'] ?></td>
                  <td class="data"><?= $row['dns'] ?></td>
                  <td class="data"><?= $row['netwerk'] ?></td>
                  <td class="data"><?= $row['netwerk'] ?></td>
                  <td class='data'><a href="app/delete.php?id=<?= $row['id']    ?>"><i class='fa fa-fw fa-send'></i></a></td>
                  <td class='data'><a href="edit.php?id=<?= $row['id']          ?>"><i class='fa fa-fw fa-pencil'></i></a><BR></td>
                  <td class='data'><a href="print.php?print=<?= $row['id']      ?>" target="blank"><i class='fa fa-fw fa-print'></i></a></td>
                  <td class='data'><a href="app/duplicate.php?id=<?= $row['id'] ?>"><i class='fa fa-fw fa-copy'></i></a></td>
                </tr>
              </form>
            <?php endwhile; ?>
          </table>
          <div id='hidebutton'>
            <form action="" method="post">
              <button type="submit" class="button" name="submit" value="print"><td class="data"><i class="fa fa-fw fa-copy"></i>print</button></td>
            </form>
          </div>
        </div>
      <?php else: ?>
        <h3>De wachttrij is leeg</h3>
      <?php endif; ?>

      <?php if ($result2 == FALSE): ?>
        <div id='div2'>
          <div id='div3'>
            <h1>Voeg player toe</h1>           
            <form action='app/insert.php' method='post' class='form_1'>
              <input type='text' name='host'    class='form-control' placeholder='Hostname'>
              <input type='text' name='ether'   class='form-control' placeholder='Ether/Mac-adres'  required>
              <input type='text' name='ip'      class='form-control' placeholder='Ip adres'         minlength='1'>
              <input type='text' name='gateway' class='form-control' placeholder='Gateway'          minlength='1'> 
              <input type='text' name='netmask' class='form-control' placeholder='Netmask'          minlength='1'> 
              <input type='text' name='dns'     class='form-control' placeholder='DNS Server'       minlength='1'>

              <p>selecteer een klant als dit een extra player is.</p>
  
              <?php if (mysqli_num_rows($resultUser) > 0): ?>
                <select name='userId'>
                  <?php while ($row = mysqli_fetch_assoc($resultUser)): ?>
                    <option value='<?php echo $row["id"]; ?>'><?php echo $row["username"]; ?></option>
                  <?php endwhile; ?>
                </select>
              <?php endif; ?>

              <br><br>
              <label placeholder='DHCP OF STATIC'></label>
              <select name='netwerk'> 
                <option type='text' name='netwerk' value='Static'>Static</option>
                <option type='text' name='netwerk' value='DHCP'>DHCP</option>
              </select>   
              <input type='submit' class='btn' name='submit' value='Submit'>
            </form>
            <br><br>
          </div>
        </div>
      <?php else: ?>
        <p>Eerste keer op Sending?</p>
        <form action="app/tablecreate.php">
          <input type="submit" value="Maak de database aan"/>
        </form>  
      <?php endif; ?>

      <?php $conn->close(); ?>

    </div>
  </body>
</html>
