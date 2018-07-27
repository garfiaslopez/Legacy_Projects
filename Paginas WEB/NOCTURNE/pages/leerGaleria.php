<?php
    include("../php/GetLeerGaleria.php");
?>
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

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="http://blueimp.github.io/Gallery/css/blueimp-gallery.min.css">
    <link rel="stylesheet" href="../css/bootstrap-image-gallery.css">
    <link rel="stylesheet" href="../css/demo.css">
    <!--backstretch-->
    <script src="../js/jquery.js"></script>
    <script src="../js/jquery.backstretch.js">
    </script> 

    <script>(function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
         if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.0";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
    </script>

    <script src="http://blueimp.github.io/Gallery/js/jquery.blueimp-gallery.min.js"></script>

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

        $result = mysqli_query($db,"SELECT * FROM $db_table WHERE id='$idEdit'");   
        $row_cont = mysqli_num_rows($result);

        if($row_cont == 1)
        {
            $row = $result->fetch_object();
            $titulo = $row->titulo;
            $fechaEvent = $row->fechaEvento;
        }
        else
        {
            header('location: ../pages/eventos.php');
            exit();     
        }

    ?>
    
        <div align="center" class="row">                        
               
            <h2 id="subtitulo" > <?php echo $titulo; ?> </h2>

            <img class= "image" src="../img/separador.png">
     
        </div>
        <div class="container">

            <div id="links">

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
                
                    <a href=<?php echo '"' . $row->foto . '"';?> title=<?php echo '"' . $row->titulo . '"';?> data-gallery="">
                        <img src=<?php echo '"' . $row->fotoThumb . '"';?> alt=<?php echo '"' . $row->titulo . '"';?>>
                    </a>
                
                <?php
                }
                ?>
            
        </div>


        <br>
        <br>
        
        <div class="row">

            <div class="col-md-9">
                
            </div>

            <div class="col-md-3">
                
                <div align="right" id ="megusta">

                   <iframe src= <?php echo '"'.'https://www.facebook.com/plugins/like.php?href=http://www.nocturneoax.com/pages/leerGaleria.php?id=' . $idEdit . '&amp;show_faces=true&amp;share=true&amp;layout=button_count' . '"'?> scrolling="no" frameborder="0" allowTransparency="true"></iframe>
                
                </div>


            </div>
                    

        </div>
        
        <br>

        <div id="fb-root"></div>
        <div class="fb-comments" data-href= <?php echo '"'.'http://www.nocturneoax.com/pages/leerGaleria.php?id=' . $idEdit .'"'?> data-width="100%" data-numposts="5" data-colorscheme="dark"></div>            
        

    </div>




<!-- The Bootstrap Image Gallery lightbox, should be a child element of the document body -->
    <div id="blueimp-gallery" class="blueimp-gallery">
        <!-- The container for the modal slides -->
        <div class="slides"></div>
        <!-- Controls for the borderless lightbox -->
        <h3 class="title"></h3>
        <a class="prev">‹</a>
        <a class="next">›</a>
        <a class="close">×</a>
        <a class="play-pause"></a>
        <ol class="indicator"></ol>
        <!-- The modal dialog, which will be used to wrap the lightbox content -->
        <div class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" aria-hidden="true">&times;</button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body next"></div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default pull-left prev">
                            <i class="glyphicon glyphicon-chevron-left"></i>
                            Previous
                        </button>
                        <button type="button" class="btn btn-primary next">
                            Next
                            <i class="glyphicon glyphicon-chevron-right"></i>
                        </button>
                    </div>
                </div>
            </div>
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