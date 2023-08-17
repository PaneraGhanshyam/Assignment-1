<%-- 
    Document   : error_page
    Created on : Aug 15, 2023, 3:55:27 AM
    Author     : ghanshyam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Sorry! Something went wrong.</title>
</head>
<body>
    <div class="container text-center">
        <img src="img/warning.png" class="img-fluid">
        <h3 class="display-3">Sorry! Something went wrong...</h3>
        <%= exception %><br/>
        <a href="index.jsp" class="btn btn-primary btn-lg text-white mt-3">Home</a>
    </div>
</body>
</html>
