<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 15/3/17
  Time: 21:33
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://bootstrapjsp.org/" prefix="b" %>

<html>
<head>
    <%--<title>Testing SkillDAO Class</title>--%>
    <b:kickstart title="Testing SkillDAO Class"/>
</head>
<body>
<%--@elvariable id="listSkills" type="java.util.List"--%>
<c:forEach items="${listSkills}" var="skills">
    <%--<p>${skills.name} - ${skills.level}</p>--%>
    <%--<p>${skills.description}</p>--%>
    <b:list>
        <b:listItem>${skills.name} - ${skills.level}</b:listItem>
        <b:listItem>${skills.description}</b:listItem>
        <b:listItem>--------------------------</b:listItem>
    </b:list>
</c:forEach>
</body>
</html>
