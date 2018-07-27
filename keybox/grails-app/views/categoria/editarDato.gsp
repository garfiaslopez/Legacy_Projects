<%--
  Created by IntelliJ IDEA.
  User: gargui3
  Date: 17/10/15
  Time: 10:04 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<div class="container-fluid main-content">
    <div class="page-title">
        <ul><li><a href="./"><i class="fa fa-home"></i></a></li> &raquo; <li>Editar contenido</li></h4></ul>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="widget-container fluid-height clearfix">
                <div class="heading">
                    <i class="fa fa-file-text-o"></i>Detalles
                </div>
                <div class="widget-content padded">
                    <g:form action="actualizarDato" class="form-horizontal">
                        <input type="text" class="hide" value="${dato.id}" name="idDato">
                        <div class="form-group">
                            <label class="control-label col-md-2">Nombre</label>
                            <div class="col-md-7">
                                <input name="nombreC" value="${dato.nombre}" class="form-control" type="text">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-2">Descripción</label>
                            <div class="col-md-7">
                                <textarea name="descripcionC" value="${dato.descripcion}" class="form-control" rows="3">${dato.descripcion}</textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-2">Tipo de propuesta</label>
                            <div class="col-md-7">
                                <select class="form-control" name="filtroC"  value="${dato.tipoPropuesta}">
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
                                <select class="form-control" name="empleadoC">
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
                                <div class="input-group date datepicker" data-date-autoclose="true" data-date-format="yyyy-mm-dd">
                                    <input name="fechaC" value="${dato.fecha.toString().substring(0, 10)}" class="form-control" type="text"><span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-2">Etiquetas</label>
                            <div class="col-md-7">
                                <input name="tagsC" type="text" value="${dato.tags}" class="tags form-control" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-2">Archivo</label>
                            <div id="DropBoxContainer" class="col-md-7">
                                <input type="dropbox-chooser"  name="fileC" id="db-chooser" data-link-type="direct" class="hide" />
                            </div>
                        </div>
                        <label class="control-label ">Campos Especificos</label>
                        <g:if test="${especificos != null}">
                            <g:each in="${especificos}" var="especifico">
                                <div class="form-group">
                                    <label class="control-label col-md-2">${especifico.nombre}</label>
                                    <div class="col-md-7">
                                        <input name="especificoC" placeholder="${especifico.nombre}" type="text" class="form-control" />
                                        <input name="idEspecificoC" type="text" class="form-control" value="${especifico.id}" style="display:none;"/>
                                    </div>
                                </div>
                            </g:each>
                        </g:if>
                        <div class="form-group">
                            <label class="control-label col-md-2 sr-only">Enviar Forma</label>
                            <div class="col-md-7">
                                <hr>
                                <g:submitButton class="btn btn-primary editarContenido" name="actualizarDato" value="Actualizar"></g:submitButton><a class="btn btn-default-outline" href="${createLink([controller: 'categoria', action: 'indice'])}">Cancelar</a>
                            </div>
                        </div>
                    </g:form>
                </div>
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
