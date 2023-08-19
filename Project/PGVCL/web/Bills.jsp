<%-- 
    Document   : Bills
    Created on : Aug 19, 2023, 2:38:28 AM
    Author     : ghanshyam
--%>
<%@page import="com.PGVCL.Entities.ErrorMessage"%>
<%@page import="java.util.List"%>
<%@page import="com.PGVCL.Entities.BillData"%>
<%@page import="com.PGVCL.Entities.User"%>
<%@page import="com.PGVCL.Helper.ConnectionProvider"%>
<%@page import="com.PGVCL.Dao.UserDao"%>
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
    
    List<BillData> list=dao.getBillData(user.getNumber());
 %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bill Data</title>
    </head>
    <body>
        <%@include file="user_nav.jsp" %>
    <div class="container mt-5">
        <% if(!(list.isEmpty())){%>
        <div class="card-header bg-secondary text-white">
            <b>Bill Data</b>
        </div>
        <div class="row">
            <%
                ErrorMessage m = (ErrorMessage) session.getAttribute("Message");
                if (m != null && (m.getType().equals("paidSuccess"))) {
            %>
            <div class="col-12 mt-3">
                <div class="alert alert-success" role="alert">
                    <%= m.getContent() %>
                </div>
            </div>
            <% 
                session.removeAttribute("Message");
                } else if (m != null && (m.getType().equals("paidUnsuccess"))) {
            %>
            <div class="col-12 mt-3">
                <div class="alert alert-danger" role="alert">
                    <%= m.getContent() %>
                </div>
            </div>
            <% 
                session.removeAttribute("Message");
                } 
            %>
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
                        <a href="PayBill?id=<%= l.getBill_id() %>" class="btn btn-success btn-sm">Pay</a>
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
