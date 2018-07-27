<html lang="en">
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="icon" type="image/png" href="img/logo.png">

    <title>Nocturne</title>
	<!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/index.css" rel="stylesheet">

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>

    <!--backstretch-->
    <script src="js/jquery.js"></script>
    <script src="js/jquery.backstretch.js">
    </script> 
    <!--CSS-->
    <link href="css/carousel.css" rel="stylesheet">


	<div id="fb-root"></div>
	<script>(function(d, s, id) {
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) return;
	  js = d.createElement(s); js.id = id;
	  js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.0";
	  fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));</script>


</head>	
<body background="img/fondo.png">

	<div id="banner">			
		<img id="logo" src="img/logo.png">	
	</div>			

	<script>

		$("#banner").backstretch([
			<?php
				include("php/GetBanners.php");

				if ($query) 
                {
                    while ($row = $query->fetch_object())
                    {

                    echo "\"".$row->foto."\",";
                	}
                }

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
       				<li><a id="navbarColor" href="index.php">Inicio   /</a></li>
       				<li><a href="pages/eventos.php">Eventos   /</a></li> 
       				<li><a href="pages/noticias.php">Noticias   /</a></li>
       				<li><a href="pages/galeria.php">Galeria   /</a></li>
       				<li><a href="pages/agenda.php">Agenda   /</a></li> 
       				<li><a href="pages/revista.php">Revista   /</a></li> 
       				<li><a href="pages/contacto.php">Contacto</a></li>       
     			</ul>
         	</div>	



		</div>
	</div>
	<div id="borde">
		<div class="row">
			<div class="col-md-9">	
			    
			    <!-- Carousel================================ -->	


	      		
	      		<div id="myCarousel" class="carousel slide" data-ride="carousel">
	      			
	      			<!-- Indicators -->
			    	<ol class="carousel-indicators">

			    		<?php
			    		include("php/GetEventos.php");
			    		$contador=0;

			    		while ($row = $query->fetch_object()) {
			    			
			    			if ($row->isForMain == 1) {
			    			
				    			if ($contador==0) {
				    				echo '<li data-target="#myCarousel" data-slide-to="0" class="active"></li>';
				    			}else{
				    				echo '<li data-target="#myCarousel" data-slide-to=" '. $contador . ' "></li>';
				    			}
				    			$bandera++;
				    		}
			    		}
			    		?>

			    	</ol>


	    			<div class="carousel-inner">	   


	    				<?php
	    				include("php/GetEventos.php");

	    				$bandera=0;
	    				while ($row = $query->fetch_object()) {
	    					
	    					if ($row->isForMain == 1) {

	    						if ($bandera==0) {
	    				?>
				        			<div class="item active">	    
				          				<img class="img-responsive" src=<?php echo '"'. $row->foto .'"'?> alt="slide">
				       
				          				<div class="cajaTitulo">	

				          					<div class="row">

				          						<div align="center">
				      								<h2 id="tituloEvento"> <?php echo $row->titulo ?> </h2>				      								
				      							</div>

				          						<div align="right">
				      								<h5 id="fec"> <?php echo date('d-M-Y', strtotime($row->fecha)); ?> </h5>				      	
				      							</div>	  				          						
				          					</div>

				      					</div>
				          			
				          				<div class="container">	            			
				            				<div class="carousel-caption">	              				
				              					<p id="leermasCarru"><a class="color btn btn-lg btn-color" href=<?php echo 'http://nocturneoax.com/pages/leerEvento.php?id=' . $row->id; ?> role="button">Leer Mas</a></p>
				            				</div>
				          				</div>
				        			</div>
				        		<?php
				        		}else{
				        		?>
				        			<div class="item">	    
				          				<img class="img-responsive" src=<?php echo '"'. $row->foto .'"'?> alt="slide">
				       
				          				<div class="cajaTitulo">	

				          					<div class="row">

				          						<div align="center">
				      								<h2 id="tituloEvento"> <?php echo $row->titulo ?> </h2>				      								
				      							</div>

				          						<div align="right">
				      								<h5 id="fec"> <?php echo date('d-M-Y', strtotime($row->fecha)); ?> </h5>				      	
				      							</div>	  				          						
				          					</div>

				      					</div>
				          			
				          				<div class="container">	            			
				            				<div class="carousel-caption">	              				
				              					<p id="leermasCarru"><a class="color btn btn-lg btn-color" href=<?php echo 'http://nocturneoax.com/pages/leerEvento.php?id=' . $row->id; ?> role="button">Leer Mas</a></p>
				            				</div>
				          				</div>
				        			</div>
				        		<?php
				        		}
				        		$bandera=1;
			        		}
			        	}
			        	?>


	        			
	      			</div>
	      			<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
	      			<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
	      		</div><!-- /.carousel -->   

	      		<br>

	      		<div id="fb-root"></div>
	      		
	      		<br><br><br>
				<div align="center">
					<img class= "image" src="img/separador.png">
				</div>
				<br><br>

				<div class="container-fluid">
					
					<?php

					include("php/GetMainNoticias.php");

					while ($row = $query->fetch_object()) 
					{
					?>

						<div class="row-fluid">
			
							<div class="row">
								
								<div class="col-md-2">
								</div>

								<div class="col-md-8">
									
									<div align="center">
										<img id="imageInicio" class="image" src=    <?php echo "\"" . $row->foto . "\"";  ?>    >
									</div>

								</div>

								<div class="col-md-2 ">
									
									<div class="row">
										<h3 id ="fecha"><?php echo date('d-M-Y', strtotime($row->fecha));?></h3>
									</div>

								</div>

							</div>

							<div class="row">

								<div class="col-md-1">

								</div>
								<div class="col-md-9">
									
									<div class="row" align="left">
										<h3 id ="subtitulo">  <?php echo $row->titulo;?>  </h3>
									</div>

									<div id ="descripcion"class="row" align="left">

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
					?>
				</div>

	      	</div>
		
			<div class="col-md-3">

				<!--
				<a class="twitter-timeline"  href="https://twitter.com/nocturneoax"  data-widget-id="501612508696678400">Tweets por @nocturneoax</a>
    			<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>


    			<br><br><br>
				<img class= "image" src="img/separador.png">
				-->
				<div class="row">

				<!--PUBLICIDAD-->
				    <?php 

                      include("php/GetPublicidad.php"); 
                      if ($query) 
                      {
                        while ($row = $query->fetch_object()) {
                    ?>

						<div class="publi col-md-12">
							<a href=<?php echo '"'.$row->link.'"';?> ><img id="imagePubli" class="image" src=<?php echo $row->foto?> ></a> 
						</div>

                    <?php 
                      	}
                    }
                    	else
                    	{

                    	}
                    ?>

				</div>

	      		
	      		<br>
				<div align="center">
					<img class= "image" src="img/separador.png">
				</div>

				<br>

				<div class="fb-like-box" data-href="https://www.facebook.com/nocturneoaxaca" data-colorscheme="dark" data-show-faces="true" data-header="false" data-stream="true" data-show-border="true"></div>
				

				<?php
					include("php/contador.php");
				?>
				<br><br><br>

				<div align="center">

					<b id="descripcion">Visitas el último mes: </b>  <h4 id ="subtitulo" > <?php echo $info[1] ?> </h4> <br>
					<b id="descripcion">Visitas totales: </b>   <h4 id ="subtitulo" > <?php echo $info[2] ?> </h4>  <br>
								
				</div>

			</div>
		</div>

		<br>
		<div align="center">
			<img class= "image" src="img/separador.png">
		</div>
		<br>  
	
		<div class="row">

			<a href="https://www.facebook.com/nocturneoaxaca"><img  class= "image" src="img/f.png" style="margin-left: 20px; margin-bottom: 30px;"></a>
			<a href="https://twitter.com/nocturneoax"><img class= "image" src="img/t.png" style="margin-left: 20px; margin-bottom: 30px;"></a>
			
			<div style="margin-top:-90px;" align="right">	

				<h4 id="contactoFooter"> Contacto: Fernando Muñoz</h4>
				<h4 id="contactoFooter"> 951 - 000 - 00 - 00    /   contacto@nocturneoax.com</h4>
				
			</div>			

		</div>
		<br>
		<footer>
        	<p class="pull-right"><a href="#">Ir Arriba</a></p>
        	<p>&copy; 2014 Berry Software, Inc. </p>

      	</footer>
	</div>


</body>
</html>