<?php

if (isset($_GET['id']) && is_numeric($_GET['id']) && $_GET['id'] < 10000000000000000000) {
	
	$idEdit = $_GET['id'];

}else
{
	header('location: ../pages/galeria.php');
	exit();		
}

?>
