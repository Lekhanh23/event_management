<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}
$conn = new mysqli("localhost", "root", "", "event");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$post_id = $_GET['post_id'] ?? null;
if (!$post_id) {
    echo "Post ID not specified.";
    exit();
}
// Lấy bài post và tên người dùng
$stmt = $conn->prepare("SELECT p.*, u.FullName FROM post p JOIN user u ON p.UserID = u.UserID WHERE p.PostID = ?");
$stmt->bind_param("i", $post_id);
$stmt->execute();
$post = $stmt->get_result()->fetch_assoc();
$stmt->close();
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Post Details</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <style>
        .wrapper {
            max-width: 800px;
            margin: auto;
        }
        .box {
            background: white;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        textarea {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            border-radius: 5px;
        }
        button {
            background: green;
            color: white;
            border: none;
            padding: 8px 16px;
            margin-top: 8px;
            border-radius: 5px;
            cursor: pointer;
        }
        .comment {
            margin-top: 10px;
            padding: 10px;
            background: #eef2f6;
            border-radius: 5px;
        }
        .comment small {
            color: gray;
        }
    </style>
</head>
<body>
<div class="sidebar">
  <a href="homepage.php"><i class="fa-solid fa-house-chimney"></i>Homepage</a>
  <a href="index.php"><i class="fa-solid fa-calendar-days"></i>Event</a>
  <a href="post.php"><i class="fa-solid fa-comment"></i><strong>Post</strong></a>
  <a href="user_profile.php"><i class="fa-solid fa-user"></i>Profile</a>
  <a href="logout.php"><i class="fa-solid fa-right-from-bracket"></i>Logout</a>
</div>
<div class="wrapper">
    <div class="box">
        <h2>Post Details</h2>
        <p><?= htmlspecialchars($post['Content'] ?? '') ?></p>
        <p><strong>User:</strong> <?= htmlspecialchars($post['FullName'] ?? '') ?></p>
        <p><strong>Time:</strong> <?= htmlspecialchars($post['Timestamp'] ?? '') ?></p>
        <p><strong>Visibility:</strong> <?= htmlspecialchars($post['Visibility'] ?? '') ?></p>
        <p><strong>Likes:</strong> <?= htmlspecialchars($post['likes'] ?? '') ?></p>
        <a href="post.php">&larr; Back to Posts</a>
    </div>

    <div class="box">
        <h3>Write your comment here!</h3>
        <form method="POST">
            <textarea name="comment" rows="3" placeholder="Write your comment"></textarea><br>
            <button type="submit">Submit</button>
        </form>
    </div>
</div>
</body>
</html>
