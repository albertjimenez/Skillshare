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

<md:navbar-md name="${name}"></md:navbar-md>


<%--Cuerpo principal--%>

<%--Barra gris--%>
<div class="row">


    <md:panel-lateral>
        <span class="white-text">
        El botón de <i><strong>Panel</strong></i> expande el panel para poder controlar y mostrar más
        información que la que se muestra.
        </span>
        <span class="white-text">
    Desde esta página podrás añadir habilidades nuevas.</span>

        <div class="card-panel red accent-2 hoverable">
            <a href="${pageContext.request.contextPath}/home/home_pc.html">
                Lista de Habilidades<i class="material-icons">list</i>
            </a>
        </div>
        <div class="card-panel red accent-2 hoverable">
            <a href="${pageContext.request.contextPath}/banned/ban.html">
                Lista de Baneados<i class="material-icons">warning</i>
            </a>
        </div>
    </md:panel-lateral>

    <%--&lt;%&ndash;TODO tengo que crear el formulario banned tanto para ver como para insertar baneados&ndash;%&gt;--%>

    <div class="col s8">

        <div class="card hoverable transparent z-depth-1-half valign">
            <div class="card-image medium">
                <img class="responsive-img" src="/images/wallcard.png" width="200" height="120">
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

</div>


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
