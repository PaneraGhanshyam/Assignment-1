<%-- 
    Document   : customer
    Created on : Aug 18, 2023, 4:15:38 AM
    Author     : ghanshyam
--%>
<%@page import="com.PGVCL.Entities.ErrorMessage"%>
<%@page import="java.util.List"%>
<%@page import="com.PGVCL.Entities.UserData"%>
<%@page import="com.PGVCL.Entities.User"%>
<%@page import="com.PGVCL.Helper.ConnectionProvider"%>
<%@page import="com.PGVCL.Dao.UserDao"%>
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
    
    List<UserData> list=dao.getUserData();
            
 %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Customer</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body style="background-color: #eceff1;">
    <%@include file="auth_nav.jsp" %>
    
    <div class="container mt-5">
        <div class="card-header bg-secondary text-white">
            <b>Customer Data</b>
        </div>
        <div class="row">
            <%
                ErrorMessage m = (ErrorMessage) session.getAttribute("Message");
                if (m != null && (m.getType().equals("userDeleteSuccess") || m.getType().equals("userEditesuccess"))) {
            %>
            <div class="col-12 mt-3">
                <div class="alert alert-success" role="alert">
                    <%= m.getContent() %>
                </div>
            </div>
            <% 
                session.removeAttribute("Message");
                } else if (m != null && (m.getType().equals("userDeleteUnsuccess") || m.getType().equals("userEditeunsuccess"))) {
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
            <% for (UserData userData : list) { %>
            <div class="col-md-4 mb-4">
                <div class="card">
                    <div class="card-header"><h7><b><%= userData.getUsername() %></b></h7></div>
                    <div class="card-body">
                        <p><strong>Id:</strong> <%= userData.getId() %></p>
                        <p><strong>Email:</strong> <%= userData.getEmail() %></p>
                        <p><strong>Address:</strong> <%= userData.getAddress() %></p>
                        <p><strong>Number:</strong> <%= userData.getNumber() %></p>
                        <p><strong>Password:</strong> <%= userData.getPassword() %></p>
                        <p><strong>Type:</strong> <%= userData.getType() %></p>
                        <p><strong>Status:</strong> <%= userData.getStatus() %></p>
                        <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#editModal<%= userData.getId() %>">Edit</button>
                        <a href="DeleteCustomer?id=<%= userData.getId() %>" class="btn btn-danger btn-sm">Delete</a>
                    </div>
                </div>
            </div>
            <!-- Edit Modal -->
            <div class="modal fade" id="editModal<%= userData.getId() %>" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="editModalLabel">Edit User: <%= userData.getUsername() %></h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form id="edit-form" action="EditCustomer" method="POST">
                                <div class="form-group">
                                    <label for="username" style="color: black;">Username</label>
                                    <input type="text" class="form-control" id="username" name="username" value="<%= userData.getUsername() %>" placeholder="Enter username" required>
                                    <div class="invalid-feedback">
                                      Username must contain alphabets, numbers, and special characters.
                                    </div>
                                  </div>
                                  <div class="form-group">
                                    <label for="email" style="color: black;">Email</label>
                                    <input type="email" class="form-control" id="email" name="email" value="<%= userData.getEmail() %>" placeholder="Enter email" required>
                                    <div class="invalid-feedback">
                                      Please enter a valid email address.
                                    </div>
                                  </div>
                                  <div class="form-group">
                                    <label for="number" style="color: black;">Mobile no</label>
                                    <input type="text" class="form-control" id="number" name="number" value="<%= userData.getNumber() %>" placeholder="Enter mobile no" required>
                                    <div class="invalid-feedback">
                                      Please enter a valid mobile number.
                                    </div>
                                  </div>
                                  <div class="form-group">
                                      <label for="address" style="color: black;">Address</label>
                                      <textarea class="form-control" id="address" name="address" placeholder="Enter address" required><%= userData.getAddress() %></textarea>
                                  </div>
                                  <div class="form-group">
                                    <label for="password" style="color: black;">Password</label>
                                    <input type="password" class="form-control" id="password" name="password" value="<%= userData.getPassword() %>" placeholder="Enter password" required>
                                    <div class="invalid-feedback">
                                      Password must contain at least 8 characters, including numbers, alphabets, and special characters.
                                    </div>
                                  </div>
                                  <div class="form-group">
                                    <label for="confirmpassword" style="color: black;">Confirm Password</label>
                                    <input type="password" class="form-control" id="confirmPassword" name="confirmpassword" value="<%= userData.getPassword() %>" placeholder="Confirm password" required>
                                    <div class="invalid-feedback">
                                      Passwords do not match.
                                    </div>
                                  </div>
                                  <label for="status" style="color: black;">Status</label>
                                  <select class="form-control" name="status" id="role" required="">
                                    <option value="deactive">Deactive</option>
                                    <option value="active">Active</option>
                                  </select>
                                  <input type="hidden" name="id" value="<%= userData.getId() %>">
                                  <div class="modal-footer">
                                      <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                      <button type="submit" class="btn btn-primary">Save changes</button>
                                  </div>
                              </form>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </div>

    <script>
    document.addEventListener('DOMContentLoaded', function() {
        const form = document.querySelector('#edit-form'); // Select the form element

        form.addEventListener('submit', function(event) { // Listen for 'submit' event
            const username = document.getElementById('username');
            const email = document.getElementById('email');
            const number = document.getElementById('number');
            const password = document.getElementById('password');
            const confirmPassword = document.getElementById('confirmPassword');

            // Validate form fields
            const isValidUsername = validateUsername(username.value);
            const isValidEmail = validateEmail(email.value);
            const isValidNumber = validateNumber(number.value);
            const isValidPassword = validatePassword(password.value);
            const isValidConfirmPassword = validateConfirmPassword(password.value, confirmPassword.value);

            // If any validation fails, prevent form submission and show validation messages
            if (!isValidUsername || !isValidEmail || !isValidNumber || !isValidPassword || !isValidConfirmPassword) {
                event.preventDefault();

                // Show validation feedback to the user (e.g., adding 'is-invalid' classes)
                if (!isValidUsername) username.classList.add('is-invalid');
                if (!isValidEmail) email.classList.add('is-invalid');
                if (!isValidNumber) number.classList.add('is-invalid');
                if (!isValidPassword) password.classList.add('is-invalid');
                if (!isValidConfirmPassword) confirmPassword.classList.add('is-invalid');
            }
        });

        // Validation functions (same as in your original code)
        function validateUsername(username) {
            const pattern = /^(?=.*[a-zA-Z])(?=.*[0-9])\w+$/;
            return pattern.test(username);
        }

        function validateEmail(email) {
            const pattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            return pattern.test(email);
        }

        function validateNumber(number) {
            const pattern = /^\d{10}$/;
            return pattern.test(number);
        }

        function validatePassword(password) {
            const pattern = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[@#$%^&+=]).{8,}$/;
            return pattern.test(password);
        }

        function validateConfirmPassword(password, confirmPassword) {
            return password === confirmPassword;
        }
    });
</script>


    <!-- Include Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
<% } %>
