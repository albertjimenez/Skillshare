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

    <title>Mis Colaboraciones</title>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.4/sweetalert2.min.js"></script>
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.4/sweetalert2.min.css">

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
    <h4 class="font-lobster center-align text3d">Mis Colaboraciones</h4>


    <div id="search-wrapper">
        <input type="text" id="search" class="live-search-box" placeholder="Buscar colaboraciones"/>
        <div id="close-icon"></div>
    </div>
    <c:if test="${not empty collaborationsProposal}">

        <h4 class="text3d center-align">Colaboraciones a partir de ofertas</h4>
        <ul class="rig columns-3 live-search-list">
            <c:forEach items="${collaborationsProposal}" var="prop">
                <a href="${pageContext.request.contextPath}/collaboration/prop/detail/${prop.left.idProposal}/${prop.left.idRequest}.html">
                    <li class="hoverable animated flipInY">
                        <img class="activator profile center-align circle" data-name=${prop.right.skillName}>
                        <c:if test="${prop.right.level == 'A'}">
                            <h3 class="center-align">${prop.right.skillName} Avanzado</h3>
                        </c:if>
                        <c:if test="${prop.right.level == 'M'}">
                            <h3 class="center-align">${prop.right.skillName} Medio</h3>
                        </c:if>
                        <c:if test="${prop.right.level == 'N'}">
                            <h3 class="center-align">${prop.right.skillName} Novato</h3>
                        </c:if>
                        <p class="black-text">Horas: ${prop.left.hours}</p>
                        <p class="black-text">Fecha inicio: ${prop.right.initialDate}</p>
                        <p class="black-text">Fecha fin: ${prop.right.finishDate}</p>
                        <c:if test="${empty prop.left.rating}">
                            <p class="red-text">No hay valoración todavía</p>
                        </c:if>
                        <p class="blue-text center-align"><strong>Click para más detalles</strong></p>
                    </li>
                </a>
            </c:forEach>
        </ul>


    </c:if>

    <c:if test="${not empty collaborationsRequest}">
        <h4 class="text3d center-align">Colaboraciones a partir de demandas</h4>
        <ul class="rig columns-3 live-search-list">
            <c:forEach items="${collaborationsRequest}" var="collabReq">
                <a href="${pageContext.request.contextPath}/collaboration/req/detail/${collabReq.left.idProposal}/${collabReq.left.idRequest}.html">
                    <li class="hoverable animated flipInY">
                        <img class="activator profile center-align circle" data-name=${collabReq.right.skillName}h>
                        <c:if test="${collabReq.right.level == 'A'}">
                            <h3 class="center-align">${collabReq.right.skillName} Avanzado</h3>
                        </c:if>
                        <c:if test="${collabReq.right.level == 'M'}">
                            <h3 class="center-align">${collabReq.right.skillName} Medio</h3>
                        </c:if>
                        <c:if test="${collabReq.right.level == 'N'}">
                            <h3 class="center-align">${collabReq.right.skillName} Novato</h3>
                        </c:if>
                        <p class="black-text">Horas: ${collabReq.left.hours}</p>
                        <p class="black-text">Fecha inicio: ${collabReq.right.initialDate}</p>
                        <p class="black-text">Fecha fin: ${collabReq.right.finishDate}</p>
                        <c:if test="${empty collabReq.left.rating}">
                            <p class="red-text">No hay valoración todavía</p>
                        </c:if>
                        <p class="blue-text center-align"><strong>Click para más detalles</strong></p>
                    </li>
                </a>
            </c:forEach>
        </ul>
    </c:if>

    <c:if test="${ empty collaborationsProposal}">

        <c:if test="${ empty collaborationsRequest}">
            <div class="valign-wrapper">
                <a class="valign" style="font-size: 50px;text-align: center">
                    <i class="material-icons valign" style="font-size: 200px; text-align: center">insert_invitation</i>
                    <br>
                    Esto está vacío... Prueba creando colaborando con alguna oferta o demanda.</a>
            </div>
        </c:if>
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
    $('.profile').initial({
        charCount: 1
    });
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
