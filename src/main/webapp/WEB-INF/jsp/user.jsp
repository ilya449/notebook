<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
</head>
<body class="container-lg">
<h1>This is a user page</h1>
<br/>
<div>

</div>
<div class="btn-group-vertical">
    <a class="btn-info btn-lg" href="${pageContext.request.contextPath}/">Main page</a>
    <br/>
    <br/>
    <a class="btn-danger btn-lg" href="${pageContext.request.contextPath}/logout">Logout</a>
</div>
</body>
</html>
