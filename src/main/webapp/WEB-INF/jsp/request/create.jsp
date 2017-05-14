<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 14/5/17
  Time: 23:58
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="md" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <title>Crear petición</title>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="/css/materialize.min.css" media="screen,projection"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <%--Avisa al navegador de que el html es valido para moviles--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link type="text/css" rel="stylesheet" href="/css/font-google.css"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="/css/my-backgrounds-opac.css" rel="stylesheet">
    <link href="/css/animate.css" rel="stylesheet">
    <style>
        body {
            background-image: url("/images/background-create-req.jpg");
        }

        main {
            opacity: 0.8;
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
    <h4 class="center-align font-lobster">Crear petición</h4>
    <div class="section z-depth-2 my-bw-nw animated fadeInDown ">
        <form:form method="post" modelAttribute="newrequest" id="myform">
            <div class="row">
                <div class="input-field col s6 offset-s3 ">
                    <form:select path="skillName">
                        <form:option value="Lista de habilidades" disabled="true"></form:option>
                        <form:options items="${listSkillnames}"></form:options>
                    </form:select>
                </div>
            </div>

            <div class="row">
                <div class="input-field col s6 offset-s3 ">
                    <form:select path="level">
                        <form:option value="" disabled="true">
                            Escoge qué nivel de habilidad es</form:option>
                        <form:option value="A">Avanzado</form:option>
                        <form:option value="M">Medio</form:option>
                        <form:option value="N">Novato</form:option>
                    </form:select>
                </div>
            </div>

            <div class="row">
                <div class="input-field col s6 offset-s3 ">
                    <i class="material-icons prefix">mode_edit</i>
                    <form:label path="description">Descripción breve</form:label>
                    <form:textarea path="description" cssClass="materialize-textarea" id="description"
                                   data-length="140" maxlength="140"></form:textarea>
                    <form:errors path="description"></form:errors>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s6 offset-s3 ">
                    <i class="material-icons prefix">date_range</i>
                    <form:label path="initialDate">Fecha de inicio</form:label>
                    <form:input path="initialDate" cssClass="datepicker" id="initialDate"></form:input>
                    <form:errors path="initialDate"></form:errors>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s6 offset-s3 ">
                    <i class="material-icons prefix">date_range</i>
                    <form:label path="finishDate">Fecha de fin</form:label>
                    <form:input path="finishDate" cssClass="datepicker" id="finishDate"></form:input>
                    <form:errors path="finishDate"></form:errors>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s6 offset-s3">
                    <button class="btn waves-effect waves-light" type="submit" name="action">Crear Solicitud
                        <i class="material-icons right">send</i>
                    </button>
                </div>
            </div>

        </form:form>
    </div>

</main>


<md:footer-md></md:footer-md>

<script type="text/javascript" src="/js/materialize.min.js"></script>
<script src="/js/scroll.js"></script>
<script type="text/javascript" src="/js/BarraLateralMovil.js"></script>
<script type="text/javascript" src="/js/aos.js"></script>
<script type="text/javascript" src="/js/initial.min.js"></script>
<script>
    $(document).ready(function () {
        $('select').material_select();
    });
</script>

<script>
    $('.profile').initial();
</script>
<script>
    AOS.init();
    $('.datepicker').pickadate({
        selectMonths: true, // Creates a dropdown to control month
        selectYears: 15 // Creates a dropdown of 15 years to control year
    });
</script>
</body>
</html>
