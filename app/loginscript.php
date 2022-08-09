<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="stylesheet.css">
</head>
<body>
<?php

    include 'database.php';          
    include '../navbar.php';

    $username = $_POST['username'];  
    $password = md5($_POST['password']);  
      
        //to prevent from mysqli injection  
        $username = stripcslashes($username);  
        $username = mysqli_real_escape_string($conn, $username);  
        // $password = mysqli_real_escape_string($conn, $password);  
      
        $sql = "select * from users where username = '$username' and password = '$password'";   
        $result = mysqli_query($conn, $sql);  
        $row = mysqli_fetch_array($result, MYSQLI_ASSOC);  

        $count = mysqli_num_rows($result);  
          
        if($count == 1){  
            
            $login = $_SESSION['username'] = $username;
            $gohome = header ("location: ../index.php");
        }  
        else{  
            $loginfail = "Gebruikersnaam of wachtwoord onjuist"; 
            $home = header("location: /sending/login.php?error=".$loginfail);
        }     
?>  
</body>
</html>
