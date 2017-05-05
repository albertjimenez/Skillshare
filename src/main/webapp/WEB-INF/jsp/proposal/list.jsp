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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <%--Avisa al navegador de que el html es valido para moviles--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">

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
            <a class="waves-effect" href="${pageContext.request.contextPath}/proposal/list.html">Mis Ofertas</a>
        </li>
        <li>
            <a class="waves-effect" href="${pageContext.request.contextPath}/request/list.html">Mis Peticiones</a>
        </li>
    </ul>
</md:sidenav-md>

<%--Fondo restante de la web sin panel--%>
<main class="container">
    <%--<div class="col s12 m8 l9" style="height: 100%">--%>
    <h1 class="font-raleway center-align">Mis ${count} ofertas</h1>
    <div class="divider"></div>
    <form>
        <div class="row">
            <%--TODO FORMULARIO DE BUSQUEDA--%>
            <div class="input-field col s12 hoverable z-depth-2">
                <i class="material-icons prefix">search</i>
                <input id="icon_prefix" type="text" class="validate">
                <label for="icon_prefix">Buscar ofertas por nombre o descripción</label>
                <%--TODO metele un like en la consulta SQL--%>
            </div>
        </div>
    </form>

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


    <%--TODO comprobar que si no tiene ni request ni proposals salga el texto de no tiene na--%>
    <c:if test="${empty proposals}">
        <div class="valign-wrapper">
            <a class="valign" style="font-size: 50px;text-align: center">
                <i class="material-icons valign" style="font-size: 200px; text-align: center">insert_invitation</i>
                <br>
                Esto está vacío... Prueba a empezar creando alguna oferta.</a>
        </div>
    </c:if>
    <c:if test="${not empty proposals}">

        <ul class="collapsible " data-collapsible="accordion">

            <c:forEach items="${proposals}" var="req">


                <md:desplegable-md name="${req.id}" name2="${req.skillName}" name3="${req.initialDate}">


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
                                   href="${pageContext.request.contextPath}/proposal/update/${req.id}.html">
                                    <i class="material-icons left ">mode_edit
                                    </i>Editar Oferta</a>
                            </td>
                            <td>
                                <a class="waves-effect waves-light btn"
                                   href="${pageContext.request.contextPath}/proposal/delete/${req.id}.html">
                                    <i class="material-icons left">delete</i>
                                    Borrar Oferta</a>
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
                            <li><a class="btn-floating blue pulse"
                                   href="${pageContext.request.contextPath}/proposal/update/${req.id}.html">
                                <i class="material-icons">mode_edit</i></a></li>
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
</body>
</html>
