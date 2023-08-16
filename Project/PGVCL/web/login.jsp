<%-- 
    Document   : login
    Created on : Aug 13, 2023, 8:32:25 PM
    Author     : ghanshyam
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  
  <!-- Custom Styles -->
  <style>
    .error-border {
      border: 1px solid red;
    }
    /* Center-align the preloader */
    .preloader {
      position: fixed;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
    }
  </style>
</head>
<body style="min-height: 90vh; background-color: #343a40; color: white;">

<div class="container mt-5">
  <div class="row justify-content-center">
    <div class="col-lg-6 col-sm-12">
      <div class="card" style="background-color: #546e7a; border-radius: 10px;">
        <div class="card-header">
          Login
        </div>
        <div class="card-body" style="background-color: #b0bec5; border-radius: 10px;">
          <!-- Login Form -->
          <form action="LoginServlet" method="POST" onsubmit="showPreloader()">
            <!-- Number Input -->
            <div class="form-group">
              <label for="number" style="color: black;">Number</label>
              <input type="text" class="form-control" name="number" id="number" placeholder="Enter number" required="">
              <small id="numberError" class="form-text text-danger" style="display: none;">Number must be exactly 10 digits and numeric.</small>
            </div>
            <!-- Password Input -->                                          
            <div class="form-group">
              <label for="password" style="color: black;">Password</label>
              <input type="password" name="password" class="form-control" id="password" placeholder="Enter password" required="">
              <small id="passwordError" class="form-text text-danger" style="display: none;">Password must be 8 characters long and include at least one number, one alphabet, and one special character.</small>
            </div>
            <!-- Role Selection -->
            <div class="form-group">
              <label for="role" style="color: black;">Role</label>
              <select class="form-control" name="role" id="role" required="">
                <option value="user">User</option>
                <option value="admin">Admin</option>
              </select>
              <small id="roleError" class="form-text text-danger" style="display: none;">Please select a role.</small>
            </div>
            <!-- Submit Button -->
            <button type="submit" name="submit" value="submit" class="btn btn-primary btn-block">Login</button>
          </form>      
        </div>
            <div class="card-footer text-center" style="color: white;">
              Don't have an account? <a href="register.jsp" style="color: #80d8ff;" >Register</a>
            </div>
      </div>
    </div>
  </div>
</div>
</script>
<!-- jQuery and Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<%
boolean loginSuccess = request.getAttribute("loginSuccess") != null && (boolean) request.getAttribute("loginSuccess");
boolean checkStatus = request.getAttribute("checkStatus") != null && (boolean) request.getAttribute("checkStatus");
boolean userExists = request.getAttribute("userExists") != null && (boolean) request.getAttribute("userExists");
boolean con = false;
if (loginSuccess == con && request.getAttribute("loginSuccess") != null) {
%>
<script>
    alert("Enter valid detail.");
    window.location.replace("login.jsp");
</script>
<%
    request.removeAttribute("loginSuccess");
} else if (checkStatus == con && request.getAttribute("checkStatus") != null) {
%>
<script>
    alert("Account deactive.");
    window.location.replace("login.jsp");
</script>
<%
    request.removeAttribute("checkStatus");
}
%>
</body>
</html>
