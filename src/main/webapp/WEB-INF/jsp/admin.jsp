<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
</head>
<body class="container-lg">
<h1>This is an admin page</h1>
<h3 style="color: green">${message}</h3>
<br/>

<div class="container h-100 w-80 border pre-scrollable">
    <c:forEach var="contact" items="${contacts}">
        <form class="row h-35 p-3 shadow-sm form-group"
              method="post" action="${pageContext.request.contextPath}/admin/update/${contact.id}" modelAttribute="contact">
            <div class="col-md-2">
                    <%--                <c:out value="${contact.photo}"/>--%>
                <label>Here will be a photo</label>
            </div>
            <div class="col-md-10">
                <div class="row">
                    <div class="form-group p-2">
                        <label>Name</label>
                        <input type="text" name="name" minlength="1" value="${contact.name}">
                    </div>
                    <div class="form-group p-2">
                        <label>Surname</label>
                        <input type="text" name="surname" value="${contact.surname}">
                    </div>
                    <div class="form-group p-2">
                        <label>Phone number</label>
                        <input type="text" name="phoneNumber" minlength="10" maxlength="13" value="${contact.phoneNumber}">
                    </div>
                    <div class="btn-toolbar row w-50">
                        <button class="col btn-success btn-sm ml-5" type="submit">Update user</button>
                        <a href="${pageContext.request.contextPath}/admin/delete/${contact.id}"
                        class="col btn-danger btn-sm text-center text-uppercase text-decoration-none ml-5">delete user</a>
                    </div>
                </div>
            </div>
<%--        </div>--%>
        </form>
    </c:forEach>
</div>
<br/>
<%--creating new contacts--%>
<h4>Create new contact</h4>
<form class="row border w-75"
      method="post" action="${pageContext.request.contextPath}/admin/create" modelAttribute="contact">
    <div class="form-group">
        <label>Input name
            <input type="text" name="name" minlength="1">
        </label>
    </div>
    <div class="form-group">
        <label>Input surname
            <input type="text" name="surname" minlength="1">
        </label>
    </div>
    <div class="form-group">
        <label>Input phone number
            <input type="text" name="phoneNumber" maxlength="13">
        </label>
    </div>
    <br/>
    <button class="btn-success btn-lg ml-auto" type="submit">Create</button>
</form>

<div class="btn-toolbar row">
    <a class="btn-info btn-lg" href="${pageContext.request.contextPath}/">Main page</a>
    <br/>
    <a class="btn-danger btn-lg ml-5" href="${pageContext.request.contextPath}/logout">Logout</a>
</div>
</body>
</html>
