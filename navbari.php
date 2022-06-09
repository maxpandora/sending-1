<ul>  

  <li><?php 
      session_start();
      if(isset($_SESSION['username'])) {
        echo "<li><a href='index.php'>Home</a></li>";
        echo "<li><a href='afgerond.php'>Afgerond</a></li>";
        echo "<li><a href='login.php'>Login</a></li>";
        echo "<li><a class='username'>" . $_SESSION['username'] . "</a></li>";
      }
  ?>
</ul>