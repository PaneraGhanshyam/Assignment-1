<%-- 
    Document   : register
    Created on : Aug 13, 2023, 10:36:29 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Registration</title>
  
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
  <style>
  .is-invalid {
    border-color: red !important;
  }
</style>
</head>
<body  style="height:100vh; background-color: #343a40; color: white;">

<div class="container mt-5">
  <div class="row justify-content-center">
    <div class="col-md-6">
      <div class="card" style="background-color: #546e7a; border-radius: 10px;">
        <div class="card-header">
          Registration
        </div>
        <div class="card-body"  style="background-color: #b0bec5; border-radius: 10px;">
          <form>
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
            </div>
            <div class="form-group">
              <label for="number" style="color: black;">Mobile no</label>
              <input type="text" class="form-control" id="number" name="number" placeholder="Enter mobile no" required>
            </div>
            <div class="form-group">
              <label for="address" style="color: black;">Address</label>
              <textarea class="form-control" id="address" name="address" placeholder="Enter address" required></textarea>
            </div>
            <div class="form-group">
              <label for="password" style="color: black;">Password</label>
              <input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required>
            </div>
            <div class="form-group">
              <label for="confirmPassword" style="color: black;">Confirm Password</label>
              <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Confirm password" required>
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
      const isValid = validateUsername(username.value);

      if (!isValid) {
        event.preventDefault();
        username.classList.add('is-invalid');
      }
    });

    function validateUsername(username) {
      const pattern = /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,}$/;
      return pattern.test(username);
    }
  });
</script>

<!-- Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
