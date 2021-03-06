
<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 20/3/17
  Time: 1:49
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="md" tagdir="/WEB-INF/tags" %>

<html>
<head>
    <title>Home Promotor de colaboraciones</title>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="/css/materialize.min.css" media="screen,projection"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <%--Avisa al navegador de que el html es valido para moviles--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link type="text/css" rel="stylesheet" href="/css/font-google.css"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.4/sweetalert2.min.js"></script>
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.4/sweetalert2.min.css">
    <link rel="stylesheet" href="/css/search.css">
    <script src="/js/effect-text-3d.js"></script>
    <style>
        body {
            background-image: url("/images/pc-wallpaper.jpg");
        }

        main {
            opacity: 0.9;
        }
    </style>
</head>

<body>
<%--Inicio del navbar con movil--%>

<header>
    <md:navbar-md name="${name}"></md:navbar-md>
</header>
    <%--Barra gris--%>

<%--TODO meter todo en <li>--%>
<md:sidenav-md name="${name}" type="${type}" cp="${cp}">

    <%--<li>--%>
    <%--<a class="waves-effect" href="${pageContext.request.contextPath}/home/home_pc.html">Colección de Habilidades</a>--%>
    <%--</li>--%>
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
    <h4 class="font-lobster center-align text3d">Listado de habilidades</h4>
        <div class="fixed-action-btn horizontal">
            <a class="btn-floating btn-large red">
                <i class="material-icons">menu</i>
            </a>
            <ul>
                <li><a class="btn-floating green" href="skill/create.html">
                    <i class="material-icons">playlist_add</i></a></li>
            </ul>
        </div>

    <ul class="collapsible popout " data-collapsible="accordion">
            <c:forEach items="${skills}" var="sk">

                <md:desplegable-md name="${sk.name}" name2="${sk.level}">
                    <table class="highlight bordered font-raleway">
                        <tr>
                            <td>DESCRIPCIÓN:</td>
                            <td>
                                <span class="font">${sk.description}</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a class="waves-effect waves-light btn" href="skill/update/${sk.name}/${sk.level}.html">
                                    <i class="material-icons right ">mode_edit
                                    </i>Editar habilidad</a>
                            </td>
                            <td>

                                    <%--<a class="waves-effect waves-light btn" id="deletebtn" href="skill/delete/${sk.name}/${sk.level}.html">--%>
                                    <%--<i class="material-icons left">delete</i>--%>
                                    <%--Borrar habilidad</a>--%>
                                <button class="waves-effect waves-light btn"
                                        id="${pageContext.request.contextPath}/skill/delete/${sk.name}/${sk.level}.html">
                                    <i class="material-icons left">delete</i>
                                    Borrar habilidad
                                </button>
                            </td>
                        </tr>
                    </table>

                    <div class="fixed-action-btn">
                        <a class="btn-floating btn-large red">
                            <i class="large material-icons">mode_edit</i>
                        </a>

                            <%--SUBButtons--%>
                        <ul>
                            <li>
                                <button class="btn-floating red"
                                        id="${pageContext.request.contextPath}/skill/delete/${sk.name}/${sk.level}.html">
                                    <i
                                            class="material-icons">delete</i></button>
                            </li>
                            <li><a class="btn-floating blue" href="skill/update/${sk.name}/${sk.level}.html">
                                <i class="material-icons">mode_edit</i></a></li>
                            <li><a class="btn-floating green" href="skill/create.html">
                                <i class="material-icons">playlist_add</i></a></li>
                        </ul>
                    </div>
                </md:desplegable-md>


            </c:forEach>
        </ul>
    <c:if test="${not empty success}">
        <script>
            toastr.success('Registrado correctamente');
        </script>
    </c:if>
    <c:if test="${not empty create}">
        <script>
            toastr.success('Habilidad añadida ');
        </script>
    </c:if>

</main>
<%--</div>--%>


<md:footer-md></md:footer-md>

<script type="text/javascript" src="/js/materialize.min.js"></script>
<script src="/js/scroll.js"></script>
<script type="text/javascript" src="/js/BarraLateralMovil.js"></script>
<%--<script type="text/javascript" src="/js/mytoast.js"></script>--%>
<script type="text/javascript" src="/js/search.js"></script>
<script>
    $(document).ready(function () {
        $('select').material_select();
    });
</script>
<script type="text/javascript" src="/js/initial.min.js"></script>
<script>
    $('.profile').initial({height: 46, width: 46, fontSize: 20, fontWeight: 700});
</script>
<%--<script>--%>
<%--function showSideNav() {--%>
<%--$('.button-collapse').sideNav('show');--%>
<%--}--%>
<%--window.onload = showSideNav;--%>
<%--</script>--%>
<script>

    $('button').click(function () {
        console.log(this.id);
        var myURL = this.id;
        console.log('hola');

        swal({
            title: '¿Quieres borrar la habilidad?',
            text: "Se borrarán las colaboraciones, propuestas y ofertas",
            type: 'warning',
            showCancelButton: true,
            cancelButtonColor: '#d33',
            confirmButtonColor: '#3085d6',
            confirmButtonText: '¡Sí, borra la habilidad!',
            cancelButtonText: 'Cancelar'
        }).then(function () {
            swal(
                'Borrada!',
                'Éxito al borrar.',
                'success'
            );
            window.location.href = "/home/" + myURL;
        });
    });

</script>
<script>
    var myNif = "${student.nif}";
    //    var myWS = new WebSocket("ws://localhost:8080/notification/{" + myNif + "}");
    var myWS = new WebSocket("ws://skillshare-uji.herokuapp.com/notification/{" + myNif + "}");
    var myURL = "${pageContext.request.contextPath}/collaboration/";
    function myOpenF() {
        console.log("opened WS:");

    }
    function myClose() {
        myWS.close();
    }
    myWS.onopen = myOpenF;
    myWS.onclose = myClose;
    window.onbeforeunload = myClose;

    myWS.onmessage = function (e) {
        console.log("Received data" + e.data);
        var msg = JSON.parse(e.data);
        console.log(msg);
        if (myNif == msg.nif) {
            console.log("Es mi colaboración");
            if (msg.isProposalURL) {

                swal({
                    title: 'Una de tus propuestas ha sido atendida :)',
                    text: "¿Quieres ver los detalles?",
                    showCancelButton: true,
                    cancelButtonColor: '#d33',
                    cancelButtonText: 'Mejor no',
                    confirmButtonColor: '#3085d6',
                    confirmButtonText: '¡Sí, llévame a los detalles!',
                    imageUrl: "/images/handshakeicon.png"
                }).then(function () {
                    window.location.href = myURL + "prop/detail/" + msg.idProp + "/" + msg.idReq + ".html";
                });
            } else {
                swal({
                    title: 'Una de tus demandas ha sido atendida :)',
                    text: "¿Quieres ver los detalles?",
                    showCancelButton: true,
                    cancelButtonColor: '#d33',
                    cancelButtonText: 'Mejor no',
                    confirmButtonColor: '#3085d6',
                    confirmButtonText: '¡Sí, llévame a los detalles!',
                    imageUrl: "/images/handshakeicon.png"
                }).then(function () {
                    window.location.href = myURL + "req/detail/" + msg.idReq + "/" + msg.idProp + ".html";
                });
            }
        } else {
            console.log("En algun lugar en alguna parte, se ha producido una colaboración, pero no conmigo :(");
        }
    }

</script>

</body>
</html>
