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

    <title>Mis Ofertas</title>
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

<%--Fondo restante de la web sin panel--%>
<main class="container">
    <%--<div class="col s12 m8 l9" style="height: 100%">--%>
    <h4 class="font-lobster center-align">Mis ${count} ofertas</h4>

    <%--Boton material de crear oferta--%>
    <div class="fixed-action-btn horizontal">
        <a class="btn-floating btn-large red">
            <i class="material-icons">menu</i>
        </a>
        <ul>
            <li><a class="btn-floating green" href="${pageContext.request.contextPath}/proposal/create.html">
                <i class="material-icons">playlist_add</i></a></li>
        </ul>
    </div>


    <c:if test="${empty proposals}">
        <div class="valign-wrapper">
            <a class="valign" style="font-size: 50px;text-align: center">
                <i class="material-icons valign" style="font-size: 200px; text-align: center">insert_invitation</i>
                <br>
                Esto está vacío... Prueba a empezar creando alguna oferta.</a>
        </div>
    </c:if>
    <c:if test="${not empty proposals}">

        <div id="search-wrapper">
            <input type="text" id="search" class="live-search-box" placeholder="Buscar ofertas" />
            <div id="close-icon"></div>
        </div>


        <ul class="rig columns-4 live-search-list">
            <c:forEach items="${proposals}" var="prop">
                <a href="#${prop.id}">
                    <li class="hoverable animated flipInY">
                        <img class="activator profile center-align circle" data-name=${prop.skillName}}">
                        <h3 class="center-align">${prop.skillName} ${prop.level}</h3>
                        <p>Descripción:</p>
                        <p class="center-align">${prop.description}</p>
                        <p class="">Inicio: ${prop.initialDate}</p>
                        <p class="">Fin: ${prop.finishDate}</p>

                    </li>
                </a>
                <%--<a class="waves-effect waves-light btn"--%>
                   <%--href="${pageContext.request.contextPath}/proposal/update/${req.id}.html">--%>
                    <%--<i class="material-icons left ">mode_edit--%>
                    <%--</i>Editar Oferta</a>--%>
                <%--<a class="waves-effect waves-light btn"--%>
                   <%--href="${pageContext.request.contextPath}/proposal/delete/${req.id}.html">--%>
                    <%--<i class="material-icons left">delete</i>--%>
                    <%--Borrar Oferta</a>--%>

            </c:forEach>
        </ul>

        <%--<ul class="collapsible popout" data-collapsible="accordion">--%>

            <%--<c:forEach items="${proposals}" var="req">--%>


                <%--<md:desplegable-md name="${req.skillName}" name2="${req.initialDate}">--%>


                    <%--<table class="highlight bordered">--%>
                        <%--<tr>--%>
                            <%--<td><span class="font-raleway">Nivel:</span></td>--%>
                            <%--<td class="font-raleway">${req.level}</td>--%>
                        <%--</tr>--%>
                        <%--<tr>--%>
                            <%--<td><span class="font-raleway">Descripción:</span></td>--%>
                            <%--<td class="font-raleway">${req.description}</td>--%>
                        <%--</tr>--%>
                        <%--<tr>--%>
                            <%--<td><span class="font-raleway">Fecha fin:</span></td>--%>
                            <%--<td class="font-raleway">${req.finishDate}</td>--%>
                        <%--</tr>--%>
                        <%--<tr>--%>
                            <%--<td>--%>
                                <%--<a class="waves-effect waves-light btn"--%>
                                   <%--href="${pageContext.request.contextPath}/proposal/update/${req.id}.html">--%>
                                    <%--<i class="material-icons left ">mode_edit--%>
                                    <%--</i>Editar Oferta</a>--%>
                            <%--</td>--%>
                            <%--<td>--%>
                                <%--<a class="waves-effect waves-light btn"--%>
                                   <%--href="${pageContext.request.contextPath}/proposal/delete/${req.id}.html">--%>
                                    <%--<i class="material-icons left">delete</i>--%>
                                    <%--Borrar Oferta</a>--%>
                            <%--</td>--%>
                        <%--</tr>--%>
                    <%--</table>--%>


                    <%--&lt;%&ndash;Botonera fija en la parte inferior derecha&ndash;%&gt;--%>
                    <%--&lt;%&ndash;Button Material&ndash;%&gt;--%>
                    <%--<div class="fixed-action-btn">--%>
                        <%--<a class="btn-floating btn-large red pulse">--%>
                            <%--<i class="large material-icons">mode_edit</i>--%>
                        <%--</a>--%>

                            <%--&lt;%&ndash;SUBButtons&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<ul>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<li><a class="btn-floating red pulse"&ndash;%&gt;--%>
                                   <%--&lt;%&ndash;href="${pageContext.request.contextPath}/proposal/delete/${req.id}.html"><i&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;class="material-icons">delete</i></a></li>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<li><a class="btn-floating blue pulse"&ndash;%&gt;--%>
                                   <%--&lt;%&ndash;href="${pageContext.request.contextPath}/proposal/update/${req.id}.html">&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<i class="material-icons">mode_edit</i></a></li>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<li><a class="btn-floating green pulse"&ndash;%&gt;--%>
                                   <%--&lt;%&ndash;href="${pageContext.request.contextPath}/proposal/create.html">&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<i class="material-icons">playlist_add</i></a></li>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</ul>&ndash;%&gt;--%>
                    <%--</div>--%>

                <%--</md:desplegable-md>--%>

            <%--</c:forEach>--%>
        <%--</ul>--%>

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
    $('.profile').initial();
</script>
<script>
    AOS.init();
</script>

</body>
</html>
