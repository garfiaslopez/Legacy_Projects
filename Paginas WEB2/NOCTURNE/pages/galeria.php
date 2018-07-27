<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="icon" type="image/png" href="../img/logo.png">
	<title>Nocturne</title>
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
                    <li><a id="navbarColor" href="../pages/galeria.php">Galeria   /</a></li>
                    <li><a href="../pages/agenda.php">Agenda   /</a></li> 
                    <li><a href="../pages/revista.php">Revista   /</a></li> 
                    <li><a href="../pages/contacto.php">Contacto</a></li>       
                </ul>
            </div>  


	</div>

	<div id="borde">

		<div class="row">

    <?php 

       include("../php/GetEventos.php");
       
       while ($row = $query->fetch_object()) {
           if ($row->hasAlbum == 1) {
          $nameEvent = $row->titulo;
    ?>





            <div class="col-md-4">
              
                <div id="RecuadroGal">

                    <div class="row">

                        <div align="center">

                            <div>

                                <div <?php echo 'class="galeria" id="Gal' . $row->id . '"';?>>

                                </div>         


                                <script>
                                    $(<?php echo '"#Gal'.$row->id . '"'; ?>).backstretch([

                                        <?php

                                            $idEvent = $row->id;

                                            $result = mysqli_query($db,"SELECT * FROM Galeria WHERE eventoid='$idEvent' LIMIT 3");
                                            while ($row = $result->fetch_object())
                                            {
                                              echo "\"".$row->foto."\",";
                                            }

                                        ?>

                                        ]
                                    ,{

                                      duration: <?php echo(rand(500,2500)); ?>, fade:3000
                                      
                                      });
                                </script>

                            </div>
                        </div>
                  
                    </div>

                    <div class="row">

                        <h2 id="tituloEvent">   <?php echo $nameEvent;?>  </h2>

                    </div>           


                    <div class="row">

                        <div align="center">

                            <p><a id="ver" class="btn btn-primary" href=<?php echo '"'. 'http://nocturneoax.com/pages/leerGaleria.php?id=' . $idEvent. '"';?> role="button">ver</a></p>

                        </div>
                    </div>

                </div>
                      
            </div>

      <?php
        }
      }
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