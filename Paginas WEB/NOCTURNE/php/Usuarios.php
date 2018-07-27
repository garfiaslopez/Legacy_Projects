<?php
$db_host = "localhost";
$db_username = "fermunozroot";
$db_pass = "a8779402294F";
$db_name = "Nocturne";
$db_table= "LoginUsers";


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

if (isset ($_POST["cambiar"])) 
{
	$idSession = $_SESSION['id'];

	$oldPass = $_POST["contravieja"];
	$oldPass = md5($oldPass);
	$newPass = $_POST["newpass"];
	$repeatNewPass = $_POST["repeat"];


	if ($newPass == $repeatNewPass) {

		$result = mysqli_query($db,"SELECT name FROM $db_table WHERE id='$idSession' AND pass='$oldPass'");
		$row_cont = mysqli_num_rows($result);

		if($row_cont == 1)
		{
			$newPass = md5($newPass);

			$updatequery = mysqli_query($db,"UPDATE $db_table SET pass='$newPass' WHERE id='$idSession' AND pass='$oldPass'");

			if ($updatequery) 
			{
				//added;
				echo '<script type="text/javascript">alert("Contraseña actualizada exitosamente.");</script>'; 
			}
			else{
				//error;
				echo '<script type="text/javascript">alert("Ocurrio un problema al actualizar tu usuario.");</script>'; 
			}

		}else
		{
			echo '<script type="text/javascript">alert("Contraseña anterior no coincide.");</script>'; 

		}

	}else
	{
		echo '<script type="text/javascript">alert("Contraseñas nuevas no coinciden.");</script>'; 

	}

}


if (isset ($_POST["nuevo"])) 
{

	$user = $_POST['nuevouser'];
	$pass = $_POST['contranueva'];
	$repeatpass = $_POST['repetir'];


	if(empty($user) || empty($pass))
	{	
    	echo '<script type="text/javascript">alert("Rellenar todos los campos.");</script>'; 
	}
	else
	{
		if ($pass == $repeatpass) {
		
			$user = strip_tags($user);
			$user= $db->real_escape_string($user);
			$pass = strip_tags($pass);
			$pass = $db->real_escape_string($pass);
			$pass = md5($pass);

			$query = $db->query("INSERT INTO $db_table (name,pass) VALUES ('$user', '$pass')");
			if ($query) 
			{
				//added;
				echo '<script type="text/javascript">alert("Usuario agregado exitosamente.");</script>'; 
			}
			else{
				//error;
				echo '<script type="text/javascript">alert("Ocurrio un problema al dar de alta tu usuario.");</script>'; 
				$db->die();
			}


		}else
		{
    		echo '<script type="text/javascript">alert("Contraseñas no concuerdan...");</script>'; 

		}

	}

}

if (isset ($_POST["eliminar"])) 
{

	$idDelete = $_POST["eliminar"];

	if ($idDelete == 1 ) 
	{
		header('location: ../pages/adminConfig.php');
		exit();
	}
	else
	{
		$query = $db->query("DELETE FROM $db_table WHERE id = $idDelete");
		
	}


}
