<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title><g:layoutTitle default="Grails"/></title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.png')}" type="image/x-icon">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'font-awesome.min.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'datepicker.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.tagsinput.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'fontawesome-iconpicker.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-colorpicker.min.css')}" type="text/css">
	<g:javascript src="jquery-1.10.2.min.js"/>
	<g:javascript src="bootstrap.min.js"/>
	<g:javascript src="bootstrap-datepicker.js"/>
	<g:javascript src="jquery.tagsinput.js"/>
    <g:javascript src="fontawesome-iconpicker.min.js"/>
    <g:javascript src="bootstrap-colorpicker.min.js"/>


	<script type="text/javascript" src="https://www.dropbox.com/static/api/2/dropins.js" id="dropboxjs" data-app-key="yas8y9g8tjo80f7"></script>
	<g:javascript src="main.js"/>
	<g:javascript>



function comDato(idt){

                    $.ajax({url: '${createLink(controller: 'categoria', action: 'comenUsuario')}', type: 'POST',
                                            data:{ idt: JSON.stringify(idt) },success: function(result){
                                                $("#comentarios").html(result)


                                                $("#anadirComentario").keypress(function(e) {
                                                    if (e.which == 13) {
                                                        var comentario = $(this).val();
                                                        var id = $("#id").val();
                                                        var idD = [{"identificador":id}];
                                                        var dat = [{
                                                            "comentario": comentario, "id": id
                                                        }];
                                                        //alert(comentario);
                                                        $.ajax({url: '${createLink(controller: 'categoria', action: 'guardarComentario')}', type: 'POST',
                                                            data:{ comentario: JSON.stringify(dat) },success: function(result){



                                                        }});

                                                        setTimeout(function(){
                                                            comDato(idD)
                                                        }, 60);





                                                    }


                                                });

                                         }});





            }




		function busca(){

				var texto = document.getElementById('buscar');
				var Jtext = [{"valor" : texto.value}];

                $.ajax({url: '${createLink(controller: 'categoria', action: 'resultado')}', type: 'POST',
			         data:{ texto: JSON.stringify(Jtext) },success: function(result){

			            $("#agregar").html(result);

			            /*******************************************/
			            // eliminar dato
						$(".eliminarDato").click(function() {
							var id = this.id
							var dat = [{
								"id": id
							}];
							$.ajax({url: '${createLink(controller: 'categoria', action: 'eliminarDato')}', type: 'POST',
                                        data:{ id: JSON.stringify(dat) },success: function(result){
                            }});
						});

							 /*************************************************/
                        // guardar favoritos
                          $(".fa-heart").click(function() {
                                var id = this.id;
                                var dat = [{
                                    "id": id
                                }];
                                $.ajax({url: '${createLink(controller: 'categoria', action: 'guardarFavorito')}', type: 'POST',
                                    data:{ id: JSON.stringify(dat) },success: function(result){
                                }});
                            });
                         /****************************************************/
							$('.dato').click(function(){



                           var idt =[{ "identificador": this.id }];

                                          $.ajax({url: '${createLink(controller: 'categoria', action: 'mostrar')}', type: 'POST',
                                         data:{ idt: JSON.stringify(idt) },success: function(result){
                                                $("#verDato").html(result)

                                                comDato(idt)
                                                $(".lin").click(function(){

                                                     $(".parrafo").css("visibility","visible")
                                                });


                                             $('#fsModal').modal({
                                                    show: 'true'
                                                });
                            /*******************************************************************************************************/
                            // guardar comentarios


                                         }});
			            });




			    }});



            }





            $(".corazon").click(function(){

                $.ajax({url: '${createLink(controller: 'categoria', action: 'favoritoUS')}', type: 'POST',
                success: function(result){
                            $("#favoritoUS").html(result)
                            $(".favDat").click(function(){

				 var idt =[{ "identificador": this.id }];

                                          $.ajax({url: '${createLink(controller: 'categoria', action: 'mostrar')}', type: 'POST',
                                         data:{ idt: JSON.stringify(idt) },success: function(result){
                                                $("#verDato").html(result)

                                                comDato(idt)
                                                $(".lin").click(function(){

                                                     $(".parrafo").css("visibility","visible")
                                                });


                                             $('#fsModal').modal({
                                                    show: 'true'
                                                });
                            /*******************************************************************************************************/
                            // guardar comentarios


                                         }});

			});
                }});
            });


	</g:javascript>
	<g:layoutHead/>
	<r:layoutResources />
</head>
<body class="page-header-fixed layout-boxed">


<g:layoutBody/>
<r:layoutResources />
</body>
</html>
