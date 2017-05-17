
<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 20/3/17
  Time: 1:49
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="md" tagdir="/WEB-INF/tags" %>

<html>
<head>
    <title>Home Promotor de colaboraciones</title>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="/css/materialize.min.css" media="screen,projection"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <%--Avisa al navegador de que el html es valido para moviles--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link type="text/css" rel="stylesheet" href="/css/font-google.css"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>

    <style>
        body {
            background-image: url("/images/pc-wallpaper.jpg");
        }

        main {
            opacity: 0.9;
        }
    </style>
</head>

<body>
<%--Inicio del navbar con movil--%>

<header>
    <md:navbar-md name="${name}"></md:navbar-md>
</header>
    <%--Barra gris--%>

<%--TODO meter todo en <li>--%>
<md:sidenav-md name="${name}" type="${type}">

    <li>
        <a class="waves-effect" href="${pageContext.request.contextPath}/home/home_pc.html">Colección de Habilidades</a>
    </li>
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
    <li><a class="subheader">Promotor de colaboraciones</a></li>
    <%--<li>--%>
    <%--<a class="waves-effect" href="${pageContext.request.contextPath}/banned/ban.html">--%>
    <%--<i class="material-icons">warning</i>Lista de baneados</a>--%>
    <%--</li>--%>
</md:sidenav-md>

<main class="container">
    <h4 class="font-lobster center-align">Colección de habilidades</h4>
        <div class="fixed-action-btn horizontal">
            <a class="btn-floating btn-large red">
                <i class="material-icons">menu</i>
            </a>
            <ul>
                <li><a class="btn-floating green" href="skill/create.html">
                    <i class="material-icons">playlist_add</i></a></li>
            </ul>
        </div>
    <ul class="collapsible popout " data-collapsible="accordion">
            <c:forEach items="${skills}" var="sk">

                <md:desplegable-md name="${sk.name}" name2="${sk.level}">
                    <table class="highlight bordered font-raleway">
                        <tr>
                            <td>DESCRIPCIÓN:</td>
                            <td>
                                <span class="font">${sk.description}</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a class="waves-effect waves-light btn" href="skill/update/${sk.name}/${sk.level}.html">
                                    <i class="material-icons left ">mode_edit
                                    </i>Editar habilidad</a>
                            </td>
                            <td>
                                <a class="waves-effect waves-light btn" href="skill/delete/${sk.name}/${sk.level}.html">
                                    <i class="material-icons left">delete</i>
                                    Borrar habilidad</a>
                            </td>
                        </tr>
                    </table>

                    <div class="fixed-action-btn">
                        <a class="btn-floating btn-large red">
                            <i class="large material-icons">mode_edit</i>
                        </a>

                            <%--SUBButtons--%>
                        <ul>
                            <li><a class="btn-floating red" href="skill/delete/${sk.name}/${sk.level}.html"><i
                                    class="material-icons">delete</i></a></li>
                            <li><a class="btn-floating blue" href="skill/update/${sk.name}/${sk.level}.html">
                                <i class="material-icons">mode_edit</i></a></li>
                            <li><a class="btn-floating green" href="skill/create.html">
                                <i class="material-icons">playlist_add</i></a></li>
                        </ul>
                    </div>
                </md:desplegable-md>


            </c:forEach>
        </ul>
</main>
<%--</div>--%>


<md:footer-md></md:footer-md>

<script type="text/javascript" src="/js/materialize.min.js"></script>
<script src="/js/scroll.js"></script>
<script type="text/javascript" src="/js/BarraLateralMovil.js"></script>
<script type="text/javascript" src="/js/mytoast.js"></script>
<script>
    $(document).ready(function () {
        $('select').material_select();
    });
</script>
<script>
    $(document).ready(function () {
        var suc = '${success}';
        console.log(suc);
        if (suc != null && suc.length > 0) {
            mytoast(suc);
        }
    });
</script>
<script type="text/javascript" src="/js/initial.min.js"></script>
<script>
    $('.profile').initial({height:46,width:46,fontSize:20,fontWeight:700});
</script>
<script>
    function showSideNav() {
        $('.button-collapse').sideNav('show');
    }
    window.onload = showSideNav;
</script>
</body>
</html>
