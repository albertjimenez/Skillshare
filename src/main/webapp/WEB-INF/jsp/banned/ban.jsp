<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 17/4/17
  Time: 20:56
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="md" tagdir="/WEB-INF/tags" %>

<html>
<head>
    <title>Lista de usuarios bloqueados</title>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="/css/materialize.min.css" media="screen,projection"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <%--Avisa al navegador de que el html es valido para moviles--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link type="text/css" rel="stylesheet" href="/css/font-google.css"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="/css/my-backgrounds-opac.css">
    <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
</head>

<style>
    /*@import url(http://fonts.googleapis.com/css?family=Raleway:100,400,700);*/
    body {
        background-image: url("/images/banned-jail.jpg");
        background-repeat: no-repeat;
        background-size: cover;
        background-attachment: fixed;
        /*font-family: Raleway, Open Sans, Droid Sans, Roboto, arial, sans-serif;*/
    }

    .blurred-bg {
        background-image: url("/images/banned-jail-blur.jpg");
        background-repeat: no-repeat;
        -moz-background-size: cover;
        -o-background-size: cover;
        -webkit-background-size: cover;
        background-size: cover;
        background-attachment: fixed;
    }

</style>
<body class="blue lighten-3">

<header>
    <md:navbar-md name="${name}"></md:navbar-md>
</header>

<%--<div class="row">--%>

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
        <li>
            <a class="waves-effect" href="${pageContext.request.contextPath}/banned/ban.html">
                <i class="material-icons">warning</i>Lista de baneados</a>
        </li>
    </ul>
</md:sidenav-md>

<main class="container ">

    <div class="fixed-action-btn horizontal">
        <a class="btn-floating btn-large red">
            <i class="material-icons">menu</i>
        </a>
        <ul>
            <li><a class="btn-floating blue" href="#modal1">
                <i class="material-icons">playlist_add</i></a></li>
        </ul>
    </div>

    <h4 class="center-align font-lobster blue-text"><strong>Listado de baneados</strong></h4>
    <%--<div class="col s12 m8 l9" style="height: 100%">--%>
    <c:if test="${empty items}">
        <div class="valign-wrapper ">
            <a class="valign" style="font-size: 50px;text-align: center">
                <i class="material-icons valign" style="font-size: 200px; text-align: center">insert_invitation</i>
                <br>
                Esto está vacío... Mejor así :)</a>
        </div>
    </c:if>
    <c:if test="${not empty items}">

        <%--Boton fijo--%>


        <ul class="collapsible popout" data-collapsible="accordion">
            <c:forEach items="${items}" var="item">

                <md:desplegable-md name="${item.name}" name2="${item.username}">
                    <table class="highlight bordered font-raleway">
                        <tr>
                            <td>NIF:</td>
                            <td>${item.nif}</td>
                        </tr>
                        <tr>
                            <td>EMAIL:</td>
                            <td>${item.email}</td>
                        </tr>
                        <tr>
                            <td>GRADO:</td>
                            <td>${item.degree}</td>
                        </tr>
                        <tr>
                            <td>
                                <a class="waves-effect waves-light btn"
                                   href="${pageContext.request.contextPath}/banned/delete/${item.nif}.html">
                                    <i class="material-icons left">delete</i>
                                    Borrar baneado</a>
                            </td>
                        </tr>

                    </table>

                    <div class="fixed-action-btn">
                        <a class="btn-floating btn-large red">
                            <i class="large material-icons">mode_edit</i>
                        </a>

                            <%--SUBButtons--%>
                        <ul>
                            <li><a class="btn-floating red"
                                   href="${pageContext.request.contextPath}/banned/delete/${item.nif}.html"><i
                                    class="material-icons">delete</i></a></li>

                            <li><a class="btn-floating green" href="#modal1">
                                <i class="material-icons">playlist_add</i></a></li>
                        </ul>
                    </div>
                </md:desplegable-md>


            </c:forEach>
        </ul>

    </c:if>
</main>
<%--</div>--%>


<%--</div>--%>


<%--MODAL  CREAR--%>
<div id="modal1" class="modal">
    <div class="modal-content">
        <h4>Escriba el NIF del usuario a prohibir</h4>
        <form:form method="post" modelAttribute="newbanned" onsubmit="return checkBanned();">
            <form:label path="nif">NIF:</form:label>
            <form:input path="nif" id="nif" cssClass="validate"/>
            <form:errors path="nif" id="wrongPass"/>
            <button class="btn waves-effect waves-light" type="submit" name="action">Añadir
                <i class="material-icons right">send</i>
            </button>
        </form:form>
    </div>
</div>

<md:footer-md></md:footer-md>
<script type="text/javascript" src="/js/materialize.min.js"></script>
<script src="/js/scroll.js"></script>
<script type="text/javascript" src="/js/BarraLateralMovil.js"></script>
<script type="text/javascript" src="/js/validador.js"></script>
<script>
    $(document).ready(function () {
        $('select').material_select();
    });
</script>
<script>
    $(document).ready(function () {
        // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
        $('.modal').modal();
    });
</script>
<script type="text/javascript" src="/js/initial.min.js"></script>
<script>
    $('.profile').initial();
</script>

<script>
    if ($('#wrongPass').get().length > 0) {
        Materialize.toast('No existe el estudiante solicitado o ya se encuentra baneado', 6000, 'rounded');

    }
</script>
</body>
</html>
