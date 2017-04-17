<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 20/3/17
  Time: 0:50
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix="c" uri="http://www.springframework.org/tags/form" %>--%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="md" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <title>Iniciar sesión</title>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="/css/materialize.min.css" media="screen,projection"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <%--Avisa al navegador de que el html es valido para moviles--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body class="blue lighten-3">

<md:navbar-md></md:navbar-md>

<h4 class="center-align hoverable z-depth-1-half">Inicia tu sesión</h4>

<%--Abrimos formulario--%>
<div class="section z-depth-2 transparent hoverable">
    <form:form method="post" modelAttribute="loginEntity" onsubmit="return check();">
        <div class="row">
            <div class="input-field col s6 offset-s3 ">
                <i class="material-icons prefix">account_circle</i>
                <form:label path="user">Email o nombre de usuario</form:label>
                <form:input path="user" id="user" cssClass="validate"/>
                <i class="materialize-red-text">
                    <form:errors path="user"/>
                </i>
            </div>
        </div>
        <div class="row ">
            <div class="input-field col s6 offset-s3">
                <i class="material-icons prefix">dialpad</i>
                <form:label path="password">Contraseña</form:label>
                <form:password path="password" id="password"/>
                <i class="materialize-red-text">
                    <form:errors path="password"/>
                </i>
            </div>
        </div>

        <div class="row center-align valign">
            <div class="col s6 offset-s3">
                <a class="waves-effect waves-green btn-flat tooltipped" data-position="left" data-delay="50"
                   data-tooltip="Sirvo para iniciar sesión">
                    <input type="submit" value="Iniciar Sesión" id="login_btn">
                </a>
            </div>
        </div>
        <div class="row center-align valign">
            <div class="col s6 offset-s3">
                <a href="/" class="waves-effect waves-green btn-flat">Volver</a>
            </div>
        </div>


    </form:form>
</div>

<div class="progress" id="progress">
    <div class="indeterminate"></div>
</div>
<%--Footer--%>
<md:footer-md></md:footer-md>

<script type="text/javascript" src="/js/materialize.min.js"></script>
<script src="/js/scroll.js"></script>
<script type="text/javascript" src="/js/BarraLateralMovil.js"></script>
<script type="text/javascript" src="/js/validador.js"></script>
<script>
    $("#progress").hide();
</script>

<script>
    $("#login_btn").click(function () {
        $(".progress").show();
    });
</script>
</body>
</html>
