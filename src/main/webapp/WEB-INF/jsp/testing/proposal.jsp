<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 17/3/17
  Time: 1:32
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://bootstrapjsp.org/" prefix="b" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <b:kickstart title="Proposals test"/>
</head>
<body>
<c:forEach items="${propo}" var="prop">
    <b:list>
        <b:listItem>${prop.nif}</b:listItem>
        <b:listItem>${prop.skillName}</b:listItem>
    </b:list>
</c:forEach>

</body>
</html>
