<?php
session_start();
$dbhost = 'localhost';
    $dbuser = 'root';
    $dbpassword = '';
    $dbname = 'event';

    $conn = @mysqli_connect($dbhost, $dbuser, $dbpassword, $dbname) 
        or die ('Failed to connect to db.');

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

$user_id = $_SESSION['user_id'];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $fullName = $_POST['full_name'];
    $email = $_POST['email'];
    $username = $_POST['username'];
    $phone = $_POST['phone'];

    $stmt = $conn->prepare("UPDATE user SET FullName = ?, Email = ?, Username = ?, PhoneNumber = ? WHERE UserID = ?");
    $stmt->bind_param("ssssi", $fullName, $email, $username, $phone, $user_id);
    $stmt->execute();

    header("Location: user_profile.php");
    exit();
}

$stmt = $conn->prepare("SELECT FullName, Email, Username, PhoneNumber FROM user WHERE UserID = ?");
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();
$user = $result->fetch_assoc();
?>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Edit Profile</title>
  <link rel="stylesheet" href="styles.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <style>

    .form-container {
      margin-left: 220px;
      padding: 50px;
      display: flex;
      justify-content: center;
      box-sizing: border-box;
    }

    .form-box {
      width: 850px;
      max-width: 1000px;
      background-color: white;
      border-radius: 16px;
      padding: 40px 60px;
      box-shadow: 0 4px 20px rgba(0,0,0,0.1);
    }

    .form-box h2 {
      font-size: 28px;
      margin-bottom: 30px;
      border-bottom: 1px solid #eee;
      padding-bottom: 15px;
    }

    .form-group {
      margin-bottom: 25px;
    }

    .form-group label {
      display: block;
      font-weight: 600;
      margin-bottom: 8px;
      font-size: 16px;
    }

    .form-group input {
      width: 100%;
      padding: 12px 14px;
      border: 1px solid #ccc;
      border-radius: 8px;
      font-size: 15px;
      box-sizing: border-box;
    }

    .submit-btn {
      background-color: #007bff;
      color: white;
      padding: 14px 22px;
      border: none;
      border-radius: 8px;
      font-size: 16px;
      font-weight: bold;
      cursor: pointer;
      float: right;
    }

    .submit-btn:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>
<div class="sidebar">
  <a href="homepage.php"><i class="fa-solid fa-house-chimney"></i>Homepage</a>
  <a href="index.php"><i class="fa-solid fa-calendar-days"></i>Event</a>
  <a href="post.php"><i class="fa-solid fa-comment"></i>Post</a>
  <a href="user_profile.php"><i class="fa-solid fa-user"></i><strong>Profile</strong></a>
  <a href="logout.php"><i class="fa-solid fa-right-from-bracket"></i>Logout</a>
</div>
<div class="form-container">
  <div class="form-box">
    <h2>Edit User</h2>
    <form method="POST">
      <div class="form-group">
        <label>Full Name</label>
        <input type="text" name="full_name" value="<?= htmlspecialchars($user['FullName']) ?>" required>
      </div>

      <div class="form-group">
        <label>Username</label>
        <input type="text" name="username" value="<?= htmlspecialchars($user['Username']) ?>" required>
      </div>

      <div class="form-group">
        <label>Email</label>
        <input type="email" name="email" value="<?= htmlspecialchars($user['Email']) ?>" required>
      </div>

      <div class="form-group">
        <label>Phone Number</label>
        <input type="text" name="phone" value="<?= htmlspecialchars($user['PhoneNumber']) ?>" required>
      </div>

      <button type="submit" class="submit-btn">Save Changes</button>
    </form>
  </div>
</div>

</body>
</html>
