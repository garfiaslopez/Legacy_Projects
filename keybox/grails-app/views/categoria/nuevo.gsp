<%--
  Created by IntelliJ IDEA.
  User: gargui3
  Date: 26/09/15
  Time: 08:08 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<div class="page-title">
    <ul><li><a href="./"><i class="fa fa-home"></i></a></li> &raquo; <li><a href="./">Propuestas</a></li> &raquo; <li>Nuevo contenido</li></h4>
</div>
<div class="row">
    <div class="col-lg-12">
        <div class="widget-container fluid-height clearfix">
            <div class="heading">
                <i class="fa fa-file-text-o"></i>Detalles
            </div>
            <div class="widget-content padded">
                <form action="#" class="form-horizontal">

                    <div class="form-group">
                        <label class="control-label col-md-2">Nombre</label>
                        <div class="col-md-7">
                            <input class="form-control" placeholder="Título del proyecto" type="text">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2">Descripción</label>
                        <div class="col-md-7">
                            <textarea class="form-control" rows="3"></textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2">Tipo de propuesta</label>
                        <div class="col-md-7">
                            <select class="form-control">
                                <option value="0">-- Selecciona uno --</option>
                                <option value="Category 1">Alignment</option>
                                <option value="Category 2">Branding</option>
                                <option value="Category 3">Brand Actions</option>
                                <option value="Category 4">Brand Events</option>
                                <option value="Category 5">End to End</option>
                                <option value="Category 6">End to End Experience</option>
                                <option value="Category 7">Make it Real</option>
                                <option value="Category 8">New Products</option>
                                <option value="Category 9">Profiling</option>
                                <option value="Category 10">Process Innovation</option>
                                <option value="Category 11">Trainings Academy</option>
                                <option value="Category 12">Quick Projects</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2">Elaborado por</label>
                        <div class="col-md-7">
                            <select class="form-control">
                                <option value="0">-- Selecciona uno --</option>
                                <option value="Category 1">Rodolfo Ramirez</option>
                                <option value="Category 2">Carlos Álvarez</option>
                                <option value="Category 3">Mónica Rivera</option>
                                <option value="Category 4">Regina Cabal</option>
                                <option value="Category 5">Saray Sánchez</option>
                                <option value="Category 6">Edwin García</option>
                                <option value="Category 7">Roberto Castañón</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2">Fecha elaboración</label>
                        <div class="col-md-3">
                            <div class="input-group date datepicker" data-date-autoclose="true" data-date-format="dd-mm-yyyy">
                                <input class="form-control" type="text"><span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2">Etiquetas</label>
                        <div class="col-md-7">
                            <input id="tags_1" name="tags1" type="text" class="tags form-control" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2">Archivo</label>
                        <div class="col-md-7">
                            <input type="dropbox-chooser" name="selected-file" id="db-chooser" data-link-type="direct" class="hide" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2 sr-only">Enviar Forma</label>
                        <div class="col-md-7">
                            <hr>
                            <button class="btn btn-primary" type="submit">Guardar</button><a href="./" class="btn btn-default-outline">Cancelar</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>