<?php

if(!isset($_SESSION['id']))
{
	header('location: ../admin.php');
	exit();
}
?>