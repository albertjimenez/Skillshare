<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 24/3/17
  Time: 14:58
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="md" tagdir="/WEB-INF/tags" %>

<html>
<head>
    <title>Registrarse</title>
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

<h4 class="center-align hoverable z-depth-1-half">Regístrate</h4>

<%--Formulario de registro con objeto Student--%>
<div class="section z-depth-2 transparent hoverable">
    <form:form method="post" modelAttribute="studentRegister" onsubmit="return check_register();">
        <%--TODO he copiado esto de login.jsp,recuerda de cambiarlo a registro--%>
        <div class="row">
            <div class="input-field col s6 offset-s3 ">
                <i class="material-icons prefix">perm_identity</i>
                <form:label path="nif">NIF</form:label>
                <form:input path="nif" id="nif" cssClass="validate"/>
                <i class="materialize-red-text">
                    <form:errors path="nif"/>
                </i>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s6 offset-s3 ">
                <i class="material-icons prefix">account_circle</i>
                <form:label path="username">Nombre de usuario</form:label>
                <form:input path="username" id="username" cssClass="validate"/>
            </div>
        </div>
        <div class="row ">
            <div class="input-field col s6 offset-s3">
                <i class="material-icons prefix">dialpad</i>
                <form:label path="password">Contraseña</form:label>
                <form:password path="password" id="password1"/>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s6 offset-s3 ">
                <i class="material-icons prefix">assignment_ind</i>
                <form:label path="name">Nombre</form:label>
                <form:input path="name" id="name" cssClass="validate"/>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s6 offset-s3 ">
                <i class="material-icons prefix">assignment_ind</i>
                <form:label path="surname">Apellidos</form:label>
                <form:input path="surname" id="surname" cssClass="validate"/>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s6 offset-s3 ">
                <i class="material-icons prefix">email</i>
                <form:label path="email">Email UJI</form:label>
                <form:input path="email" id="email" cssClass="validate"/>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s6 offset-s3 ">
                <i class="material-icons prefix">business</i>
                <form:label path="degree">Titulación cursando</form:label>
                <form:input path="degree" id="degree" cssClass="validate"/>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s6 offset-s3 ">
                <i class="material-icons prefix">assignment</i>
                <form:label path="course">Curso</form:label>
                <form:input path="course" id="course" cssClass="validate"/>
                <i class="materialize-red-text">
                    <form:errors path="course"/>
                </i>
            </div>
        </div>

        <div class="row">
            <div class="input-field col s6 offset-s3 ">
                <i class="material-icons prefix">view_day</i>
                <form:select path="type">
                    <form:option value="" disabled="true">
                        Escoge qué tipo de estudiante eres</form:option>
                    <form:option value="NO">Estudiante de grado</form:option>
                    <form:option value="CP">Promotor de colaboraciones</form:option>
                    <form:option value="CM">Miembro del consejo</form:option>
                    <form:option value="MA">Estudiante de máster</form:option>
                    <form:option value="PG">Estudiante de postgrado</form:option>
                </form:select>
            </div>
        </div>
        <div class="row center-align valign">
            <div class="col s6 offset-s3">
                <a class="waves-effect waves-green btn-flat tooltipped" data-position="bottom" data-delay="15"
                   data-tooltip="Sirvo para registrar usuario sesión">
                    <input type="submit" value="Registrarse" id="register_btn">
                </a>
            </div>
        </div>
    </form:form>

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

</body>
</html>