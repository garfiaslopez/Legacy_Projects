<?php

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



if (isset ($_POST['submit'])) 
{

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

	    	if (file_exists("../files/Eventos/" . $_FILES["imagen"]["name"])) {

	    	} else {

	      		move_uploaded_file($_FILES["imagen"]["tmp_name"],
	      		"../files/Eventos/" . $_FILES["imagen"]["name"]);

	    	}

      		$title = $_POST['titulo'];
			$body = $_POST['descripcion'];
			$photo = "../files/Eventos/" . $_FILES["imagen"]["name"];
			$fecha = date('Y-m-d G:i:s');

			$d = new DateTime($_POST['FechaEvento']);
			$timestamp = $d->getTimestamp(); // Unix timestamp
			$formatted_date = $d->format('Y-m-d'); // se voltea la fecha para la db.

			$hasAlbum = NO;
			$carrousel= NO;
			$title = $db->real_escape_string($title);
			$body = $db->real_escape_string($body);
			//$body = htmlentities($body);


			if ($title && $body) {

				$query = $db->query("INSERT INTO $db_table (titulo,cuerpo,foto,fecha,fechaEvento,hasAlbum,isForMain) VALUES ('$title', '$body', '$photo', '$fecha','$formatted_date','$hasAlbum','$carrousel')");
				if ($query) 
				{
					//added;
					echo '<script type="text/javascript">alert("Evento agregado exitosamente.");</script>'; 
				}
				else{
					//error;
					echo '<script type="text/javascript">alert("Ocurrio un problema al subir tu evento.");</script>'; 

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
else
{
	//echo "ISNOTSET POST SUBMIT";
}


if (isset ($_POST['saveCarrousel']))
{
	$evenChecked = $_POST["Carrousel"];

	if(empty($evenChecked))
  	{
  		$result = mysqli_query($db,"SELECT * FROM $db_table");

 		while($row = mysqli_fetch_array($result)) {
 				
			$identiti = $row['id'];
			$updatequery = mysqli_query($db,"UPDATE $db_table SET isForMain='0' WHERE id='$identiti'");

 		}



    	echo '<script type="text/javascript">alert("Guardado exitosamente.");</script>'; 
    	$db->close();  	}
  	else
  	{
    	//valor de los elementos a modificar
    	$N = count($evenChecked);
    	//valor de los eventos en server:
    	$result = mysqli_query($db,"SELECT * FROM $db_table");

 		while($row = mysqli_fetch_array($result)) {			
 		//recorre todos los eventos del servidor:
 			$bandera=false;

			for ($j=0; $j < $N ; $j++) { 
				//recorre todos los checkboxes...
				$identiti = $row['id'];

				if ($row['id'] == $evenChecked[$j]) {
					//esta el id entre los checkeados....se actualiza su checkbox a positivo:
					$bandera = true;

					$updatequery = mysqli_query($db,"UPDATE $db_table SET isForMain='1' WHERE id='$identiti'");
					break;
				}

			}
			if ($bandera == false) {
				//no lo encontro:  // se actualiza su checkbox a negativo
				$updatequery = mysqli_query($db,"UPDATE $db_table SET isForMain='0' WHERE id='$identiti'");
			}

		}
    	echo '<script type="text/javascript">alert("Guardado exitosamente.");</script>'; 
    }

}



if (isset($_POST['editar']) && is_numeric($_POST['editar']) && $_POST['editar'] < 10000000000000000000) {
	
	$idEdit = $_POST['editar'];

	$result = mysqli_query($db,"SELECT * FROM $db_table WHERE id='$idEdit'");
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

	    	if (file_exists("../files/Eventos/" . $_FILES["imagen"]["name"])) {
	    		echo "la foto existe";

	    		$photo = "../files/Eventos/" . $_FILES["imagen"]["name"];

	    	} else {

	      		move_uploaded_file($_FILES["imagen"]["tmp_name"],
	      		"../files/Eventos/" . $_FILES["imagen"]["name"]);

	      		$photo = "../files/Eventos/" . $_FILES["imagen"]["name"];
	      		echo "movio la foto y ";
	    	}
		}

	} else {

		$result = mysqli_query($db,"SELECT * FROM $db_table WHERE id='$idEdit'");
		$row = $result->fetch_object();
		$photo = $row->foto;
		echo "tomo foto anterior . ". $photo;
	}


  	$title = $_POST['titulo'];
	$body = $_POST['descripcion'];
	$fecha = date('Y-m-d G:i:s');
	$title = $db->real_escape_string($title);
	$body = $db->real_escape_string($body);
	//$body = htmlentities($body);

	$d = new DateTime($_POST['FechaEvento']);
	$timestamp = $d->getTimestamp(); // Unix timestamp
	$formatted_date = $d->format('Y-m-d'); // se voltea la fecha para la db.

	//CHECK IF I HAVE ALBUM....  (?)

	if ($title && $body) {

		$updatequery = mysqli_query($db,"UPDATE $db_table SET titulo='$title', cuerpo='$body', foto='$photo', fecha='$fecha',fechaEvento='$formatted_date' WHERE id='$idEdit'");
		if ($updatequery) 
		{
			//added;
			echo '<script type="text/javascript">alert("Evento actualizado exitosamente."); window.location.assign("../pages/adminEventos.php"); </script>'; 
		}
		else{
			//error;
			echo '<script type="text/javascript">alert("Ocurrio un problema al guardar tu evento.");</script>'; 

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
		header('location: ../pages/adminEventos.php');
		$db->close();
		exit();
		echo '<script type="text/javascript">alert("Evento eliminado exitosamente.");</script>'; 
	}
	else{
		//error;
		echo '<script type="text/javascript">alert("Ocurrio un problema al eliminar tu Evento.");</script>'; 

	}


}



?>