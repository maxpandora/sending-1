<? include_once 'sessionstart.php'; ?>
<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Finished</title>
    <link rel="stylesheet" href="stylesheet.css">

<!-- Bootstrap JavaScript -->
<script src="js/bootstrap.bundle.min.js"></script>

</head>
<body>
    <?php 
    include 'navbar.php';
    include 'app/database.php';
      // MYSQL query
      $sql2 = "SELECT * FROM `pakket` WHERE `finished` = 1";
      $result = $conn->query($sql2);
    ?>

  <div id="wrapper">
    <div class="div-1">
      <h1>Finished</h1>

   <?php if ($result->num_rows > 0) : ?>
            <table class='data-table'><tr>
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
            
            <?php if(isset($_SESSION['username'])) : ?>
              <th>actie</th> </tr>
            <?php endif;?>
    
           
        <?php while($row = $result->fetch_assoc()) : ?>
          <tr><td><?= $row["id"] ?></td>
          <td><?= $row["host"] ?></td>
          <td><?= $row["ether"] ?></td>
          <td><?= $row["ip"] ?></td>
          
          <td><?= $row["gateway"] ?></td>
          <td><?= $row["netmask"] ?></td>
          <td><?= $row["dns"] ?></td>
          <td><?= $row["netwerk"] ?></td>
          <td><?= $row["date"] ?></td>    
          <td><a href="app/queue.php?id=<?= $row['id'] ?>">  <i class='fa fa-clock-o' aria-hidden='true'></i></a> | 
          <a href="info.php?id=<?= $row['id'] ?>">           <i class='fa fa-info-circle' aria-hidden='true'></i></a> |
          <a href="addclient.php?id=<?= $row['id'] ?>">      <i class='fa-duotone fa-flag-checkered' aria-hidden='true'></i></a>
          

          <?php if(isset($_SESSION['username'])) : ?>
              <td><a href="app/erase.php?id=<?= $row['id'] ?>"> <button>X</button></a>
          <?php endif; ?>

    <?php endwhile; ?>

    <?php else: ?>
      Nog geen players finished
    <?php endif; ?>

  <?php $conn->close(); ?>  
</div></div>
</body>
</html>