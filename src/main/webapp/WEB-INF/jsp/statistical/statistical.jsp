<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 10/6/17
  Time: 0:39
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="md" tagdir="/WEB-INF/tags" %>

<html>
<head>
    <title>Estadísticas de Skillshare</title>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="/css/materialize.min.css" media="screen,projection"/>
    <link type="text/css" rel="stylesheet" href="/css/font-google.css"/>
    <link rel="stylesheet" href="/css/animate.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <%--Avisa al navegador de que el html es valido para moviles--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="/css/aos.css">
    <script src="/js/aos.js"></script>
    <script src="/js/effect-text-3d.js"></script>
    <script type="text/javascript" src="/js/fusioncharts.js"></script>

    <style>
        body {
            background-image: url("/images/stats-wpp.jpg");
        }
    </style>
</head>
<body class="blue lighten-3">


<%--Inicio del navbar con movil--%>
<header>
    <md:navbar-md name="${name}"></md:navbar-md>
</header>

<%--<div class="row">--%>
<%--Barra gris--%>


<md:sidenav-md name="${name}" type="${type}" cp="${cp}">
    <ul>
        <li>
            <a class="waves-effect" href="${pageContext.request.contextPath}/proposal/list.html">Mis Ofertas</a>
        </li>
        <li>
            <a class="waves-effect" href="${pageContext.request.contextPath}/proposal/all.html">Ofertas de la
                comunidad</a>
        </li>
        <li>
            <a class="waves-effect" href="${pageContext.request.contextPath}/request/list.html">Mis Peticiones</a>
        </li>
    </ul>
</md:sidenav-md>

<main class="container">
    <h2 class="font-lobster center-align text3d">Informes estadísticos</h2>
    <div class="divider"></div>

    <div class="center-align">
        <h4 class="font-lobster blue-text">Estadísticas de colaboraciones</h4>
        <br>
        <div id="chart-container" class="animated bounceInLeft">Aquí se mostrará la gráfica de datos...</div>
        <br>
        <h4 class="font-lobster blue-text">Estadísticas de las habilidades más demandadas</h4>
        <br>
        <div id="chart-container2" class="animated bounceInRight">Aquí se mostrará la gráfica de datos...</div>
        <br>
        <h4 class="font-lobster blue-text">Estadísticas de los grados más colaboradores</h4>
        <br>
        <div id="chart-container3" class="animated bounceInLeft">Aquí se mostrará la gráfica de datos...</div>
    </div>
</main>


<md:footer-md></md:footer-md>
<script type="text/javascript" src="/js/materialize.min.js"></script>
<script src="/js/scroll.js"></script>
<script type="text/javascript" src="/js/BarraLateralMovil.js"></script>

<script>
    FusionCharts.ready(function () {
        var l = ${plotCollaborations};
        var revenueChart = new FusionCharts({
            type: 'column3d',
            renderAt: 'chart-container',
            width: "60%",
            height: "60%",
            useRoundEdges: 1,
            dataFormat: 'json',
            dataSource: {
                "chart": {
                    "caption": "Estadísticas de colaboración",
                    "subCaption": "junto a ofertas y demandas",
                    "paletteColors": "#0075c2,#1aaf5d,#f2c500,#f45b00,#8e0000",
                    "bgColor": "EEEEEE,CCCCCC",
                    //opaqueness of each color
                    "bgAlpha": "70,80",
                    "bgRatio": "60, 40",
                    "canvasBgAlpha": "0",
                    "exportEnabled": "1",
                    "showBorder": "0",
                    "use3DLighting": "1",
                    "showShadow": "1",
                    "enableSmartLabels": "0",
                    "startingAngle": "310",
                    "showLabels": "1",
                    "showPercentValues": "1",
//                    "showLegend": "1",
                    "legendShadow": "0",
                    "legendBorderAlpha": "0",
                    "decimals": "0",
                    "captionFontSize": "14",
                    "subcaptionFontSize": "14",
                    "subcaptionFontBold": "0",
                    "toolTipColor": "#ffffff",
                    "toolTipBorderThickness": "0",
                    "toolTipBgColor": "#000000",
                    "toolTipBgAlpha": "80",
                    "toolTipBorderRadius": "2",
                    "toolTipPadding": "5",
                    "useRoundEdges": "1",
                },
                "data": l
            }
        }).render();
    });
</script>
<script>
    FusionCharts.ready(function () {
        var l = ${plotMostSkills};
        var revenueChart = new FusionCharts({
            type: 'column3d',
            renderAt: 'chart-container2',
            width: "60%",
            height: "60%",
            dataFormat: 'json',
            dataSource: {
                "chart": {
                    "caption": "Habilidades más demandadas",
                    "paletteColors": "#0075c2,#1aaf5d,#f2c500,#f45b00,#8e0000",
                    "bgColor": "EEEEEE,CCCCCC",
                    //opaqueness of each color
                    "bgAlpha": "70,80",
                    "bgRatio": "60, 40",
                    "canvasBgAlpha": "0",
                    "exportEnabled": "1",
                    "showBorder": "0",
                    "use3DLighting": "1",
                    "showShadow": "1",
                    "enableSmartLabels": "0",
                    "startingAngle": "310",
                    "showLabels": "1",
                    "showPercentValues": "1",
//                    "showLegend": "1",
                    "legendShadow": "0",
                    "legendBorderAlpha": "0",
                    "decimals": "0",
                    "captionFontSize": "14",
                    "subcaptionFontSize": "14",
                    "subcaptionFontBold": "0",
                    "toolTipColor": "#ffffff",
                    "toolTipBorderThickness": "0",
                    "toolTipBgColor": "#000000",
                    "toolTipBgAlpha": "80",
                    "toolTipBorderRadius": "2",
                    "toolTipPadding": "5",
                    "useRoundEdges": "1",
                },
                "data": l
            }
        }).render();
    });
</script>
<script>
    FusionCharts.ready(function () {
        var l = ${degreesMoreCollaborative};
        var revenueChart = new FusionCharts({
            type: 'column3d',
            renderAt: 'chart-container3',
            width: "60%",
            height: "60%",
            dataFormat: 'json',
            dataSource: {
                "chart": {
                    "caption": "Grados más colaboradores",
                    "paletteColors": "#0075c2,#1aaf5d,#f2c500,#f45b00,#8e0000",
                    "bgColor": "EEEEEE,CCCCCC",
                    //opaqueness of each color
                    "bgAlpha": "70,80",
                    "bgRatio": "60, 40",
                    "canvasBgAlpha": "0",
                    "exportEnabled": "1",
                    "showBorder": "0",
                    "use3DLighting": "1",
                    "showShadow": "1",
                    "enableSmartLabels": "0",
                    "startingAngle": "310",
                    "showLabels": "1",
                    "showPercentValues": "1",
//                    "showLegend": "1",
                    "legendShadow": "0",
                    "legendBorderAlpha": "0",
                    "decimals": "0",
                    "captionFontSize": "14",
                    "subcaptionFontSize": "14",
                    "subcaptionFontBold": "0",
                    "toolTipColor": "#ffffff",
                    "toolTipBorderThickness": "0",
                    "toolTipBgColor": "#000000",
                    "toolTipBgAlpha": "80",
                    "toolTipBorderRadius": "2",
                    "toolTipPadding": "5",
                    "useRoundEdges": "1",
                },
                "data": l
            }
        }).render();
    });
</script>
</body>
</html>
