<?php

    // connect db
    $dbhost = 'localhost';
    $dbuser = 'root';
    $dbpassword = '';
    $dbname = 'event';

    $conn = @mysqli_connect($dbhost, $dbuser, $dbpassword, $dbname) 
        or die ('Failed to connect to db.');

    // fetch post data
    $sql = "SELECT * FROM `post` ORDER BY Timestamp DESC";
    $result = @mysqli_query($conn, $sql);
    $posts = @mysqli_fetch_all($result, MYSQLI_ASSOC);
    @mysqli_free_result($result);
    @mysqli_close($conn);

    
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Homepage</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .post-card {
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            transition: 0.3s ease-in-out;
        }
        .post-card:hover {
            transform: scale(1.01);
        }
    </style>
</head>
<script>
function likePost(postId) {
    fetch('like.php', {
        method: 'POST',
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: 'id=' + postId
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            document.getElementById('like-count-' + postId).innerText = '👍 ' + data.likes;
        }
    });
}
</script>
<body class="container py-4">
<div class="sidebar">
  <a href="homepage.php"><i class="fa-solid fa-house-chimney"></i><strong>Homepage</strong></a>
  <a href="index.php"><i class="fa-solid fa-calendar-days"></i>Event</a>
  <a href="post.php"><i class="fa-solid fa-comment"></i>Post</a>
  <a href="user_profile.php"><i class="fa-solid fa-user"></i>Profile</a>
  <a href="logout.php"><i class="fa-solid fa-right-from-bracket"></i>Logout</a>
</div>
<div class="main-content">
<div class="text-center mb-5">
        <h1>Welcome to the Event Management</h1>
        <p class="text-muted">Explore recent event posts and see what people are saying!</p>
    </div>

    <div class="row">
        <?php if (empty($posts)): ?>
            <div class="col-12 text-center">
                <p class="text-muted">No posts available.</p>
            </div>
        <?php else: ?>
            <?php foreach ($posts as $post): ?>
                <div class="col-md-6 col-lg-4 mb-4">
                <div class="card">
  <p><?= htmlspecialchars($post['Content']) ?></p>
  <small>Posted by <b><?= $post['UserID'] ?></b> on <?= $post['Timestamp'] ?></small>
  <div style="margin-top: 10px;">
    <span class="badge badge-primary">Visibility: <?= $post['Visibility'] ?></span>
  </div>
  <div style="margin-top: 10px;">
    <span id="like-count-<?= $post['PostID'] ?>">❤️ <?= $post['likes'] ?></span>
    <button onclick="likePost(<?= $post['PostID'] ?>)" class="like-button" id="like-btn-<?= $post['PostID'] ?>">❤️ Like</button>
  </div>
</div>

                </div>
            <?php endforeach; ?>
        <?php endif; ?>
    </div>
</div>
<script>
function likePost(postId) {
  fetch("like_post.php", {
    method: "POST",
    headers: { "Content-Type": "application/x-www-form-urlencoded" },
    body: "post_id=" + postId
  })
  .then(response => response.text())
  .then(likes => {
    document.getElementById("like-count-" + postId).innerText = "❤️ " + likes;
  })
  .catch(error => console.error("Error:", error));
}
</script>
</body>
</html>
