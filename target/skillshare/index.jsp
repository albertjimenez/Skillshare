<%--
  Created by IntelliJ IDEA.
  User: Beruto
  Date: 8/3/17
  Time: 1:10
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Indice del proyecto EI1027</title>
    <!--Import Google Icon Font-->
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="css/materialize.min.css" media="screen,projection"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <%--Avisa al navegador de que el html es valido para moviles--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

</head>

<body style="background-color:powderblue;">


<%--Inicio del navbar con movil--%>
<div class="navbar-fixed">
    <nav>
        <div class="nav-wrapper light-blue">
            <a href="#id_01" class="brand-logo center">
                <img src="images/icono_app.png"
                     class="responsive-img z-depth-2" alt="" width="40" height="40">
                Skillshare EI1027
            </a>
            <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons ">menu</i></a>
            <%--Esto es la cabecera de arriba--%>
            <ul class="right hide-on-med-and-down">
                <li><a href="testing/listSkill.html">Listar Habilidades</a></li>
                <li><a href="testing/proposal.html">Propuestas</a></li>
            </ul>
            <%--Esto es la cabecera movil--%>
            <ul class="side-nav" id="mobile-demo">
                <li><a href="testing/listSkill.html">Lista de Habilidades</a></li>
                <li><a href="testing/proposal.html">Propuestas</a></li>
            </ul>
        </div>
    </nav>
</div>


<div class="carousel carousel-slider">
    <a href="#one!" class="carousel-item"><img src="images/carousel/1.jpeg" alt=""></a>
    <a href="#two!" class="carousel-item"><img src="images/carousel/2.jpg" alt=""></a>
    <a href="#three!" class="carousel-item"><img src="images/carousel/3.jpg" alt=""></a>
    <a href="#four!" class="carousel-item"><img src="images/carousel/4.jpg" alt=""></a>
</div>


<%--Parte inicial de la web, donde se encuentra la tarjeta de iniciar sesión--%>
<div class="card transparent hoverable medium">
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

    <%--TODO Recuerda que metiendo el href con # y un ID, vas a esa parte--%>
    <div class="card-action">
        <a class="waves-effect waves-light btn-large">
            <i class="material-icons left">person_pin</i>Inicia Sesión</a>
        <a class="waves-effect waves-light btn-large">
            <i class="material-icons left">add</i>Regístrate</a>
    </div>
</div>


<%--Explicacion del proyecto--%>
<div class="row z-depth-1 ">
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
</div>

<div class="row z-depth-1 ">
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
</div>

<div class="row z-depth-1 ">
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
</div>

<div class="row z-depth-1 ">
    <div class="col s4">
        <div id="id_01" class="center promo promo-example">
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
</div>

<%--Se aconseja moverlos al final de la web para reducir los tiempos de carga--%>
<!--Import jQuery before materialize.js-->
<%--<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>--%>
<script type="text/javascript" src="js/materialize.min.js"></script>
<script type="text/javascript" src="js/BarraLateralMovil.js"></script>

<%--Script de smooth scroll--%>
<script src="js/scroll.js" ></script>
<script>
//    $(document).ready(function(){
//        $('.carousel').carousel();
//    });
    $('.carousel.carousel-slider').carousel({fullWidth: /**/true});
    autoplay()
    function autoplay() {
        $('.carousel.carousel-slider').carousel('next');
        setTimeout(autoplay, 3000);
    }

</script>
</body>
</html>
