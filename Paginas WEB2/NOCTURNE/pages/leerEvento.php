<?php
    include ("../php/GetLeerEvento.php");
?>

<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Nocturne</title>
<link rel="icon" type="image/png" href="../img/logo.png">
	<link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/index.css" rel="stylesheet">   
    <style>

            /* Demo styles */
            body{border-top:4px solid #000;}
            .content{color:#777;font:12px/1.4 "helvetica neue",arial,sans-serif;width:700px;margin:20px auto;}
            h1{font-size:12px;font-weight:normal;color:#ddd;margin:0;}
            p{margin:0 0 20px}
            a {color:#22BCB9;text-decoration:none;}
            .cred{margin-top:20px;font-size:11px;}

            /* This rule is read by Galleria to define the gallery height: */
            #galleria{height:700px;}
            @media(max-width: 768px){
              #galleria{
                height:400px;
                width: 270px;
              }
            }
    </style> 

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../js/bootstrap.min.js"></script>

    <!--backstretch-->
    <script src="../js/jquery.js"></script>
    <script src="../js/jquery.backstretch.js">
    </script> 
    <!-- load Galleria -->
    <script src="../js/galleria-1.3.6.min.js"></script>

    <script>(function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
         if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.0";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
    </script>

    
    

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
                    <li><a id="navbarColor" href="../pages/eventos.php">Eventos   /</a></li> 
                    <li><a href="../pages/noticias.php">Noticias   /</a></li>
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


                <br>
                <?php
                    if ($album) {
                ?>

                    <div align="center">
                        <div id="galleria">
                        <script>

                            // Load the classic theme
                            Galleria.loadTheme('galleria.classic.min.js');

                            // Initialize Galleria
                            Galleria.run('#galleria');

                        </script>
                        <?php

                            $db_host = "localhost";
                            $db_username = "fermunozroot";
                            $db_pass = "a8779402294F";
                            $db_name = "Nocturne";
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

                            $result = mysqli_query($db,"SELECT * FROM Galeria WHERE eventoid='$idEdit'");
                             while ($row = $result->fetch_object()){
                         ?>
                                <a href= <?php echo '"' . $row->foto . '"'; ?> >
                                    <img 
                                        src= <?php echo '"' . $row->fotoThumb . '"'; ?>,
                                        data-title= <?php echo '"' . $row->titulo . '"'; ?>
                                        data-description= <?php echo '"'. date('d-M-Y', strtotime($row->fecha)) . '"'; ?>
                                    >
                                </a>
                            <?php
                            }
                            ?>
                        </div>
                    </div>
                <?php
                    }else{    
                ?>

                    <img src= <?php echo '"'.$photo.'"';?> class="img-responsive" >


                <?php
                }
                ?>

                <br>

                <div class="row">
                    <div class="col-md-9">
                        
                        <h2 id="subtitulo" > <?php echo $titulo; ?> </h2>

                    </div>

                    <div class="col-md-3">
                        
                        <h2 style="text-align:right;" id="fecha" > <?php echo date('d-M-Y', strtotime($fechaEvent)); ?> </h2>

                    </div>
                </div>




                <div align="center">
                    <img class= "image" src="../img/separador.png">
                </div>

                <div id="descripcion">
                    
                    <?php
                        echo $descripcion;
                    ?>
                </div>

                <br>

                <div class="row">

                    <div class="col-md-9">
                        
                    </div>

                    <div class="col-md-3">
                        
                        <div align="right" id ="megusta">

                           <iframe src= <?php echo '"'.'https://www.facebook.com/plugins/like.php?href=http://www.nocturneoax.com/pages/leerEvento.php?id=' . $idEdit . '&amp;show_faces=true&amp;share=true&amp;layout=button_count' . '"'?> scrolling="no" frameborder="0" allowTransparency="true"></iframe>
                        
                        </div>


                    </div>
                    

                </div>

               <br>
                <div id="fb-root"></div>
                <div class="fb-comments" data-href= <?php echo '"'.'http://www.nocturneoax.com/pages/leerEvento.php?id=' . $idEdit .'"'?> data-width="100%" data-numposts="5" data-colorscheme="dark"></div>            
                


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

        </div> <!-- /row -->

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

    </div> <!-- /Borde -->



</body>
</html>