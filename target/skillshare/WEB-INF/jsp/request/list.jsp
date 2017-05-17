<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 29/4/17
  Time: 1:58
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="md" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <title>Mis peticiones</title>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="/css/materialize.min.css" media="screen,projection"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <%--Avisa al navegador de que el html es valido para moviles--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link type="text/css" rel="stylesheet" href="/css/font-google.css"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
        body {
            background-image: url("/images/background-list-req.jpg");
        }
    </style>
</head>
<body class="blue lighten-3">


<header>
    <md:navbar-md name="${name}"></md:navbar-md>
</header>

<md:sidenav-md name="${name}" type="${type}" cp="${cp}">
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


</md:sidenav-md>

<main class="container">
    <h4 class="font-lobster center-align">Mis ${count} Peticiones</h4>



    <%--Boton material de crear solicitud--%>
    <div class="fixed-action-btn horizontal">
        <a class="btn-floating btn-large red">
            <i class="material-icons">menu</i>
        </a>
        <ul>
            <li><a class="btn-floating green" href="${pageContext.request.contextPath}/request/create.html">
                <i class="material-icons">playlist_add</i></a></li>
        </ul>
    </div>

    <c:if test="${empty requests}">
        <div class="valign-wrapper">
            <a class="valign" style="font-size: 50px;text-align: center">
                <i class="material-icons valign" style="font-size: 200px; text-align: center">insert_invitation</i>
                <br>
                Esto está vacío... Prueba creando alguna petición.</a>
        </div>
    </c:if>
    <c:if test="${not empty requests}">

        <ul class="collapsible popout" data-collapsible="accordion">


            <c:forEach items="${requests}" var="req">

                <md:desplegable-md name="${req.skillName}" name2="${req.initialDate}">

                    <table class="highlight bordered">
                        <tr>
                            <td><span class="font-raleway">Nivel:</span></td>
                            <td class="font-raleway">${req.level}</td>
                        </tr>
                        <tr>
                            <td><span class="font-raleway">Descripción:</span></td>
                            <td class="font-raleway">${req.description}</td>
                        </tr>
                        <tr>
                            <td><span class="font-raleway">Fecha fin:</span></td>
                            <td class="font-raleway">${req.finishDate}</td>
                        </tr>
                        <tr>
                            <td>
                                <a class="waves-effect waves-light btn"
                                   href="${pageContext.request.contextPath}/proposal/delete/${req.id}.html">
                                    <i class="material-icons left">delete</i>
                                    Borrar Solicitud</a>
                            </td>
                        </tr>
                    </table>


                    <%--Botonera fija en la parte inferior derecha--%>
                    <%--Button Material--%>
                    <div class="fixed-action-btn">
                        <a class="btn-floating btn-large red pulse">
                            <i class="large material-icons">mode_edit</i>
                        </a>

                            <%--SUBButtons--%>
                        <ul>
                            <li><a class="btn-floating red pulse"
                                   href="${pageContext.request.contextPath}/proposal/delete/${req.id}.html"><i
                                    class="material-icons">delete</i></a></li>
                            <li><a class="btn-floating green pulse"
                                   href="${pageContext.request.contextPath}/proposal/create.html">
                                <i class="material-icons">playlist_add</i></a></li>
                        </ul>
                    </div>

                </md:desplegable-md>
            </c:forEach>
        </ul>
    </c:if>
</main>


<md:footer-md></md:footer-md>

<script type="text/javascript" src="/js/materialize.min.js"></script>
<script src="/js/scroll.js"></script>
<script type="text/javascript" src="/js/BarraLateralMovil.js"></script>
<script>
    $(document).ready(function () {
        $('select').material_select();
    });
</script>
<script type="text/javascript" src="/js/initial.min.js"></script>
<script>
    $('.profile').initial({
        width:40,height:40
    });
</script>


</body>
</html>
