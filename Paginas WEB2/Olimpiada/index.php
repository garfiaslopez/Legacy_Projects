
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>OOI - Olimpiada Oaxaqueña de Informática</title>

    <!-- Bootstrap Core CSS - Uses Bootswatch Flatly Theme: http://bootswatch.com/flatly/ -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/freelancer.css" rel="stylesheet">
    <link href="css/carousel.css" rel="stylesheet">
    <link href="css/Loginbox.css" rel="stylesheet">
    <link href="css/bootstrap-dialog.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


        <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap-dialog.js"></script>
    <!-- Contact Form JavaScript -->
</head>

<body id="page-top" class="index">
    
    <?php
        include("php/registro.php");
        include("php/loginUser.php");
    ?>

    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#page-top">Inicio</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-left">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li class="page-scroll">
                        <a href="#info">Información General</a>
                    </li>
                    <li class="page-scroll">
                        <a href="#about">Acerca de</a>
                    </li>
                    <li class="page-scroll">
                        <a href="#portfolio">Galería</a>
                    </li>
                    <li class="page-scroll">
                        <a href="#obj">Objetivos</a>
                    </li>
                    <li class="page-scroll">
                        <a href="#registro">Regístrate</a>
                    </li>
                </ul>

                <ul class="nav navbar-nav navbar-right">

                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                        
                    <div class="btn-group">
                    
                        <button  type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown">
                            Iniciar Sesion <span class="caret"></span>
                        </button>

                        <div class="dropdown-menu" >
                            <div class="col-sm-12">
                                <div class="col-sm-12">
                                    ¡Logueate!
                                </div>
                                <div class="col-sm-12">
                                    <input type="text" placeholder="Usuario" onclick="return false;" class="form-control input-sm" id="inputError" />
                                </div>
                                <br/>
                                <div class="col-sm-12">
                                    <input type="password" placeholder="Contraseña" class="form-control input-sm" name="password" id="Password1" />
                                </div>
                                <div class="col-sm-12">
                                    <button type="submit" class="btn btn-success btn-sm">Iniciar Sesion</button>
                                </div>
                            </div>
                        </div>
                    </div>



                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <!-- Header -->
    <header>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <img style="max-width:300px;" class="img-responsive" src="img/LogoOOI.png" alt="">
                    <div class="intro-text">
                        <span class="name">OOI</span>
                        <hr class="star-light">
                        <span class="skills">Olimpiada Oaxaqueña de Informática</span>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- Info Section -->
    <section id="info">
    	<div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>Información General</h2>
                    <hr class="star-primary">
                </div>
            </div>

                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
				      <!-- Indicators -->
				      <ol class="carousel-indicators">
				        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				        <li data-target="#myCarousel" data-slide-to="1"></li>
				        <li data-target="#myCarousel" data-slide-to="2"></li>
				      </ol>
				      <div class="carousel-inner" role="listbox">
				        <div class="item active">
				          <img src="img/ooi2012.jpg" alt="First slide">
				          <div class="container">
				            <div class="carousel-caption">
				              <h1>Noticia 1</h1>
				              <p>Prueba</p>
				            </div>
				          </div>
				        </div>
				      </div>
				      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
				        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				        <span class="sr-only">Previous</span>
				      </a>
				      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
				        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				        <span class="sr-only">Next</span>
				      </a>
				    </div><!-- /.carousel -->
        </div>
    </section>


    <!-- About Section -->
    <section class="success" id="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>Acerca de la OOI</h2>
                    <hr class="star-light">
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-lg-offset-2">
                    <p align="justify">La Olimpiada Oaxaqueña de Informática esta enfocada a encontrar a los 4 programadores de oro del estado de Oaxaca. Con el objetivo de representar al estado en la Olimpiada Mexicana de Informática(OMI).
                    </p>
                </div>
                <div class="col-lg-4">
                    <p align="justify">La OMI se realiza cada año en diferentes estados de la república, la OMI consta de 6 días, en los cuales 2 son de
                    competencia, 5 horas 4 problemas a resolver, una experiencia increíble en la cual vale la pena el esfuerzo.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Portfolio Grid Section -->
    <section id="portfolio">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>Galería</h2>
                    <hr class="star-primary">
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4 portfolio-item">
                    <a href="#portfolioModal1" class="portfolio-link" data-toggle="modal">
                        <div class="caption">
                            <div class="caption-content">
                                <i class="fa fa-search-plus fa-3x"></i>
                            </div>
                        </div>
                        <img src="img/ooi2014.jpg" class="img-responsive" alt="">
                    </a>
                </div>
                <div class="col-sm-4 portfolio-item">
                    <a href="#portfolioModal2" class="portfolio-link" data-toggle="modal">
                        <div class="caption">
                            <div class="caption-content">
                                <i class="fa fa-search-plus fa-3x"></i>
                            </div>
                        </div>
                        <img src="img/ooi2013.jpg" class="img-responsive" alt="">
                    </a>
                </div>
                <div class="col-sm-4 portfolio-item">
                    <a href="#portfolioModal3" class="portfolio-link" data-toggle="modal">
                        <div class="caption">
                            <div class="caption-content">
                                <i class="fa fa-search-plus fa-3x"></i>
                            </div>
                        </div>
                        <img src="img/ooi2012.jpg" class="img-responsive" alt="">
                    </a>
                </div>
            </div>
        </div>
    </section>

    <section class="success" id="obj">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 text-center">
                    <h3>Misión</h3>
                    <hr class="star-light">
                    <p align="justify">La misión de la olimpiada es formar olímpicos con buenas bases y sobre todo con el gusto hacia
                    	la programación.</p>
                </div>
                <div class="col-lg-4 text-center">
                    <h3>Visión</h3>
                    <hr class="star-light">
                    <p align="justify">La visión de la olimpiada es ir escalando en el medallero nacional, encontrarse entre los 5 mejores
                    	estados y obtener olímpicos internacionales oaxaqueños.</p>
                </div>
                <div class="col-lg-4 text-center">
                    <h3>Objetivo</h3>
                    <hr class="star-light">
                    <p align="justify">Encontrar cada año a los 4 programadores de oro de Oaxaca.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Contact Section -->
    <section id="registro">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>¡Regístrate!</h2>
                    <hr class="star-primary">
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2">
                    <!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->
                    <!-- The form should work on most web servers, but if the form is not working you may need to configure your web server differently. -->
                    

                    <form method="POST" enctype="multipart/form-data" novalidate>


                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Nombre</label>
                                <input type="text" class="form-control" placeholder="Nombre" id="Nombre" name="Nombre" required data-validation-required-message="Dato obligatorio.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Apellido Paterno</label>
                                <input type="text" class="form-control" placeholder="Apellido Paterno" id="ApellidoP" name="ApellidoP" required data-validation-required-message="Dato obligatorio.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Apellido Materno</label>
                                <input type="text" class="form-control" placeholder="Apellido Materno" id="ApellidoM" name="ApellidoM" required data-validation-required-message="Dato obligatorio.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Edad</label>
                                <input type="text" class="form-control" placeholder="Edad" id="Edad" name="Edad" required data-validation-required-message="Dato obligatorio.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Plantel Educativo</label>
                                <input type="text" class="form-control" placeholder="Plantel Educativo" id="Plantel" name="Plantel" required data-validation-required-message="Dato obligatorio.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Localidad o Municipio</label>
                                <input type="text" class="form-control" placeholder="Localidad o Municipio" id="Localidad" name="Localidad" required data-validation-required-message="Dato obligatorio.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>

                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Correo</label>
                                <input type="email" class="form-control" placeholder="Correo" id="Correo" name="Correo" required data-validation-required-message="Dato obligatorio.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Phone Number</label>
                                <input type="tel" class="form-control" placeholder="Numero Celular" id="Telefono" name="Telefono" required data-validation-required-message="Dato obligatorio.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                         
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Usuario</label>
                                <input type="text" class="form-control" placeholder="Usuario" id="Usuario" name="Usuario" required data-validation-required-message="Dato obligatorio.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>

                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Contraseña</label>
                                <input type="password" class="form-control" placeholder="Contraseña" id="Password" name="Password" required data-validation-required-message="Dato obligatorio.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Repetir Contraseña</label>
                                <input type="password" class="form-control" placeholder="Repetir Contraseña" id="PasswordAgain" name="PasswordAgain" required data-validation-required-message="Dato obligatorio.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <br>
                        <div class="success"></div>
                        <div align="right" class="row">

                            <div align="right" class="form-group col-xs-12">

                                <button id="registro" name="registro" type="submit" value="registro" class="btn btn-success btn-lg">Registrar</button>

                            </div>

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    

    <!-- Footer -->
    <footer class="text-center">
        <div class="footer-above">
            <div class="container">
                <div class="row">
                    <div class="footer-col col-md-4">
                        <h3>Localidad</h3>
                        <p>Oaxaca de Juárez, Oaxaca<br> México</p>
                    </div>
                    <div class="footer-col col-md-4">
                        <h3>Siguenos en</h3>
                        <ul class="list-inline">
                            <li>
                                <a href="https://www.facebook.com/OMIOaxaca" class="btn-social btn-outline"><i class="fa fa-fw fa-facebook"></i></a>
                            </li>
                            <li>
                                <a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-twitter"></i></a>
                            </li>
                        </ul>
                    </div>
                    <div class="footer-col col-md-4">
                        <h3>Correo</h3>
                        <p>omioaxaca@gmail.com</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-below">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        Copyright &copy; COOI 2015
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
    <div class="scroll-top page-scroll visible-xs visble-sm">
        <a class="btn btn-primary" href="#page-top">
            <i class="fa fa-chevron-up"></i>
        </a>
    </div>

    <!-- Portfolio Modals -->
    <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div class="modal-body">
                            <h2>Olimpicos OMI 2014</h2>
                            <hr class="star-primary">
                            <img src="img/ooi2014.jpg" class="img-responsive img-centered" alt="">
                            <p align="left">La OMI 2014 fue realizada en Pachuca, Hidalgo, los competidores fueron: <br>
                            	<br>Javier Eduardo Avendaño Jimenez --- Bronce <br>
                            	Julio Cesar Rodriguez <br>
                            	Jonathan Francisco Hernandez <br>
                            	Jorge Armando Solis Montero <br> </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div class="modal-body">
                            <h2>Olimpicos OMI 2013</h2>
                            <hr class="star-primary">
                            <img src="img/ooi2013.jpg" class="img-responsive img-centered" alt="">
                            <p align="left">La OMI 2013 fue realizada en Toluca, Mexico. Los competidores fueron:<br>
                            	<br>Daniel Jeronimo Gomez Antonio --- Bronce<br>
                            	Javier Eduardo Avendaño Jimenez --- Bronce<br>
                            	Alejandro García Guillén<br>
                            	Jose de Jesus Garfias Lopez</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div class="modal-body">
                            <h2>Olimpicos OMI 2012</h2>
                            <hr class="star-primary">
                            <img src="img/ooi2012.jpg" class="img-responsive img-centered" alt="">
                            <p align="left">La OMI 2012 fue realizada en Hermosillo, Sonora. Los competidores fueron:<br>
                            	<br>Javier Eduardo Avendaño Jimenez<br>
                            	Alejandro García Guillén<br>
                            	Jose de Jesus Garfias Lopez<br>
                            	Daniel Jeronimo Gomez Antonio</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="portfolio-modal modal fade" id="portfolioModal4" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div class="modal-body">
                            <h2>Project Title</h2>
                            <hr class="star-primary">
                            <img src="img/portfolio/game.png" class="img-responsive img-centered" alt="">
                            <p>Use this area of the page to describe your project. The icon above is part of a free icon set by <a href="https://sellfy.com/p/8Q9P/jV3VZ/">Flat Icons</a>. On their website, you can download their free set with 16 icons, or you can purchase the entire set with 146 icons for only $12!</p>
                            <ul class="list-inline item-details">
                                <li>Client:
                                    <strong><a href="http://startbootstrap.com">Start Bootstrap</a>
                                    </strong>
                                </li>
                                <li>Date:
                                    <strong><a href="http://startbootstrap.com">April 2014</a>
                                    </strong>
                                </li>
                                <li>Service:
                                    <strong><a href="http://startbootstrap.com">Web Development</a>
                                    </strong>
                                </li>
                            </ul>
                            <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="portfolio-modal modal fade" id="portfolioModal5" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div class="modal-body">
                            <h2>Project Title</h2>
                            <hr class="star-primary">
                            <img src="img/portfolio/safe.png" class="img-responsive img-centered" alt="">
                            <p>Use this area of the page to describe your project. The icon above is part of a free icon set by <a href="https://sellfy.com/p/8Q9P/jV3VZ/">Flat Icons</a>. On their website, you can download their free set with 16 icons, or you can purchase the entire set with 146 icons for only $12!</p>
                            <ul class="list-inline item-details">
                                <li>Client:
                                    <strong><a href="http://startbootstrap.com">Start Bootstrap</a>
                                    </strong>
                                </li>
                                <li>Date:
                                    <strong><a href="http://startbootstrap.com">April 2014</a>
                                    </strong>
                                </li>
                                <li>Service:
                                    <strong><a href="http://startbootstrap.com">Web Development</a>
                                    </strong>
                                </li>
                            </ul>
                            <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="portfolio-modal modal fade" id="portfolioModal6" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div class="modal-body">
                            <h2>Project Title</h2>
                            <hr class="star-primary">
                            <img src="img/portfolio/submarine.png" class="img-responsive img-centered" alt="">
                            <p>Use this area of the page to describe your project. The icon above is part of a free icon set by <a href="https://sellfy.com/p/8Q9P/jV3VZ/">Flat Icons</a>. On their website, you can download their free set with 16 icons, or you can purchase the entire set with 146 icons for only $12!</p>
                            <ul class="list-inline item-details">
                                <li>Client:
                                    <strong><a href="http://startbootstrap.com">Start Bootstrap</a>
                                    </strong>
                                </li>
                                <li>Date:
                                    <strong><a href="http://startbootstrap.com">April 2014</a>
                                    </strong>
                                </li>
                                <li>Service:
                                    <strong><a href="http://startbootstrap.com">Web Development</a>
                                    </strong>
                                </li>
                            </ul>
                            <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h4 class="modal-title">Modal title</h4>
          </div>
          <div class="modal-body">
            <p>One fine body…</p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary">Save changes</button>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <!-- Navigation -->



    <!-- Plugin JavaScript -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="js/classie.js"></script>
    <script src="js/cbpAnimatedHeader.js"></script>

    <script src="js/jqBootstrapValidation.js"></script>


    <!-- Custom Theme JavaScript -->
    <script src="js/freelancer.js"></script>

    <script type="text/javascript">

       $(function () {
            $('.dropdown-menu input').click(function (event) {
                event.stopPropagation();
            });
        });

    </script>



</body>

</html>
