<?php

$db_host = "localhost";
$db_username = "fermunozroot";
$db_pass = "a8779402294F";
$db_name = "Nocturne";
$db_table= "Revistas";


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
if (isset ($_POST['submit'])) 
{

	$allowedExts = array("pdf");

	$temp = explode(".", $_FILES["imagen"]["name"]);
	$extension = end($temp);

	if (in_array($extension, $allowedExts)) {

		if ($_FILES["imagen"]["error"] > 0) {

	  	} else {

	    	if (file_exists("../files/Revistas/" . $_FILES["imagen"]["name"])) {    //HERE!!!!


	    	} else {

	      		move_uploaded_file($_FILES["imagen"]["tmp_name"],
	      		"../files/Revistas/" . $_FILES["imagen"]["name"]);    //HEREEE!!!!!

	    	}

	    	$photo = "http://nocturneoax.com/files/Revistas/" . $_FILES["imagen"]["name"];  //HEREE!!!!!
			$fecha = date('Y-m-d G:i:s');
			
			$title = $_POST['titulo'];
			$body = $_POST['descripcion'];

			$photo = $db->real_escape_string($photo);
			$title = $db->real_escape_string($title);
			$body = $db->real_escape_string($body);
			$body = htmlentities($body);		

			$query = $db->query("INSERT INTO $db_table (titulo,cuerpo,foto,fecha) VALUES ('$title','$body','$photo', '$fecha')");
			if ($query) 
			{
				//added;
				echo '<script type="text/javascript">alert("Revista agregada exitosamente.");</script>'; 
			}
			else{
				//error;
				echo '<script type="text/javascript">alert("Ocurrio un problema al subir tu revista.");</script>'; 
			}
		}

	} else {

		echo '<script type="text/javascript">alert("Formato Invalido.");</script>'; 

	}
	
}


if (isset ($_POST["eliminar"])) 
{
	$imgcheked = $_POST["Revistas"];

	if(empty($imgcheked))
  	{
    	echo '<script type="text/javascript">alert("Selecciona alguna revista.");</script>'; 
  	}
  	else
  	{
    	$N = count($imgcheked);

    	for($i=0; $i < $N; $i++)
    	{

      		$query = $db->query("DELETE FROM $db_table WHERE id = $imgcheked[$i]");

      		if (!$query) {
      		}

    	}

    	echo '<script type="text/javascript">alert("Revistas eliminada exitosamente.");</script>'; 
    }
}




?>