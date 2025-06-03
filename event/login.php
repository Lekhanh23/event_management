<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
session_start();
$dbhost = 'localhost';
    $dbuser = 'root';
    $dbpassword = '';
    $dbname = 'event';

    $conn = @mysqli_connect($dbhost, $dbuser, $dbpassword, $dbname) 
        or die ('Failed to connect to db.');

$error = '';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = trim($_POST['email']);
    $password = trim($_POST['password']);

    $stmt = $conn->prepare("SELECT * FROM user WHERE Email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();

    $result = $stmt->get_result();

    if ($result->num_rows === 1) {
        $user = $result->fetch_assoc();
    
        if ($password === $user['password']) { // ⚠ bạn dùng plain password, không hash
            $_SESSION['user_id'] = $user['UserID'];
            $_SESSION['email'] = $user['Email'];
            $_SESSION['fullname'] = $user['FullName'];
            $_SESSION['role'] = $user['Role'];
    
            header("Location: homepage.php");
            exit(); // ✅ PHẢI có dòng này để dừng và chuyển hướng
        } else {
            $error = "Sai mật khẩu!";
        }
    }
    
}
?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Login</title>
  <link rel="stylesheet" href="styles.css">
</head>
<body>

<div class="login-container">
  <div class="login-left">
    <h1><i class="fas fa-university"></i> Event Management</h1>
  </div>
  <div class="login-right">
  <div class="login-form-box">
    <h2>Login</h2>
    <p>Please enter your account details.</p>

    <form method="post" action="">
      <label>Username or Email</label>
      <input type="text" name="email" required>

      <label>Password</label>
      <input type="password" name="password" required>

      <div class="remember-forgot">
        <label><input type="checkbox" name="remember"> Remember me</label>
        <a href="#">Forgot password?</a>
      </div>

      <button type="submit" class="login-btn">Login</button>

      <p class="register-link">Don't have an account? <a href="register.php">Register here</a></p>
    </form>
  </div>
  </div>
</div>
</body>
</html>