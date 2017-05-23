<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 22/3/17
  Time: 2:09
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="md" tagdir="/WEB-INF/tags" %>

<html>
<head>

    <title>Home Estudiante</title>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="/css/materialize.min.css" media="screen,projection"/>
    <link type="text/css" rel="stylesheet" href="/css/font-google.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <%--Avisa al navegador de que el html es valido para moviles--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
    <script>
        function showSideNav() {
            $('.button-collapse').sideNav('show');
        }
        window.onload = showSideNav;
    </script>
</head>
<body class="blue lighten-3">

<%--Inicio del navbar con movil--%>
<header>
    <md:navbar-md name="${name}"></md:navbar-md>
</header>

<%--<div class="row">--%>
<%--Barra gris--%>
<md:sidenav-md name="${name}" type="${type}">

    <ul>
        <li>
            <a class="waves-effect" href="${pageContext.request.contextPath}/proposal/list.html">Mis Ofertas</a>
        </li>
        <li>
            <a class="waves-effect" href="${pageContext.request.contextPath}/proposal/all.html">Ofertas de la
                comunidad</a>
        </li>
        <li>
            <a class="waves-effect" href="${pageContext.request.contextPath}/request/list.html">Mis Peticiones</a>
        </li>
    </ul>
    <a href="#modal-help" class="waves-effect">
        <i class="material-icons">live_help</i>
    </a>

</md:sidenav-md>
<%--Fondo restante de la web sin panel--%>
<main class="container">
    <c:if test="${empty proposals}">
        <div class="valign-wrapper">
            <a class="valign" style="font-size: 50px;text-align: center">
                <i class="material-icons valign" style="font-size: 200px; text-align: center">insert_invitation</i>
                <br>
                Esto está vacío... Prueba a empezar creando ofertas o uniéndote a peticiones.</a>
        </div>
    </c:if>
    <c:if test="${not empty proposals}">
        <p>Pene</p>
    </c:if>
    <%--</div>--%>
</main>
<c:if test=" ${not empty success}">
    <script>
        toastr.success('Registrado correctamente');
    </script>
</c:if>

<%--</div>--%>


<%--Modal Ayuda--%>
<div class="modal" id="modal-help">
    <div class="modal-content cyan lighten-4 hoverable z-depth-5">
        <h5 class="font-raleway">Bienvenido</h5>
        <p>Hola ${name}, en el panel gris de tu izquierda encontrarás todas las
            herramientas de las que puedes hacer uso.</p>
        <p>¡Pásatelo genial aprendiendo y enseñado con el resto de la comunidad universitaria!</p>
    </div>
</div>

</div>
<md:footer-md></md:footer-md>

<script type="text/javascript" src="/js/materialize.min.js"></script>
<script src="/js/scroll.js"></script>
<script type="text/javascript" src="/js/BarraLateralMovil.js"></script>
<%--<script type="text/javascript" src="/js/mytoast.js"></script>--%>
<script>
    $(document).ready(function () {
        // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
        $('.modal').modal();
    });
</script>

</body>
</html>
