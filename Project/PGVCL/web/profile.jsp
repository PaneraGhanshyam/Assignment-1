<%-- 
    Document   : profile
    Created on : Aug 16, 2023, 10:07:32 PM
    Author     : ghanshyam
--%>
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
  else
  {
 %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Profile</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css">
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
        <div class="container mt-5">
          <div class="row justify-content-center">
            <div class="col-md-8">
              <div class="card">
                <div class="card-header" style="background-color: #b0bec5; color: white;">
                    <b>User Information</b>
                </div>
                 <%
                    ErrorMessage m=(ErrorMessage)session.getAttribute("Message");
                    if(m!=null && m.getType().equals("updateSucces"))
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
                      <h6>Name:</h6>
                      <p><%= user.getUsername()%></p>
                    </div>
                    <div class="col-sm-6">
                      <h6>Email:</h6>
                      <p><%= user.getEmail()%></p>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <h6>Mobile Number:</h6>
                      <p>+91 <%= user.getNumber()%></p>
                    </div>
                    <div class="col-sm-6">
                      <h6>Address:</h6>
                      <p><%= user.getAddress()%></p>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <h6>Type:</h6>
                      <p><%= user.getType()%></p>
                    </div>
                    <div class="col-sm-6">
                      <h6>Status:</h6>
                      <p><%= user.getStatus()%></p>
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
                <form id="edit-form" action="EditProfileServlet" method="POST">
                  <div class="form-group">
                      <label for="username" style="color: black;">Username</label>
                      <input type="text" class="form-control" id="username" name="username" value="<%= user.getUsername()%>" placeholder="Enter username" required>
                      <div class="invalid-feedback">
                        Username must contain alphabets,numbers and special character.
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="email" style="color: black;">Email</label>
                      <input type="email" class="form-control" id="email" name="email" value="<%= user.getEmail()%>" placeholder="Enter email" required>
                      <div class="invalid-feedback">
                        Please enter a valid email address.
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="number" style="color: black;">Mobile no</label>
                      <input type="text" class="form-control" id="number" name="number" value="<%= user.getNumber()%>" placeholder="Enter mobile no" required>
                      <div class="invalid-feedback">
                        Please enter a valid mobile number.
                      </div>
                    </div>
                    <div class="form-group">
                        <label for="address" style="color: black;">Address</label>
                        <textarea class="form-control" id="address" name="address" placeholder="Enter address" required><%= user.getAddress()%></textarea>
                    </div>
                    <div class="form-group">
                      <label for="password" style="color: black;">Password</label>
                      <input type="password" class="form-control" id="password" name="password" value="<%= user.getPassword()%>" placeholder="Enter password" required>
                      <div class="invalid-feedback">
                        Password must contain at least 8 characters, including numbers, alphabets, and special characters.
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="confirmpassword" style="color: black;">Confirm Password</label>
                      <input type="password" class="form-control" id="confirmPassword" name="confirmpassword" value="<%= user.getPassword()%>" placeholder="Confirm password" required>
                      <div class="invalid-feedback">
                        Passwords do not match.
                      </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save changes</button>
                    </div>
                </form>
              </div>
            </div>
          </div>
        </div>
  <!-- Bootstrap JS and jQuery -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.min.js"></script>
</body>
</html>
<script>
  document.addEventListener('DOMContentLoaded', function() {
    const form = document.querySelector('#edit-form'); // Select the form element

    form.addEventListener('submit', function(event) { // Listen for 'submit' event
      const username = document.getElementById('username');
      const email = document.getElementById('email');
      const number = document.getElementById('number');
      const password = document.getElementById('password');
      const confirmPassword = document.getElementById('confirmPassword');

      const isValidUsername = validateUsername(username.value);
      const isValidEmail = validateEmail(email.value);
      const isValidNumber = validateNumber(number.value);
      const isValidPassword = validatePassword(password.value);
      const isValidConfirmPassword = validateConfirmPassword(password.value, confirmPassword.value);

      if (!isValidUsername) {
        event.preventDefault();
        username.classList.add('is-invalid');
      }

      if (!isValidEmail) {
        event.preventDefault();
        email.classList.add('is-invalid');
      }

      if (!isValidNumber) {
        event.preventDefault();
        number.classList.add('is-invalid');
      }

      if (!isValidPassword) {
        event.preventDefault();
        password.classList.add('is-invalid');
      }

      if (!isValidConfirmPassword) {
        event.preventDefault();
        confirmPassword.classList.add('is-invalid');
      }
    });

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
<% } %>
 