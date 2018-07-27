<?php

include("../php/resize-class.php");

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

//recuperar el ID del evento a subir galeria

if (isset ($_POST['Eventoid'])) 
{

	$idEvent = $_POST['Eventoid'];

	//Recuperar el nombre del evento a subir galeria

	$result = mysqli_query($db,"SELECT * FROM $db_table WHERE id='$idEvent'");
	$row = $result->fetch_object();

	$nameEvent = $row->titulo;

	//crear las cadenas y los directorios a donde se van a guardar las imagenes

	$dirNormal = "../files/Galeria/". $nameEvent . "/Normal/";
	$dirThumb = "../files/Galeria/". $nameEvent . "/Thumb/";

	if(!mkdir($dirNormal, 0777, true)) {
	    echo 'Fallo al crear las carpetas...';
	}

	if(!mkdir($dirThumb, 0777, true)) {
	    echo 'Fallo al crear las carpetas...';
	}

	//mueve la imagen original al directorio normal 
	if (!empty($_FILES)) {

		$name_array = $_FILES['file']['name']; 
		$tmp_name_array = $_FILES['file']['tmp_name']; 
		$type_array = $_FILES['file']['type']; 
		$size_array = $_FILES['file']['size']; 
		$error_array = $_FILES['file']['error']; 

		$allowedExts = array("gif", "jpeg", "jpg", "png","JPEG", "JPG", "PNG");

		$totalimg=0;

		for($i = 0; $i < count($tmp_name_array); $i++){

			$temp = explode(".", $name_array[$i]);
			$extension = end($temp);

			if ((($type_array[$i] == "image/gif")
			|| ($type_array[$i] == "image/jpeg")
			|| ($type_array[$i] == "image/jpg")
			|| ($type_array[$i] == "image/JPG")
			|| ($type_array[$i] == "image/JPEG")
			|| ($type_array[$i] == "image/pjpeg")
			|| ($type_array[$i] == "image/x-png")
			|| ($type_array[$i] == "image/png"))
			|| ($type_array[$i] == "image/PNG")
			&& ($size_array[$i] < 100000000)
			&& in_array($extension, $allowedExts)) {

				if ($error_array[$i] > 0) {

			  	} else {

			    	if (file_exists( $dirNormal . $name_array[$i])) {

			    	} else {

						if(move_uploaded_file($tmp_name_array[$i], $dirNormal . $name_array[$i])){ 

							//redimensiona la imagen del directorio normal y pasala para el directorio thumb

							// *** 1) Initialise / load image
							$resizeObj = new resize( $dirNormal . $name_array[$i] );

							// *** 2) Resize image (options: exact, portrait, landscape, auto, crop)
							$resizeObj -> resizeImage(200, 200, 'crop');

							// *** 3) Save image
							$resizeObj -> saveImage( $dirThumb . $name_array[$i], 100);


						} else { 

				    		echo '<script type="text/javascript">alert("FUCKING ERROR.");</script>'; 
						} 

			    	}
					
					//Salva en la DB galeria la foto

		      		$title = $nameEvent ."_" . $name_array[$i];
					$fecha = date('Y-m-d G:i:s');
					$foto = "http://nocturneoax.com/files/Galeria/". $nameEvent . "/Normal/" . $name_array[$i];
					$fotoThumb = "http://nocturneoax.com/files/Galeria/". $nameEvent . "/Thumb/" . $name_array[$i];
					$eventoid = $idEvent;

					$hasAlbum = '1';

					$query = $db->query("INSERT INTO Galeria (titulo,foto,fecha,fotoThumb,eventoid) VALUES ('$title', '$foto', '$fecha', '$fotoThumb','$eventoid')");
					if ($query) 
					{
						$totalimg++;
						//added;
						echo 'se agrego la fotini';
					}
					else{
						//error;
						echo '<script type="text/javascript">alert("Ocurrio un problema al subir tu evento.");</script>'; 

					}
				}
			} else {
				echo '<script type="text/javascript">alert("Imagen Invalida.");</script>'; 
			}
		}

		echo 'total de img' .$totalimg . 'count' . count($tmp_name_array);

		//Actualiza la DB evento con HasAlbum 
		if ($totalimg == count($tmp_name_array)) {

			$updatequery = mysqli_query($db,"UPDATE Eventos SET hasAlbum='$hasAlbum' WHERE id='$idEvent'");
			if ($updatequery) 
			{
				echo '<script type="text/javascript">alert("Galeria Exitosamente Cargada.");</script>'; 
			}
			else{
				//error;
				echo '<script type="text/javascript">alert("Ocurrio un problema al guardar tu evento.");</script>'; 

			}
		}
	}else{

		echo '<script type="text/javascript">alert("FUCKING ERROR Selecciona un evento.");</script>'; 

	}


}


if (isset ($_POST["eliminar"])) 
{
	$imgcheked = $_POST["checkimag"];

	if(empty($imgcheked))
  	{
    	echo '<script type="text/javascript">alert("Selecciona alguna imagen.");</script>'; 
  	}
  	else
  	{
    	$N = count($imgcheked);

    	for($i=0; $i < $N; $i++)
    	{

      		$query = $db->query("DELETE FROM Galeria WHERE id = $imgcheked[$i]");


    	}

    	echo '<script type="text/javascript">alert("Imagen eliminada exitosamente.");</script>'; 
    	$db->close();
    }
}

if (isset ($_POST["eliminarTodo"])) 
{
	$idDelete = $_POST["eliminarTodo"];

	$query = $db->query("DELETE FROM Galeria WHERE eventoid = '$idDelete'");

	if ($query) {

		$updatequery = mysqli_query($db,"UPDATE Eventos SET hasAlbum='0' WHERE id='$idDelete'");

		if ($updatequery) {

	    	echo '<script type="text/javascript">alert("Galeria eliminada exitosamente.");</script>'; 
		}

	}

}

?>