<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 28/4/17
  Time: 15:46
--%>
<%@attribute name="name" required="false" %>
<%@attribute name="name2" required="false" %>
<%@attribute name="name3" required="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%--Pongo etiquetas li porque esto va siempre dentro de un forEach--%>

<li>
    <%--Encabezado que siemre se muestra con icono--%>
    <div class="collapsible-header blue lighten-4 z-depth-3">
        <%--<i class="material-icons">--%>
        <%--touch_app</i>--%>
        <div>
            <img class=" activator profile" data-name=${name}}">
        </div>
        <span class="font-raleway">
            <c:if test="${name2 == 'A'}">
                Nombre: ${name} - Avanzado
            </c:if>
                        <c:if test="${name2 == 'M'}">
                            Nombre: ${name} - Medio
                        </c:if>
            <c:if test="${name2 == 'N'}">
                Nombre: ${name} - Novato
            </c:if>
        </span>
    </div>

    </div>
    <div class="collapsible-body blue lighten-5 hoverable">

        <div class="container">
            <%--recuerda que el body va en un table--%>
            <jsp:doBody/>
        </div>

    </div>

</li>