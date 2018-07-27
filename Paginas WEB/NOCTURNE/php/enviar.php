<?php

if (isset($_POST['submit'])) {


	//Importamos las variables del formulario
	@$name = addslashes($_POST['nombre']);
	@$email = addslashes($_POST['email']);
	@$subject = addslashes($_POST['empresa']);
	@$message = addslashes($_POST['mensaje']);
	//Preparamos el mensaje de contacto
	$cabeceras = "From: $email\n" //La persona que envia el correo
	 . "Reply-To: $email\n";
	$asunto = "$subject"; //El asunto
	$email_to = "contacto@nocturneoax.com"; //cambiar por tu email
	$contenido = "$name le ha enviado el siguiente mensaje:\n"
	. "\n"
	. "$message\n"
	. "\n";
	//Enviamos el mensaje y comprobamos el resultado
	if (@mail($email_to, $asunto ,$contenido ,$cabeceras )) {
	//Si el mensaje se envía muestra una confirmación
		
		echo '<script type="text/javascript">alert("Muchas Gracias, Revisaremos su correo y le enviaremos una pronta respuesta.");</script>'; 


	}else{
	//Si el mensaje no se envía muestra el mensaje de error
		echo '<script type="text/javascript">alert("Error, no se pudo enviar su correo.");</script>'; 
	}



}



?>