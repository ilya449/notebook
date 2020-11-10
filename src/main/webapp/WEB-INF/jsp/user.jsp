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
<div class="container h-100 border pre-scrollable">
    <c:forEach var="contact" items="${contacts}">
        <div class="row h-40 p-3 shadow-sm">
            <div class="col-md-2">
                <img src="">
            </div>
            <div class="col-md-10">
                <div class="row">
                    <div class="form-group p-2">
                        <label>Name</label>
                        <input readonly value="${contact.name}">
                    </div>
                    <div class="form-group p-2">
                        <label>Surname</label>
                        <input readonly value="${contact.surname}">
                    </div>
                    <div class="form-group p-2">
                        <label>Phone number</label>
                        <input readonly value="${contact.phoneNumber}">
                    </div>
                </div>
            </div>
        </div>
        </c:forEach>
</div>
<br/>
<div class="btn-group-vertical">
    <a class="btn-info btn-lg" href="${pageContext.request.contextPath}/">Main page</a>
    <br/>
    <br/>
    <a class="btn-danger btn-lg" href="${pageContext.request.contextPath}/logout">Logout</a>
</div>
</body>
</html>
