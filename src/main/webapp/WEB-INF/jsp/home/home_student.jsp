<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 22/3/17
  Time: 2:09
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="md" tagdir="/WEB-INF/tags" %>

<html>
<head>

    <title>Home Estudiante</title>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="/css/materialize.min.css" media="screen,projection"/>
    <link type="text/css" rel="stylesheet" href="/css/font-google.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <%--Avisa al navegador de que el html es valido para moviles--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
    <script src="/js/effect-text-3d.js"></script>
    <script src="/js/raphael-2.1.4.min.js"></script>
    <script src="/js/justgage.js"></script>
    <link rel="stylesheet" href="/css/animate.css">
    <link rel="stylesheet" href="/css/search.css">
    <link rel="stylesheet" href="/css/my-grid.css">
    <style>
        body {
            background-image: url("/images/mywwe.jpg");
        }
    </style>
</head>
<body class="blue lighten-3">

<%--Inicio del navbar con movil--%>
<header>
    <md:navbar-md name="${name}"></md:navbar-md>
</header>

<%--<div class="row">--%>
<%--Barra gris--%>
<md:sidenav-md name="${name}" type="${type}">

    <ul>
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
    </ul>
    <a href="#modal-help" class="waves-effect">
        <i class="material-icons">live_help</i>
    </a>

</md:sidenav-md>
<%--Fondo restante de la web sin panel--%>
<main class="container">
    <c:if test="${empty proposals and empty requests}">
        <div class="valign-wrapper">
            <a class="valign" style="font-size: 50px;text-align: center">
                <i class="material-icons valign" style="font-size: 200px; text-align: center">insert_invitation</i>
                <br>
                Esto está vacío... Prueba a empezar creando ofertas o uniéndote a peticiones.</a>
        </div>
    </c:if>

    <c:if test="${not empty requests and not empty proposals}">
        <h3 class="text3d font-lobster center-align">Mi última demanda y oferta</h3>
        <div id="search-wrapper">
            <input type="text" id="search" class="live-search-box" placeholder="Buscar..."/>
            <div id="close-icon"></div>
        </div>

        <%--If has any proposal--%>
        <ul class="rig columns-2 live-search-list">
            <a href="${pageContext.request.contextPath}/proposal/detail/${proposals.id}.html">
                <li class="hoverable animated flipInY">
                    <img class="activator profile center-align circle" data-name=${proposals.skillName}}">
                    <c:if test="${proposals.level == 'A'}">
                        <h3 class="center-align">${proposals.skillName} Avanzado</h3>
                    </c:if>
                    <c:if test="${prop.level == 'M'}">
                        <h3 class="center-align">${proposals.skillName} Medio</h3>
                    </c:if>
                    <c:if test="${proposals.level == 'N'}">
                        <h3 class="center-align">${proposals.skillName} Novato</h3>
                    </c:if>
                    <p>Descripción:</p>
                    <p class="center-align">${proposals.description}</p>
                    <p class="">Inicio: ${proposals.initialDate}</p>
                    <p class="">Fin: ${proposals.finishDate}</p>

                </li>
            </a>
        </ul>
        <%--If has any request--%>
        <ul class="rig columns-2 live-search-list">
            <a href="${pageContext.request.contextPath}/request/detail/${requests.id}.html">
                <li class="hoverable animated flipInY">
                    <img class="activator profile center-align circle" data-name=${requests.skillName}}">
                    <c:if test="${requests.level == 'A'}">
                        <h3 class="center-align">${requests.skillName} Avanzado</h3>
                    </c:if>
                    <c:if test="${requests.level == 'M'}">
                        <h3 class="center-align">${requests.skillName} Medio</h3>
                    </c:if>
                    <c:if test="${requests.level == 'N'}">
                        <h3 class="center-align">${requests.skillName} Novato</h3>
                    </c:if>
                    <p>Descripción:</p>
                    <p class="center-align">${requests.description}</p>
                    <p class="">Inicio: ${requests.initialDate}</p>
                    <p class="">Fin: ${requests.finishDate}</p>

                </li>
            </a>
        </ul>
        <h3 class="text3d font-lobster center-align">Resumen de mi actividad</h3>
        <div class="row">
            <div class="col s6">
                <div id="numberCollab" style="width:200px; height:200px"></div>
            </div>
            <div class="col s6">
                <div id="numberProp" style="width:200px; height:200px"></div>
            </div>
            <div class="col s6">
                <div id="numberReq" style="width:200px; height:200px"></div>
            </div>
            <div class="col s6">
                <div id="numberHours" style="width:200px; height:200px"></div>
            </div>

        </div>

    </c:if>

    <c:if test="${not empty proposals and empty requests}">

        <%--If has any proposal--%>
        <h3 class="text3d font-lobster center-align">Mi última oferta</h3>
        <ul class="rig columns-2 live-search-list">
            <a href="${pageContext.request.contextPath}/proposal/detail/${proposals.id}.html">
                <li class="hoverable animated flipInY">
                    <img class="activator profile center-align circle" data-name=${proposals.skillName}}">
                    <c:if test="${proposals.level == 'A'}">
                        <h3 class="center-align">${proposals.skillName} Avanzado</h3>
                    </c:if>
                    <c:if test="${prop.level == 'M'}">
                        <h3 class="center-align">${proposals.skillName} Medio</h3>
                    </c:if>
                    <c:if test="${proposals.level == 'N'}">
                        <h3 class="center-align">${proposals.skillName} Novato</h3>
                    </c:if>
                    <p>Descripción:</p>
                    <p class="center-align">${proposals.description}</p>
                    <p class="">Inicio: ${proposals.initialDate}</p>
                    <p class="">Fin: ${proposals.finishDate}</p>

                </li>
            </a>
        </ul>
        <h3 class="text3d font-lobster center-align">Resumen de mi actividad</h3>
        <div class="row">
            <div class="col s6">
                <div id="numberCollab" style="width:200px; height:200px"></div>
            </div>
            <div class="col s6">
                <div id="numberProp" style="width:200px; height:200px"></div>
            </div>
            <div class="col s6">
                <div id="numberReq" style="width:200px; height:200px"></div>
            </div>
            <div class="col s6">
                <div id="numberHours" style="width:200px; height:200px"></div>
            </div>

        </div>

    </c:if>

    <c:if test="${not empty requests and empty proposals}">
        <%--If has any request--%>
        <h3 class="text3d font-lobster center-align">Mi última demanda</h3>
        <ul class="rig columns-2 live-search-list center">
            <a href="${pageContext.request.contextPath}/request/detail/${requests.id}.html">
                <li class="hoverable animated flipInY">
                    <img class="activator profile center-align circle" data-name=${requests.skillName}}">
                    <c:if test="${requests.level == 'A'}">
                        <h3 class="center-align">${requests.skillName} Avanzado</h3>
                    </c:if>
                    <c:if test="${requests.level == 'M'}">
                        <h3 class="center-align">${requests.skillName} Medio</h3>
                    </c:if>
                    <c:if test="${requests.level == 'N'}">
                        <h3 class="center-align">${requests.skillName} Novato</h3>
                    </c:if>
                    <p class="blue-grey-text darken-3"><strong>Descripción:</strong></p>
                    <p class="center-align blue-text">${requests.description}</p>
                    <p class="black-text"><strong>Inicio:</strong> ${requests.initialDate}</p>
                    <p class="black-text"><strong>Fin:</strong> ${requests.finishDate}</p>

                </li>
            </a>
        </ul>

        <h3 class="text3d font-lobster center-align">Resumen de mi actividad</h3>
        <div class="row">
            <div class="col s6">
                <div id="numberCollab" style="width:200px; height:200px"></div>
            </div>
            <div class="col s6">
                <div id="numberProp" style="width:200px; height:200px"></div>
            </div>
            <div class="col s6">
                <div id="numberReq" style="width:200px; height:200px"></div>
            </div>
            <div class="col s6">
                <div id="numberHours" style="width:200px; height:200px"></div>
            </div>

        </div>
    </c:if>


    <%--Resumen--%>


