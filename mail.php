<?php
   $name = mysqli_real_escape_string($conn, $_POST['name']);
   $phone = mysqli_real_escape_string($conn, $_POST['phone']);
   $mail = mysqli_real_escape_string($conn, $_POST['email']);
   $subject = mysqli_real_escape_string($conn, $_POST['subject']);
   $message = mysqli_real_escape_string($conn, $_POST['message']);


?>