<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 22/3/17
  Time: 2:09
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

    <title>Mis Ofertas</title>
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

<%--Inicio del navbar con movil--%>
<nav>
    <div class="navbar-fixed">

        <div class="nav-wrapper light-blue">
            <a class="brand-logo center" href="/">
                <img src="/images/icono_app.png"
                     class="responsive-img z-depth-2" alt="" width="40" height="40">
                Skillshare EI1027
            </a>
            <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons ">menu</i></a>
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
    </div>
</nav>

<div class="row">
    <%--Barra gris--%>
    <div class="col s3 blue-grey darken-1 z-depth-3" style="min-height:100%; min-width: 5%">

        <%--PANEL--%>
        <h3 class="black-text z-depth-1 btn-large red accent-2">PANEL
            <i class="material-icons">menu</i>
        </h3>
        <div class="col s10">
            <div class="card-panel">
                <h4 class="black-text font-raleway">
                    ${type} ${student.name} </h4>

                <div class="divider"></div>
                <ul>
                    <li>
                        <a href="../proposal/list.html">Mis Ofertas</a>
                    </li>
                </ul>
            </div>
            <a href="#modal-help" class="waves-effect waves-light btn btn-floating">
                <i class="material-icons">live_help</i>

            </a>
        </div>

    </div>
    <%--Fondo restante de la web sin panel--%>
    <div class="col s9 ">
        <h1 class="font-raleway">Mis ${count} ofertas</h1>
        <div class="divider"></div>


        <%--Boton material de crear oferta--%>
        <div class="fixed-action-btn horizontal">
            <a class="btn-floating btn-large blue">
                <i class="material-icons">menu</i>
            </a>
            <ul>
                <li><a class="btn-floating green" href="proposal/create.html">
                    <i class="material-icons">playlist_add</i></a></li>
            </ul>
        </div>


        <%--TODO comprobar que si no tiene ni request ni proposals salga el texto de no tiene na--%>
        <c:if test="${empty proposals}">
            <div class="valign-wrapper">
                <a class="valign" style="font-size: 50px;text-align: center">
                    <i class="material-icons valign" style="font-size: 200px; text-align: center">insert_invitation</i>
                    <br>
                    Esto está vacío... Prueba a empezar creando alguna oferta.</a>
            </div>
        </c:if>
        <c:if test="${not empty proposals}">
            <ul class="collapsible " data-collapsible="accordion">
                <c:forEach items="${proposals}" var="prop">

                    <li>
                        <div class="collapsible-header red lighten-3 z-depth-3">
                            <i class="material-icons">
                                touch_app</i>ID: ${prop.id} - Habilidad: ${prop.skillName} - Fecha
                            inicio: ${prop.initialDate}</div>
                        <div class="collapsible-body cyan lighten-4 hoverable">
                            <div class="row">
                                <div class="col s12">
                                    <p>Nivel: ${prop.level}</p>
                                    <p>Descripción: ${prop.description}</p>
                                    <p>Fecha fin: ${prop.finishDate}</p>
                                </div>
                            </div>
                                <%--Botonera dentro del cajon--%>
                            <div class="row">
                                <div class="col s6">
                                    <a class="waves-effect waves-light btn"
                                       href="proposal/update/${prop.id}.html">
                                        <i class="material-icons left ">mode_edit
                                        </i>Editar Oferta</a>
                                </div>
                                <div class="col s6">
                                    <a class="waves-effect waves-light btn"
                                       href="proposal/delete/${prop.id}.html">
                                        <i class="material-icons left">delete</i>
                                        Borrar Oferta</a>
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
                                    <li><a class="btn-floating red"
                                           href="proposal/delete/${prop.id}.html"><i
                                            class="material-icons">delete</i></a></li>
                                    <li><a class="btn-floating blue"
                                           href="proposal/update/${prop.id}.html">
                                        <i class="material-icons">mode_edit</i></a></li>
                                    <li><a class="btn-floating green" href="proposal/create.html">
                                        <i class="material-icons">playlist_add</i></a></li>
                                </ul>
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ul>

        </c:if>
    </div>


</div>


</div>


<%--Modal Ayuda--%>
<div class="modal" id="modal-help">
    <div class="modal-content cyan lighten-4 hoverable z-depth-5">
        <h5 class="font-raleway">Bienvenido</h5>
        <p>Hola ${name}, en el panel gris de tu izquierda encontrarás todas las
            herramientas de las que puedes hacer uso.</p>
        <p>¡Pásatelo genial aprendiendo y enseñado con el resto de la comunidad universitaria!</p>
    </div>
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
                </ul>
            </div>
        </div>
    </div>
    <div class="footer-copyright">
        <div class="container">
            © 2017 Copyright
            <a class="grey-text text-lighten-4 right" href="https://aulavirtual.uji.es/course/view.php?id=47728">Aula
                Virtual</a>
        </div>
    </div>
</footer>

<script type="text/javascript" src="/js/materialize.min.js"></script>
<script src="/js/scroll.js"></script>
<script type="text/javascript" src="/js/BarraLateralMovil.js"></script>

<%--<script>--%>
<%--$(document).ready(function () {--%>
<%--// the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered--%>
<%--$('.modal').modal();--%>
<%--});--%>
<%--</script>--%>

</body>
</html>
