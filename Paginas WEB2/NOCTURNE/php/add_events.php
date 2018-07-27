<?php
// Values received via ajax
	$title = $_POST['title'];
	$start = $_POST['start'];
	$end = $_POST['end'];
	$description= $_POST['description'];
	$url = $_POST['url'];
	

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

	$query = $db->query("INSERT INTO $db_table (title,description,url,start,end) VALUES ('$title', '$description', '$url', '$start','$end')");

?>