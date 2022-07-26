<?php
include 'navbar.php';
unset($_SESSION["username"]);
header("location: /sending/index.php");
?>