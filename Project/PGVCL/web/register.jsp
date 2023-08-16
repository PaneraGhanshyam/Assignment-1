<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Registration</title>
  
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css">
  <style>
    .is-invalid {
      border-color: red !important;
    }
  </style>
</head>
<body style="min-height: 100vh; background-color: #343a40; color: white;">

<div class="container mt-5">
  <div class="row justify-content-center">
    <div class="col-md-6">
      <div class="card" style="background-color: #546e7a; border-radius: 10px;">
        <div class="card-header">
          Registration
        </div>
        <div class="card-body" style="background-color: #b0bec5; border-radius: 10px;">
          <form id="reg-form" action="RegisterServlet" method="POST">
            <div class="form-group">
              <label for="username" style="color: black;">Username</label>
              <input type="text" class="form-control" id="username" name="username" placeholder="Enter username" required>
              <div class="invalid-feedback">
                Username must contain alphabets and numbers, and be at least 6 characters long.
              </div>
            </div>
            <div class="form-group">
              <label for="email" style="color: black;">Email</label>
              <input type="email" class="form-control" id="email" name="email" placeholder="Enter email" required>
              <div class="invalid-feedback">
                Please enter a valid email address.
              </div>
            </div>
            <div class="form-group">
              <label for="number" style="color: black;">Mobile no</label>
              <input type="text" class="form-control" id="number" name="number" placeholder="Enter mobile no" required>
              <div class="invalid-feedback">
                Please enter a valid mobile number.
              </div>
            </div>
            <div class="form-group">
              <label for="address" style="color: black;">Address</label>
              <textarea class="form-control" id="address" name="address" placeholder="Enter address" required></textarea>
            </div>
            <div class="form-group">
              <label for="password" style="color: black;">Password</label>
              <input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required>
              <div class="invalid-feedback">
                Password must contain at least 8 characters, including numbers, alphabets, and special characters.
              </div>
            </div>
            <div class="form-group">
              <label for="confirmpassword" style="color: black;">Confirm Password</label>
              <input type="password" class="form-control" id="confirmPassword" name="confirmpassword" placeholder="Confirm password" required>
              <div class="invalid-feedback">
                Passwords do not match.
              </div>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Register</button>
          </form>
        </div>
        <div class="card-footer text-center" style="color: white;">
          Already have an account? <a href="login.jsp" style="color: #80d8ff;">Login</a>
        </div>
      </div>
    </div>
  </div>
</div>

<script>
  document.addEventListener('DOMContentLoaded', function() {
    const form = document.querySelector('form');

    form.addEventListener('submit', function(event) {
      const username = document.getElementById('username');
      const email = document.getElementById('email');
      const number = document.getElementById('number'); // Get number input element
      const password = document.getElementById('password'); // Get password input element
      const confirmPassword = document.getElementById('confirmPassword'); // Get confirm password input element

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
      const pattern = /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,}$/;
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
<!-- Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.min.js"></script>
</body>
</html>
<%
boolean registrationSuccess = request.getAttribute("registrationSuccess") != null && (boolean) request.getAttribute("registrationSuccess");
boolean check=true;
if (registrationSuccess==check && request.getAttribute("registrationSuccess") != null) 
{
%>
    <script>
        alert("Registration successful");
        window.location.replace("login.jsp");
    </script>
<%
}
else if(registrationSuccess!=check && request.getAttribute("registrationSuccess") != null)
{
%>

    <script>
        alert("Number already exist.");
        window.location.replace("register.jsp");
    </script>
<% } %>