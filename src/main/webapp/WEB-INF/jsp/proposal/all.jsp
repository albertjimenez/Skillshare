<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 5/5/17
  Time: 14:01
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="md" tagdir="/WEB-INF/tags" %>

<html>
<head>
    <title>Listado de propuestas</title>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="/css/materialize.min.css" media="screen,projection"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <%--Avisa al navegador de que el html es valido para moviles--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link type="text/css" rel="stylesheet" href="/css/font-google.css"/>
    <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
    <link rel="stylesheet" href="/css/aos.css">
    <link rel="stylesheet" href="/css/grid.css">

</head>
<body class="blue lighten-3">

<header>
    <md:navbar-md name="${name}"></md:navbar-md>
</header>


<md:sidenav-md name="${name}" type="${type}">
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
    <div class="fixed-action-btn horizontal">
        <a class="btn-floating btn-large blue">
            <i class="material-icons">menu</i>
        </a>
        <ul>
            <li><a class="btn-floating green" href="#modal1">
                <i class="material-icons">playlist_add</i></a></li>
        </ul>
    </div>
    <%--<div class="col s12 m8 l9" style="height: 100%">--%>
    <c:if test="${empty proposals}">
        <div class="valign-wrapper">
            <a class="valign" style="font-size: 50px;text-align: center">
                <i class="material-icons valign" style="font-size: 200px; text-align: center">insert_invitation</i>
                <br>
                No hay propuestas todavía, te sugerimos crear una :)</a>
        </div>
    </c:if>

    <c:if test="${not empty proposals}">

        <%--Boton fijo--%>

        <c:forEach items="${proposals}" var="prop">

            <%--<div class="row">--%>
            <%--<div class="col s12 m6">--%>
            <%--<div class="card">--%>
            <%--<div class="card-image">--%>
            <%--<img src="/images/wall-card.jpg">--%>
            <%--<span class="card-title">${prop.skillName} ${prop.level}</span>--%>
            <%--<a class="btn-floating halfway-fab waves-effect waves-light red"><i class="material-icons">submit</i></a>--%>
            <%--</div>--%>
            <%--<div class="card-content">--%>
            <%--<p>${prop.initialDate}</p>--%>
            <%--<p>${prop.description}</p>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</div> --%>
            <div class="row grid" data-size="${count}">
                <div class="col s12 m10 l12">
                    <div class="card medium" data-aos="flip-up">
                        <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator profile" data-name=${prop.skillName}}" width="100">
                        </div>
                        <div class="card-content">
                <span class="card-title activator grey-text text-darken-4">${prop.skillName} - ${prop.level}
                    <i class="material-icons right">more_vert</i></span>
                            <p><a href="#">Colaborar</a></p>
                            <p><a href="#">Visitar colaborador</a></p>
                        </div>
                        <div class="card-reveal">
                            <span class="card-title grey-text text-darken-4">${prop.skillName} - ${prop.level}<i
                                    class="material-icons right">close</i></span>
                            <p>${prop.initialDate}</p>
                            <p>${prop.description}</p>
                        </div>
                    </div>
                </div>
            </div>

        </c:forEach>


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

<script>
    AOS.init();
</script>
</body>
</html>
