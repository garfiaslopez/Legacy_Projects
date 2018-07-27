<%--
  Created by IntelliJ IDEA.
  User: javi
  Date: 2/11/15
  Time: 04:42 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>

<g:each in="${favoritos}" var="f">

    <a   class="favDat"  id="${f.getAt(1)}"><p>${f.getAt(0)}</p></a>
</g:each>
