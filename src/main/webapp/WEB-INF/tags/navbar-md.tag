<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 17/4/17
  Time: 14:29
--%>
<%--Inicio del navbar con movil--%>
<%@attribute name="name" required="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="navbar">
    <nav>
        <div class="nav-wrapper light-blue">
            <%--Si se pone fija la barra, la barra de movil no va --%>

            <a class="brand-logo center" href="${pageContext.request.contextPath}/">
                <img src="${pageContext.request.contextPath}/images/icono_app.png"
                     class="responsive-img z-depth-2" alt="" width="40" height="40">
                Skillshare EI1027
            </a>
            <a href="#" data-activates="mobile-demo" class="button-collapse">
                <i class="material-icons ">menu</i>
            </a>
            <%--Esto es la cabecera de arriba--%>
            <ul class="right hide-on-med-and-down">
                <c:if test="${empty name}">
                    <li><a href="${pageContext.request.contextPath}/login/login.html">Entrar</a></li>
                </c:if>
                <c:if test="${not empty name}">
                    <li><a href="${pageContext.request.contextPath}/login/login.html">${name}</a></li>
                </c:if>
                <li><a href="${pageContext.request.contextPath}/register/register.html">Registrarse</a></li>
            </ul>
            <%--Esto es la cabecera movil--%>
            <ul class="side-nav" id="mobile-demo">
                <c:if test="${empty name}">
                    <li><a href="${pageContext.request.contextPath}/login/login.html">Entrar</a></li>
                </c:if>
                <c:if test="${not empty name}">
                    <li><a href="${pageContext.request.contextPath}/login/login.html">${name}</a></li>
                </c:if>
                <li><a href="${pageContext.request.contextPath}/register/register.html">Registrarse</a></li>

            </ul>
        </div>
    </nav>
</div>
