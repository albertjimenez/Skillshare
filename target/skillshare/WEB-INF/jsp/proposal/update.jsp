<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 12/4/17
  Time: 17:51
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Actualizar Ofertas</title>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="/css/materialize.min.css" media="screen,projection"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <%--Avisa al navegador de que el html es valido para moviles--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body class="blue lighten-3">


<div class="navbar-fixed">
    <nav>
        <div class="nav-wrapper light-blue">
            <a class="brand-logo center" href="/">
                <img src="/images/icono_app.png"
                     class="responsive-img z-depth-2" alt="" width="40" height="40">
                Skillshare EI1027
            </a>
            <%--<a href="#" data-activates="mobile-demo" class="button-collapse">--%>
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
<div class="row">
    <%--Barra gris--%>
    <div class="col s3 blue-grey darken-1 z-depth-3" style="min-height:100%; min-width: 5%">

        <div class="col s10">
            <div class="card-panel red accent-2">
          <span class="white-text">
          El botón de <i><strong>Panel</strong></i> expande el panel para poder controlar y mostrar más
              información que la que se muestra. <br>
          </span>
                <span class="white-text">
                    Cuando haces clic en una habilidad puedes editarla con el botón flotante que aparece
                abajo a la izquierda. En él se desplega el subbotón editar, eliminar y crear.</span>
            </div>
        </div>

    </div>



</body>
</html>
