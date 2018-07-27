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
    <script type="text/javascript" src="../js/pdfobject.js"></script>

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



  <script type="text/javascript">

    window.onload = function ()
    {

      <?php 
        $db_host = "localhost";
        $db_username = "fermunozroot";
        $db_pass = "a8779402294F";
        $db_name = "Nocturne";
        $db_table= "Revistas";
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
        $query = $db->query("SELECT * FROM $db_table ORDER BY id DESC LIMIT 1");
        
        $row = $query->fetch_object(); 
        
      ?>
      var parametros = {
        navpanes: 1,
        view: "FitH",
        pagemode: "thumbs"
      };
      var atributos = {
        url: "<?php echo $row->foto ?>", 
        pdfOpenParams: parametros
      };

      var pdf = new PDFObject(atributos);
      pdf.embed("VisorPDF");

      
    };

  </script>



  <script type="text/javascript">

  function CambiarPDF(link)
  {

    var parametros = {
      navpanes: 1,
      view: "FitH",
      pagemode: "thumbs"
    };
    var atributos = {
      url: link, 
      pdfOpenParams: parametros
    };


    var pdf = new PDFObject(atributos);
    pdf.embed("VisorPDF");

  }

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
                    <li><a id="navbarColor" href="../pages/revista.php">Revista   /</a></li> 
                    <li><a href="../pages/contacto.php">Contacto</a></li>       
                </ul>
            </div>  

		</div>
	</div>

	<div id="borde">
		<div class="row">
			<div id="borde2" class="col-md-9">

        <div id="VisorPDF" src=<?php echo $row->foto ?> width="100%" height="100%">Tu navegador no tiene soporte para PDF.</div>

			 </div>

			<div class="col-md-3">

      <h4 class="publititle"> Ediciones: </h4>

      <div class="list-group">

        <?php 

          include("../php/GetRevista.php");
          $bandera=0;
          while ($row = $query->fetch_object()) 
          {
            if($bandera == 0)
            {
               echo '<a id="Revista '. $row->id . '" onclick=\'CambiarPDF("' .  $row->foto .  '"); \' class="list-group-item">'  . $row->titulo .'</a>';

            }else
            {

              echo '<a  id="Revista '. $row->id . '" onclick=\'CambiarPDF("' .  $row->foto .  '"); \' class="list-group-item">'  . $row->titulo .'</a>';

            }
            $bandera=1;
          }

        ?>


        </div>

        <hr class="featurette-divider">
				<!--PUBLICIDAD-->
				    <?php 

                      include("../php/GetPublicidad.php"); 
                      if ($query) 
                      {
                        while ($row = $query->fetch_object()) {
                    ?>

						<div class="publi col-md-12">
               <a href=<?php echo '"'.$row->link.'"';?> ><img class="image" src=<?php echo $row->foto?> ></a> 
						</div>

                    <?php 
                      	}
                    }
                    	else
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