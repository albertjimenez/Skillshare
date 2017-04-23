<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 12/4/17
  Time: 17:50
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="md" tagdir="/WEB-INF/tags" %>

<html>
<head>
    <title>Crear Oferta</title>
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

<header>
    <md:navbar-md name="${name}"></md:navbar-md>
</header>


<%--<div class="row">--%>
    <%--Panel lateral movil--%>
<md:sidenav-md name="${name}" type="${type}">
    <ul>
            <li>
                <a class="waves-effect" href="${pageContext.request.contextPath}/proposal/list.html">Mis Ofertas</a>
            </li>
        </ul>
</md:sidenav-md>

    <%--Resto fondo web--%>
<%--<div class="col s12 m8 l9" style="height: 100%">--%>
<main>
    <h4 class="font-raleway">Crear oferta</h4>
        <div class="container valign hoverable z-depth-2">
            <form:form method="post" modelAttribute="newproposal" onsubmit="return checkProposal();">

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
                            <form:option value="A">Advanced</form:option>
                            <form:option value="M">Medium</form:option>
                            <form:option value="N">Newbie</form:option>
                        </form:select>
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s6 offset-s3 ">
                        <i class="material-icons prefix">mode_edit</i>
                        <form:label path="description">Descripción breve</form:label>
                        <form:textarea path="description" cssClass="materialize-textarea" id="description"
                                       data-length="140"></form:textarea>
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
                        <button class="btn waves-effect waves-light" type="submit" name="action">Crear oferta
                            <i class="material-icons right">send</i>
                        </button>
                    </div>
                </div>
                <div class="row"></div>

                <%--No incluimos ni nif ni ID, los cogemos del cliente al momento de devolver este objeto--%>

            </form:form>
        </div>
</main>
<%--</div>--%>

<%--</div>--%>


<md:footer-md></md:footer-md>
<script type="text/javascript" src="/js/materialize.min.js"></script>
<script src="/js/scroll.js"></script>
<script type="text/javascript" src="/js/BarraLateralMovil.js"></script>
<script type="text/javascript" src="/js/validador.js"></script>
<script>
    $(document).ready(function () {
        $('select').material_select();
    });
</script>
<script>
    $('.datepicker').pickadate({
        selectMonths: true, // Creates a dropdown to control month
        selectYears: 15 // Creates a dropdown of 15 years to control year
    });
</script>
<script>
    $(document).ready(function () {
        $('input#input_text, textarea#textarea1').characterCounter();
    });

</script>
</body>
</html>
