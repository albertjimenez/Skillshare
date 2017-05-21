<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 17/4/17
  Time: 14:29
--%>
<%--Inicio del navbar con movil--%>
<%@attribute name="name" required="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <link type="text/css" rel="stylesheet" href="/css/font-google.css"/>
    <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
</head>

<div class="navbar">
    <nav>
        <div class="nav-wrapper light-blue">
            <%--Si se pone fija la barra, la barra de movil no va --%>

            <a class="brand-logo center" href="${pageContext.request.contextPath}/">
                <img src="${pageContext.request.contextPath}/images/icono_app.png"
                     class="responsive-img z-depth-2" alt="" width="40" height="40">
                <span class="font-lobster">Skillshare</span>
            </a>
            <a onmouseenter="showSideNav();" href="#" data-activates="slide-out"
               class="button-collapse show-on-large"><i
                    class="material-icons">menu</i></a>

            <%--<a href="#" data-activates="mobile-demo" class="button-collapse">--%>
            <%--<i class="material-icons ">menu</i>--%>
            <%--</a>--%>
            <%--Esto es la cabecera de arriba--%>
            <ul class="right hide-on-med-and-down">
                <c:if test="${empty name}">
                    <li><a class="waves-effect" href="${pageContext.request.contextPath}/login/login.html">Entrar</a>
                    </li>
                    <li><a class="waves-effect" href="${pageContext.request.contextPath}/register/register.html">Registrarse</a>
                    </li>
                </c:if>
                <c:if test="${not empty name}">
                    <li><a class="waves-effect" href="${pageContext.request.contextPath}/login/login.html">${name}</a>
                    </li>
                    <li><a class="waves-effect" href="${pageContext.request.contextPath}/login/logout.html">Salir</a>
                    </li>
                </c:if>

            </ul>
            <%--Esto es la cabecera movil--%>

        </div>
    </nav>
</div>
<script>
    //    function showSideNav() {
    //        $('.button-collapse').sideNav('show');
    //    }
</script>