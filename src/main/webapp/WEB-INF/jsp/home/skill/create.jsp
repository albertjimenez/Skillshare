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
</head>
<body class="blue lighten-3">

<header>
    <md:navbar-md name="${name}"></md:navbar-md>
</header>


<%--Cuerpo principal--%>

<%--Barra gris--%>
<%--<div class="row">--%>


<md:sidenav-md name="${name}" type="${type}">
    <ul>
        <li>
            <a href="${pageContext.request.contextPath}/home/home_pc.html">
                Lista de Habilidades<i class="material-icons">list</i>
            </a></li>
        <li>
            <a href="${pageContext.request.contextPath}/banned/ban.html">
                Lista de Baneados<i class="material-icons">warning</i>
            </a></li>
    </ul>
</md:sidenav-md>

<%--<div class="col s8">--%>
<main>
    <div class="container medium">
        <div class="card hoverable transparent z-depth-1-half valign">
            <div class="card-image">
                <img class="responsive-img" src="/images/wallcard.png">
                <span class="card-title">Crear habilidad</span>
            </div>

            <div class="card-content">
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
                                <form:option value="A">Advanced</form:option>
                                <form:option value="M">Medium</form:option>
                                <form:option value="N">Newbie</form:option>
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
        </div>
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
