<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 15/3/17
  Time: 21:33
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Testing SkillDAO Class</title>

</head>
<body>
<%--@elvariable id="listSkills" type="java.util.List"--%>
<c:forEach items="${listSkills}" var="skills">
    <p>${skills.name} - ${skills.level}</p>
    <p>${skills.description}</p>

</c:forEach>
</body>
</html>
