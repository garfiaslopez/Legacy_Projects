<?php

if (isset($_GET['id']) && is_numeric($_GET['id']) && $_GET['id'] < 10000000000000000000) {
	
	$idEdit = $_GET['id'];

	$db_host = "localhost";
	$db_username = "fermunozroot";
	$db_pass = "a8779402294F";
	$db_name = "Nocturne";
	$db_table= "Galeria";

	//DatabaseConnection:
	$db = mysqli_connect($db_host,$db_username,$db_pass,$db_name);
	// Check connection
	if (mysqli_connect_errno())
	{
		//echo "Failed to connect to MySQL: " . mysqli_connect_error();
	}else
	{
		//echo "<html> \r\n successfully connection \r\n </html>";
	}

	$result = mysqli_query($db,"SELECT * FROM $db_table WHERE eventoid='$idEdit'");	
	

}else
{
	header('location: ../pages/eventos.php');
	exit();		
}

?>
