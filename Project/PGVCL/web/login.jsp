<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
  </style>
</head>
<body style="height:100vh; background-color: #343a40; color: white;">

<div class="container mt-5">
  <div class="row justify-content-center">
    <div class="col-md-6">
      <div class="card" style="background-color: #546e7a; border-radius: 10px;">
        <div class="card-header">
          Login
        </div>
        <div class="card-body" style="background-color: #b0bec5; border-radius: 10px;">
          <!-- Login Form -->
          <form onsubmit="return validateForm()" action="index.jsp">
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
<!-- JavaScript Validation -->
<script>
  function validateForm() {
    var numberField = document.getElementById("number");
    var passwordField = document.getElementById("password");
    var roleField = document.getElementById("role");
    var numberError = document.getElementById("numberError");
    var passwordError = document.getElementById("passwordError");
    var roleError = document.getElementById("roleError");
    
    var valid = true;

    // Number Validation
    if (numberField.value.trim() === "") {
      numberField.classList.add("error-border");
      numberError.style.display = "block";
      valid = false;
    } else if (numberField.value.length !== 10 || isNaN(numberField.value)) {
      numberField.classList.add("error-border");
      numberError.style.display = "block";
      valid = false;
    } else {
      numberField.classList.remove("error-border");
      numberError.style.display = "none";
    }

    // Password Validation
    if (passwordField.value.trim() === "") {
      passwordField.classList.add("error-border");
      passwordError.style.display = "block";
      valid = false;
    } else if (
      passwordField.value.length < 8 ||
      !/(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z\d])/.test(passwordField.value)
    ) {
      passwordField.classList.add("error-border");
      passwordError.style.display = "block";
      valid = false;
    } else {
      passwordField.classList.remove("error-border");
      passwordError.style.display = "none";
    }

    // Role Validation
    if (roleField.value === "") {
      roleField.classList.add("error-border");
      roleError.style.display = "block";
      valid = false;
    } else {
      roleField.classList.remove("error-border");
      roleError.style.display = "none";
    }

    return valid;
  }
</script>
<!-- jQuery and Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
