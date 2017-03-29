<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 25/3/17
  Time: 19:31
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Editar Habilidad</title>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="/css/materialize.min.css" media="screen,projection"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <%--Avisa al navegador de que el html es valido para moviles--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
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

<%--Cuerpo principal--%>

<%--Barra gris--%>
<div class="row">
    <div class="col s3 blue-grey darken-1 z-depth-3" style="min-height:100%; min-width: 5%">

        <%--PANEL--%>
        <ul id="slide-out" class="side-nav">
            <li><a href="#!">First Sidebar Link</a></li>

        </ul>
        <%--Barra gris de verdad--%>
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
                    Desde esta página podrás editar las habilidades cambiando solo su descripción.</span>
            </div>
        </div>
        <div class="col s10">

            <%--TODO tengo que crear el formulario banned tanto para ver como para insertar baneados--%>
            <div class="card-panel red accent-2 hoverable">
                <a href="../../../../login/banned.html">
                    Lista de Baneados<i class="material-icons">warning</i>
                </a>
            </div>
        </div>

    </div>

    <%--Resto de la página--%>
    <div class="col s9 ">

        <div class="card hoverable transparent z-depth-1-half">
            <div class="card-image">
                <img class="responsive-img" src="/images/wallcard.png">
                <span class="card-title">Editar habilidad ${editskill.name}</span>
            </div>
            <div class="card-content">
                <form:form method="post" modelAttribute="editskill" id="myform">
                    <h4 class="center-align">Editar habilidad ${editskill.name}</h4>
                    <div class="row">
                        <div class="input-field col s6 offset-s3 ">
                            <i class="material-icons prefix">supervisor_account</i>
                            <form:label path="name">Nombre</form:label>
                            <form:input path="name" id="name" cssClass="validate" value="${editskill.name}"/>
                        </div>
                        <div class="input-field col s6 offset-s3 ">
                            <i class="material-icons prefix">dashboard</i>
                            <form:select path="level">
                                <form:option value="" disabled="true">
                                    Escoge qué nivel de habilidad es</form:option>
                                <form:option value="A">Advanced</form:option>
                                <form:option value="M">Medium</form:option>
                                <form:option value="N">Newbie</form:option>
                            </form:select>
                        </div>
                        <div class="input-field col s6 offset-s3 ">
                            <i class="material-icons prefix">toc</i>
                            <form:label path="description">Descripción</form:label>
                            <form:textarea path="description" id="description" value="${editskill.description}"
                                           cssClass="validate"/>
                        </div>
                        <div class="input-field col s6 offset-s3 ">
                                <%--<input type="submit" class="" value="Aceptar" id="edit_ok_btn">--%>
                            <button class="btn waves-effect waves-light" type="submit" name="action">Editar
                                <i class="material-icons right">send</i>
                            </button>
                            <a class="waves-effect waves-green btn-flat" href="../../../home_pc.html">Cancelar</a>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>


    </div>

</div>


<%--Footer--%>
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


<%--Seccion Scripts--%>
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
