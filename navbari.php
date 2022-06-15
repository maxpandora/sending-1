<ul>  

  <li>
  <?php 
  //  laat username zien als die is ingelogd
      
  session_start();
  function loggedinstartsession() {
      if(isset($_SESSION['username'])) {
        echo "<li><a href='logout.php'>Log out</a></li>";
        echo "<li><a class='username'>". $_SESSION['username'] ."</a></li></ul>";
        
      } else { 
        echo "<li><a href='login.php'>Login</a></li>";

      }
        }

     

// De rest van de navigatiebar
        echo "<li><a href='index.php'>Home</a></li>";
        echo "<li><a href='afgerond.php'>Afgerond</a></li>";
        loggedinstartsession()
      
  ?>