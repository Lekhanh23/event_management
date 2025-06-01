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

$sql = "SELECT u.FullName, u.Email, u.JoinDate, r.Role 
        FROM user u 
        LEFT JOIN regis r ON u.UserID = r.UserID 
        WHERE u.UserID = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();
$user = $result->fetch_assoc();
?>


<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>User Profile</title>
  <link rel="stylesheet" href="styles.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <style>
    .profile-container {
      margin-left: 220px;
      padding: 50px;
      display: flex;
      justify-content: center;
      box-sizing: border-box;
    }

    .profile-card {
      width: 850px;
      max-width: 1000px;
      background-color: white;
      border-radius: 16px;
      padding: 40px 60px;
      box-shadow: 0 4px 20px rgba(0,0,0,0.1);
    }

    .profile-card h2 {
      font-size: 28px;
      margin-bottom: 30px;
      border-bottom: 1px solid #eee;
      padding-bottom: 15px;
    }

    .profile-item {
      font-size: 17px;
      margin-bottom: 18px;
    }

    .profile-item strong {
      display: inline-block;
      width: 160px;
    }

    .edit-link {
      display: inline-block;
      margin-top: 20px;
      color: #007bff;
      text-decoration: underline;
      font-size: 16px;
    }
    .edit-btn {
  background-color: #007bff;
  color: white;
  padding: 12px 20px;
  font-size: 16px;
  border: none;
  border-radius: 8px;
  font-weight: bold;
  cursor: pointer;
}

.edit-btn:hover {
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
<div class="profile-container">
  <div class="profile-card">
    <h2>User Profile</h2>
    <p class="profile-item"><strong>Full Name:</strong> <?= htmlspecialchars($user['FullName']) ?></p>
    <p class="profile-item"><strong>Email:</strong> <?= htmlspecialchars($user['Email']) ?></p>
    <p class="profile-item"><strong>Role:</strong> <?= htmlspecialchars($user['Role']) ?></p>
    <p class="profile-item"><strong>Created At:</strong> <?= htmlspecialchars($user['JoinDate']) ?></p>
    <form action="edit_profile.php" method="get">
  <button type="submit" class="edit-btn">Edit</button>
    </form>
  </div>
</div>

</body>
</html>
