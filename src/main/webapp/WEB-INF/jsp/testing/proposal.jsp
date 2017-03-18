<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 17/3/17
  Time: 1:32
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <b:kickstart title="Proposals test"/>
</head>
<body>
<c:forEach items="${propo}" var="prop">
    <p>${prop.nif}</p>
    <p>${prop.skillname}</p>
</c:forEach>

</body>
</html>
