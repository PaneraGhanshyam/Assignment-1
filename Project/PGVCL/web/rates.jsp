<%-- 
    Document   : rates
    Created on : Aug 16, 2023, 04:07:32 AM
    Author     : ghanshyam
--%>
<%@page import="com.PGVCL.Dao.UserDao"%>
<%@page import="com.PGVCL.Helper.ConnectionProvider"%>
<%@page import="com.PGVCL.Entities.Rates"%>
<%@page import="com.PGVCL.Entities.ErrorMessage"%>
<%@page import="com.PGVCL.Entities.User"%>
<%@page import="java.sql.*" %>
<%@page errorPage="error_page.jsp" %>
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
    UserDao dao=new UserDao(ConnectionProvider.getConnection());
            
    Rates rates=dao.getRates();
 %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Rates</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css">
</head>
<body style="background-color: #eceff1;">
       <%@include file="auth_nav.jsp" %>
        <div class="container mt-5">
          <div class="row justify-content-center">
            <div class="col-md-8">
              <div class="card">
                <div class="card-header" style="background-color: #b0bec5; color: white;">
                    <b>Rate information</b>
                </div>
                 <% 
                    ErrorMessage m=(ErrorMessage)session.getAttribute("Message");
                    if(m!=null && m.getType().equals("rateUpdateSucces"))
                    {
                 %>
                
                        <div class="alert alert-success" role="alert">
                            <%= m.getContent() %>
                        </div>
                 <%  session.removeAttribute("Message");
                    }
                 %>
                <div class="card-body" style="">
                  <div class="row">
                    <div class="col-sm-6">
                      <h6>Units:</h6>
                    </div>
                    <div class="col-sm-6">
                      <h6>Rate/Unit</h6>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                        <h6>Unit Less Than 100:</h6>
                    </div>
                    <div class="col-sm-6">
                      <p><%= rates.getUnit_Less_Than_Hundread()%></p>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <h6>Unit Between 100 and 200:</h6>
                    </div>
                    <div class="col-sm-6">
                      <p><%= rates.getUnit_Between_Hundread_To_Two_Hundread()%></p>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <h6>Unit Between 200 and 300:</h6>
                    </div>
                    <div class="col-sm-6">
                      <p><%= rates.getUnit_Between_Two_Hundread_to_Three_Hundread()%></p>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <h6>Unit Greater Than 300:</h6>
                    </div>
                    <div class="col-sm-6">
                      <p><%= rates.getUnit_Greater_Than_Three_Hundread()%></p>
                    </div>
                  </div>
                  <div class="row mt-3">
                    <div class="col text-center">
                      <button type="button" class="btn btn-primary" style="padding-left: 50px; padding-right: 50px" data-toggle="modal" data-target="#editModal">Edit</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>                 
                    
        <!-- Edit Modal -->
        <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="editModalLabel">Edit User Information</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <form action="EditRatesServlet" method="POST" onsubmit="return validateForm();">
                    <div class="form-group">
                      <label for="unitLessHundred">Unit Less Than 100:</label>
                      <input type="text" class="form-control" id="unitLessHundred" name="unitLessHundred" value="<%= rates.getUnit_Less_Than_Hundread() %>" required>
                    </div>
                    <div class="form-group">
                      <label for="unitBetweenHundredTwoHundred">Unit Between 100 and 200:</label>
                      <input type="text" class="form-control" id="unitBetweenHundredTwoHundred" name="unitBetweenHundredTwoHundred" value="<%= rates.getUnit_Between_Hundread_To_Two_Hundread() %>" required>
                    </div>
                    <div class="form-group">
                      <label for="unitBetweenTwoHundredThreeHundred">Unit Between 200 and 300:</label>
                      <input type="text" class="form-control" id="unitBetweenTwoHundredThreeHundred" name="unitBetweenTwoHundredThreeHundred" value="<%= rates.getUnit_Between_Two_Hundread_to_Three_Hundread() %>" required>
                    </div>
                    <div class="form-group">
                      <label for="unitGreaterThanThreeHundred">Unit Greater Than 300:</label>
                      <input type="text" class="form-control" id="unitGreaterThanThreeHundred" name="unitGreaterThanThreeHundred" value="<%= rates.getUnit_Greater_Than_Three_Hundread() %>" required>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                      <button type="submit" class="btn btn-primary">Save Changes</button>
                    </div>
                  </form>        
              </div>
            </div>
          </div>
        </div>
                    
       <script>
            function validateForm() {
                var unitLessHundred = document.getElementById("unitLessHundred").value;
                var unitBetweenHundredTwoHundred = document.getElementById("unitBetweenHundredTwoHundred").value;
                var unitBetweenTwoHundredThreeHundred = document.getElementById("unitBetweenTwoHundredThreeHundred").value;
                var unitGreaterThanThreeHundred = document.getElementById("unitGreaterThanThreeHundred").value;

                if (!isNumeric(unitLessHundred) || !isNumeric(unitBetweenHundredTwoHundred) || !isNumeric(unitBetweenTwoHundredThreeHundred) || !isNumeric(unitGreaterThanThreeHundred)) {
                    alert("Please enter valid numeric values for rates.");
                    return false;
                }
                return true;
            }

            function isNumeric(value) {
                return /^-?\d+$/.test(value);
            }
        </script>

  <!-- Bootstrap JS and jQuery -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.min.js"></script>
</body>
</html>
<% } %>
 