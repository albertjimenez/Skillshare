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

    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/intro.js/2.5.0/introjs.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/intro.js/2.5.0/intro.min.js"></script>
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

            <c:if test="${not empty tour}">
                <a onmouseenter="showSideNav();" href="#" data-activates="slide-out" id="tour"
                   data-intro='Este es el boton menu que muestra las opciones y los sitios a los que puedes ir, Dale click para comenzar'
                   class="button-collapse show-on-large"><i
                        class="material-icons">menu</i></a>
            </c:if>
            <c:if test="${empty tour}">
                <a onmouseenter="showSideNav();" href="#" data-activates="slide-out"
                   class="button-collapse show-on-large"><i
                        class="material-icons">menu</i></a>
            </c:if>

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
                    <li><a class="waves-effect" href="${pageContext.request.contextPath}/login/login.html">
                        <i class="material-icons left">home</i>${name}</a>
                    </li>
                    <li><a class="waves-effect" href="${pageContext.request.contextPath}/login/logout.html">
                        <i class="material-icons right">exit_to_app</i>Salir</a>
                    </li>
                </c:if>

            </ul>
            <%--Esto es la cabecera movil--%>

        </div>
    </nav>
</div>
<script>
    introJs().start();
    introJs().oncomplete(function () {
        console.log('hola');
        $('.button-collapse').sideNav('show');
    });
    var elem = document.getElementById('tour');
    introJs().onchange(function (elem) {
        alert("new step");
    });
</script>

<script>

    //    function showSideNav() {
    //        $('.button-collapse').sideNav('show');
    //    }
</script>