<%-- 
    Document   : generate_bill
    Created on : Aug 18, 2023, 10:09:30 PM
    Author     : ghanshyam
--%>
<%@page import="com.PGVCL.Entities.ErrorMessage"%>
<%@page import="java.util.List"%>
<%@page import="com.PGVCL.Helper.ConnectionProvider"%>
<%@page import="com.PGVCL.Entities.UserData"%>
<%@page import="com.PGVCL.Dao.UserDao"%>
<%@page import="com.PGVCL.Entities.User"%>
<%
  User user=(User)session.getAttribute("currentUser");
  
  if(user==null)
  {
    response.sendRedirect("login.jsp");
  }
  else if(user.getType().equals("user"))
  {
    response.sendRedirect("index.jsp");
  }
  else
  {         
 %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Generate Bill</title>
        
        <!-- Include Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body style="background-color: #eceff1;">
        <%@include file="auth_nav.jsp" %>
        
        <div class="modal-body">
            <form id="edit-form" action="userFound" method="POST">
                <div class="form-group">
                    <label for="u_id" style="color: black;">User-Id:</label>
                    <input type="text" class="form-control" id="u_id" name="u_id" placeholder="Enter user-id" required>
                </div>
                    <button type="submit" name="submit" value="submit" class="btn btn-primary btn-block">Search</button>
            </form>
            <% 
                ErrorMessage m = (ErrorMessage) session.getAttribute("Message");
                if (m != null && (m.getType().equals("generateSuccess")))
                {
            %>
                <div class="col-12 mt-3">
                    <div class="alert alert-success" role="alert">
                        <%= m.getContent() %>
                    </div>
                </div>
            <%
                session.removeAttribute("Message");
                } else if (m != null && (m.getType().equals("generationUnsuccess"))){
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
            <% 
                if (m != null && (m.getType().equals("userFound"))) {
                    UserDao dao=new UserDao(ConnectionProvider.getConnection());
                    List<UserData> list=dao.getUserData();
                    int u_id=Integer.parseInt(m.getContent());
                    String username="";
                    String number="";
                    String address=""; 
                    for(UserData l:list)
                    {
                        if(l.getId()==u_id)
                        {
                           username=l.getUsername();
                           number=l.getNumber();
                           address=l.getAddress();
                           
                        }
                    }
            %>
                <form id="edit-form" action="generateBill" method="POST">
                <div class="form-group">
                    <label for="u_id" style="color: black;">User-Id:</label>
                    <input type="text" class="form-control" id="u_id" name="u_id" value="<%= u_id %>" disabled>
                    <input type="hidden" name="u_id" value="<%= u_id %>">
                </div>
                <div class="form-group">
                    <label for="username" style="color: black;">Username:</label>
                    <input type="text" class="form-control" id="username" name="username" value="<%= username %>" disabled>
                    <input type="hidden" name="username" value="<%= username %>">
                </div>
                <div class="form-group">
                    <label for="number" style="color: black;">Number:</label>
                    <input type="text" class="form-control" id="number" name="number" value="<%= number %>" disabled>
                    <input type="hidden" name="number" value="<%= number %>">
                </div>
                <div class="form-group">
                    <label for="address" style="color: black;">Address:</label>
                    <input type="text" class="form-control" id="address" name="address" value="<%= address %>" disabled>
                    <input type="hidden" name="address" value="<%= address %>">
                </div>
                <div class="form-group">
                    <label for="unit" style="color: black;">Unit:</label>
                    <input type="text" class="form-control" id="unit" name="unit" placeholder="Enter here" required>
                </div>
                <div class="form-group">
                    <label for="dues" style="color: black;">Any dues:</label>
                    <input type="text" class="form-control" id="dues" name="dues" placeholder="Enter here" required>
                </div>
                <div class="form-group">
                    <label for="year:" style="color: black;">Year:</label>
                    <select class="form-control" name="year" required="">
                        <option value="2023" selected>2023</option>
                        <option value="2024">2024</option>
                        <option value="2025">2025</option>
                        <option value="2026">2026</option>
                        <option value="2027">2027</option>
                        <option value="2028">2028</option>
                        <option value="2029">2029</option>
                        <option value="2030">2030</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="month:" style="color: black;">Month:</label>
                    <select class="form-control" name="month" required="">
                        <option value="january" selected>January</option>
                        <option value="february">February</option>
                        <option value="march">March</option>
                        <option value="april">April</option>
                        <option value="may">May</option>
                        <option value="june">June</option>
                        <option value="july">July</option>
                        <option value="august">August</option>
                        <option value="september">September</option>
                        <option value="october">October</option>
                        <option value="november">November</option>
                        <option value="december">December</option>
                    </select>
                </div>
                    <button type="submit" name="submit" value="submit" class="btn btn-primary btn-block">Generate</button>
                </form>
            
            <% 
                session.removeAttribute("Message");
                } else if (m != null && (m.getType().equals("userNotFound"))){
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
        
        <!-- Include Bootstrap JS and jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
<% } %>
