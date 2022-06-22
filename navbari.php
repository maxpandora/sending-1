<ul>  

  <li>
  <?php 
  //  laat username zien als die is ingelogd
      
  session_start();
  function loggedinstartsession() {
      if(isset($_SESSION['username'])) {
        echo "<li><a href='logout.php' class='navbar-page'>Log out</a></li>";
        echo "<li><a class='username'>". $_SESSION['username'] ."</a></li></ul>";
        
      } else { 
        echo "<li><a href='login.php' class='navbar-page'>Login</a></li>";

      }
        }

     

// De rest van de navigatiebar
        echo "<img src='images/logo.png' alt='logo' class='logo' ></img></a>";
        echo "<li><a href='index.php' class='navbar-page'>Home</a></li>";
        echo "<li><a href='afgerond.php' class='navbar-page'>Afgerond</a></li>";
        loggedinstartsession()
      
  ?></ul>  
