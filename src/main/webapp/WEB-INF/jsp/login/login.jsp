<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 20/3/17
  Time: 0:50
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix="c" uri="http://www.springframework.org/tags/form" %>--%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="md" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">

    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="/css/materialize.min.css" media="screen,projection"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <%--Avisa al navegador de que el html es valido para moviles--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="/css/animate.css">
    <link type="text/css" rel="stylesheet" href="/css/font-google.css"/>
    <link type="text/css" rel="stylesheet" href="/css/my-backgrounds-opac.css"/>
    <link type="text/css" rel="stylesheet" href="/css/loader-bar.css"/>
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
    <title>Iniciar sesión</title>
    <script src="/js/effect-text-3d.js"></script>
</head>
<style>
    body {
        display: flex;
        min-height: 100vh;
        flex-direction: column;
        background-image: url("/images/background-login.jpg");
    }

    main {
        flex: 1 0 auto;
        /*opacity: 0.7;*/
    }

</style>
<body class="blue lighten-3">

<md:sidenav-md>
    <%--<li><a class="grey-text text-lighten-3" href="${pageContext.request.contextPath}/login/login.html">Entrar</a>--%>
    <%--</li>--%>
    <%--<li><a class="grey-text text-lighten-3"--%>
    <%--href="${pageContext.request.contextPath}/register/register.html">Registro</a></li>--%>
</md:sidenav-md>

<header>
    <md:navbar-md></md:navbar-md>
</header>

<div class="load-bar" id="load-bar">
    <div class="bar"></div>
    <div class="bar"></div>
    <div class="bar"></div>
</div>
<main class="container">
    <h4 class="center-align animated slideInDown font-lobster text3d">Inicia la sesión</h4>

    <%--Abrimos formulario--%>
    <div class="section z-depth-2 my-bw-nw  hoverable animated slideInUp" id="myForm">
        <form:form method="post" modelAttribute="loginEntity" onsubmit="return check();">
            <div class="row" id="userSection">
                <div class="input-field col s6 offset-s3 ">
                    <i class="material-icons prefix">account_circle</i>
                    <form:label path="user">Email o nombre de usuario</form:label>
                    <form:input path="user" id="user" cssClass="validate"/>
                    <i class="materialize-red-text">
                        <form:errors path="user"/>
                    </i>
                </div>
            </div>
            <div class="row" id="passSection">
                <div class="input-field col s6 offset-s3">
                    <i class="material-icons prefix">dialpad</i>
                    <form:label path="password">Contraseña</form:label>
                    <form:password path="password" id="password"/>
                    <i class="materialize-red-text">
                        <form:errors path="password" id="wrongPass"/>
                    </i>
                </div>
            </div>

            <div class="row center-align valign">
                <div class="col s6 offset-s3">
                    <a class="waves-effect waves-green btn-flat tooltipped" data-position="left" data-delay="50"
                       data-tooltip="Sirvo para iniciar sesión">
                        <input type="submit" value="Iniciar Sesión" id="login_btn">
                    </a>
                </div>
            </div>
            <div class="row center-align valign">
                <div class="col s6 offset-s3">
                    <a href="/" class="waves-effect waves-green btn-flat">Volver</a>
                </div>
            </div>


        </form:form>
    </div>

    <%--<div class="progress" id="progress">--%>
    <%--<div class="indeterminate"></div>--%>
    <%--</div>--%>
</main>
<%--Footer--%>
<md:footer-md></md:footer-md>

<script type="text/javascript" src="/js/materialize.min.js"></script>
<script src="/js/scroll.js"></script>
<script type="text/javascript" src="/js/BarraLateralMovil.js"></script>
<script type="text/javascript" src="/js/validador.js"></script>
<script>
    $("#load-bar").hide();
</script>

<script>

    $("#login_btn").click(function () {
//        $(".progress").show();
        var test = true;
        if (document.getElementById("user").value.trim() == '') {
            test = false;
        }
        if (document.getElementById("password").value.trim() == '') {
            test = false;
        }
        if (test) {
            $('#load-bar').show();
        }


    });
</script>
<script>
    if ($('#wrongPass').get().length > 0) {
        console.log('yee');
        $('#myForm').removeClass('animated slideInUp');
        $("#passSection").addClass('animated shake');
        Materialize.toast("Contraseña incorrecta", 4000, 'rounded');
    }
    //    if ($('#userSection').get().length > 0) {
    //        console.log('yee');
    //        $('#myForm').removeClass('animated slideInUp');
    //        $("#userSection").addClass('animated shake');
    //    }
</script>
</body>
</html>
