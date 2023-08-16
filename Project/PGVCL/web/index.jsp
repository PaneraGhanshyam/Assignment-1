<%-- 
    Document   : index
    Created on : Aug 13, 2023, 8:32:25 PM
    Author     : ghanshyam
--%>
<%
  User user=(User)session.getAttribute("currentUser");
  
  if(user==null)
  {
    response.sendRedirect("login.jsp");
  }
  else
  {
 %>
<%@page import="com.PGVCL.Entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Home</title>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<body style="background-color: #eceff1;">
<% 
    if(user.getType().equals("admin"))
    {
%>
        <%@include file="auth_nav.jsp" %>
<%  }
    else
    {
%>      
        <%@include file="user_nav.jsp" %>
<%  } %>

    <!-- Banner Section -->
    <section class="jumbotron text-center" style="background-color: #546e7a; color: white;">
      <div class="container">
        <h1 class="display-4">Providing Reliable Electrical Solutions</h1>
        <p class="lead">We specialize in delivering high-quality electrical services for homes and businesses.</p>
      </div>
    </section>

    <!-- Services Section -->
    <section id="services" class="py-5" style="background-color: #b0bec5;">
      <div class="container">
        <div class="row">
          <!-- Residential Services -->
          <div class="col-md-4 col-sm-6">
            <div class="card mb-4">
              <div class="card-body">
                <h4 class="card-title">Residential Services</h4>
                <p class="card-text">From wiring to installations, we have your home's electrical needs covered.</p>
              </div>
            </div>
          </div>
          <!-- Commercial Services -->
          <div class="col-md-4 col-sm-6">
            <div class="card mb-4">
              <div class="card-body">
                <h4 class="card-title">Commercial Services</h4>
                <p class="card-text">Efficient and reliable electrical solutions for businesses of all sizes.</p>
              </div>
            </div>
          </div>
          <!-- Emergency Repairs -->
          <div class="col-md-4 col-sm-6">
            <div class="card mb-4">
              <div class="card-body">
                <h4 class="card-title">Emergency Repairs</h4>
                <p class="card-text">24/7 emergency repair services to keep your power up and running.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- JavaScript Dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
<% } %>