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
    <title>Show</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body>
    <div class="container p-10">
        <nav class="my-5 d-flex justify-content-between align-items-center">
            <h1>Expense Details</h1>
            <a href="/">Go back</a>
        </nav>
        <div>
            <div class="d-flex flex-row justify-content-between mb-3 mx-5">
                <h4>Expense Name:</h4>
                <h4>${travel.expense}</h4>
            </div >
            <div class="d-flex flex-row justify-content-between mb-3 mx-5">
                <h4>Expense Description:</h4>
                <h4>${travel.description}</h4>
            </div>
            <div class="d-flex flex-row justify-content-between mb-3 mx-5">
                <h4>Vendor:</h4>
                <h4>${travel.vendor}</h4>
            </div> 
            <div class="d-flex flex-row justify-content-between mb-3 mx-5">
                <h4>Amount Spent:</h4>
                <h4>$${travel.amount}</h4>
            </div>
        </div>
    </div>
</body>
</html>