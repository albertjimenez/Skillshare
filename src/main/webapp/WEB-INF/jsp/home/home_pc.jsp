
<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 20/3/17
  Time: 1:49
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="md" tagdir="/WEB-INF/tags" %>

<html>
<head>
    <title>Home Promotor de colaboraciones</title>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="/css/materialize.min.css" media="screen,projection"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <%--Avisa al navegador de que el html es valido para moviles--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>

<%--<style>--%>
<%--body {--%>
<%--display: flex;--%>
<%--min-height: 100vh;--%>
<%--flex-direction: column;--%>
<%--}--%>

<%--main {--%>
<%--flex: 1 0 auto;--%>
<%--}--%>

<%--header, main, footer {--%>
<%--padding-left: 300px;--%>
<%--}--%>

<%--@media only screen and (max-width : 992px) {--%>
<%--header, main, footer {--%>
<%--padding-left: 0;--%>
<%--}--%>
<%--}--%>
<%--</style>--%>
<body class="blue lighten-3">
<%--Inicio del navbar con movil--%>

<header>
    <md:navbar-md name="${name}"></md:navbar-md>
</header>
    <%--Barra gris--%>

<%--TODO meter todo en <li>--%>
<md:sidenav-md name="${name}" type="${type}">
    <li><a class="waves-effect" href="${pageContext.request.contextPath}/banned/ban.html">
        <i class="material-icons">warning</i>Lista de baneados</a></li>
</md:sidenav-md>

<%--<div class="col s12 m8 l9" style="height: 100%">--%>
<main>
        <div class="fixed-action-btn horizontal">
            <a class="btn-floating btn-large red">
                <i class="material-icons">menu</i>
            </a>
            <ul>
                <li><a class="btn-floating green" href="skill/create.html">
                    <i class="material-icons">playlist_add</i></a></li>
            </ul>
        </div>
        <ul class="collapsible " data-collapsible="accordion">
            <c:forEach items="${skills}" var="sk">
                <li>
                    <div class="collapsible-header red lighten-3 z-depth-3">
                        <i class="material-icons">
                            touch_app</i>#${sk.name} #${sk.level}</div>
                    <div class="collapsible-body cyan lighten-4 hoverable">
                        <div class="row">
                            <div class="col s12">
                        <span>${sk.description}</span>
                            </div>
                        </div>
                            <%--Botonera dentro del cajon--%>
                        <div class="row">
                            <div class="col s6">
                                <a class="waves-effect waves-light btn" href="skill/update/${sk.name}/${sk.level}.html">
                                    <i class="material-icons left ">mode_edit
                                    </i>Editar habilidad</a>
                            </div>
                            <div class="col s6">
                                <a class="waves-effect waves-light btn" href="skill/delete/${sk.name}/${sk.level}.html">
                                    <i class="material-icons left">delete</i>
                                    Borrar habilidad</a>
                            </div>
                        </div>
                            <%--Botonera fija en la parte inferior derecha--%>
                            <%--Button Material--%>
                        <div class="fixed-action-btn">
                            <a class="btn-floating btn-large red">
                                <i class="large material-icons">mode_edit</i>
                            </a>

                                <%--SUBButtons--%>
                            <ul>
                                <li><a class="btn-floating red" href="skill/delete/${sk.name}/${sk.level}.html"><i
                                        class="material-icons">delete</i></a></li>
                                <li><a class="btn-floating blue" href="skill/update/${sk.name}/${sk.level}.html">
                                    <i class="material-icons">mode_edit</i></a></li>
                                <li><a class="btn-floating green" href="skill/create.html">
                                    <i class="material-icons">playlist_add</i></a></li>
                            </ul>
                        </div>
                    </div>
                </li>
            </c:forEach>
        </ul>
</main>
<%--</div>--%>


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
