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
<body class="blue lighten-3">


<md:sidenav-md name="${name}" type="${type}"></md:sidenav-md>

<header>
    <md:navbar-md name="${name}"></md:navbar-md>
</header>

<main>
    <p class="green">WS</p>
    <span style="display: block !important; width: 180px; text-align: center; font-family: sans-serif; font-size: 12px;"><a
            href="http://espanol.wunderground.com/cgi-bin/findweather/getForecast?query=zmw:00000.123.08286&bannertypeclick=wu_travel_jet3"
            title="Castellon de la Plana, Spain Weather Forecast" target="_blank"><img
            src="http://weathersticker.wunderground.com/weathersticker/cgi-bin/banner/ban/wxBanner?bannertype=wu_travel_jet3_metric&airportcode=LEBT&ForcedCity=Castellon de la Plana&ForcedState=Spain&wmo=08286&language=SP"
            alt="Find more about Weather in Castellon de la Plana, SP" width="160"/></a><br><a
            href="http://espanol.wunderground.com/cgi-bin/findweather/getForecast?query=zmw:00000.123.08286&bannertypeclick=wu_travel_jet3"
            title="Get latest Weather Forecast updates" style="font-family: sans-serif; font-size: 12px"
            target="_blank">Click for weather forecast</a></span>

</main>

<footer>
    <md:footer-md></md:footer-md>
</footer>
<script type="text/javascript" src="/js/materialize.min.js"></script>
<script src="/js/scroll.js"></script>
<script type="text/javascript" src="/js/BarraLateralMovil.js"></script>
<script type="text/javascript" src="/js/validador.js"></script>

<script>
    //TODO cuidado con la direccion del websocket, de localhost a skillshare
    //HAy una funcion setTimeout para enviar periodicamente mensajes
    //var ruta = window.location.host;
    var myWS = new WebSocket("ws://skillshare-uji.herokuapp.com/chat/{22}");
    myWS.onopen = (() = > console.log("Guei abierto")
    )
    ;
    window.onbeforeunload = (() = > myWS.close()
    )
    ;
    myWS.onclose = (() = > console.log("Guei cerrado")
    )
    ;
    myWS.onerror = (() = > console.log("Guei error")
    )
    ;
</script>

</body>
</html>
