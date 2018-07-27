<%--
  Created by IntelliJ IDEA.
  User: gargui3
  Date: 26/09/15
  Time: 06:15 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" %>

<div class="container-fluid main-content">
    <g:if test="${flash.errorBus}">
        <div class="alert alert-danger" id="errorBus" style="display: block;text-align: center;">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            ${flash.errorBus}
        </div>
    </g:if>
    <div class="col-sm-12">
        <div class="page-title">
            <ul><li><a href="./"><i class="fa fa-home"></i></a></li> &raquo;<h4> <li>Resultados de búsqueda</li></h4>
            </ul>
        </div>
        <div class="row">
            <div class="widget-container fluid-height">
                <!-- Table -->
                <table class="table table-filters">
                    <thead>
                    <tr>
                        <td></td>
                        <td>Nombre</td>
                        <td>Fecha</td>
                        <td></td>
                    </tr>
                    </thead>

                    <tbody id="holder">
                    <tr class="item branding">

                <g:each in="${dato}" var="d">
                    <tr>
                        <td>
                            <i style="color: ${d.getAt(4)}" class="fa fa-circle"></i>
                        </td>
                        <td><a class="dato" id="${d.getAt(0)}">${d.getAt(1)}</a></td>
                        <td>${d.getAt(2).toString().substring(0, 10)}</td>
                        <td class="actions dropdown">
                            <g:set var="h" value="${0}" />
                         <g:each in="${favoritos}" var="f">



                                <g:if test="${d.getAt(0) == f.getAt(1) }">
                                    <i class="fa fa-heart active" id="${d.getAt(0)}"></i>
                                    <g:set var="h" value="${-1}" />
                                </g:if>

                         </g:each>
                            <g:if test="${h == 0}">

                                <i class="fa fa-heart " id="${d.getAt(0)}"></i>
                            </g:if>

                        </td>
                    </tr>
                </g:each>
                    </tbody>
                </table>
            </div>

        </div>
    </div>
</div>
<div id="verDato"> </div>

<script>
    $(document).ready(function(){

        $("#errorBus").delay(10000).fadeOut(400);
    });
</script>
