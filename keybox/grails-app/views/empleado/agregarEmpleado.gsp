<%--
  Created by IntelliJ IDEA.
  User: gargui3
  Date: 15/10/15
  Time: 01:34 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<div class="col-md-12">
    <section class="panel">
        <div class="panel-body profile-information">
            <div class="col-md-offset-2 col-md-8">
                <div class="profile-desk">
                    <g:uploadForm role="form" onsubmit="return validar()">
                        <div class="form-group">
                            <input name="nombre" type="text" class="form-control" id="nombre" placeholder="Nombre" required >
                        </div>
                        <div class="form-group">
                            <input name="usuario" type="text" class="form-control" id="usuario" placeholder="Usuario" required >
                        </div>
                        <div class="form-group">
                            <input name="email" type="email" class="form-control" id="email" placeholder="Correo" required >
                        </div>
                        <div class="form-group">
                            <input name="pass" type="password" class="form-control" id="pass" placeholder="Contraseña" required >
                        </div>
                        <div class="form-group">
                            <input name="passC" type="password" class="form-control" id="passComprobar" placeholder="Repetir Contraseña" required >
                        </div>
                        <div class="form-group">
                            <select name="rol" id="rol"
                                    class="form-control m-bot15" required>
                                <option value="Administrador">Administrador</option>
                                <option value="Consultor">Consultor</option>
                                <option value="Editor">Editor</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="exampleInputFile">Avatar</label>
                            <input type="file" id="exampleInputFile" name="avatar">
                            <p class="help-block">min: 150x150px</p>
                        </div>


                        <button formaction="${createLink(controller: 'empleado', action: 'guardarEmpleado')}" name="guardarEmpleado" value="Guardar" class="btn btn-info pull-left">Guardar</button>
                        <button formaction="${createLink([controller: 'categoria', action: 'indice',id: -1])}" class="btn btn-default">Cancelar</button>
                    </g:uploadForm>
                </div>
            </div>
        </div>
    </section>
</div>