<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 22/3/17
  Time: 1:47
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Contraseña incorrecta</title>
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


<div class="row">

    <div class="col s3">
    </div>
    <div class="col s6 z-depth-1-half">
        <div class="card-image waves-effect waves-block waves-light">
            <img class="activator responsive-img z-depth-3" src="/images/password.png">
        </div>
        <div class="card  blue-grey darken-1">
            <div class="card-content white-text">
                <span class="card-title">Aviso</span>
                <p>La contraseña de la cuenta no es correcta.
                    Por favor verifica que estás introduciendo la información correcta.</p>
            </div>
            <div class="card-action valign center-align">
                <a href="login.html">Iniciar sesión otra vez</a>
            </div>
            <div class="card-action valign center-align">
                <a href="/">Volver</a>
            </div>
        </div>
    </div>
    <div class="col s3">
    </div>

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


</body>
</html>
