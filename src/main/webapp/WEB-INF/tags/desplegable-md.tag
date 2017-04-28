<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 28/4/17
  Time: 15:46
--%>
<%@attribute name="name" required="false" %>
<%@attribute name="name2" required="false" %>
<%@attribute name="name3" required="false" %>


<%--Pongo etiquetas li porque esto va siempre dentro de un forEach--%>

<li>
    <%--Encabezado que siemre se muestra con icono--%>
    <div class="collapsible-header blue lighten-4 z-depth-3">
        <i class="material-icons">
            touch_app</i>
        ${name} ${name2}</div>

    </div>
    <div class="collapsible-body blue lighten-5 hoverable">

        <div class="container">
            <%--recuerda que el body va en un table--%>
            <jsp:doBody/>
        </div>

    </div>

</li>