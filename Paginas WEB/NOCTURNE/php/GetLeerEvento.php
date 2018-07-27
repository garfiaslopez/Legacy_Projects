<?php

if (isset($_GET['id']) && is_numeric($_GET['id']) && $_GET['id'] < 10000000000000000000) {
	
	$idEdit = $_GET['id'];

	$db_host = "localhost";
	$db_username = "fermunozroot";
	$db_pass = "a8779402294F";
	$db_name = "Nocturne";
	$db_table= "Eventos";

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

	$result = mysqli_query($db,"SELECT * FROM $db_table WHERE id='$idEdit'");	
	$row_cont = mysqli_num_rows($result);

	if($row_cont == 1)
	{

		$row = $result->fetch_object();
		$titulo = $row->titulo;
		$descripcion = $row->cuerpo;
		$fechaEvent = $row->fechaEvento;
		$album=$row->hasAlbum;
		$photo = $row->foto;

	}
	else
	{
		header('location: ../pages/eventos.php');
		exit();		
	}


}else
{
	header('location: ../pages/eventos.php');
	exit();		
}

?>
