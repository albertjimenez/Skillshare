<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 23/4/17
  Time: 17:40
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="md" tagdir="/WEB-INF/tags" %>

<html>
<head>
    <title>Title</title>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="/css/materialize.min.css" media="screen,projection"/>
    <link type="text/css" rel="stylesheet" href="/css/font-google.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <%--Avisa al navegador de que el html es valido para moviles--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
</head>
<style>

    header, main, footer {
        padding-left: 300px;
    }

    @media only screen and (max-width: 992px) {
        header, main, footer {
            padding-left: 0;
        }
    }
</style>
<body class="blue lighten-3">


<md:sidenav-md></md:sidenav-md>

<header>
    <md:navbar-md></md:navbar-md>
</header>

<main>
    <p class="green">Guei</p>

</main>

<footer>
    <md:footer-md></md:footer-md>
</footer>
<script type="text/javascript" src="/js/materialize.min.js"></script>
<script src="/js/scroll.js"></script>
<script type="text/javascript" src="/js/BarraLateralMovil.js"></script>
<script type="text/javascript" src="/js/validador.js"></script>

<script>
    var myWS = new WebSocket("ws://localhost:8080/chat/{22}");
    window.onbeforeunload = (() = > myWS.close()
    )
    ;
</script>

</body>
</html>
