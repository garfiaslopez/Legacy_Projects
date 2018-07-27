<%--
  Created by IntelliJ IDEA.
  User: gargui3
  Date: 26/09/15
  Time: 07:21 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<div class="col-md-12">
    <section class="panel">
        <div class="panel-body profile-information">
            <div class="col-md-offset-2 col-md-8">
                <div class="profile-pic text-center">
                    <img src="${createLink(controller: 'empleado', action: 'getImagen', id: usuario.id)}" onerror='this.src="${resource(dir: 'images', file: 'default.jpg')}"'/>

                </div>

                <div class="profile-desk">
                    <h1>${datos[0].getAt(0)}</h1>

                    <span class="text-muted">${rol.get(cont++)}</span>

                    <g:uploadForm role="form" action="actualizarEmpleado" onsubmit="return validar()" >
                        <div class="form-group">
                            <input type="text" class="form-control" name="nombre1" value="${datos[0].getAt(0)}" required >
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="user1" value="${datos[0].getAt(1)}" required >
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-control" name="email1" value="${datos[0].getAt(3)}" required >
                        </div>
                        <div class="form-group">
                            <input type="password" id="pass" class="form-control" name="pass1" placeholder="Cambiar Contraseña"  >
                        </div>
                        <div>
                         <div class="form-group">
                            <input type="password" id="passComprobar" class="form-control" name="passComprobar1" placeholder="Repetir Contraseña"  >
                        </div>


                        <div class="form-group">
                            <label for="exampleInputFile">Avatar</label>
                            <input name="avatar" type="file" id="exampleInputFile">
                            <p class="help-block">min: 150x150px</p>
                        </div>

                        <button class="btn btn-info pull-left" name="actualizarEmpleado" value="Actualizar">Actualizar</button>
                        <button formaction="${createLink([controller: 'categoria', action: 'indice'])}" class="btn btn-default" type="button pull-left">Cancelar</button>
                    </g:uploadForm>
                </div>
            </div>
        </div>
    </section>
</div>