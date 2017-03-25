
<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 20/3/17
  Time: 1:49
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Home Promotor de colaboraciones</title>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="/css/materialize.min.css" media="screen,projection"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <%--Avisa al navegador de que el html es valido para moviles--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<%--<style>--%>
<%--header, main, footer {--%>
<%--padding-left: 300px;--%>
<%--}--%>

<%--@media only screen and (max-width : 992px) {--%>
<%--header, main, footer {--%>
<%--padding-left: 0;--%>
<%--}--%>
<%--}--%>

<%--</style>--%>
<body class="blue lighten-3">
<%--Inicio del navbar con movil--%>
<div class="navbar-fixed">
    <nav>
        <div class="nav-wrapper light-blue">
            <a class="brand-logo center" href="/">
                <img src="/images/icono_app.png"
                     class="responsive-img z-depth-2" alt="" width="40" height="40">
                Skillshare EI1027
            </a>
            <a href="#" data-activates="mobile-demo" class="button-collapse">
                <%--<i class="material-icons large">menu</i>--%>
                <i class="z-depth-1-half">PANEL</i>
            </a>
            <%--Esto es la cabecera de arriba--%>
            <ul class="right hide-on-med-and-down">
                <li><a href="/">Inicio</a></li>
                <li><a href="../login/logout.html">Cerrar sesión</a></li>
            </ul>
            <%--Esto es la cabecera movil--%>
            <ul class="side-nav" id="mobile-demo">
                <li><a href="../login/logout.html">Cerrar sesión</a></li>
            </ul>
        </div>
    </nav>
</div>
<div class="row">
    <%--Barra gris--%>
    <div class="col s3 blue-grey darken-1 z-depth-3" style="min-height:100%; min-width: 5%">

        <%--PANEL--%>
        <ul id="slide-out" class="side-nav">
            <li><a href="#!">First Sidebar Link</a></li>

        </ul>
        <a href="#" data-activates="slide-out" class="button-collapse" data-toggle="fullscreen">

            <h3 class="black-text z-depth-1 btn-large red accent-2">PANEL
                <i class="material-icons">menu</i>
            </h3>
        </a>
        <div class="col s10">
            <div class="card-panel red accent-2">
          <span class="white-text">
          El botón de <i><strong>Panel</strong></i> expande el panel para poder controlar y mostrar más
              información que la que se muestra. <br>
          </span>
                <span class="white-text">
                    Cuando haces clic en una habilidad puedes editarla con el botón flotante que aparece
                abajo a la izquierda. En él se desplega el subbotón editar, eliminar y crear.</span>
            </div>
        </div>

    </div>
    <div class="col s9 ">
        <div class="fixed-action-btn horizontal">
            <a class="btn-floating btn-large blue">
                <i class="material-icons">menu</i>
            </a>
            <ul>
                <li><a class="btn-floating green" href="skill/create.html">
                    <i class="material-icons">playlist_add</i></a></li>
            </ul>
        </div>
        <ul class="collapsible " data-collapsible="accordion">
            <c:forEach items="${skills}" var="sk">
                <li>
                    <div class="collapsible-header red lighten-3 z-depth-3">
                        <i class="material-icons">
                            touch_app</i>#${sk.name} #${sk.level}</div>
                    <div class="collapsible-body cyan lighten-4 hoverable">
                        <div class="row">
                            <div class="col s12">
                        <span>${sk.description}</span>
                            </div>
                        </div>
                            <%--Botonera dentro del cajon--%>
                        <div class="row">
                            <div class="col s6">
                                <a class="waves-effect waves-light btn" href="skill/update/${sk.name}/${sk.level}.html">
                                    <i class="material-icons left ">mode_edit
                                    </i>Editar habilidad</a>
                            </div>
                            <div class="col s6">
                                <a class="waves-effect waves-light btn" href="skill/delete/${sk.name}/${sk.level}.html">
                                    <i class="material-icons left">delete</i>
                                    Borrar habilidad</a>
                            </div>
                        </div>
                            <%--Botonera fija en la parte inferior derecha--%>
                            <%--Button Material--%>
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
                    </div>
                </li>
            </c:forEach>
        </ul>

    </div>


</div>
<footer class="page-footer light-blue">
    <div class="container">
        <div class="row">
            <div class="col l6 s12">
                <h5 class="white-text">Skillshare Project</h5>
                <p class="grey-text text-lighten-4">Elaborado con Spring MVC y Materialize.</p>
            </div>
            <div class="col l4 offset-l2 s12">
                <h5 class="white-text">Enlaces</h5>
                <ul>
                    <li><a class="grey-text text-lighten-3" href="login/login.html">Iniciar Sesión</a></li>
                    <li><a class="grey-text text-lighten-3" href="register/register.html">Regístrate</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="footer-copyright">
        <div class="container">
            © 2017 Copyright
            <a class="grey-text text-lighten-4 right" href="https://aulavirtual.uji.es/course/view.php?id=47728">Aula
                Virtual EI1027</a>
        </div>
    </div>
</footer>


<script type="text/javascript" src="/js/materialize.min.js"></script>
<script src="/js/scroll.js"></script>
<script type="text/javascript" src="/js/BarraLateralMovil.js"></script>
<script>
    $(document).ready(function () {
        $('select').material_select();
    });
</script>
</body>
</html>
