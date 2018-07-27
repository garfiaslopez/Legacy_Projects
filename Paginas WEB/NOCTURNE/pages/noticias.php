<!DOCTYPE html>
<html>
<head>

	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Nocturne</title>
<link rel="icon" type="image/png" href="../img/logo.png">
	<!-- Bootstrap -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/index.css" rel="stylesheet">    

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../js/bootstrap.min.js"></script>

    <!--backstretch-->
    <script src="../js/jquery.js"></script>
    <script src="../js/jquery.backstretch.js">
    </script> 

    <!--CSS-->
    <link href="../css/carousel.css" rel="stylesheet">

</head>
<body background="../img/fondo.png">

	<div id="banner">

		<img id="logo" src="../img/logo.png">				

	</div>								
	<script>
		$("#banner").backstretch([

			<?php
				include("../php/GetBanners.php");

				if ($query) 
                {
                    while ($row = $query->fetch_object())
                    {

                    echo "\"".$row->foto."\",";
                	}
                }

                $db->close();
            ?>	

			]
		,{duration: 2000, fade:3000
       	});
	</script>

	<div class="navbar navbar-inverse" role="navigation">
		<div class="container-fluid">		


			<div class="navbar-header">

				<buttom type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Nocturne|Oaxaca</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</buttom>

				<a id="title" class="navbar-brand" href="http://nocturneoax.com">Nocturne|Oaxaca</a>
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      			<ul class="nav navbar-nav navbar-right">
       				<li><a href="../index.php">Inicio   /</a></li>
       				<li><a href="../pages/eventos.php">Eventos   /</a></li> 
       				<li><a id="navbarColor" href="../pages/noticias.php">Noticias   /</a></li>
       				<li><a href="../pages/galeria.php">Galeria   /</a></li>
       				<li><a href="../pages/agenda.php">Agenda   /</a></li> 
       				<li><a href="../pages/revista.php">Revista   /</a></li> 
       				<li><a href="../pages/contacto.php">Contacto</a></li>       
     			</ul>
         	</div>	




		</div>
	</div>

	<div id="borde">
		<div class="row">
			<div class="col-md-9">

				<div class="container-fluid">

				<?php

				include("../php/GetMainNoticias.php");


				$bandera = 0;

				while ($row = $query->fetch_object()) 
				{
				?>

				<?php
						if ($bandera == 0) {		//		<-- PRIMERA NOTICIA (FORMATO GRANDE ) -->
					?>

							<div class="row-fluid">
				
								<div class="row">
									
									<div class="col-md-2">
									</div>

									<div class="col-md-8">
										
										<div align="center">
											<img id="imageBig"class="image" src=    <?php echo "\"" . $row->foto . "\"";  ?>    >
										</div>

									</div>

									<div class="col-md-2 ">
										
										<div class="row">
											<h3 id="fecha"><?php echo date('d-M-Y', strtotime($row->fecha));?></h3>
										</div>

									</div>

								</div>

								<div class="row">

									<div class="col-md-1">

									</div>
									<div class="col-md-9">
										
										<div class="row" align="left">
											<h3 id="subtitulo">  <?php echo $row->titulo;?>  </h3>
										</div>

										<div id="descripcion" class="row" align="left">

											<?php 
												$texto = substr($row->cuerpo, 0,300);
												echo $texto."...";
											?> 
										</div>

									</div>

									<div id="leermasDIV" class="col-md-2" >
										
										<div class="row " >
											<a id="leermasNoti"  href=<?php echo "\"http://nocturneoax.com/pages/leerNoticia.php?id=" . $row->id . "\"";     ?>     >Leer Mas...</a>  
										</div>

									</div>

								</div>

								<hr class="featurette-divider">

							</div>




						<?php
						}else//			<-- DEMAS NOTICIAS (FORMATO NORMAL ) -->
						{	
						?>


							<div class="row-fluid">
				
								<div class="row">
									
									<div class="col-md-2">
									</div>

									<div class="col-md-8">
										
										<div align="center">
											<img id="imageSmall" class="image" src=    <?php echo "\"" . $row->foto . "\"";  ?>    >
										</div>

									</div>

									<div class="col-md-2 ">
										
										<div class="row">
											<h3 id="fecha" ><?php echo date('d-M-Y', strtotime($row->fecha));?></h3>
										</div>

									</div>

								</div>

								<div class="row">

									<div class="col-md-1">

									</div>
									<div class="col-md-9">
										
										<div class="row" align="left">
											<h3 id="subtitulo">  <?php echo $row->titulo;?>  </h3>
										</div>

										<div id="descripcion" class="row" align="left">

											<?php 
												$texto = substr($row->cuerpo, 0,300);
												echo $texto."...";
											?> 
										</div>

									</div>

									<div id="leermasDIV"  class="col-md-2" >
										
										<div class="row " >
											<a id="leermasNoti" href=<?php echo "\"http://nocturneoax.com/pages/leerNoticia.php?id=" . $row->id . "\"";     ?>     >Leer Mas...</a>  
										</div>

									</div>

								</div>

								<hr class="featurette-divider">

							</div>




						<?php
						}
						$bandera=1;
						?>



				<?php
				}
				?>
				</div>



				<div>
					<?php
					if ($atras > 0) {
					//	echo '<button src="http://nocturneoax.com/pages/noticias.php?p='. $atras .'" class="btn btn-warning">Anterior</button>';

						echo '<a href="http://nocturneoax.com/pages/noticias.php?p='. $atras .'" class="btn btn-warning" role="button">Anterior</a>';

					}

					for ($i=1; $i <= $paginas ; $i++) { 


						if ($pageActual == $i) {

							echo '<a href="http://nocturneoax.com/pages/noticias.php?p='. $i .'" class="btn btn-danger" role="button">' . $i .'</a>';
							//echo '<button src="http://nocturneoax.com/pages/noticias.php?p='. $i .'" class="btn btn-danger">' . $i .'</button>';
						}else{
							echo '<a href="http://nocturneoax.com/pages/noticias.php?p='. $i .'" class="btn btn-success" role="button">' . $i .'</a>';

							//echo '<button src="http://nocturneoax.com/pages/noticias.php?p='. $i .'" class="btn btn-success">' . $i .'</button>';
						}
					

					}

					if ($pageActual < $paginas) {

						echo '<a href="http://nocturneoax.com/pages/noticias.php?p=' . $adelante . '" class="btn btn-warning" role="button">Siguiente</a>';

						//echo '<button href="http://nocturneoax.com/pages/noticias.php?p=' . $adelante . '" class="btn btn-warning">Siguiente</button>';
					}

					?>
				</div>


			</div>



			<div class="col-md-3">

	    		<?php 
	    			include("../php/GetPublicidad.php"); 
	    
	    			if ($query) {

	    				while ($row = $query->fetch_object()) {
	    		?>
							<div class="publi col-md-12">
								<a href=<?php echo '"'.$row->link.'"';?> ><img class="image" src=<?php echo $row->foto?> ></a> 
							</div>
	    				<?php 

	      				}
	    			}else
	    			{
	    			}

	    			$db->close();
	    		?>
			</div>

		
		</div>


		<br>
		<div align="center">
			<img class= "image" src="../img/separador.png">
		</div>
		<br>  
		<a href="https://www.facebook.com/nocturneoaxaca"><img  class= "image" src="../img/f.png" style="margin-left: 20px; margin-bottom: 30px;"></a>
		<a href="https://twitter.com/nocturneoax"><img class= "image" src="../img/t.png" style="margin-left: 20px; margin-bottom: 30px;"></a>

		<footer>
        	<p class="pull-right"><a href="#">Ir Arriba</a></p>
        	<p>&copy; 2014 Berry Software, Inc. </p>
      	</footer>

	</div>	



</body>
</html>