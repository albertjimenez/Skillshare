<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 8/6/17
  Time: 2:02
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="md" tagdir="/WEB-INF/tags" %>

<html>
<head>
    <title>Detalles de la colaboración</title>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="/css/materialize.min.css" media="screen,projection"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <%--Avisa al navegador de que el html es valido para moviles--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link type="text/css" rel="stylesheet" href="/css/font-google.css"/>
    <link rel="stylesheet" href="/css/animate.css">
    <link rel="stylesheet" href="/css/my-backgrounds-opac.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.4/sweetalert2.min.js"></script>
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.4/sweetalert2.min.css">
    <script src="/js/effect-text-3d.js"></script>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/fontawesome-stars.css">

    <style>
        main {
            opacity: 0.9;
        }

        body {
            background-image: url("/images/detail.jpg");
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

    <h2 class="center-align font-lobster text3d">
        Colaboración </h2>
    <div class="animated zoomInRight z-depth-3 hoverable" style="border-radius: 25px">
        <div class="card blue">
            <%--<div class="card-image">--%>
            <%--<img class="activator profile center-align circle" data-name=${proposal.skillName}}">--%>
            <%--</div>--%>
            <div class="card-content white-text">
                En la pestaña de <strong>Colaboración</strong>, encontrarás más detalles de la colaboración.
                En la pestaña de <strong>Solicitud</strong>, encontrarás los detalles de la solicitud que aceptaste.
                En la pestaña de <strong>Estudiante</strong> encontrarás la información del estudiante así como sus
                datos de contacto.
            </div>
            <div class="card-tabs ">
                <ul class="tabs tabs-fixed-width tabs-transparent ">
                    <li class="tab"><a class="active" href="#test5">Colaboración</a></li>
                    <li class="tab"><a href="#test6">Solicitud</a></li>
                    <li class="tab"><a href="#test4">Estudiante</a></li>
                </ul>
            </div>
            <div class="card-content blue lighten-4">
                <%--Seccion Colaboración--%>
                <div id="test5" class="blue lighten-4">
                    Horas: <input value="${collaboration.hours}" disabled="true">
                    <p>Valoración de la colaboración:</p>
                    <form:form modelAttribute="collaboration" id="myForm">
                        <form:select path="rating" id="example-square" name="rating" autocomplete="off">
                            <option value=""></option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </form:select>
                        <c:if test="${collaboration.rating == 0}">
                            <script type="text/javascript">
                                $(function () {
                                    $('#example-square').barrating({
                                        theme: 'fontawesome-stars'
                                    });

                                });
                            </script>
                            <a class="btn waves-effect waves-light" id="accept">Valorar
                                <i class="material-icons right">send</i>
                            </a>
                        </c:if>
                        <c:if test="${collaboration.rating != 0}">
                            <script type="text/javascript">
                                $(function () {
                                    var rate = ${collaboration.rating};
                                    var rateNumber = Number(rate);
                                    $('#example-square').barrating({
                                        theme: 'fontawesome-stars',
                                        initialRating: rateNumber,
                                        hoverState: false,
                                        readonly: true
                                    });

                                });
                            </script>
                        </c:if>

                    </form:form>
                </div>
                <%--Seccion Solicitud--%>
                <div id="test6" class="blue lighten-4">
                    Nombre de la habilidad: <input value="${request.skillName}" disabled="true">
                    Nivel: <input value="${level}" disabled="true">
                    Fecha de Inicio: <input value="${request.initialDate}" disabled="true">
                    Fecha de Fin: <input value="${request.finishDate}" disabled="true">
                    Descripción: <input value="${request.description}" disabled="true">
                </div>
                <%--Seccion estudiante--%>
                <div id="test4" class="blue lighten-4">
                    Nombre: <input value="${student_request.name}" disabled="true">
                    Apellidos: <input value="${student_request.surname}" disabled="true">
                    Estudios: <input value="${student_request.degree}" disabled="true">
                    Curso: <input value="${student_request.course}" disabled="true">

                    <p>Contacto:</p>
                    <a href="mailto:${student_request.email}"><i class="material-icons">email</i>
                        Correo UJI</a>
                </div>
            </div>
        </div>
    </div>

</main>

<md:footer-md></md:footer-md>


<script type="text/javascript" src="/js/materialize.min.js"></script>
<script type="text/javascript" src="/js/initial.min.js"></script>
<script type="text/javascript" src="/js/jquery.barrating.min.js"></script>

<script>
    $('.profile').initial();
</script>
<script>
    $('#accept').click(function () {
        swal({
            title: '¿Quieres realizar la valoración?',
            text: "Recuerda que será visible solo para ti y para el estudiante. Sé sincero.",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '¡Sí, realiza la valoración!',
            cancelButtonText: 'Cancelar'
        }).then(function () {
            swal(
                'Valoración realizada',
                'Estamos recargando la página...',
                'success'
            );
            $('#myForm').trigger('submit');
        });
    });
</script>
<script>
    $(document).ready(function () {
//        $('select').materAial_select();
    });
</script>
<%--Script de smooth scroll--%>
<script src="/js/BarraLateralMovil.js"></script>
</body>
</html>

