<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 23/4/17
  Time: 17:36
--%>
<%@attribute name="name" required="false" %>
<%@attribute name="type" required="false" %>
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

    header, main, footer {
        padding-left: 300px;
    }

    @media only screen and (max-width: 992px) {
        header, main, footer {
            padding-left: 0;
        }
    }
</style>

<ul id="slide-out" class="side-nav fixed">
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
                <a href="#!user"><img class="circle" src="/images/profile/pablo.png"></a>
                <a href="#${pageContext.request.contextPath}/login/login.html">
                    <span class="blue-text lighten-1">${name}</span></a>
                <a href="#${pageContext.request.contextPath}/login/login.html">
                    <span class="blue-text lighten-1 name">${type}</span></a>
                <a href="${pageContext.request.contextPath}/login/logout.html">
                        <span class="blue-grey-text darken-2">
                            Salir
                        </span>
                </a>
            </c:if>
        </div>
    </li>
    <li><a class="subheader">Herramientas</a></li>

    <div class="light-blue lighten-3">
        <jsp:doBody/>
    </div>

</ul>


<%--<li><a href="#!"><i class="material-icons">cloud</i>First Link With Icon</a></li>--%>

<%--<li><a href="#!">Second Link</a></li>--%>
<%--<li>--%>
<%--<div class="divider"></div>--%>
<%--</li>--%>

<%--<li><a class="waves-effect" href="#!">Third Link With Waves</a></li>--%>


<script>
    $(".button-collapse").sideNav();
</script>