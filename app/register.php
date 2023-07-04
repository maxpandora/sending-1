<?php
include 'database.php';
if(isset($_POST['submit']))

{    
//mysqli_REAL_ESCAPE is om SQL INJECTIONS TE ESCAPEN!
     $username = mysqli_real_escape_string($conn, $_POST['username']);
     $password = mysqli_real_escape_string($conn, $_POST['password']);
     $email = mysqli_real_escape_string($conn, $_POST['email']);
    
    $sql = "INSERT INTO `login`(`username`, `password`, `email`) 
     VALUES ('$username', MD5('".$password."'),'$email')";

}
$sql_u = "SELECT * FROM login WHERE username='$username'";
$sql_e = "SELECT * FROM login WHERE email='$email'";
$res_u = mysqli_query($conn, $sql_u);
$res_e = mysqli_query($conn, $sql_e);


if (mysqli_num_rows($res_u) > 0) {
  $takenusername = "Deze account bestaat al.";
  $home = header("location: ../createaccount.php?message=".$takenusername);

 exit();
} else if(mysqli_num_rows($res_e) > 0){
  $takenemail = "Deze Email is al in gebruik";
  $home = header("location: ../createaccount.php?message=".$takenemail);
}
else { 
 
  $sql = "INSERT INTO `login`(`username`, `password`, `email`) 
                       VALUES ('$username', MD5('".$password."'),'$email')";
  $insert = mysqli_query($conn, $sql);
  $accountcreated = "Account succesvol aangemaakt, u kunt nu inloggen.";
  $home = header("location: ../login.php?message=".$accountcreated);

}

?>