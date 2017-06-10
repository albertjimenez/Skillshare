<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 23/4/17
  Time: 17:36
--%>
<%@attribute name="name" required="false" %>
<%@attribute name="type" required="false" %>
<%@attribute name="cp" required="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    body {
        display: flex;
        min-height: 100vh;
        flex-direction: column;
    }

    main {
        flex: 1 0 auto;
    }

</style>

<ul id="slide-out" class="side-nav">
    <li>
        <div class="userView">
            <div class="background">
                <img src="/images/material.jpg">
            </div>

            <c:if test="${empty name}">
                <a href="${pageContext.request.contextPath}/login/login.html">Entrar</a>
                <a href="${pageContext.request.contextPath}/register/register.html">Registrarse</a>
            </c:if>
            <c:if test="${not empty name}">
                <a href="#!user"><img class="circle responsive-img " src="/images/profile-picture.png"></a>
                <a href="#${pageContext.request.contextPath}/login/login.html">
                    <span class="blue-text lighten-1">${name}</span></a>
                <a href="#${pageContext.request.contextPath}/login/login.html">
                    <span class="blue-text lighten-1 name">${type}</span></a>


            </c:if>
            <c:if test="${not empty cp}">
                <a class="waves-effect" href="${pageContext.request.contextPath}/banned/ban.html">
                    <i class="material-icons">warning</i>Listado de baneados</a>
                <a class="waves-effect" href="${pageContext.request.contextPath}/home/home_pc.html">
                    Listado de Habilidades</a>
            </c:if>

            <c:if test="${not empty name}">
                <a href="${pageContext.request.contextPath}/login/logout.html">
                    <span class="red-text darken-2">Salir</span>
                </a>
            </c:if>

        </div>
    </li>

    <c:if test="${not empty name}">
        <li><a class="subheader">Herramientas</a></li>
    </c:if>
    <div class="light-blue lighten-3">

        <%--<jsp:doBody/>--%>
        <c:if test="${not empty name}">

            <li>
                <a class="waves-effect" href="${pageContext.request.contextPath}/home/home_pc.html">Mi Area</a>
            </li>
            <li>
                <a class="waves-effect" href="${pageContext.request.contextPath}/proposal/list.html">Mis Ofertas</a>
            </li>
            <li>
                <a class="waves-effect" href="${pageContext.request.contextPath}/request/list.html">Mis Demandas</a>
            </li>
            <li>
                <a class="waves-effect" href="${pageContext.request.contextPath}/collaboration/list.html">Mis
                    colaboraciones</a>
            </li>
            <li>
                <a class="waves-effect" href="${pageContext.request.contextPath}/proposal/all.html">Ofertas de la
                    comunidad</a>
            </li>
            <li>
                <a class="waves-effect" href="${pageContext.request.contextPath}/request/all.html">Demandas
                    de la comunidad</a>
            </li>
            <li>
                <a href="#modal-help" class="waves-effect"><i class="material-icons">live_help</i>Ayuda</a>
            </li>

            <script>
                $(document).ready(function () {
                    // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
                    $('.modal').modal();
                });
            </script>


        </c:if>
    </div>

</ul>

<div class="modal" id="modal-help">
    <div class="modal-content cyan lighten-4 hoverable z-depth-5">
        <h5 class="font-raleway">Bienvenido</h5>
        <p>Hola ${name}, en el panel blanco de la izquierda puedes ver todas las
            herramientas de las que puedes hacer uso.</p>
        <p>Disfruta ayudando y aprendiendo con el resto de la comunidad universitaria.</p>
    </div>
</div>
<%--<li><a href="#!"><i class="material-icons">cloud</i>First Link With Icon</a></li>--%>

<%--<li><a href="#!">Second Link</a></li>--%>
<%--<li>--%>
<%--<div class="divider"></div>--%>
<%--</li>--%>

<%--<li><a class="waves-effect" href="#!">Third Link With Waves</a></li>--%>


<script>
    $(".button-collapse").sideNav();
</script>