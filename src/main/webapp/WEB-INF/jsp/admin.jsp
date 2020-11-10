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
        <form class="row h-30 p-3 shadow-sm form-group"
              method="post" action="${pageContext.request.contextPath}/admin/update/${contact.id}" modelAttribute="contact">
            <div class="col-md-3 display-1 block">
                <img src="src/main/webapp/WEB-INF/1.jpg">
            </div>
            <div class="col-md-9">
                <div class="row form-group">
                    <div class="p-2">
                        <label>Name</label>
                        <input type="text" name="name" minlength="1" value="${contact.name}">
                    </div>
                    <div class="p-2">
                        <label>Surname</label>
                        <input type="text" name="surname" value="${contact.surname}">
                    </div>
                    <div class="p-2">
                        <label>Phone number</label>
                        <input type="text" name="phoneNumber" minlength="3" maxlength="13" value="${contact.phoneNumber}">
                    </div>
                    <div class="btn-toolbar row small">
                        <button class="col btn-success btn-sm ml-5" type="submit">Update contact</button>
                        <a href="${pageContext.request.contextPath}/admin/delete/${contact.id}"
                           class="col btn-danger btn-sm text-uppercase text-decoration-none ml-5 alert">Delete contact</a>
                    </div>
                    <input type="file" class="small" name="photo" accept="image/jpeg,image/png,image/jpg">
                </div>
            </div>
<%--        </div>--%>
        </form>
    </c:forEach>
</div>
<br/>
<%--creating new contacts--%>
<h4>Create new contact</h4>
<form class="row border w-100"
      method="post" action="${pageContext.request.contextPath}/admin/create" modelAttribute="contact">
    <div class="form-group">
        <label>Name
            <input type="text" name="name" minlength="1">
        </label>
    </div>
    <div class="form-group ml-2">
        <label>Surname
            <input type="text" name="surname">
        </label>
    </div>
    <div class="form-group">
        <label>Phone number
            <input type="text" name="phoneNumber" maxlength="13">
        </label>
    </div>
    <div class="form-group">
        <input type="file" class="small ml-5" name="photo" accept="image/png,image/jpg,image/jpeg">
    </div>
    <br/>
    <button class="btn-success btn ml-auto" type="submit">Create</button>
</form>

<div class="btn-toolbar row">
    <a class="btn-info btn-lg" href="${pageContext.request.contextPath}/">Main page</a>
    <br/>
    <a class="btn-danger btn-lg ml-5" href="${pageContext.request.contextPath}/logout">Logout</a>
</div>
</body>
</html>
