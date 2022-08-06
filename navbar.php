
  
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="stylesheet.css">
<link rel="icon" type="image/ico" href="images/logo.ico"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</body>
<?php




session_start();
 function loggedinstartsession() {
     if(isset($_SESSION['username'])) {
      echo "<li><a href='logout.php' class=active".('login.php')."><i class='fa fa-fw fa-user'></i>Log out</a></li>";
      echo "<li><a class='username'>Welkom ". $_SESSION['username'] ."!</a></li></ul>";
    } else { 
      echo "<li><a href='login.php' class=active".('login.php')."><i class='fa fa-fw fa-user'></i>Log in</a></li>";
      }
      } 


// The function is checking the url for making a link active for the hoover 
// styling css
   function active($currect_page){
  $url_array =  explode('/', $_SERVER['REQUEST_URI']) ;
  $url = end($url_array);  
  if($currect_page == $url){
      echo 'active'; //class name in css 
  } 
}


?>
<ul><div class="newnavbar">
    <li><img src='images/logo.png' alt='logo' class='logo' ></img></a></li>
    <li><a class="<?php active('index.php');?>" href="index.php"><i class="fa fa-fw fa-home"></i>home</a></li>
    <li><a class="<?php active('afgerond.php');?>" href="afgerond.php"><i class="fa fa-fw fa-book"></i>afgerond</a></li>
    <?php loggedinstartsession() ?>
</ul></div>
</html> 

</ul>  
