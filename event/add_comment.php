<?php
session_start();

// Kiểm tra nếu người dùng chưa đăng nhập
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit;
}

// Kiểm tra nếu không có UserID trong session
if (!isset($_SESSION['userid'])) {
    die('User ID not found in session. Please log in again.');
}

// Kết nối cơ sở dữ liệu
$dbhost = 'localhost';
$dbuser = 'root';
$dbpassword = '';
$dbname = 'event';

$conn = @mysqli_connect($dbhost, $dbuser, $dbpassword, $dbname);

if (!$conn) {
    die('Failed to connect to database: ' . mysqli_connect_error());
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $postid = intval($_POST['postid']);
    $eventid = intval($_POST['eventid']); // Lấy EventID từ form (hoặc từ bảng Post)
    $comment_text = $_POST['comment_text'];
    $userid = $_SESSION['userid']; // Lấy UserID từ session

    // Thêm comment vào database
    $query = "INSERT INTO comment (UserID, PostID, EventID, Content) VALUES (?, ?, ?, ?)";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("iiis", $userid, $postid, $eventid, $comment_text);

    if ($stmt->execute()) {
        header("Location: post_details.php?id=" . $postid);
        exit;
    } else {
        echo "Error adding comment: " . $stmt->error;
    }
}
?>
