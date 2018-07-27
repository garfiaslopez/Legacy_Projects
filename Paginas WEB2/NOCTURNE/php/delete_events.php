<?php


/* Values received via ajax */
	$id = $_POST['id'];

	$db_host = "localhost";
	$db_username = "fermunozroot";
	$db_pass = "a8779402294F";
	$db_name = "Nocturne";
	$db_table= "evenement";

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

	$updatequery = mysqli_query($db,"DELETE FROM $db_table WHERE id='$id'");

?>