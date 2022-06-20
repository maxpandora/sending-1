<?php
include 'database.php';
if(isset($_POST['submit']))

{    
//mysqli_REAL_ESCAPE is om SQL INJECTIONS TE ESCAPEN!
     $username = mysqli_real_escape_string($conn, $_POST['username']);
     $password = mysqli_real_escape_string($conn, $_POST['password']);
     $email = mysqli_real_escape_string($conn, $_POST['email']);
    
    $sql = "INSERT INTO `users`(`username`, `password`, `email`) 
     VALUES ('$username', MD5('".$password."'),'$email')";

}
$sql_u = "SELECT * FROM users WHERE username='$username'";
$sql_e = "SELECT * FROM users WHERE email='$email'";
$res_u = mysqli_query($conn, $sql_u);
$res_e = mysqli_query($conn, $sql_e);

if (mysqli_num_rows($res_u) > 0) {
  echo "Sorry... username already taken"; 	
} else if(mysqli_num_rows($res_e) > 0){
  echo "Sorry... email already taken"; 	
}
else { 
 
  $sql = "INSERT INTO `users`(`username`, `password`, `email`) 
                       VALUES ('$username', MD5('".$password."'),'$email')";
  $insert = mysqli_query($conn, $sql);
  $home = header("location: /sending/index.php");


}

?>
  