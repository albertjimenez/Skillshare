<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 5/5/17
  Time: 14:01
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="md" tagdir="/WEB-INF/tags" %>

<html>
<head>
    <title>Listado de demandas</title>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="/css/materialize.min.css" media="screen,projection"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <%--Avisa al navegador de que el html es valido para moviles--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link type="text/css" rel="stylesheet" href="/css/font-google.css"/>
    <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
    <script src="/js/effect-text-3d.js"></script>
    <link rel="stylesheet" href="/css/aos.css">
    <link rel="stylesheet" href="/css/my-grid.css">
    <link rel="stylesheet" href="/css/animate.css">
    <link rel="stylesheet" href="/css/search.css">
    <style>
        body {
            background-image: url("/images/waveps3.jpg");
        }

    </style>
</head>
<body class="blue lighten-3">

<header>
    <md:navbar-md name="${name}"></md:navbar-md>
</header>


<md:sidenav-md name="${name}" type="${type}" cp="${cp}">
    <ul>
        <li>
            <a class="waves-effect" href="${pageContext.request.contextPath}/home/home_pc.html">Mi área</a>
        </li>
        <li>
            <a class="waves-effect" href="${pageContext.request.contextPath}/proposal/all.html">Ofertas de la
                comunidad</a>
        </li>
        <li>
            <a class="waves-effect" href="${pageContext.request.contextPath}/proposal/list.html">Mis Ofertas</a>
        </li>
        <li>
            <a class="waves-effect" href="${pageContext.request.contextPath}/request/list.html">Mis Peticiones</a>
        </li>

    </ul>
</md:sidenav-md>

<main class="container">

    <h4 class="center-align font-lobster text3d">Demandas disponibles</h4>
    <div class="fixed-action-btn horizontal">
        <a class="btn-floating btn-large blue">
            <i class="material-icons">menu</i>
        </a>
        <ul>
            <li><a class="btn-floating green" href="${pageContext.request.contextPath}/request/create.html">
                <i class="material-icons">playlist_add</i></a></li>
        </ul>
    </div>
    <%--<div class="col s12 m8 l9" style="height: 100%">--%>
    <c:if test="${empty requests}">
        <div class="valign-wrapper">
            <a class="valign white-text" style="font-size: 50px;text-align: center">
                <i class="material-icons valign" style="font-size: 200px; text-align: center">insert_invitation</i>
                <br>
                No hay demandas todavía, te sugerimos crear una :)</a>
        </div>
    </c:if>

    <c:if test="${not empty requests}">

        <%--<div class="wrap">--%>
        <%--<input type="text" class="live-search-box search" placeholder="Buscar ofertas" />--%>
        <%--</div>--%>
        <div id="search-wrapper">
            <input type="text" id="search" class="live-search-box" placeholder="Buscar ofertas"/>
            <div id="close-icon"></div>
        </div>


        <%--Boton fijo--%>
        <ul class="rig columns-3 live-search-list">
            <c:forEach items="${requests}" var="prop">
                <a href="${pageContext.request.contextPath}/request/detail/${prop.id}.html">
                    <li class="hoverable animated flipInY">
                        <img class="activator profile center-align circle" data-name=${prop.skillName}}">
                        <c:if test="${prop.level == 'A'}">
                            <h3 class="center-align">${prop.skillName} Avanzado</h3>
                        </c:if>
                        <c:if test="${prop.level == 'M'}">
                            <h3 class="center-align">${prop.skillName} Medio</h3>
                        </c:if>
                        <c:if test="${prop.level == 'N'}">
                            <h3 class="center-align">${prop.skillName} Novato</h3>
                        </c:if>
                        <p class="blue-grey-text darken-3"><strong>Descripción:</strong></p>
                        <p class="center-align blue-text">${prop.description}</p>
                        <p class="black-text"><strong>Inicio:</strong> ${prop.initialDate}</p>
                        <p class="black-text"><strong>Fin:</strong> ${prop.finishDate}</p>
                    </li>
                </a>

            </c:forEach>
        </ul>

    </c:if>
</main>

<md:footer-md></md:footer-md>


<script type="text/javascript" src="/js/materialize.min.js"></script>
<script type="text/javascript" src="/js/initial.min.js"></script>
<script>
    $('.profile').initial();
</script>
<%--Script de smooth scroll--%>
<script src="/js/scroll.js"></script>
<script src="/js/aos.js"></script>
<script src="/js/BarraLateralMovil.js"></script>
<script type="text/javascript" src="/js/search.js"></script>
<script>
    var myNif = "${student.nif}";
    //    var myWS = new WebSocket("ws://localhost:8080/notification/{" + myNif + "}");
    var myWS = new WebSocket("ws://skillshare-uji.herokuapp.com/notification/{" + myNif + "}");
    var myURL = "${pageContext.request.contextPath}/collaboration/";
    function myOpenF() {
        console.log("opened WS:");

    }
    function myClose() {
        myWS.close();
    }
    myWS.onopen = myOpenF;
    myWS.onclose = myClose;
    window.onbeforeunload = myClose;

    myWS.onmessage = function (e) {
        console.log("Received data" + e.data);
        var msg = JSON.parse(e.data);
        console.log(msg);
        if (myNif == msg.nif) {
            console.log("Es mi colaboración");
            if (msg.isProposalURL) {

                swal({
                    title: 'Una de tus propuestas ha sido atendida :)',
                    text: "¿Quieres ver los detalles?",
                    showCancelButton: true,
                    cancelButtonColor: '#d33',
                    cancelButtonText: 'Mejor no',
                    confirmButtonColor: '#3085d6',
                    confirmButtonText: '¡Sí, llévame a los detalles!',
                    imageUrl: "/images/handshakeicon.png"
                }).then(function () {
                    window.location.href = myURL + "prop/detail/" + msg.idProp + "/" + msg.idReq + ".html";
                });
            } else {
                swal({
                    title: 'Una de tus demandas ha sido atendida :)',
                    text: "¿Quieres ver los detalles?",
                    showCancelButton: true,
                    cancelButtonColor: '#d33',
                    cancelButtonText: 'Mejor no',
                    confirmButtonColor: '#3085d6',
                    confirmButtonText: '¡Sí, llévame a los detalles!',
                    imageUrl: "/images/handshakeicon.png"
                }).then(function () {
                    window.location.href = myURL + "req/detail/" + msg.idReq + "/" + msg.idProp + ".html";
                });
            }
        } else {
            console.log("En algun lugar en alguna parte, se ha producido una colaboración, pero no conmigo :(");
        }
    }

</script>
<script>
    AOS.init();
</script>


</body>
</html>
