<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 23/3/17
  Time: 1:16
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                <li><a href="login.html">Iniciar sesión</a></li>
            </ul>
            <%--Esto es la cabecera movil--%>
            <ul class="side-nav" id="mobile-demo">
                <li><a href="login.html">Iniciar sesión</a></li>
            </ul>
        </div>
    </div>
</nav>

<%--TODO de momento dejo un GIF pero me gustaria un video en background--%>
<%--Enlace del tutorial: https://www.youtube.com/watch?v=W2y33Q2lf3k--%>

<%--<img class="center-align responsive-img z-depth-1" src="/images/goodbye.gif" alt="Good Bye">--%>
<%--<div class="video-container">--%>
<%--<video id="video-elem" src="" preload="auto" autoplay="true" loop="loop" muted="muted">--%>
<%--<source src="/video/typing.webm" poster="/images/goodbye.gif" type="video/webm">--%>
<%--<source src="/video/typing_.mp4" poster="/images/goodbye.gif" type="video/mp4">--%>
<%--No se soporta la reproducción de vídeo.--%>
<%--</video>--%>
<%--</div>--%>
<video playsinline autoplay muted loop poster="/images/goodbye.gif" id="bgvid">
    <source src="/video/typing.webm" type="video/webm">
    <source src="/video/typing_.mp4" type="video/mp4">
</video>

<div class="card-content" id="content">
    <h1>Sesión cerrada</h1>
</div>
</body>
</html>
