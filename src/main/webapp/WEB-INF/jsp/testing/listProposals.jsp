<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 16/3/17
  Time: 1:12
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>Lista de propuestas</title>
</head>
<body>
<c:forEach items="${proposalsList}" var="prop">
    <p>${prop.nif}</p>
    <p>${prop.skillname}</p>
</c:forEach>
</body>
</html>
