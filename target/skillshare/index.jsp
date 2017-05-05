<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="md" tagdir="/WEB-INF/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Beruto
  Date: 8/3/17
  Time: 1:10
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <title>Indice del proyecto EI1027</title>
    <!--Import Google Icon Font-->
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="css/materialize.min.css" media="screen,projection"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="/js/jquery.zmd.hierarchical-display.min.js"></script>
    <%--Avisa al navegador de que el html es valido para moviles--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
    <link rel="stylesheet" href="/css/zmd.hierarchical-display.min.css">

    <link type="text/css" rel="stylesheet" href="/css/font-google.css"/>


</head>

<body class="blue lighten-3">



<%--Inicio del navbar con movil--%>
<md:navbar-md></md:navbar-md>
<%--Carrousel--%>
<div class="carousel carousel-slider">
    <a href="#one!" class="carousel-item"><img src="images/carousel/1.jpeg" alt=""></a>
    <a href="#two!" class="carousel-item"><img src="images/carousel/2.jpg" alt=""></a>
    <a href="#three!" class="carousel-item"><img src="images/carousel/3.jpg" alt=""></a>
    <a href="#four!" class="carousel-item"><img src="images/carousel/4.jpg" alt=""></a>
</div>

<div data-animation="hierarchical-display">
<%--Parte inicial de la web, donde se encuentra la tarjeta de iniciar sesión--%>
    <div class="card transparent hoverable medium section">
    <div class="card-image">
        <img class="responsive-img" src="images/footer-log.jpg">
        <span class="card-title">Primeros Pasos</span>
    </div>
    <div class="card-content">
        <p>Si nunca has usado este servico te recomendamos que sigas bajando para conocer más
            y después, si te animas, regístrate. Si ya estás registrado, ya sabes como va, así que
            inicia sesión y haz tu día más productivo.
            <link href="https://afeld.github.io/emoji-css/emoji.css" rel="stylesheet">
            <i class="em em-mortar_board"></i>
        </p>
    </div>


    <%--Botones de Iniciar Sesión y Registrarse--%>
    <div class="card-action">
        <a class="light-blue waves-effect waves-light btn-large" href="login/login.html">
            <i class="material-icons left">person_pin</i>Inicia Sesión</a>
        <a class="light-blue waves-effect waves-light btn-large" href="register/register.html">
            <i class="material-icons left">add</i>Regístrate</a>

    </div>
</div>


<%--Explicacion del proyecto--%>
    <div class="row z-depth-1 section">
    <div class="col s4">
        <div class="center promo promo-example">
            <i class="large material-icons">group</i>
            <p class="promo-caption">Colaborativo</p>
            <p class="light center">Nuestro sistema de información aporta
                una característica única, en el sentido en el que todos los estudiantes
                somos los actores primarios y formamos parte de él. De esta manera,
                todo el mundo es el <i>rey.</i></p>
        </div>
    </div>
    <div class="col s4">
        <div class="center promo promo-example">
            <i class="large material-icons">payment</i>
            <p class="promo-caption">Gratuito</p>
            <p class="light center">Porque creemos que la moneda más importante en
                este mundo es el tiempo, por ello solo aceptamos el pago con tu tiempo.</p>
        </div>
    </div>
    <div class="col s4">
        <div class="center promo promo-example">
            <i class="large material-icons">language</i>
            <p class="promo-caption">Accesible</p>
            <p class="light center">Porque nos gusta ponértelo, lo más fácil posible.
                Accede desde cualquier dispositivo para aprender todo aquello que te propongas.</p>
        </div>
    </div>
</div>

<%--Sobre nosotros--%>
    <div id="about" class="row z-depth-1 section ">
    <div class="col s6">
        <div class="center promo promo-example">
            <img class="responsive-img" src="images/profile/albert.png" width="512" height="512">
            <p class="promo-caption">Albert Jiménez</p>
            <p class="light center">
                Entusiasta de las aventuras que deparan los proyectos nuevos como este.
                Puedes visitar mi portfolio en <a href="https://www.albertjimenez.github.io">Portfolio Github</a>.
            </p>
        </div>
    </div>
    <div class="col s6">
        <div class="center promo promo-example">
            <img src="images/profile/pablo.png" class="responsive-img" width="512" height="512">
            <p class="promo-caption">Pablo Berbel</p>
            <p class="light center">Rellenar.</p>
        </div>
    </div>
</div>

</div>
<%--Footer--%>
<md:footer-md></md:footer-md>


<%--Se aconseja moverlos al final de la web para reducir los tiempos de carga--%>
<!--Import jQuery before materialize.js-->
<script type="text/javascript" src="js/materialize.min.js"></script>

<%--Script de smooth scroll--%>
<script src="/js/scroll.js"></script>
<script src="/js/BarraLateralMovil.js"></script>
<script>
    $(".carousel.carousel-slider").carousel({
        fullWidth: true,
        dist: 0,
        indicators: true
    });

    autoplay();
    function autoplay() {
        $('.carousel.carousel-slider').carousel('next');
        setTimeout(autoplay, 10000);
    }

</script>
</body>
</html>
