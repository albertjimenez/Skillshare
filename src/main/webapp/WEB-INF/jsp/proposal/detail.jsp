<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 28/5/17
  Time: 21:47
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="md" tagdir="/WEB-INF/tags" %>

<html>
<head>
    <title>Detalles de la propuesta</title>
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
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
    <script src="/js/effect-text-3d.js"></script>
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

<c:if test="${not empty duplicated}">
    <script>
        toastr.error('Colaboración repetida');
    </script>
</c:if>
<c:if test="${not empty correct}">
    <script>
        toastr.success('Colaboración creada');
    </script>
</c:if>

<main class="container">

    <h2 class="center-align font-lobster text3d">Oferta - ${proposal.skillName} | ${proposal.level}  </h2>
    <div class="animated zoomInRight z-depth-3 hoverable" style="border-radius: 25px">
        <div class="card blue">
            <%--<div class="card-image">--%>
            <%--<img class="activator profile center-align circle" data-name=${proposal.skillName}}">--%>
            <%--</div>--%>
            <div class="card-content white-text">
                En la pestaña de <strong>Oferta</strong>, encontrarás más detalles de la oferta.
                En la pestaña de <strong>Estudiante</strong> encontrarás la información del estudiante así como sus
                datos de contacto.
            </div>
            <div class="card-tabs ">
                <ul class="tabs tabs-fixed-width tabs-transparent ">
                    <li class="tab"><a class="active" href="#test5">Oferta</a></li>
                    <li class="tab"><a href="#test4">Estudiante</a></li>
                </ul>
            </div>
            <div class="card-content blue lighten-4">
                <%--Seccion Oferta--%>
                <div id="test5" class="blue lighten-4">
                    Fecha inicio: <input value="${proposal.initialDate}" disabled="true">
                    Fecha fin: <input value="${proposal.finishDate}" disabled="true">
                    Descripción: <p>${proposal.description}</p>
                </div>
                <%--Seccion estudiante--%>
                <div id="test4" class="blue lighten-4">
                    Nombre: <input value="${student_proposal.name}" disabled="true">
                    Apellidos: <input value="${student_proposal.surname}" disabled="true">
                    Estudios: <input value="${student_proposal.degree}" disabled="true">
                    Curso: <input value="${student_proposal.course}" disabled="true">

                    <p>Contacto:</p>
                    <a href="mailto:${student_proposal.email}"><i class="material-icons">email</i>
                        Correo UJI</a>
                </div>
            </div>
                <div class="card-action blue center-align lighten-4">
                    <a href="#modal1" class="red  lighten-2  center-align btn waves-effect"><i class="material-icons">supervisor_account</i>
                        Colaborar</a>
                </div>
        </div>
    </div>

</main>

<%--Modal de colaboracion - proposal--%>
<div id="modal1" class="modal">
    <div class="modal-content">
        <h3 class="center-align font-lobster blue-text">Colaborar</h3>
        <form:form method="post" modelAttribute="newrequest" id="myForm">

            <c:if test="${empty match_request}">
                <p class="center-align red-text">No hay solicitudes que coincidan,
                    se creará automáticamente a partir de esta propuesta</p>
            </c:if>
            <c:if test="${not empty match_request}">
                <div class="row">
                    <div class="col s6 offset-s3 ">
                            <%--<i class="material-icons">announcement</i>--%>
                        <form:label path="skillName">Nombre de tu solicitud</form:label>
                        <form:select path="skillName">
                            <form:option value="Lista de ofertas que coinciden" disabled="true"></form:option>
                            <form:options items="${match_request}"></form:options>
                        </form:select>
                    </div>
                </div>
            </c:if>
            <div class="row">
                <div class="input-field col s6 offset-s3 ">
                        <%--<i class="material-icons">format_list_numbered</i>--%>
                    <form:label path="description">Número de horas que dedicarás</form:label>
                    <form:input path="description"></form:input>

                </div>
            </div>

        </form:form>
    </div>
    <div class="modal-footer">
        <a href="#!" id="accept" class="modal-action waves-effect waves-purple blue btn-flat right">Colaborar</a>
        <a href="#!" class="modal-close waves-effect waves-purple red btn-flat left">Cancelar</a>
    </div>
</div>
<md:footer-md></md:footer-md>


<script type="text/javascript" src="/js/materialize.min.js"></script>
<script type="text/javascript" src="/js/initial.min.js"></script>
<script>
    $('.profile').initial();
    $('.modal').modal();
</script>

<script>
    $('#accept').click(function () {
        swal({
            title: '¿Quieres realizar la colaboración?',
            text: "Recuerda dedicar mínimo 2 horas. ¡Aprende mucho!",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '¡Sí, realiza la colaboración!',
            cancelButtonText: 'Cancelar'
        }).then(function () {
            swal(
                'Colaboración iniciada!',
                'Se te redirigirá al inicio.',
                'success'
            );
            $('#myForm').trigger('submit');
        });
    });
</script>
<script>
    $(document).ready(function () {
        $('select').material_select();
    });
</script>
<%--Script de smooth scroll--%>
<script src="/js/BarraLateralMovil.js"></script>
</body>
</html>
