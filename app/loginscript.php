
<?php

    include 'database.php';          
    include '../navbar.php';

    $username = $_POST['username'];  
    $password = md5($_POST['password']);  
      
        //to prevent from mysqli injection  
        $username = stripcslashes($username);  
        $username = mysqli_real_escape_string($conn, $username);  
      
        $sql = "select * from users where username = '$username' and password = '$password'";   
        $result = mysqli_query($conn, $sql);  

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
