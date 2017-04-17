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
            background: url(/images/goodbye.png) no-repeat;
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


<%--TODO de momento dejo un GIF pero me gustaria un video en background--%>
<%--Enlace del tutorial: https://www.youtube.com/watch?v=W2y33Q2lf3k--%>


<video playsinline autoplay muted loop poster="/images/goodbye.png" id="bgvid">
    <source src="/video/typing.webm" type="video/webm">
    <source src="/video/typing_.mp4" type="video/mp4">
</video>

<div class="card-content" id="content">
    <h1>Sesión cerrada</h1>
</div>

<md:footer-md></md:footer-md>


<script type="text/javascript" src="/js/materialize.min.js"></script>
<script src="/js/scroll.js"></script>
<script type="text/javascript" src="/js/BarraLateralMovil.js"></script>


</body>
</html>
