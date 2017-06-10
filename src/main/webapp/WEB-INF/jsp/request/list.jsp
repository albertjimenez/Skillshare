<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 29/4/17
  Time: 1:58
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="md" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <title>Mis peticiones</title>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="/css/materialize.min.css" media="screen,projection"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <%--Avisa al navegador de que el html es valido para moviles--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link type="text/css" rel="stylesheet" href="/css/font-google.css"/>
    <link rel="stylesheet" href="/css/aos.css">
    <link rel="stylesheet" href="/css/my-grid.css">
    <link rel="stylesheet" href="/css/animate.css">
    <link rel="stylesheet" href="/css/search.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="/js/effect-text-3d.js"></script>
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/intro.js/2.5.0/introjs.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/intro.js/2.5.0/intro.min.js"></script>
    <script src="/js/jQuery.jPulse.min.js"></script>
    <style>
        body {
            background-image: url("/images/background-list-req.jpg");
        }

        main {
            /*opacity: 0.8;*/
        }
    </style>
</head>
<body class="blue lighten-3">


<header>
    <md:navbar-md name="${name}"></md:navbar-md>
</header>

<md:sidenav-md name="${name}" type="${type}" cp="${cp}">
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


</md:sidenav-md>

<main class="container">
    <h4 class="font-lobster center-align text3d">Mis Peticiones</h4>


    <c:if test="${empty requests}">
        <div class="valign-wrapper">
            <a class="valign" style="font-size: 50px;text-align: center">
                <i class="material-icons valign" style="font-size: 200px; text-align: center">insert_invitation</i>
                <br>
                Esto está vacío... Prueba creando alguna petición.</a>
        </div>

        <%--Boton material de crear solicitud--%>
        <div class="fixed-action-btn horizontal"
             data-intro='Este es el boton extra que muestra opciones adicionales para cada elemento.'
             data-position='top'>
            <a class="btn-floating btn-large red">
                <i class="material-icons" id="myButton">menu</i>
            </a>
            <ul>
                <li><a class="btn-floating green" href="${pageContext.request.contextPath}/request/create.html">
                    <i class="material-icons">playlist_add</i></a></li>
            </ul>
        </div>


        <script>
            $("#myButton").jPulse({
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
    <c:if test="${not empty requests}">

        <div class="fixed-action-btn horizontal">
            <a class="btn-floating btn-large red">
                <i class="material-icons">menu</i>
            </a>
            <ul>
                <li><a class="btn-floating green" href="${pageContext.request.contextPath}/request/create.html">
                    <i class="material-icons">playlist_add</i></a></li>
            </ul>
        </div>

        <div id="search-wrapper">
            <input type="text" id="search" class="live-search-box" placeholder="Buscar peticiones"/>
            <div id="close-icon"></div>
        </div>


        <ul class="rig columns-3 live-search-list">
            <c:forEach items="${requests}" var="collab">
                <a href="${pageContext.request.contextPath}/request/detail/${collab.id}.html">
                    <li class="hoverable animated flipInY">
                        <img class="activator profile center-align circle" data-name=${collab.skillName}}">
                        <c:if test="${collab.level == 'A'}">
                            <h3 class="center-align">${collab.skillName} Avanzado</h3>
                        </c:if>
                        <c:if test="${collab.level == 'M'}">
                            <h3 class="center-align">${collab.skillName} Medio</h3>
                        </c:if>
                        <c:if test="${collab.level == 'N'}">
                            <h3 class="center-align">${collab.skillName} Novato</h3>
                        </c:if>
                        <p>Descripción:</p>
                        <p class="center-align">${collab.description}</p>
                        <p class="">Inicio: ${collab.initialDate}</p>
                        <p class="">Fin: ${collab.finishDate}</p>

                    </li>
                </a>
                <%--<a class="waves-effect waves-light btn"--%>
                <%--href="${pageContext.request.contextPath}/proposal/update/${req.id}.html">--%>
                <%--<i class="material-icons left ">mode_edit--%>
                <%--</i>Editar Oferta</a>--%>
                <%--<a class="waves-effect waves-light btn"--%>
                <%--href="${pageContext.request.contextPath}/proposal/delete/${req.id}.html">--%>
                <%--<i class="material-icons left">delete</i>--%>
                <%--Borrar Oferta</a>--%>

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
    AOS.init();

</script>

<script>
    introJs().start();
</script>

</body>
</html>
