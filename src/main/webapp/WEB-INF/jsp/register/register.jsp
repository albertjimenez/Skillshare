<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 24/3/17
  Time: 14:58
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
<nav>
    <div class="navbar-fixed">

        <div class="nav-wrapper light-blue">
            <a class="brand-logo center" href="/">
                <img src="/images/icono_app.png"
                     class="responsive-img z-depth-2" alt="" width="40" height="40">
                Skillshare EI1027
            </a>
            <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons ">menu</i></a>
            <%--Esto es la cabecera de arriba--%>
            <ul class="right hide-on-med-and-down">
                <li><a href="/login/login.html">Iniciar sesión</a></li>
            </ul>
            <%--Esto es la cabecera movil--%>
            <ul class="side-nav" id="mobile-demo">
                <li><a href="/login/login.html">Iniciar sesión</a></li>
            </ul>
        </div>
    </div>
</nav>

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
        <%--<div class="row ">--%>
        <%--<div class="input-field col s6 offset-s3">--%>
        <%--<i class="material-icons prefix">dialpad</i>--%>
        <%--<form:label path="passwordAgain">Repita la Contraseña</form:label>--%>
        <%--<form:password path="passwordAgain" id="passwordAgain"/>--%>
        <%--</div>--%>
        <%--</div>--%>
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


<footer class="page-footer light-blue">
    <div class="container">
        <div class="row">
            <div class="col l6 s12">
                <h5 class="white-text">Skillshare Project</h5>
                <p class="grey-text text-lighten-4">Elaborado con Spring MVC y Materialize.</p>
            </div>
            <div class="col l4 offset-l2 s12">
                <h5 class="white-text">Enlaces</h5>
                <ul>
                    <li><a class="grey-text text-lighten-3" href="login/login.html">Iniciar Sesión</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="footer-copyright">
        <div class="container">
            © 2017 Copyright
            <a class="grey-text text-lighten-4 right" href="https://aulavirtual.uji.es/course/view.php?id=47728">Aula
                Virtual</a>
        </div>
    </div>
</footer>


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
