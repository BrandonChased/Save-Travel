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
    <title>Home</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body>
    <div class="container">
        <h1 class="display-3">Save Travels</h1>
        <table class="table table-striped">
            <thead>
                <th>Expense</th>
                <th>Vendor</th>
                <th>Amount</th>
                <th>Actions</th>
            </thead>
            <c:forEach var="travel" items="${travels}">
            <tr>
                <td><a href="travels/${travel.id}">${travel.expense}</a></td>
                <td>${travel.vendor}</td>
                <td>$${travel.amount}</td>
                <td class="d-flex">
                    <a class="btn btn-warning" href="/travels/edit/${travel.id}">Edit</a>
                    <form action="/travels/${travel.id}" method="post">
                        <input type="hidden" name="_method" value="delete">
                        <input class="btn btn-danger" type="submit" value="Delete">
                    </form>
                </td>
            </tr>
            </c:forEach>
        </table>
        <h2 class="display-6">Add an Expense:</h2>
        <form:form action="/travels" method="post" modelAttribute="travel">
            <div class="form-group">
                <form:label path="expense" for="expense">Expense Name </form:label>
                <form:errors path="expense"/>
                <form:input type="text" class="form-control" path="expense" id="expense" name="expense"/>
            </div>
            <div class="form-group">
                <form:label path="vendor" for="vendor">Vendor: </form:label>
                <form:errors path="vendor"/>
                <form:input type="text" class="form-control" path="vendor" id="vendor" name="vendor"/>
            </div>
            <div class="form-group">
                <form:label path="amount" for="amount">Amount: </form:label>
                <form:input type="number" class="form-control" path="amount" id="amount" name="amount"/>
            </div>
            <div class="form-group">
                <form:label path="description" for="description">Description: </form:label>
                <form:errors path="description"/>
                <form:textarea type="text" class="form-control" path="description" id="description" name="description"></form:textarea>
            </div>
            <button class="btn btn-primary">Submit</button>
        </form:form>
    </div>
</body>
</html>