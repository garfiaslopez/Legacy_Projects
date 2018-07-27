<%--
  Created by IntelliJ IDEA.
  User: gargui3
  Date: 17/10/15
  Time: 09:22 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<div class="col-md-12">
    <section class="panel">
        <div class="panel-body profile-information">
            <div class="col-md-offset-2 col-md-8">
                <div class="profile-pic text-center">
                    <!--<img src="images/ui-rodolfo.png" alt=""/>-->
                    <img src="${createLink(controller: 'categoria', action: 'getImagen', id: usuario.id)}">
                </div>

                <div class="profile-desk">
                    <h1>${empleado.nombre}</h1>
                    <span class="text-muted">${rol}</span>
                    <g:uploadForm role="form" action="guardarEdicionEmpleado" onsubmit="return validar()">
                        <div class="form-group">
                            <input type="text" class="form-control" name="nombre" value="${empleado.nombre}" required >
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="usuario" value="${usuario.username}" required >
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-control" name="email" value="${empleado.correo}" required >
                        </div>
                        <div class="form-group">
                            <input type="password" id="pass" class="form-control" name="pass" placeholder="Cambiar Contraseña">
                        </div>
                        <div class="form-group">
                            <input type="password" id="passComprobar" class="form-control" name="passComprobar" placeholder="Repetir Contraseña">
                        </div>
                        <!--
                        <div class="form-group">
                            <select class="form-control m-bot15" name="rol" value="" required>
                                <option value="Administrador">Administrador</option>
                                <option value="Consultor">Consultor</option>
                                <option value="Editor">Editor</option>
                            </select>
                        </div>
                        -->
                        <div class="form-group">
                            <label for="exampleInputFile">Avatar</label>
                            <input type="file" id="exampleInputFile" name="avatar">
                            <p class="help-block">min: 150x150px</p>
                        </div>
                        <input type="hidden" value="${usuario.id}" name="idU">
                        <input type="hidden" value="${empleado.id}" name="idE">
                        <button  name="guardarEdicionEmpleado" value="Actualizar" class="btn btn-info " style="display: inline;">Actualizar</button>
                        <button formaction="${createLink([controller: 'categoria', action: 'indice',id: -1])}" class="btn btn-default" style="display: inline;">Cancelar</button>
                    </g:uploadForm>
                </div>
            </div>
        </div>
    </section>
</div>