<%--
  Created by IntelliJ IDEA.
  User: javi
  Date: 22/10/15
  Time: 06:46 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>

<div class="heading">
    <i class="fa fa-comments"></i>Comentarios
</div>


<div class="comments padded">
    <g:each in="${comentarios}" var="c">
        <div class="comment">
            <img src="${createLink(controller: 'categoria', action: 'getImagen', id: c.getAt(3))}" width="34px", height="34px" onerror='this.src="${resource(dir: 'images', file: 'default.jpg')}"'><g:if test="${empleado != null}"> ${empleado.nombre}</g:if><b class="caret"></b>
            <div class="profile-details clearfix">
                <a class="user-name" href="#">${c.getAt(0)}</a>
                <p>
                    <em>${c.getAt(2)}</em>
                </p>
            </div>
            <p class="content">
                ${c.getAt(1)}
            </p>
        </div>
    </g:each>


    <form role="form">
        <div class="form-group">
            <input class="form-control" id="anadirComentario" placeholder="Añadir un comentario..." type="email">
            <input type="text" value="${des[0].getAt(7)}" style="display: none;" id="id">
        </div>
    </form>
</div>
