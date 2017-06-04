<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 23/4/17
  Time: 17:40
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="md" tagdir="/WEB-INF/tags" %>

<html>
<head>
    <title>Title</title>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="/css/materialize.min.css" media="screen,projection"/>
    <link type="text/css" rel="stylesheet" href="/css/font-google.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <%--Avisa al navegador de que el html es valido para moviles--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
    <link href="/css/jquery.dynatable.css" rel="stylesheet">
    <script src="/js/jquery.dynatable.js"></script>

</head>
<body class="blue lighten-3">


<md:sidenav-md name="${name}" type="${type}"></md:sidenav-md>

<header>
    <md:navbar-md name="${name}"></md:navbar-md>
</header>

<main class="container">
    <p class="">WS</p>
    <form >
        Quantity (between 1 and 5):
        <input type="number" name="quantity" min="1" max="5">
        <input type="submit">
    </form>


</main>
<md:footer-md></md:footer-md>

<script>
    var records = ${skills};
    $('#my-final-table').dynatable({
        dataset: {
            records: records,
            perPageDefault: 10,
            perPageOptions: [10, 25, 50, 75, 100]
        },
        inputs: {
            paginationPrev: 'Anterior',
            paginationNext: 'Siguiente',
            perPageText: 'Mostrar: ',
            recordCountText: 'Mostrando-> ',
            processingText: 'Procesando...'
        }
    });

    $('.input').addClass('search_1');

</script>


<script type="text/javascript" src="/js/materialize.min.js"></script>
<script src="/js/scroll.js"></script>
<script type="text/javascript" src="/js/BarraLateralMovil.js"></script>
<script type="text/javascript" src="/js/validador.js"></script>

<script>
    //TODO cuidado con la direccion del websocket, de localhost a skillshare
    //HAy una funcion setTimeout para enviar periodicamente mensajes
    //var ruta = window.location.host;
    var myWS = new WebSocket("ws://skillshare-uji.herokuapp.com/chat/{22}");
    myWS.onopen = (() = > console.log("Guei abierto")
    )
    ;
    window.onbeforeunload = (() = > myWS.close()
    )
    ;
    myWS.onclose = (() = > console.log("Guei cerrado")
    )
    ;
    myWS.onerror = (() = > console.log("Guei error")
    )
    ;
</script>


</body>
</html>
