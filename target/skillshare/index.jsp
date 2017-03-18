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
    <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

    <%--Avisa al navegador de que el html es valido para moviles--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

</head>
<body>
<nav>
    <div class="nav-wrapper">
        <a href="#" class="brand-logo center">
            <img class="responsive-img" src="images/icono_app.png">
        </a>
        <ul id="nav-mobile" class="right hide-on-med-and-down">
            <li><a href="testing/listSkill.html">Lista de Habilidades</a></li>
            <li><a href="testing/proposal.html">Propuestas</a></li>
        </ul>
    </div>
</nav>

<div class="col s12 m2">
    <h1 class="z-depth-5 cyan-text" align="center">Skillshare Pablo Albert</h1>
</div>
<ul>
    <h2>Índice de test</h2>
    <li><h3><a href="testing/listSkill.html">Lista de Habilidades</a></h3></li>
    <li>
        <h3><a href="testing/proposal.html">Propuestas</a></h3>
    </li>
</ul>
</div>
<div class="card teal accent-2 hoverable small">
    <div class="card-image">
        <img class="responsive-img" src="images/foot.jpg">
        <span class="card-title">Tarjeta Materialize</span>
    </div>
    <div class="card-content">
        <p>Soy un ejemplo de una tarjeta material del Santi. Gracias Adri <3</p>
    </div>
    <div class="card-action">
        <a href="#">Soy un enlace Uooooooo</a>
    </div>
</div>

<%--Se aconseja moverlos al final de la web para reducir los tiempos de carga--%>
<!--Import jQuery before materialize.js-->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="js/materialize.min.js"></script>
</body>
</html>
