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

    <title>Mis Colaboraciones</title>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="/css/materialize.min.css" media="screen,projection"/>
    <link type="text/css" rel="stylesheet" href="/css/font-google.css"/>
    <link rel="stylesheet" href="/css/aos.css">
    <link rel="stylesheet" href="/css/my-grid.css">
    <link rel="stylesheet" href="/css/animate.css">
    <link rel="stylesheet" href="/css/search.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <%--Avisa al navegador de que el html es valido para moviles--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="/css/my-backgrounds-opac.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/intro.js/2.5.0/introjs.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/intro.js/2.5.0/intro.min.js"></script>
    <script src="/js/effect-text-3d.js"></script>

    <style>
        body {
            background-image: url("/images/background-list-req.jpg");
        }

        main {
            opacity: 0.9;
        }
    </style>
</head>
<body class="blue lighten-3">

<%--Inicio del navbar con movil--%>
<header>
    <md:navbar-md name="${name}"></md:navbar-md>
</header>

<%--<div class="row">--%>
<%--Barra gris--%>


<md:sidenav-md name="${name}" type="${type}" cp="${cp}">
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
</md:sidenav-md>

<main class="container">
    <h4 class="font-lobster center-align text3d">Mis ${count} colaboraciones</h4>


    <%--<c:if test="${empty collaborationsProposal}">--%>
    <%--<div class="valign-wrapper">--%>
    <%--<a class="valign" style="font-size: 50px;text-align: center">--%>
    <%--<i class="material-icons valign" style="font-size: 200px; text-align: center">insert_invitation</i>--%>
    <%--<br>--%>
    <%--Esto está vacío... Prueba a empezar ayudando a alguien en las secciones de ofertas y solicitudes.</a>--%>
    <%--</div>--%>
    <%--</c:if>--%>
    <%--TODO transformar con tupla de 3--%>
    <div id="search-wrapper">
        <input type="text" id="search" class="live-search-box" placeholder="Buscar colaboraciones"/>
        <div id="close-icon"></div>
    </div>
    <c:if test="${not empty collaborationsProposal}">

        <h4 class="text3d center-align">Colaboraciones a partir de ofertas</h4>
        <ul class="rig columns-3 live-search-list">
            <c:forEach items="${collaborationsProposal}" var="collab">
                <a href="${pageContext.request.contextPath}/collaboration/detail/${collab.idProposal}/${collab.idRequest}.html">
                    <li class="hoverable animated flipInY">
                        <img class="activator profile center-align circle" data-name=${collab.hours}h>
                        <h3 class="center-align">Propuesta ${collab.idProposal} Solicitud ${collab.idRequest}</h3>
                        <p class="black-text">Horas: ${collab.hours}</p>
                        <p class="blue-text"><strong>Click para más detalles</strong></p>
                    </li>
                </a>
            </c:forEach>
        </ul>


    </c:if>

    <c:if test="${not empty collaborationsRequest}">
        <h4 class="text3d center-align">Colaboraciones a partir de solicitudes</h4>
        <ul class="rig columns-3 live-search-list">
            <c:forEach items="${collaborationsRequest}" var="collabReq">
                <a href="${pageContext.request.contextPath}/collaboration/detail/${collabReq.idProposal}/${collabReq.idRequest}.html">
                    <li class="hoverable animated flipInY">
                        <img class="activator profile center-align circle" data-name=${collabReq.hours}h>
                        <h3 class="center-align">Propuesta ${collabReq.idProposal} Solicitud ${collabReq.idRequest}</h3>
                        <p class="black-text">Horas: ${collabReq.hours}</p>
                        <p class="blue-text"><strong>Click para más detalles</strong></p>
                    </li>
                </a>
            </c:forEach>
        </ul>
    </c:if>

    <c:if test="${ empty collaborationsProposal}">
        <div class="valign-wrapper">
            <a class="valign" style="font-size: 50px;text-align: center">
                <i class="material-icons valign" style="font-size: 100px; text-align: center">insert_invitation</i>
                <br>
                Esto está vacío... Prueba creando alguna oferta.</a>
        </div>
    </c:if>
    <c:if test="${ empty collaborationsRequest}">
        <div class="valign-wrapper">
            <a class="valign" style="font-size: 50px;text-align: center">
                <i class="material-icons valign" style="font-size: 100px; text-align: center">insert_invitation</i>
                <br>
                Esto está vacío... Prueba creando alguna petición.</a>
        </div>
    </c:if>


</main>


<md:footer-md></md:footer-md>
<script type="text/javascript" src="/js/materialize.min.js"></script>
<script src="/js/scroll.js"></script>
<script type="text/javascript" src="/js/BarraLateralMovil.js"></script>
<script type="text/javascript" src="/js/search.js"></script>

<script>
    $(document).ready(function () {
        $('select').material_select();
    });
</script>
<script type="text/javascript" src="/js/initial.min.js"></script>
<script>
    $('.profile').initial({
        charCount: 3
    });
</script>
<script>
    AOS.init();
</script>

<script>
    introJs().start();
</script>
</body>
</html>
