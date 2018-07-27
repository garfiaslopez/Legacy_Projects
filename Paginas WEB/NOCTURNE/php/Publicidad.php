<?php

$db_host = "localhost";
$db_username = "fermunozroot";
$db_pass = "a8779402294F";
$db_name = "Nocturne";
$db_table= "Publicidad";


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

	$allowedExts = array("gif", "jpeg", "jpg", "png","JPEG", "JPG", "PNG");

	$temp = explode(".", $_FILES["imagen"]["name"]);
	$extension = end($temp);

	if ((($_FILES["imagen"]["type"] == "image/gif")
	|| ($_FILES["imagen"]["type"] == "image/jpeg")
	|| ($_FILES["imagen"]["type"] == "image/JPEG")
	|| ($_FILES["imagen"]["type"] == "image/JPG")
	|| ($_FILES["imagen"]["type"] == "image/PNG")
	|| ($_FILES["imagen"]["type"] == "image/jpg")
	|| ($_FILES["imagen"]["type"] == "image/pjpeg")
	|| ($_FILES["imagen"]["type"] == "image/x-png")
	|| ($_FILES["imagen"]["type"] == "image/png"))
	&& ($_FILES["imagen"]["size"] < 100000000)
	&& in_array($extension, $allowedExts)) {

		if ($_FILES["imagen"]["error"] > 0) {

	  	} else {

	    	if (file_exists("../files/Publicidad/" . $_FILES["imagen"]["name"])) {    //HERE!!!!


	    	} else {

	      		move_uploaded_file($_FILES["imagen"]["tmp_name"],
	      		"../files/Publicidad/" . $_FILES["imagen"]["name"]);    //HEREEE!!!!!

	    	}

	    	$photo = "http://nocturneoax.com/files/Publicidad/" . $_FILES["imagen"]["name"];  //HEREE!!!!!
			$fecha = date('Y-m-d G:i:s');

			$photo = $db->real_escape_string($photo);
			$link = $_POST['enlace'];

			$query = $db->query("INSERT INTO $db_table (foto,link,fecha) VALUES ('$photo', '$link','$fecha')");
			if ($query) 
			{
				//added;
				echo '<script type="text/javascript">alert("Publicidad agregada exitosamente.");</script>'; 
			}
			else{
				//error;
				echo '<script type="text/javascript">alert("Ocurrio un problema al subir tu publicidad.");</script>'; 
			}
		}

	} else {

		echo '<script type="text/javascript">alert("Imagen Invalida.");</script>'; 

	}
	
}



if (isset ($_POST["eliminar"])) 
{
	$imgcheked = $_POST["checkimag"];

	if(empty($imgcheked))
  	{
    	echo '<script type="text/javascript">alert("Selecciona alguna publicidad.");</script>'; 
  	}
  	else
  	{
    	$N = count($imgcheked);

    	for($i=0; $i < $N; $i++)
    	{

      		$query = $db->query("DELETE FROM $db_table WHERE id = $imgcheked[$i]");

      		if (!$query) {
      			$db->die();
      		}

    	}

    	echo '<script type="text/javascript">alert("Publicidad eliminada exitosamente.");</script>'; 
    	$db->close();
    }
}



?>