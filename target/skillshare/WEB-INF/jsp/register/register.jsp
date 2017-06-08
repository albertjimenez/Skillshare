<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 24/3/17
  Time: 14:58
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="md" tagdir="/WEB-INF/tags" %>

<html>
<head>
    <title>Registrarse</title>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="/css/materialize.min.css" media="screen,projection"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <%--Avisa al navegador de que el html es valido para moviles--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/css/font-google.css">
    <link rel="stylesheet" type="text/css" href="/css/animate.css">
    <link rel="stylesheet" type="text/css" href="/css/my-backgrounds-opac.css">
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
    <script src="/js/effect-text-3d.js"></script>

    <style>

        video#bgvid {
            position: fixed;
            top: 50%;
            left: 50%;
            min-width: 100%;
            min-height: 100%;
            width: auto;
            height: auto;

            z-index: -100;
            -ms-transform: translateX(-50%) translateY(-50%);
            -moz-transform: translateX(-50%) translateY(-50%);
            -webkit-transform: translateX(-50%) translateY(-50%);
            transform: translateX(-50%) translateY(-50%);
            background: url(/images/whiteboard.png) no-repeat;
            background-size: cover;
        }

        .section {
            opacity: 0.9;
        }

    </style>
</head>

<body class="blue lighten-3">
<md:navbar-md></md:navbar-md>

<md:sidenav-md>
    <li><a class="grey-text text-lighten-3" href="${pageContext.request.contextPath}/login/login.html">Entrar</a>
    </li>
    <li><a class="grey-text text-lighten-3"
           href="${pageContext.request.contextPath}/register/register.html">Registro</a></li>
</md:sidenav-md>

<h4 class="center-align font-lobster text3d"><strong>Regístrate</strong></h4>

<main class="container">

    <video playsinline autoplay muted loop poster="/images/whiteboard.png" id="bgvid">
        <source src="/video/whiteboard.webm" type="video/webm">
        <source src="/video/whiteboard.mp4" type="video/mp4">
    </video>
<%--Formulario de registro con objeto Student--%>
    <div class="section z-depth-2 my-bw-nw">
        <form:form method="post" modelAttribute="studentRegister" onsubmit="return check_register();"
                   cssClass="animated lightSpeedIn">
            <div class="row">
                <div class="input-field col s6 offset-s3 ">
                    <i class="material-icons prefix">perm_identity</i>
                    <form:label path="nif">NIF</form:label>
                    <form:input path="nif" id="nif" cssClass="validate"/>
                    <i class="materialize-red-text">
                        <form:errors path="nif"/>
                    </i>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s6 offset-s3 ">
                    <i class="material-icons prefix">account_circle</i>
                    <form:label path="username">Nombre de usuario</form:label>
                    <form:input path="username" id="username" cssClass="validate"/>
                </div>
            </div>
            <div class="row ">
                <div class="input-field col s6 offset-s3">
                    <i class="material-icons prefix">dialpad</i>
                    <form:label path="password">Contraseña</form:label>
                    <form:password path="password" id="password1"/>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s6 offset-s3 ">
                    <i class="material-icons prefix">assignment_ind</i>
                    <form:label path="name">Nombre</form:label>
                    <form:input path="name" id="name" cssClass="validate"/>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s6 offset-s3 ">
                    <i class="material-icons prefix">assignment_ind</i>
                    <form:label path="surname">Apellidos</form:label>
                    <form:input path="surname" id="surname" cssClass="validate"/>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s6 offset-s3 ">
                    <i class="material-icons prefix">email</i>
                    <form:label path="email">Email UJI</form:label>
                    <form:input path="email" id="email" cssClass="validate"/>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s6 offset-s3 ">
                    <i class="material-icons prefix">view_day</i>
                    <form:select path="type" id="type">
                        <form:option value="" disabled="true">
                            Escoge qué tipo de estudiante eres</form:option>
                        <form:option value="NO">Estudiante de grado</form:option>
                        <form:option value="CP">Promotor de colaboraciones</form:option>
                        <form:option value="CM">Miembro del consejo</form:option>
                        <form:option value="MA">Estudiante de máster</form:option>
                        <%--<form:option value="PG">Estudiante de postgrado</form:option>--%>
                    </form:select>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s6 offset-s3 ">
                    <i class="material-icons prefix">business</i>
                    <form:label path="degree">Titulación</form:label>
                    <form:input path="degree" id="autocomplete-input" cssClass="autocomplete" autocomplete="false"/>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s6 offset-s3 ">
                    <i class="material-icons prefix">assignment</i>
                    <form:label path="course"></form:label>
                        <%--<form:input path="course" id="course" cssClass="validate"/>--%>
                    <form:select path="course">
                        <form:option value="" disabled="true">
                            Escoge tu curso</form:option>
                        <form:option value="1">Primer curso</form:option>
                        <form:option value="2">Segundo curso</form:option>
                        <form:option value="3">Tercer curso</form:option>
                        <form:option value="4">Cuarto curso</form:option>
                        <form:option value="5">Quinto curso</form:option>
                        <form:option value="6">Sexto curso</form:option>
                    </form:select>

                </div>
            </div>


            <div class="row center-align valign">
                <div class="col s6 offset-s3">
                    <a class="waves-effect waves-green btn-flat tooltipped" data-position="bottom" data-delay="15"
                       data-tooltip="Sirvo para registrar usuario sesión">
                        <input type="submit" value="Registrarse" id="register_btn">
                    </a>
                </div>
            </div>
            <%--<div class="input-field">--%>
            <%--<input class="purple darken-4 autocomplete" id="autocomplete-input" type="search">--%>
            <%--<label for="autocomplete-input"><i class="material-icons">search</i></label>--%>
            <%--<i class="material-icons">close</i>--%>
            <%--</div>--%>
        </form:form>
