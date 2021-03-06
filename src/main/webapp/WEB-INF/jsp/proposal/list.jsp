<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 22/3/17
  Time: 2:09
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="md" tagdir="/WEB-INF/tags" %>

<html>
<head>

    <title>Mis Ofertas</title>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="/css/materialize.min.css" media="screen,projection"/>
    <link type="text/css" rel="stylesheet" href="/css/font-google.css"/>
    <link rel="stylesheet" href="/css/aos.css">
    <link rel="stylesheet" href="/css/my-grid.css">
    <link rel="stylesheet" href="/css/animate.css">
    <link rel="stylesheet" href="/css/search.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <%--Avisa al navegador de que el html es valido para moviles--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="/css/my-backgrounds-opac.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/intro.js/2.5.0/introjs.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/intro.js/2.5.0/intro.min.js"></script>
    <script src="/js/effect-text-3d.js"></script>
    <script src="/js/jQuery.jPulse.min.js"></script>

    <style>
        body {
            background-image: url("/images/background-list-req.jpg");
        }

        main {
            opacity: 0.9;
        }
    </style>
</head>
<body class="blue lighten-3">

<%--Inicio del navbar con movil--%>
<header>
    <md:navbar-md name="${name}"></md:navbar-md>
</header>


<md:sidenav-md name="${name}" type="${type}" cp="${cp}">
    <ul>
        <li>
            <a class="waves-effect" href="${pageContext.request.contextPath}/proposal/list.html">Mis Ofertas</a>
        </li>
        <li>
            <a class="waves-effect" href="${pageContext.request.contextPath}/request/list.html">Mis Demandas</a>
        </li>
        <li>
            <a class="waves-effect" href="${pageContext.request.contextPath}/proposal/all.html">Ofertas de la
                comunidad</a>
        </li>
    </ul>
</md:sidenav-md>

<%--Fondo restante de la web sin panel--%>
<main class="container">
    <%--<div class="col s12 m8 l9" style="height: 100%">--%>
    <h4 class="font-lobster center-align text3d">Mis Ofertas</h4>

    <%--Boton material de crear oferta--%>
    <c:if test="${not empty tour2}">
        <div class="fixed-action-btn horizontal" id="tour2"
             data-intro='Este es el boton extra que muestra opciones adicionales para cada elemento.'
             data-position='top'>

            <a class="btn-floating btn-large red">
                <i class="material-icons">menu</i>
            </a>
            <ul>
                <li><a class="btn-floating green" href="${pageContext.request.contextPath}/proposal/create.html">
                    <i class="material-icons">playlist_add</i></a></li>
            </ul>
        </div>

        <script>
            $(".btn-large").jPulse({
                color: "#00ACED",
                size: 150,
                speed: 700,
                interval: 440,
                left: 20,
                top: -20,
                zIndex: -1
            });
        </script>
    </c:if>

    <c:if test="${empty tour2}">
        <div class="fixed-action-btn horizontal">

            <a class="btn-floating btn-large red">
                <i class="material-icons">menu</i>
            </a>
            <ul>
                <li><a class="btn-floating green" href="${pageContext.request.contextPath}/proposal/create.html">
                    <i class="material-icons">playlist_add</i></a></li>
            </ul>
        </div>
    </c:if>

    <c:if test="${empty proposals}">
        <div class="valign-wrapper">
            <a class="valign white-text" style="font-size: 50px;text-align: center">
                <i class="material-icons valign" style="font-size: 200px; text-align: center">insert_invitation</i>
                <br>
                Esto está vacío... Prueba a empezar creando alguna oferta.</a>
        </div>
    </c:if>
    <c:if test="${not empty proposals}">

        <div id="search-wrapper">
            <input type="text" id="search" class="live-search-box" placeholder="Buscar ofertas"/>
            <div id="close-icon"></div>
        </div>


        <ul class="rig columns-3 live-search-list">
            <c:forEach items="${proposals}" var="prop">
                <a href="${pageContext.request.contextPath}/proposal/detail/${prop.id}.html">
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
                        <p class="blue-text">${prop.description}</p>
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
<script src="/js/scroll.js"></script>
<script type="text/javascript" src="/js/BarraLateralMovil.js"></script>
<script type="text/javascript" src="/js/search.js"></script>

<script>
    $(document).ready(function () {
        $('select').material_select();
    });
</script>
<script type="text/javascript" src="/js/initial.min.js"></script>
<script>
    $('.profile').initial();
</script>
<script>
    AOS.init();
</script>
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
    introJs().start();
</script>
</body>
</html>
