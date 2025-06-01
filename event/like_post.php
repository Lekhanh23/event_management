<?php
$host = "localhost";
$user = "root";
$password = "";
$database = "event";

$conn = new mysqli($host, $user, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['post_id'])) {
    $post_id = intval($_POST['post_id']);

    $stmt = $conn->prepare("UPDATE post SET likes = likes + 1 WHERE PostID = ?");
    $stmt->bind_param("i", $post_id);
    $stmt->execute();

    $result = $conn->query("SELECT likes FROM post WHERE PostID = $post_id");
    $row = $result->fetch_assoc();

    echo $row['likes'];
}
?>
