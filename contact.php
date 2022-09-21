<?php
include 'navbar.php'; 
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Contact</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script language="JavaScript" type="text/javascript" src="script.js"></script>
</head>
<body>
 <div id="contact">
<h1>Contact</h1>
<h3>voor vragen of info kunt u mij bereiken via:</h3>    
<hr>
<form action="mail.php" method="post" class="form_1">
    <div id="container-contact" >
        <input type="text" placeholder="name"></input name="name">
        <input type="text" placeholder="phone"></input name="telefoon">
        <input type="text" placeholder="email"></input name="email">
        <input type="text" placeholder="subject"></input name="subject">
        <textarea name="message" id="mail" cols="30" rows="10" name="message">
           
        </textarea>
        <button>Submit</button>        
    </div>
    <div id="contact2">
    <h1>Kaan Enver Aydin</h1>
    <h3>IT Support Engineer</h1>
    <h5>0612482506</h1>
    <h5>kaanenveraydin@gmail.com</h1>
    </div>
</form>
</body>
</html>