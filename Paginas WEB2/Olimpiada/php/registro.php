<?php



if (isset($_POST["registro"])) {



	$db_host = "localhost";
	$db_username = "garfiaslopez";
	$db_pass = "jose12JESUS";
	$db_name = "Olimpiada";
	$db_table= "Usuarios";

	$_nombre = $_POST["Nombre"];
	$_apellidoP = $_POST["ApellidoP"];
	$_apellidoM = $_POST["ApellidoM"];
	$_edad = $_POST["Edad"];
	$_plantel = $_POST["Plantel"];
	$_localidad = $_POST["Localidad"];
	$_correo = $_POST["Correo"];
	$_telefono = $_POST["Telefono"];
	$_usuario = $_POST["Usuario"];
	$_contra = $_POST["Password"];
	$_contrarepeat = $_POST["PasswordAgain"];


	if ($_nombre == "" or
		$_apellidoP == "" or
		$_apellidoM == "" or
		$_edad == "" or
		$_plantel == "" or
		$_localidad == "" or
		$_correo == "" or
		$_telefono == "" or
		$_usuario == "" or
		$_contra == "" or
		$_contrarepeat == ""
		) {

			echo "<script type='text/javascript'>         

				BootstrapDialog.show({
            		title: 'Error',
            		message: '¡Favor de rellenar todos los datos.',
            		type: BootstrapDialog.TYPE_DANGER
        		}); 
				</script>";			
	}else{


		if ($_edad <= 16) {

			if ($_contra == $_contrarepeat) {

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


				//ENCRYPTAADO:

				$_usuario = strip_tags($_usuario);
				$_usuario= $db->real_escape_string($_usuario);

				$_contra = strip_tags($_contra);
				$_contra = $db->real_escape_string($_contra);

				$_contra = md5($_contra);


				$key = 'SoftwareDeveloper12';

				$mail_encrypt = base64_encode(mcrypt_encrypt(MCRYPT_RIJNDAEL_256, md5($key), $_correo, MCRYPT_MODE_CBC, md5(md5($key))));
				$phone_encrypt = base64_encode(mcrypt_encrypt(MCRYPT_RIJNDAEL_256, md5($key), $_telefono, MCRYPT_MODE_CBC, md5(md5($key))));

				$decrypted = rtrim(mcrypt_decrypt(MCRYPT_RIJNDAEL_256, md5($key), base64_decode($mail_encrypt), MCRYPT_MODE_CBC, md5(md5($key))), "\0");


				$query = $db->query("INSERT INTO Usuarios (Nombre,ApellidoP,ApellidoM,Edad,Plantel,Localidad,Correo,Telefono,UserName,Password) VALUES ('$_nombre' , '$_apellidoP' , '$_apellidoM' , '$_edad' , '$_plantel' , '$_localidad' , '$mail_encrypt' , '$phone_encrypt' , '$_usuario' , '$_contra')");


				//$query = $db->query("INSERT INTO Usuarios (Nombre,ApellidoP,ApellidoM,Edad,Plantel,Localidad,Correo,Telefono,UserName,Password) VALUES ('$_nombre', '$_apellidoP', '$_apellidoM', '$_edad', '$_plantel', '$_localidad', '$_correo', '$_usuario', '$_contra') ");


				if ($query) {

					echo "<script type='text/javascript'>         

						BootstrapDialog.show({
		            		title: 'Felicidades',
		            		message: '¡Te registraste con exito en esta olimpiada; Ahora ya puedes acceder a los recursos que necesitas para tu preparación, que la fuerza este contigo, te desea mucho exito el COOI!.',
		            		type: BootstrapDialog.TYPE_SUCCESS

		        		}); 
						</script>";

				}else{

					echo "<script type='text/javascript'>         

						BootstrapDialog.show({
		            		title: 'Error',
		            		message: '¡Verifica que todos tus datos sean los correctos y vuelve a intentarlo.',
		            		type: BootstrapDialog.TYPE_DANGER
		        		}); 
						</script>";		
				}

			}else{

				echo "<script type='text/javascript'>         

					BootstrapDialog.show({
	            		title: 'Error',
	            		message: '¡Contraseñas no coinciden.',
	            		type: BootstrapDialog.TYPE_DANGER
	        		}); 
					</script>";		

			}
		}else{


			echo "<script type='text/javascript'>         

			BootstrapDialog.show({
        		title: 'Error',
        		message: '¡No tienes la edad que se necesita para poder participar, debes tener 16 o menos. Lo sentimos :(',
        		type: BootstrapDialog.TYPE_DANGER
    		}); 
			</script>";		
		}




	}



}

?>