</main>


<c:if test=" ${not empty success}">
    <script>
        toastr.success('Registrado correctamente');
    </script>
</c:if>


</div>
<md:footer-md></md:footer-md>

<script type="text/javascript" src="/js/materialize.min.js"></script>
<script src="/js/scroll.js"></script>
<script type="text/javascript" src="/js/BarraLateralMovil.js"></script>
<script type="text/javascript" src="/js/search.js"></script>
<script type="text/javascript" src="/js/initial.min.js"></script>
<script>
    $('.profile').initial();
</script>
<%--<script type="text/javascript" src="/js/mytoast.js"></script>--%>
<script>
    $(document).ready(function () {
        // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
        $('.modal').modal();
    });
</script>

<script>
    //JSP variables
    var _nC = ${numberCollab};
    var _nH = ${numberHours};
    var _nP = ${numberProposals};
    var _nR = ${numberRequests};

    //JS variables
    var numberCollab = Number(_nC);
    var numberHours = Number(_nH);
    var numberProposals = Number(_nP);
    var numberRequests = Number(_nR);
    var g = new JustGage({
        id: "numberCollab",
        valueFontColor: '2196f3',
        labelFontColor: '2196f3',
        value: numberCollab,
        min: 0,
        title: "Número de colaboraciones"
    });
    var g2 = new JustGage({
        id: "numberProp",
        value: numberProposals,
        valueFontColor: '2196f3',
        labelFontColor: '2196f3',
        min: 0,
        title: "Número de ofertas"
    });
    var g3 = new JustGage({
        id: "numberReq",
        valueFontColor: '2196f3',
        labelFontColor: '2196f3',
        value: numberRequests,
        min: 0,
        title: "Número de demandas"
    });

    var g4 = new JustGage({
        id: "numberHours",
        value: numberHours,
        labelFontColor: 'd32f2f',
        min: -20,
        max: 100,
        valueFontColor: 'd32f2f',
        title: "Saldo de horas",
        levelColorsGradient: true

    });
    if (numberHours >= 0) {
        g4 = new JustGage({
            id: "numberHours",
            value: numberHours,
            labelFontColor: 'd32f2f',
            min: 0,
            max: 100,
            valueFontColor: 'd32f2f',
            title: "Saldo de horas",
            levelColorsGradient: true

        });
    }

</script>

</body>
</html>
