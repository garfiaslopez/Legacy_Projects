<?php

$db_host = "localhost";
$db_username = "fermunozroot";
$db_pass = "a8779402294F";
$db_name = "Nocturne";
$db_table= "Noticias";


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
	|| ($_FILES["imagen"]["type"] == "image/jpg")
	|| ($_FILES["imagen"]["type"] == "image/JPEG")
	|| ($_FILES["imagen"]["type"] == "image/JPG")
	|| ($_FILES["imagen"]["type"] == "image/PNG")
	|| ($_FILES["imagen"]["type"] == "image/pjpeg")
	|| ($_FILES["imagen"]["type"] == "image/x-png")
	|| ($_FILES["imagen"]["type"] == "image/png"))
	&& ($_FILES["imagen"]["size"] < 100000000)
	&& in_array($extension, $allowedExts)) {

		if ($_FILES["imagen"]["error"] > 0) {

	  	} else {

	    	if (file_exists("../files/Noticias/" . $_FILES["imagen"]["name"])) {

	    	} else {

	      		move_uploaded_file($_FILES["imagen"]["tmp_name"],
	      		"../files/Noticias/" . $_FILES["imagen"]["name"]);

	    	}

      		$title = $_POST['titulo'];
			$body = $_POST['descripcion'];
			$photo = "../files/Noticias/" . $_FILES["imagen"]["name"];
			$fecha = date('Y-m-d G:i:s');
			$title = $db->real_escape_string($title);
			$body = $db->real_escape_string($body);
			// $body = htmlentities($body);


			if ($title && $body) {

				$query = $db->query("INSERT INTO $db_table (titulo,cuerpo,foto,fecha) VALUES ('$title', '$body', '$photo', '$fecha')");
				if ($query) 
				{
					//added;
					echo '<script type="text/javascript">alert("Noticia agregada exitosamente.");</script>'; 
				}
				else{
					//error;
					echo '<script type="text/javascript">alert("Ocurrio un problema al subir tu noticia.");</script>'; 

				}

			}
			else{
				//mising data
				echo '<script type="text/javascript">alert("Favor de rellenar todos los campos.");</script>'; 

			}
		}

	} else {

		echo '<script type="text/javascript">alert("Imagen Invalida.");</script>'; 

	}
	
}


if (isset($_POST['editar']) && is_numeric($_POST['editar']) && $_POST['editar'] < 10000000000000000000) {
	
	$idEdit = $_POST['editar'];

	$result = mysqli_query($db,"SELECT * FROM $db_table WHERE id='$idEdit'");
	$row_cont = mysqli_num_rows($result);

	$row = $result->fetch_object();

}



if (isset ($_POST["guardar"])) 
{
	$idEdit = $_POST['guardar'];

	$allowedExts = array("gif", "jpeg", "jpg", "png","JPEG", "JPG", "PNG");

	$temp = explode(".", $_FILES["imagen"]["name"]);
	$extension = end($temp);

	if ((($_FILES["imagen"]["type"] == "image/gif")
	|| ($_FILES["imagen"]["type"] == "image/jpeg")
	|| ($_FILES["imagen"]["type"] == "image/jpg")
	|| ($_FILES["imagen"]["type"] == "image/pjpeg")
	|| ($_FILES["imagen"]["type"] == "image/JPEG")
	|| ($_FILES["imagen"]["type"] == "image/JPG")
	|| ($_FILES["imagen"]["type"] == "image/PNG")
	|| ($_FILES["imagen"]["type"] == "image/x-png")
	|| ($_FILES["imagen"]["type"] == "image/png"))
	&& ($_FILES["imagen"]["size"] < 100000000)
	&& in_array($extension, $allowedExts)) {

		if ($_FILES["imagen"]["error"] > 0) {

	  	} else {

	    	if (file_exists("../files/Noticias/" . $_FILES["imagen"]["name"])) {

	    	} else {

	      		move_uploaded_file($_FILES["imagen"]["tmp_name"],
	      		"../files/Noticias/" . $_FILES["imagen"]["name"]);

	      		$photo = "../files/Noticias/" . $_FILES["imagen"]["name"];
	    	}
		}
	} else {
		$result = mysqli_query($db,"SELECT * FROM $db_table WHERE id='$idEdit'");
		$row_cont = mysqli_num_rows($result);

		$row = $result->fetch_object();
		$photo = $row->foto;
	}


  	$title = $_POST['titulo'];
	$body = $_POST['descripcion'];
	$fecha = date('Y-m-d G:i:s');
	$title = $db->real_escape_string($title);
	$body = $db->real_escape_string($body);
	//$body = htmlentities($body);


	if ($title && $body) 
	{
		$updatequery = mysqli_query($db,"UPDATE $db_table SET titulo='$title', cuerpo='$body', foto='$photo', fecha='$fecha' WHERE id='$idEdit'");
		if ($updatequery) 
		{
			//added;
			echo '<script type="text/javascript">alert("Noticia guardada exitosamente."); window.location.assign("../pages/adminNoticias.php"); </script>'; 
		}
		else{
			//error;
			echo '<script type="text/javascript">alert("Ocurrio un problema al guardar tu noticia.");</script>'; 
		}
	}
	else{
		//mising data
		echo '<script type="text/javascript">alert("Favor de rellenar todos los campos.");</script>'; 
	}
}



if (isset ($_POST["eliminar"])) 
{
	$id = $_POST['eliminar'];

	$updatequery = mysqli_query($db,"DELETE FROM $db_table WHERE id='$id'");
	if ($updatequery) 
	{
		//added;
		//FALTARIA ALGUN ALERTVIEW:::::
		header('location: ../pages/adminNoticias.php');
		$db->close();
		exit();
		echo '<script type="text/javascript">alert("Noticia eliminada exitosamente.");</script>'; 
	}
	else{
		//error;
		echo '<script type="text/javascript">alert("Ocurrio un problema al eliminar tu noticia.");</script>'; 

	}


}







?>