<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>KeyBox</title>

    <g:javascript>

		$(document).ready(function() {

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
		    function acciones(idtt, nombre, idtt2){

		                    console.log(idtt + " " + nombre);

		                        var idFiltro = [{"identificador": idtt}];

                                var nombre2 =[{"nombre": nombre}];

                                var idtt3 =[{"identificador": idtt2}];

                             $.ajax({url: '${createLink(controller: 'categoria', action: 'busFil')}', type: 'POST',
                               data:{idd:JSON.stringify(idFiltro),nombre:JSON.stringify(nombre2),idd2:JSON.stringify(idtt3)},success: function(result){
                                        $(".divFil").html(result);


                                        /* FAVORITE */
                                        $( ".actions i.fa-heart" ).click(function() {
                                            $( this ).toggleClass( "active" );

                                        });

/***********************************************************/
                                // eliminar dato
                                $(".eliminarDato").click(function() {
                                    var id = this.id
                                    var dat = [{
                                        "id": id
                                    }];
                                    $.ajax({url: '${createLink(controller: 'categoria', action: 'eliminarDato')}', type: 'POST',
                                                data:{ id: JSON.stringify(dat) },success: function(result){

                                        acciones(idtt,nombre,idtt2)
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
                                 $(".editDato").click(function(){

                                        var idtt = [{"identificador": this.id}];

                                        $.ajax({url: '${createLink(controller: 'categoria', action: 'editarDato')}', type: 'POST',
                                        data:{ idd: JSON.stringify(idtt) },success: function(result){
                                            $("#agregar").html(result);
                                        }});

                                 });

                                 $(".fa-heart .favDat").each(function(idx,idxx){

                                    if($(idx).id == $(idxx).id){

                                        $(idx).addClass("active")
                                    }

                                 })

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

                                    $('.agregarContenido').click(function(){

                                            var categoria = [{ "valor": this.id }];

                                            $.ajax({url: '${createLink(controller: 'categoria', action: 'agregarContenido')}', type: 'POST',
                                             data:{ nombre: JSON.stringify(categoria) },success: function(result){

                                                $("#agregar").html(result);


                    /*******************************************************************************************/


                                            }});


                                        });


                               }});

                               $('.editarFiltro').click(function(){

                            var dataToSend = [{"catName":this.name,"filterId":this.id}];

                            $.ajax({url: '${createLink(controller: 'categoria', action: 'editarFiltro')}', type: 'POST',
                             data:{ values: JSON.stringify(dataToSend) },success: function(result){

                                $("#agregar").html(result);

                                 $(".actualizarFiltro").click(function() {

                                    var n = document.getElementById("nombre");
                                    var icon = document.getElementById("icono");

                                    var dat = [{
                                        "nombre": n.value, "icono": icon.value, "id": this.id
                                    }];

                                    $.ajax({url: '${createLink(controller: 'categoria', action: 'actualizarFiltro')}', type: 'POST',
                                     data:{ datos: JSON.stringify(dat) },success: function(result){

                                    }});
                                });

                            }});

                        });

                        $(".eliminarFiltro").click(function() {
                            var id = this.id
                            var dat = [{
                                "id": id
                            }];
                            $.ajax({url: '${createLink(controller: 'categoria', action: 'eliminarFiltro')}', type: 'POST',
                                        data:{ id: JSON.stringify(dat) },success: function(result){

                                carga()
                            }});


                        });



		    };

		    function carga(){

                var idd2;

                console.log("posicion = ${pos}");

                if("${pos}" == ""){
		            idd2 = [{ "identificador": "${min[0]}" }];
		            $('a').removeClass('current');
			        $('#${min[0]}').addClass('current');
		        }else{
		            idd2 = [{ "identificador": "${pos}" }];
		            $('a').removeClass('current');
			        $('#${pos}').addClass('current');
		        }
                var idd3 = [{ "iden": "0" }];



		        $.ajax({url: '${createLink(controller: 'categoria', action: 'show')}', type: 'POST',
                data:{ idd: JSON.stringify(idd2) ,idF: JSON.stringify(idd3)},success: function(result){
                    $("#agregar").html(result);

                     $(".fil").click(function(){

                            console.log("aaaaaa");
                            acciones(this.id, "filtros", idd2[0].identificador+"");


                        });

                        acciones(idd2[0].identificador, "categoria", idd2[0].identificador);


                        $('.agregarFiltro').click(function(){

                            var categoria = [{ "valor": this.id }];

                            $.ajax({url: '${createLink(controller: 'categoria', action: 'agregarFiltro')}', type: 'POST',
                             data:{ nombre: JSON.stringify(categoria) },success: function(result){

                                $("#agregar").html(result);

                                 $(".guardarFiltro").click(function() {

                                    console.log(this);

                                    var n = document.getElementById("nombre");
                                    var icon = document.getElementById("icono");

                                    var dat = [{
                                        "nombre": n.value, "icono": icon.value, "id": this.id
                                    }];

                                    $.ajax({url: '${createLink(controller: 'categoria', action: 'guardarFiltro')}', type: 'POST',
                                     data:{ datos: JSON.stringify(dat) },success: function(result){

                                    }});
                                });

                            }});

                        });


                        $('.editarFiltro').click(function(){

                            var dataToSend = [{"catName":this.name,"filterId":this.id}];

                            $.ajax({url: '${createLink(controller: 'categoria', action: 'editarFiltro')}', type: 'POST',
                             data:{ values: JSON.stringify(dataToSend) },success: function(result){

                                $("#agregar").html(result);

                                 $(".actualizarFiltro").click(function() {

                                    var n = document.getElementById("nombre");
                                    var icon = document.getElementById("icono");

                                    var dat = [{
                                        "nombre": n.value, "icono": icon.value, "id": this.id
                                    }];

                                    $.ajax({url: '${createLink(controller: 'categoria', action: 'actualizarFiltro')}', type: 'POST',
                                     data:{ datos: JSON.stringify(dat) },success: function(result){

                                    }});
                                });

                            }});

                        });

                        $(".eliminarFiltro").click(function() {
                            var id = this.id
                            var dat = [{
                                "id": id
                            }];
                            $.ajax({url: '${createLink(controller: 'categoria', action: 'eliminarFiltro')}', type: 'POST',
                                        data:{ id: JSON.stringify(dat) },success: function(result){

                                carga()
                            }});


                        });

                }});

		    };

            if("${pos}" != -1){
		        carga();
		    }else{
		        cargarUsuario();
		    }

			$('.menuClick').click(function() {

			    $('a').removeClass('current');
			    $(this).addClass('current');

			    var idd2 = [{ "identificador": this.id }];
                var idd3 = [{ "iden": "0" }];

                    $.ajax({url: '${createLink(controller: 'categoria', action: 'show')}', type: 'POST',
                     data:{ idd: JSON.stringify(idd2) ,idF: JSON.stringify(idd3)},success: function(result){
                        $("#agregar").html(result);


                        $(".fil").click(function(){

                            console.log("aaaaaa");
                            acciones(this.id, "filtros", idd2[0].identificador+"");


                        });

                        acciones(idd2[0].identificador, "categoria", idd2[0].identificador);


                        $('.agregarFiltro').click(function(){

                            var categoria = [{ "valor": this.id }];

                            $.ajax({url: '${createLink(controller: 'categoria', action: 'agregarFiltro')}', type: 'POST',
                             data:{ nombre: JSON.stringify(categoria) },success: function(result){

                                $("#agregar").html(result);

                                 $(".guardarFiltro").click(function() {
                                    var n = document.getElementById("nombre");
                                    var icon = document.getElementById("icono");

                                    var dat = [{
                                        "nombre": n.value, "icono": icon.value, "id": this.id
                                    }];

                                    $.ajax({url: '${createLink(controller: 'categoria', action: 'guardarFiltro')}', type: 'POST',
                                     data:{ datos: JSON.stringify(dat) },success: function(result){

                                    }});
                                });

                            }});

                        });








                    }});

			});



			$('.mas').click(function(){

				$('a').removeClass('current');
				$(this).addClass('current');

				$.ajax({url: '${createLink(controller: 'categoria', action: 'agregar')}', type: 'GET', success: function(result){
					$("#agregar").html(result);

					$(".btnEdit").click(function(){

					    console.log("entro a editar");

					    var cId = [{"identificador":this.id}];



                        $.ajax({url: '${createLink(controller: 'categoria', action: 'editarCategoria')}', type: 'POST',
                        data: {valor: JSON.stringify(cId)}, success: function(result){

                            $(".editarC").html(result);

                        }});

					});

					$("#agregarCampo").click(function(){

					    $.ajax({url: '${createLink(controller: 'categoria', action: 'campo')}', type: 'GET', success: function(result){
                            $("#campo").append(result);
                        }});

					});
/***********************************************************************************/


				}});

			});

			$('#perfil').click(function(){

				$('a').removeClass('current');
				$('.user').addClass('current');

				$.ajax({url: '${createLink(controller: 'empleado', action: 'perfil')}', type: 'GET', success: function(result){
					$("#agregar").html(result);
				}});

			});


            function accionesUS(idt){

                     var idUsuario2= [{"identificador": idt}]

                        $.ajax({url: '${createLink(controller: 'empleado', action: 'busUsuario')}', type: 'POST',
                         data:{idU:JSON.stringify(idUsuario2)},success: function(result){
                            $(".tbUsuario").html(result);


                                // eliminar empleado
                    $(".eliminarEmpleado").click(function() {
                        var id = this.id;
                        var dat = [{
                            "id": id
                        }];
                        $.ajax({url: '${createLink(controller: 'empleado', action: 'eliminarEmpleado')}', type: 'POST', data:{
                            id: JSON.stringify(dat)}, success: function(result) {

                            $("#agregar").html(result);


                        }});

                             setTimeout(function(){
                                accionesUS(idt)
                            }, 50);

                    });
            // editar empleado
					$(".editEmpleado").click(function(){

                        var idEmpleado = [{"identificador": this.id}];

                        console.log("entro editar empleado");

                        $.ajax({url: '${createLink(controller: 'empleado', action: 'editarEmpleado')}', type: 'POST', data:{
                            idd: JSON.stringify(idEmpleado)}, success: function(result) {

                            $("#agregar").html(result);

                        }});

					});

					$(".agregarEmpleado").click(function(){

					    $.ajax({url: '${createLink(controller: 'empleado', action: 'agregarEmpleado')}', type: 'GET', success: function(result){
                            $("#agregar").html(result);



                        }});

					});


					    }});

            }

            function cargarUsuario(){

                $('a').removeClass('current');
				$('.useri').addClass('current');

				$.ajax({url: '${createLink(controller: 'empleado', action: 'usuario')}', type: 'GET', success: function(result){
					$("#agregar").html(result);
//Busqueda de usuario filtro


                    $(".btnFil").click(function(){

                        accionesUS(this.id)

                    });

                    accionesUS("0")

				}});

            };

			$('.useri').click(function(){

				$('a').removeClass('current');
				$(this).addClass('current');

				$.ajax({url: '${createLink(controller: 'empleado', action: 'usuario')}', type: 'GET', success: function(result){
					$("#agregar").html(result);
//Busqueda de usuario filtro


                    $(".btnFil").click(function(){

                        accionesUS(this.id)

                    });

                    accionesUS("0")

				}});
//termina busqueda usuario filtro
            /*******************************/




			});




		});



$(".favDat").click(function(){

				 var idt =[{ "identificador": this.id }];

                                          $.ajax({url: '${createLink(controller: 'categoria', action: 'mostrar')}', type: 'POST',
                                         data:{ idt: JSON.stringify(idt) },success: function(result){
                                                $("#verDato").html(result)


                                                $(".lin").click(function(){

                                                     $(".parrafo").css("visibility","visible")
                                                });
                                                comDato(idt)

                                             $('#fsModal').modal({
                                                    show: 'true'
                                                });
                            /*******************************************************************************************************/
                            // guardar comentarios


                                         }});

			});

    </g:javascript>

</head>

<body>
<g:if test="${flash.message}">
    <div class="alert alert-success" id="mensaje" style="display: block;text-align: center;">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        ${flash.message}
    </div>
</g:if>
<g:if test="${flash.error}">
    <div class="alert alert-danger" id="error" style="display: block;text-align: center;">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        ${flash.error}
    </div>
</g:if>
<g:if test="${flash.warning}">
    <div class="alert alert-warning" id="warning" style="display: block;text-align: center;">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        ${flash.warning}
    </div>
</g:if>
<div class="modal-shiftfix">
    <div class="navbar navbar-fixed-top scroll-hide">
        <div class="container-fluid top-bar">
            <div class="pull-right">
                <ul class="nav navbar-nav pull-right">
                    <li class="dropdown notifications hidden-xs corazon ">
                        <a class="dropdown-toggle cor" data-toggle="dropdown"  href="#"><i class="fa fa-heart-o "></i></a>
                        <ul class="dropdown-menu">
                            <!-- g:each rellenando la lista con los datos de tabla Favoritos -->
                            <li><span><i class="fa fa-heart active"></i>Favoritos</span></li>

                            <!-- aqui debes de agregar el g:each -->
                            <li id="favoritoUS"></li>
                        </ul>

                    </li>
                    <li class="dropdown user hidden-xs"><a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <!-- Obtener imagen del usuario que inicia sesion -->
                        <img src="${createLink(controller: 'categoria', action: 'getImagen', id: usuario.id)}" width="34px", height="34px" onerror='this.src="${resource(dir: 'images', file: 'default.jpg')}"' ><g:if test="${empleado != null}"> ${empleado.nombre}</g:if><b class="caret"></b>
                    </a>
                        <ul class="dropdown-menu">
                            <li><a id="perfil">
                                <i class="fa fa-user"></i>Mi Cuenta</a>
                            </li>
                            <li><a href="${createLink(controller: 'logout', action: 'index')}">
                                <i class="fa fa-sign-out"></i>Cerrar sesión</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
            <button class="navbar-toggle">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>

            <a class="logo" href="${createLink(controller: 'categoria', action: 'indice')}">KEYBOX</a>

            <form action="javascript:busca()">

                <div class="navbar-form form-inline col-lg-2 hidden-xs">
                    <input id="buscar" class="form-control" placeholder="Busca por nombre, tag, o cliente..." type="text">
                </div>

            </form>


        </div>

        <div class="container-fluid main-nav clearfix">
            <div class="nav-collapse">
                <ul class="nav">
                <!-- Rellenar lista de los valores obtenidos de la tabla Categoria -->
                    <g:each in="${categorias}" var="c">
                        <li><a class="tab menuClick" id="${c.getAt(1)}">${c.getAt(0)}</a></li>
                    </g:each>
                    <li><a class="tab useri">Usuarios</a></li>
                    <sec:ifAllGranted roles="ROLE_ADMIN">
                        <li><a class="add-type mas"><i class="fa fa-plus"></i></a></li>
                    </sec:ifAllGranted>
                </ul>
            </div>
        </div>

    </div>
    <div class="container-fluid main-content">

        <div class="row">

            <div id="agregar">

            </div>

        </div>

    </div>
</div>

<div id="verDato"></div>
<script>
    $(document).ready(function(){
        $("#mensaje").delay(5000).fadeOut(400);
        $("#warning").delay(7000).fadeOut(400);
        $("#error").delay(10000).fadeOut(400);
    });

    function validar() {
        var clave1 = $("#pass").val();
        var clave2 = $("#passComprobar").val();

        if (clave1 == clave2)
            return true;
        else {
            alert("Las contraseñas son distintas, por favor verique de nuevo.");
            return false;
        }
    }

    function validarCampos() {
        var filtro = $("#filtroD").val();
        var empleado = $("#empleadoD").val();

        if (filtro == 0) {
            alert("Seleccione un filtro");
            return false;
        }

        else if (empleado == 0){
            alert("Seleccione un empleado");
            return false;
        } else
            return true;
    }

    function validarCamposEsp() {
        var campo = document.getElementsByName("valor");
        for(var i = 0; i < campo.length; i++) {
            if (campo[i].value == 0) {
                alert("Selecciona un tipo de campo.");
                return false;
            }
        }
        return true;

    }
</script>
</body>
</html>
