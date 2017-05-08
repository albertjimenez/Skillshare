<%--
  Created by IntelliJ IDEA.
  User: Beruto and Pablo Berbel for EI1027
  Date: 7/5/17
  Time: 20:49
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
    <title>Upload File Request Page</title>
</head>
<body>
<form method="POST" action="/home/upload.html" enctype="multipart/form-data">
    File to upload: <input type="file" name="file">

    Name: <input type="text" name="name">


    <input type="submit" value="Upload"> Press here to upload the file!
</form>
</body>
</html>