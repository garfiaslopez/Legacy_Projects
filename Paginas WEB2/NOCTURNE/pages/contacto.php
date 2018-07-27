<!DOCTYPE html>
<?php
    include ("../php/enviar.php");
?>
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=gb18030">
	
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
                    <li><a href="../pages/noticias.php">Noticias   /</a></li>
                    <li><a href="../pages/galeria.php">Galeria   /</a></li>
                    <li><a href="../pages/agenda.php">Agenda   /</a></li> 
                    <li><a href="../pages/revista.php">Revista   /</a></li> 
                    <li><a id="navbarColor" href="../pages/contacto.php">Contacto</a></li>       
                </ul>
            </div>  

		</div>
	</div>
	<div id="borde">
    	<div class="row">

       		<div class="col-md-1">       			
       		</div>

       		<div class="col-md-10">

                <div class="row">

                    <div class="col-md-1">            
                    </div>

                    <div class="col-md-10">   

                        <div align="center">             
                        <img src="../img/contactobotella.png" class="image">
                        </div>
                
                         <br>

                        <FORM id="contacto" name="contacto" method="POST">

                            <input name="nombre" type="nombre" class="form-control" placeholder="Nombre" required autofocus>
                            <p></p>
                            <input name="empresa" type="empresa" class="form-control" placeholder="Empresa" required autofocus>
                            <p></p>
                            <input name="email" type="email" class="form-control" placeholder="Correo Electronico" required autofocus>
                            <p></p>
                            <textarea name="mensaje" type="mensaje" class="form-control" rows="7" placeholder="Comentarios" required autofocus></textarea>
                            <p></p>
                            <a href="https://www.facebook.com/nocturneoaxaca"><img  class= "image" src="../img/f.png" style="margin-left: 20px; margin-bottom: 30px;"></a>
                            <a href="https://twitter.com/nocturneoax"><img class= "image" src="../img/t.png" style="margin-left: 20px; margin-bottom: 30px;"></a>
                            <div align="right">
                                <button type="submit" name="submit" value="Enviar" class="btn btn-ml btn-primary">Enviar</button>
                            </div>

                        </FORM>         

                    </div>

                    <div class="col-md-1">            
                    </div>
                    
                </div>
                <hr class="featurette-divider">

                <div class="row">
                    
                    <div class="col-md-1">
                        
                    </div>

                    <div class="col-md-10">
                        

                        <div align="center">
                            <img src="../img/contactoship.png" class="image">
                        </div>

                        <div id="contacto">
                                Somos una empresa vanguardista orientada en todo momento a lograr que nuestros productos cuenten con la elegancia, moda, tendencia y calidad que nuestros clientes mas exigentes merecen tener.
                        </div>

                    </div>

                    <div class="col-md-1">
                        
                    </div>
                </div>

                <hr class="featurette-divider">



                <div class="row">
                    
                    <div class="col-md-1">
                        
                    </div>

                    <div class="col-md-10">
                        

                        <div align="center">
                            <img src="../img/contacto.png" class="image">
                        </div>

                        <div id="contacto">
                            Ser una empresa reconocida, distinguida, renombrada y demandante, en el mundo textil enfocada a la elegancia y vanguardia gracias la buena reputacion y distincion adquirida por nuestros productos de gran calidad siempre en contacto con la tendencia y moda , logrando asi enfrentar mercados internacionales.
                        </div>

                    </div>

                    <div class="col-md-1">
                        
                    </div>
                </div>


            </div>


            <div class="col-md-1">
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