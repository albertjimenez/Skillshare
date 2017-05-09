<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 25/3/17
  Time: 22:29
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="md" tagdir="/WEB-INF/tags" %>

<html>
<head>
    <title>Crear habilidad</title>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="/css/materialize.min.css" media="screen,projection"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <%--Avisa al navegador de que el html es valido para moviles--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link type="text/css" href="/css/font-google.css">
    <link type="text/css" href="/css/animate.css">
    <link href="/css/my-backgrounds-opac.css" rel="stylesheet">
    <style>
        @import url(http://fonts.googleapis.com/css?family=Raleway:100,400,700);
        body {
            background-image: url("/images/background-create-skill.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            background-attachment: fixed;
            font-family: Raleway, Open Sans, Droid Sans, Roboto,arial, sans-serif;
        }

        .blurred-bg {
            background-image: url("/images/background-create-skill-blur.jpg");
            background-repeat: no-repeat;
            -moz-background-size: cover;
            -o-background-size: cover;
            -webkit-background-size: cover;
            background-size: cover;
            background-attachment: fixed;
        }

    </style>
</head>
<body class="blue lighten-3">

<header>
    <md:navbar-md name="${name}"></md:navbar-md>
</header>





<md:sidenav-md name="${name}" type="${type}">
    <li>
        <a class="waves-effect" href="${pageContext.request.contextPath}/home/home_pc.html">Colección de Habilidades</a>
    </li>
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
    <li><a class="subheader">Promotor de colaboraciones</a></li>
    <li>
        <a class="waves-effect" href="${pageContext.request.contextPath}/banned/ban.html">
            <i class="material-icons">warning</i>Lista de baneados</a>
    </li>
</md:sidenav-md>

<%--<div class="col s8">--%>
<main class="container">
    <h4 class="font-lobster center-align blue-text">Crear habilidad</h4>
    <div class="section z-depth-2 my-bw-nw animated fadeInDown blurred-bg blue-text">
                <form:form method="post" modelAttribute="createskill" onsubmit="white_spaces();">
                    <div class="row">
                        <div class="input-field col s6 offset-s3 ">
                            <i class="material-icons prefix">supervisor_account</i>
                            <form:label path="name">Nombre</form:label>
                            <form:input path="name" id="name" cssClass="validate"/>
                        </div>
                        <div class="input-field col s6 offset-s3 ">
                            <i class="material-icons prefix">dashboard</i>
                            <form:select path="level">
                                <form:option value="" disabled="true">
                                    Escoge qué nivel de habilidad es</form:option>
                                <form:option value="A">Avanzada</form:option>
                                <form:option value="M">Media</form:option>
                                <form:option value="N">Novato</form:option>
                            </form:select>
                        </div>
                        <div class="input-field col s6 offset-s3 ">
                            <i class="material-icons prefix">toc</i>
                            <form:label path="description">Descripción</form:label>
                            <form:textarea path="description" id="description" cssClass="validate"/>
                        </div>
                        <div class="input-field col s6 offset-s3 ">
                            <button class="btn waves-effect waves-light" type="submit" name="action">Crear
                                <i class="material-icons right">send</i>
                            </button>
                            <a class="waves-effect waves-green btn-flat"
                               href="${pageContext.request.contextPath}/home/home_pc.html">Cancelar</a>
                        </div>
                    </div>

                </form:form>
    </div>
</main>

<%--</div>--%>

<%--</div>--%>


<%--Footer--%>
<md:footer-md></md:footer-md>


<%--Seccion Scripts--%>
<script type="text/javascript" src="/js/materialize.min.js"></script>
<script src="/js/scroll.js"></script>
<script type="text/javascript" src="/js/BarraLateralMovil.js"></script>
<script type="text/javascript" src="/js/validador.js"></script>
<script>
    $(document).ready(function () {
        $('select').material_select();


    });
</script>

</body>
</html>
