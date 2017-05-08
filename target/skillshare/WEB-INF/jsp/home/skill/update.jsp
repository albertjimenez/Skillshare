<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="md" tagdir="/WEB-INF/tags" %>

<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 25/3/17
  Time: 19:31
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Editar Habilidad</title>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="/css/materialize.min.css" media="screen,projection"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <%--Avisa al navegador de que el html es valido para moviles--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="/css/animate.css" rel="stylesheet">
    <link href="/css/font-google.css" rel="stylesheet">
    <link href="/css/my-backgrounds-opac.css" rel="stylesheet">
</head>
<style>
    body {
        background-image: url("/images/background-update.jpg");
        display: flex;
        min-height: 100vh;
        flex-direction: column;
    }

    main {
        flex: 1 0 auto;
        opacity: 0.7;
    }

</style>
<body class="blue lighten-3">

<%--Inicio del navbar con movil--%>
<header><md:navbar-md name="${name}"></md:navbar-md></header>
<%--Cuerpo principal--%>

<%--Barra gris--%>
<%--<div class="row">--%>

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

    <%--Resto de la página--%>
<%--<div class="col s9 ">--%>
<main class="container">
    <h4 class="center-align font-lobster">Editar habilidad ${editskill.name}</h4>
    <div class="section z-depth-2 my-bw-nw animated fadeInDown ">
        <form:form method="post" modelAttribute="editskill" id="myform">
                    <div class="row">
                        <div class="input-field col s6 offset-s3 ">
                            <i class="material-icons prefix">supervisor_account</i>
                            <form:label path="name">Nombre</form:label>
                            <form:input path="name" id="name" cssClass="validate" value="${editskill.name}"
                                        disabled="true"/>
                        </div>
                    </div>
            <div class="row">
                <div class="input-field col s6 offset-s3 ">
                    <i class="material-icons prefix">dashboard</i>
                    <form:select path="level" disabled="true">
                        <form:option value="" disabled="true">
                            Escoge qué nivel de habilidad es</form:option>
                        <form:option value="A">Avanzada</form:option>
                        <form:option value="M">Media</form:option>
                        <form:option value="N">Novato</form:option>
                    </form:select>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s6 offset-s3 ">
                    <i class="material-icons prefix">toc</i>
                    <form:label path="description">Descripción</form:label>
                    <form:textarea path="description" id="description" value="${editskill.description}"
                                   cssClass="validate"/>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s6 offset-s3 ">
                    <button class="btn waves-effect waves-light" type="submit" name="action">Editar
                        <i class="material-icons right">send</i>
                    </button>
                    <a class="waves-effect waves-green btn-flat" href="../../../home_pc.html">Cancelar</a>
                </div>
            </div>
                </form:form>
            </div>

</main>


<%--Footer--%>
<md:footer-md></md:footer-md>

<%--Seccion Scripts--%>
<script type="text/javascript" src="/js/materialize.min.js"></script>
<script src="/js/scroll.js"></script>
<script type="text/javascript" src="/js/BarraLateralMovil.js"></script>
<script>
    $(document).ready(function () {
        $('select').material_select();
    });
</script>
<script>
    AOS.init();
</script>
</body>
</html>
