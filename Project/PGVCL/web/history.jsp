<%-- 
    Document   : history
    Created on : Aug 19, 2023, 3:50:11 AM
    Author     : ghanshyam
--%>
<%@page import="com.PGVCL.Entities.User"%>
<%@page import="com.PGVCL.Helper.ConnectionProvider"%>
<%@page import="com.PGVCL.Dao.UserDao"%>
<%@page import="java.util.List"%>
<%@page import="com.PGVCL.Entities.BillData"%>
<%
  User user=(User)session.getAttribute("currentUser");
  
  if(user==null)
  {
    response.sendRedirect("login.jsp");
  }
  else if(user.getType().equals("admin"))
  {
    response.sendRedirect("index.jsp");
  }
  else
  {
    UserDao dao=new UserDao(ConnectionProvider.getConnection());
    
    List<BillData> list=dao.getHistory(user.getNumber());
 %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>History</title>
    </head>
    <body>
        <%@include file="user_nav.jsp" %>
    <div class="container mt-5">
        <% if(!(list.isEmpty())){%>
        <div class="card-header bg-secondary text-white">
            <b>History</b>
        </div>
        <div class="row">
            <% for (BillData l : list) { %>
            <div class="col-md-4 mb-4">
                <div class="card">
                    <div class="card-header"><h7><b>Bill no:<%= l.getBill_id() %></b></h7></div>
                    <div class="card-body">
                        <p><strong>User-Id:</strong> <%= l.getU_id() %></p>
                        <p><strong>User Name:</strong> <%= l.getUsername() %></p>
                        <p><strong>Number:</strong> <%= l.getNumber() %></p>
                        <p><strong>Address:</strong> <%= l.getAddress() %></p>
                        <p><strong>Year:</strong> <%= l.getYear() %></p>
                        <p><strong>Month:</strong> <%= l.getMonth() %></p>
                        <p><strong>Amount:</strong> <%= l.getAmount() %></p>
                        <p><strong>Status:</strong> <%= l.getStatus() %></p>
                    </div>
                </div>
            </div>
           <% } %>
        </div>
           <% }else{ %>
           
           <div class="card-header bg-secondary text-white" style="text-align: center">
                    <b>No Bill Found</b>
                 </div>
           <%
              }
           %>
    </div>
    <!-- Bootstrap JS and jQuery -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.min.js"></script>
    </body>
</html>
<% } %>