</div>
</main>

<md:footer-md></md:footer-md>

<script type="text/javascript" src="/js/materialize.min.js"></script>
<script src="/js/scroll.js"></script>
<script type="text/javascript" src="/js/BarraLateralMovil.js"></script>
<script type="text/javascript" src="/js/validador.js"></script>
<script type="text/javascript" src="/js/aos.js"></script>
<script>
    $(document).ready(function () {
        $('select').material_select();
    });
</script>
<script>
    AOS.init();
</script>

<%--<script>--%>
<%--var degrees = ${degrees};--%>
<%--var masters = ${masters};--%>
<%--console.log(degrees);--%>
<%--console.log(masters);--%>
<%--$('#type').change(function(){--%>
<%--console.log($('#type').find(":selected").text());--%>
<%--if($('#type').find(":selected").text()!='Estudiante de máster'){--%>


<%--}--%>
<%--else {--%>
<%--console.log("Has tocado master");--%>
<%--}--%>
<%--});--%>
<%--</script>--%>
<script>
    $(document).ready(function () {
        $('input.autocomplete').autocomplete({
            data: {
                "Grado en Arquitectura Técnica": null,
                "Grado en Diseño y Desarrollo de Videojuegos": null,
                "Grado en Ingeniería Agroalimentaria y del Medio Rural": null,
                "Grado en Ingeniería Eléctrica": null,
                "Grado en Ingeniería en Diseño Industrial y Desarrollo de Productos": null,
                "Grado en Ingeniería en Tecnologías Industriales": null,
                "Grado en Ingeniería Informática": null,
                "Grado en Ingeniería Mecánica": null,
                "Grado en Ingeniería Química": null,
                "Grado en Matemática Computacional": null,
                "Grado en Química": null,
                "Grado en Enfermería": null,
                "Grado en Medicina": null,
                "Grado en Psicología": null,
                "Grado en Comunicación Audiovisual": null,
                "Grado en Estudios Ingleses": null,
                "Grado en Historia y Patrimonio": null,
                "Grado en Historia y Patrimonio (Plan de 2015)": null,
                "Grado en Humanidades: Estudios Interculturales": null,
                "Grado en Humanidades: Estudios Interculturales (Plan de 2015)": null,
                "Grado en Maestro o Maestra de Educación Infantil": null,
                "Grado en Maestro o Maestra de Educación Primaria": null,
                "Grado en Periodismo": null,
                "Grado en Publicidad y Relaciones Públicas": null,
                "Grado en Traducción e Interpretación": null,
                "Grado en Administración de Empresas": null,
                "Grado en Criminología y Seguridad": null,
                "Grado en Derecho": null,
                "Grado en Economía": null,
                "Grado en Finanzas y Contabilidad": null,
                "Grado en Gestión y Administración Pública": null,
                "Grado en Relaciones Laborales y Recursos Humanos": null,
                "Grado en Turismo": null,
                "Máster Universitario en Ciencia, Tecnología y Aplicaciones de los Materiales Cerámicos (Plan de 2013)": null,
                "Máster Universitario en Diseño y Fabricación (Plan de 2015)": null,
                "Máster Universitario en Eficiencia Energética y Sostenibilidad (Plan de 2013)": null,
                "Máster Universitario en Física Aplicada": null,
                "Máster Universitario en Ingeniería Industrial": null,
                "Máster Universitario en Investigación y Biotecnología Agrarias": null,
                "Máster Universitario en Matemática Computacional (Plan de 2013) (A distancia)": null,
                "Máster Universitario en Matemática Computacional (Plan de 2013) (Presencial)": null,
                "Máster Universitario en Prevención de Riesgos Laborales (Plan de 2013)": null,
                "Máster Universitario en Protección Integrada de Cultivos (Plan de 2013)": null,
                "Máster Universitario en Química Aplicada y Farmacológica": null,
                "Máster Universitario en Química Sostenible (Plan de 2015)": null,
                "Máster Universitario en Química Teórica y Modelización Computacional (Plan de 2014)": null,
                "Máster Universitario en Sistemas Inteligentes (Plan de 2013)": null,
                "Máster Universitario en Técnicas Cromatográficas Aplicadas (Plan de 2013)": null,
                "Máster Universitario Erasmus Mundus en Robótica Avanzada": null,
                "Máster Universitario Erasmus Mundus en Tecnología Geoespacial (Plan de 2013)": null,
                "Máster Universitario en Comunicación Intercultural y Enseñanza de Lenguas (Plan de 2013)": null,
                "Master Universitario en Didáctica de la Música": null,
                "Máster Universitario en Enseñanza y Adquisición de la Lengua Inglesa en Contextos Multilingües (Plan de 2013) (A distancia)": null,
                "Máster Universitario en Enseñanza y Adquisición de la Lengua Inglesa en Contextos Multilingües (Plan de 2013) (Presencial)": null,
                "Máster Universitario en Estudios Internacionales de Paz, Conflictos y Desarrollo (Plan de 2013)": null,
                "Máster Universitario en Ética y Democracia (Plan de 2013)": null,
                "Máster Universitario en Historia del Arte y Cultura Visual": null,
                "Máster Universitario en Historia e Identidades en el Mediterráneo Occidental (siglos XV-XIX) (Plan de 2014)": null,
                "Máster Universitario en Investigación Aplicada en Estudios Feministas, de Género y Ciudadanía (Plan de 2016)": null,
                "Máster Universitario en Investigación en Traducción e Interpretación (Plan de 2013)": null,
                "Máster Universitario en Lengua Inglesa para el Comercio Internacional": null,
                "Máster Universitario en Nuevas Tendencias y Procesos de Innovación en Comunicación (Plan de 2016)": null,
                "Máster Universitario en Profesor/a de Educación Secundaria Obligatoria y Bachillerato, Formación Profesional y Enseñanzas de Idiomas": null,
                "Máster Universitario en Psicopedagogía": null,
                "Máster Universitario en Traducción Médico-Sanitaria (Plan de 2013)": null,
                "Máster Universitario en Abogacía": null,
                "Máster Universitario en Cooperación al Desarrollo (Plan de 2015) (A distancia)": null,
                "Máster Universitario en Dirección de Empresas / Master in Management": null,
                "Máster Universitario en Economía / Master in Economics": null,
                "Máster Universitario en Gestión de la Calidad": null,
                "Máster Universitario en Gestión Financiera y Contabilidad Avanzada (Plan de 2013)": null,
                "Máster Universitario en Igualdad y Género en el Ámbito Público y Privado (Plan de 2013)": null,
                "Máster Universitario en Marketing e Investigación de Mercados": null,
                "Máster Universitario en Sistema de Justicia Penal": null,
                "Máster Universitario en Sostenibilidad y Responsabilidad Social Corporativa": null,
                "Máster Universitario en Ciencias de la Enfermería (Plan de 2013)": null,
                "Máster Universitario en Intervención y Mediación Familiar (Plan de 2014)": null,
                "Máster Universitario en Investigación en Cerebro y Conducta": null,
                "Máster Universitario en Psicología del Trabajo, de las Organizaciones y en Recursos Humanos (Plan de 2014) (A distancia)": null,
                "Máster Universitario en Psicología del Trabajo, de las Organizaciones y en Recursos Humanos (Plan de 2014) (Presencial)": null,
                "Máster Universitario en Psicología General Sanitaria": null,
                "Máster Universitario en Rehabilitación Psicosocial en Salud Mental Comunitaria": null
            }
        });
    });

</script>

</body>
</html>
