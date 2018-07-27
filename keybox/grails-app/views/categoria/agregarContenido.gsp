<%--
  Created by IntelliJ IDEA.
  User: gargui3
  Date: 11/10/15
  Time: 05:52 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<div class="container-fluid main-content">
    <div class="page-title">
        <ul><li><a href="./"><i class="fa fa-home"></i></a></li> &raquo; <li><a>${dato}</a></li> &raquo; <li>Nuevo contenido</li></h4>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="widget-container fluid-height clearfix">
                <g:if test="${datos > 0 || maximo == 0}">
                    <div class="heading">
                        <i class="fa fa-file-text-o"></i>Detalles
                    </div>
                    <div class="widget-content padded">
                        <g:form action="guardarContenido" class="form-horizontal" onsubmit="return validarCampos()">

                            <div class="form-group">
                                <label class="control-label col-md-2">Nombre</label>
                                <div class="col-md-7">
                                    <input name="nombreD" class="form-control" placeholder="Título del proyecto" type="text" required >
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-2">Descripción</label>
                                <div class="col-md-7">
                                    <textarea name="descripcionD" class="form-control" rows="3"></textarea>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-2">Tipo de propuesta</label>
                                <div class="col-md-7">
                                    <select class="form-control" name="filtroD" id="filtroD">


                                        <option value="Sin filtro">Sin filtro</option>


                                        <g:each in="${filtros}" var="f">


                                            <option value="${f.nombre}">${f.nombre}</option>


                                        </g:each>

                                    </select>


                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-2">Elaborado por</label>
                                <div class="col-md-7">
                                    <select class="form-control" name="empleadoD" id="empleadoD">
                                        <option value="0">-- Selecciona uno --</option>
                                        <g:each in="${empleados}" var="e">
                                            <option value="${e.nombre}">${e.nombre}</option>
                                        </g:each>

                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-2">Fecha elaboración</label>
                                <div class="col-md-3">
                                    <div class="input-group date datepicker" data-date-autoclose="true" data-date-format="dd/mm/yyyy">
                                        <input name="fechaD" class="form-control" type="text" required><span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-2">Etiquetas</label>
                                <div class="col-md-7">
                                    <input id="tags" name="tagsD" type="text" class="tags form-control" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-2">Archivo</label>
                                <div id="DropBoxContainer" class="col-md-7">
                                    <input type="dropbox-chooser" name="fileD" id="db-chooser" data-link-type="direct" class="hide" />
                                </div>
                            </div>
                            <label class="control-label ">Campos Especificos</label>
                            <input type="text" name="idt" value="${categoria.id}" class="hide">
                            <g:if test="${especificos != null && ! especificos.isEmpty()}">
                                <g:each in="${especificos}" var="especifico">
                                    <div class="form-group">
                                        <label class="control-label col-md-2">${especifico.nombre}</label>
                                        <div class="col-md-7">
                                            <input name="especifico" type="text" class="form-control" required />
                                            <input name="idEspecifico" type="text" class="form-control" value="${especifico.id}" style="display:none;"/>

                                        </div>
                                    </div>
                                </g:each>

                            </g:if>
                            <div class="form-group">
                                <label class="control-label col-md-2 sr-only">Enviar Forma</label>
                                <div class="col-md-7">
                                    <hr>
                                    <g:submitButton name="guardarContenido"  value="Guardar" class="btn btn-primary guardarContenido" id="${categoria.id}"></g:submitButton><a class="btn btn-default-outline" href="">Cancelar</a>
                                </div>
                            </div>
                        </g:form>
                    </div>
                </g:if>
                <g:else>
                    <div class="heading">
                        <i class="fa fa-file-text-o"></i>Limite de Datos alcanzado
                    </div>
                </g:else>
            </div>
        </div>
    </div>
</div>

<script>

    $('.datepicker').datepicker();

    options = {

        // Required. Called when a user selects an item in the Chooser.
        success: function(files) {
            var linkdropbox = files[0].link;
            linkdropbox = linkdropbox.slice(0,-1);
            linkdropbox+="1";

            $("#db-chooser").val(linkdropbox);
        },

        // Optional. Called when the user closes the dialog without selecting a file
        // and does not include any parameters.
        cancel: function() {
        },

        // Optional. "preview" (default) is a preview link to the document for sharing,
        // "direct" is an expiring link to download the contents of the file. For more
        // information about link types, see Link types below.
        linkType: "preview", // or "direct"

        // Optional. A value of false (default) limits selection to a single file, while
        // true enables multiple file selection.
        multiselect: false, // or true

        // Optional. This is a list of file extensions. If specified, the user will
        // only be able to select files with these extensions. You may also specify
        // file types, such as "video" or "images" in the list. For more information,
        // see File types below. By default, all extensions are allowed.
        //extensions: ['.pdf', '.doc', '.docx'],
    };
    var button = Dropbox.createChooseButton(options);
    document.getElementById("DropBoxContainer").appendChild(button);

</script>
