<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 20/3/17
  Time: 0:50
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix="c" uri="http://www.springframework.org/tags/form" %>--%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

<%--Inicio del navbar con movil--%>
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
            <li><a href="testing/listSkill.html">Listar Habilidades</a></li>
            <li><a href="testing/proposal.html">Propuestas</a></li>
        </ul>
        <%--Esto es la cabecera movil--%>
        <ul class="side-nav" id="mobile-demo">
            <li><a href="testing/listSkill.html">Lista de Habilidades</a></li>
            <li><a href="testing/proposal.html">Propuestas</a></li>
        </ul>
    </div>
</div>
</nav>

<h4 class="center-align hoverable z-depth-1-half">Inicia tu sesión</h4>
<%--Abrimos formulario--%>
<%--TODO VIGILA EL ATRIBUTO modelAttribute--%>
<div class="section z-depth-2 transparent hoverable">
    <form:form method="post" modelAttribute="loginEntity">
        <div class="row">
            <div class="input-field col s6 offset-s3 ">
                <i class="material-icons prefix">account_circle</i>
                <form:label path="user">Email</form:label>
                <form:input path="user"/>
                    <%--<input placeholder="Correo o Nombre de Usuario" id="login_access" type="text">--%>
                    <%--<label for="login_access">Correo o Nombre de Usuario</label>--%>
            </div>
        </div>
        <div class="row ">
            <div class="input-field col s6 offset-s3">
                <i class="material-icons prefix">dialpad</i>
                    <%--<input placeholder="Contraseña" id="password" type="password" class="validate">--%>
                <form:label path="password">Contraseña</form:label>
                <form:input path="password"/>
                    <%--<label for="password">Contraseña</label>--%>
            </div>
        </div>

        <div class="row center-align valign">
            <div class="col s6 offset-s3">
                <input type="submit" value="Iniciar Sesión" class="waves-effect waves-green btn-flat">
            </div>
        </div>
        <div class="row center-align valign">
            <div class="col s6 offset-s3">
                <a href="/" class="waves-effect waves-green btn-flat">Volver</a>
            </div>
        </div>
    </form:form>
</div>


<%--Footer--%>
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
                    <%--<li><a class="grey-text text-lighten-3" href="#!">Link 2</a></li>--%>
                    <%--<li><a class="grey-text text-lighten-3" href="#!">Link 3</a></li>--%>
                    <%--<li><a class="grey-text text-lighten-3" href="#!">Link 4</a></li>--%>
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
</body>
</html>
