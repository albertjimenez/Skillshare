<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 5/5/17
  Time: 14:01
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="md" tagdir="/WEB-INF/tags" %>

<html>
<head>
    <title>Listado de propuestas</title>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="/css/materialize.min.css" media="screen,projection"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <%--Avisa al navegador de que el html es valido para moviles--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link type="text/css" rel="stylesheet" href="/css/font-google.css"/>
    <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
    <link rel="stylesheet" href="/css/aos.css">
    <link rel="stylesheet" href="/css/my-grid.css">
    <link rel="stylesheet" href="/css/animate.css">
    <link rel="stylesheet" href="/css/search.css">

</head>
<body class="blue lighten-3">

<header>
    <md:navbar-md name="${name}"></md:navbar-md>
</header>


<md:sidenav-md name="${name}" type="${type}" cp="${cp}">
    <ul>
        <li>
            <a class="waves-effect" href="${pageContext.request.contextPath}/home/home_pc.html">Mi área</a>
        </li>
        <li>
            <a class="waves-effect" href="${pageContext.request.contextPath}/proposal/all.html">Ofertas de la
                comunidad</a>
        </li>
        <li>
            <a class="waves-effect" href="${pageContext.request.contextPath}/proposal/list.html">Mis Ofertas</a>
        </li>
        <li>
            <a class="waves-effect" href="${pageContext.request.contextPath}/request/list.html">Mis Peticiones</a>
        </li>

    </ul>
</md:sidenav-md>

<main class="container">

    <h4 class="center-align font-lobster">Ofertas disponibles</h4>
    <div class="fixed-action-btn horizontal">
        <a class="btn-floating btn-large blue">
            <i class="material-icons">menu</i>
        </a>
        <ul>
            <li><a class="btn-floating green" href="${pageContext.request.contextPath}/proposal/create.html">
                <i class="material-icons">playlist_add</i></a></li>
        </ul>
    </div>
    <%--<div class="col s12 m8 l9" style="height: 100%">--%>
    <c:if test="${empty proposals}">
        <div class="valign-wrapper">
            <a class="valign" style="font-size: 50px;text-align: center">
                <i class="material-icons valign" style="font-size: 200px; text-align: center">insert_invitation</i>
                <br>
                No hay propuestas todavía, te sugerimos crear una :)</a>
        </div>
    </c:if>

    <c:if test="${not empty proposals}">

        <%--<div class="wrap">--%>
        <%--<input type="text" class="live-search-box search" placeholder="Buscar ofertas" />--%>
        <%--</div>--%>
        <div id="search-wrapper">
            <input type="text" id="search" class="live-search-box" placeholder="Buscar ofertas"/>
            <div id="close-icon"></div>
        </div>


        <%--Boton fijo--%>
        <ul class="rig columns-3 live-search-list">
        <c:forEach items="${proposals}" var="prop">
            <a href="${pageContext.request.contextPath}/proposal/detail/${prop.id}.html">
                <li class="hoverable animated flipInY">
                    <img class="activator profile center-align circle" data-name=${prop.skillName}}">
                    <h3 class="center-align">${prop.skillName} ${prop.level}</h3>
                    <p>Descripción:</p>
                    <p class="center-align">${prop.description}</p>
                    <p class="">Inicio: ${prop.initialDate}</p>
                    <p class="">Fin: ${prop.finishDate}</p>
                </li>
            </a>

        </c:forEach>
        </ul>

    </c:if>
</main>

<md:footer-md></md:footer-md>


<script type="text/javascript" src="/js/materialize.min.js"></script>
<script type="text/javascript" src="/js/initial.min.js"></script>
<script>
    $('.profile').initial();
</script>
<%--Script de smooth scroll--%>
<script src="/js/scroll.js"></script>
<script src="/js/aos.js"></script>
<script src="/js/BarraLateralMovil.js"></script>
<script type="text/javascript" src="/js/search.js"></script>

<script>
    AOS.init();
</script>


</body>
</html>
