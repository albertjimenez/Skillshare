<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 23/3/17
  Time: 1:16
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="md" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <title>Fin de sesión</title>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="/css/materialize.min.css" media="screen,projection"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <%--Avisa al navegador de que el html es valido para moviles--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <style type="text/css">
        video#bgvid {
            position: fixed;
            top: 50%;
            left: 50%;
            min-width: 100%;
            min-height: 100%;
            width: auto;
            height: auto;

            z-index: -100;
            -ms-transform: translateX(-50%) translateY(-50%);
            -moz-transform: translateX(-50%) translateY(-50%);
            -webkit-transform: translateX(-50%) translateY(-50%);
            transform: translateX(-50%) translateY(-50%);
            background: url(/images/goodbye.gif) no-repeat;
            background-size: cover;
        }

        div#content {
            background-color: #666666;
            z-index: 1000;
            position: absolute;
            width: 100%;
            min-height: 100%;
            opacity: 0.75;
        }
    </style>
</head>
<body class="blue lighten-3">
<md:navbar-md></md:navbar-md>
<%--<nav>--%>
<%--<div class="navbar-fixed">--%>

<%--<div class="nav-wrapper light-blue">--%>
<%--<a class="brand-logo center" href="/">--%>
<%--<img src="/images/icono_app.png"--%>
<%--class="responsive-img z-depth-2" alt="" width="40" height="40">--%>
<%--Skillshare EI1027--%>
<%--</a>--%>
<%--<a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons ">menu</i></a>--%>
<%--&lt;%&ndash;Esto es la cabecera de arriba&ndash;%&gt;--%>
<%--<ul class="right hide-on-med-and-down">--%>
<%--<li><a href="login.html">Iniciar sesión</a></li>--%>
<%--</ul>--%>
<%--&lt;%&ndash;Esto es la cabecera movil&ndash;%&gt;--%>
<%--<ul class="side-nav" id="mobile-demo">--%>
<%--<li><a href="login.html">Iniciar sesión</a></li>--%>
<%--</ul>--%>
<%--</div>--%>
<%--</div>--%>
<%--</nav>--%>

<%--TODO de momento dejo un GIF pero me gustaria un video en background--%>
<%--Enlace del tutorial: https://www.youtube.com/watch?v=W2y33Q2lf3k--%>

<video playsinline autoplay muted loop poster="/images/goodbye.gif" id="bgvid">
    <source src="/video/typing.webm" type="video/webm">
    <source src="/video/typing_.mp4" type="video/mp4">
</video>

<div class="card-content" id="content">
    <h1>Sesión cerrada</h1>
</div>

<md:footer-md></md:footer-md>
<%--<footer class="page-footer light-blue">--%>
<%--<div class="container">--%>
<%--<div class="row">--%>
<%--<div class="col l6 s12">--%>
<%--<h5 class="white-text">Skillshare Project</h5>--%>
<%--<p class="grey-text text-lighten-4">Elaborado con Spring MVC y Materialize.</p>--%>
<%--</div>--%>
<%--<div class="col l4 offset-l2 s12">--%>
<%--<h5 class="white-text">Enlaces</h5>--%>
<%--<ul>--%>
<%--<li><a class="grey-text text-lighten-3" href="login/login.html">Iniciar Sesión</a></li>--%>
<%--</ul>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--<div class="footer-copyright">--%>
<%--<div class="container">--%>
<%--© 2017 Copyright--%>
<%--<a class="grey-text text-lighten-4 right" href="https://aulavirtual.uji.es/course/view.php?id=47728">Aula--%>
<%--Virtual</a>--%>
<%--</div>--%>
<%--</div>--%>
<%--</footer>--%>


<script type="text/javascript" src="/js/materialize.min.js"></script>
<script src="/js/scroll.js"></script>
<script type="text/javascript" src="/js/BarraLateralMovil.js"></script>


</body>
</html>
