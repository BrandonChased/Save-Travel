<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body>
    <div class="container">
        <nav class="d-flex justify-content-between align-items-center">
            <h1>Edit Expense</h1>
            <a href="/">Go Back</a>
        </nav>
        <form:form action="/edit/${travel.id}" method="post" modelAttribute="travel">
            <input type="hidden" name="_method" value="put"/>
            <div class="form-group mb-3">
                <form:label path="expense" for="expense">Expense Name </form:label>
                <form:input type="text" class="form-control" path="expense" id="expense" name="expense"/>
                <form:errors path="expense" class="text-danger"/>
            </div>
            <div class="form-group mb-3">
                <form:label path="vendor" for="vendor">Vendor: </form:label>
                <form:input type="text" class="form-control" path="vendor" id="vendor" name="vendor"/>
                <form:errors path="vendor" class="text-danger"/>
            </div>
            <div class="form-group mb-3">
                <form:label path="amount" for="amount">Amount: </form:label>
                <form:input type="number" class="form-control" path="amount" id="amount" name="amount"/>
                <form:errors path="amount" class="text-danger"/>
            </div>
            <div class="form-group mb-3">
                <form:label path="description" for="description">Description: </form:label>
                <form:textarea type="text" class="form-control" path="description" id="description" name="description"></form:textarea>
                <form:errors path="description" class="text-danger"/>
            </div>
            <button class="btn btn-primary">Submit</button>
        </form:form>
    </div>
</body>
</html>