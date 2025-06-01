<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

$conn = new mysqli("localhost", "root", "", "event");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$errors = [];

$Title = '';
$Description = '';
$StartDate = '';
$EndDate = '';
$Location = '';
$HostID = '';
$Category = '';
$MaxParticipants = '';
$Note = '';

// Lấy danh sách user cho dropdown
$users = [];
$user_result = $conn->query("SELECT UserID, FullName FROM user");
while ($u = $user_result->fetch_assoc()) {
    $users[] = $u;
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $Title = $_POST['Title'] ?? '';
    $Description = $_POST['Description'] ?? '';
    $StartDate = $_POST['StartDate'] ?? '';
    $EndDate = $_POST['EndDate'] ?? '';
    $Location = $_POST['Location'] ?? '';
    $HostID = $_POST['HostID'] ?? '';
    $Category = $_POST['Category'] ?? '';
    $MaxParticipants = $_POST['MaxParticipants'] ?? '';
    $Note = $_POST['Note'] ?? '';

    $stmt = $conn->prepare("INSERT INTO event (Title, Description, StartDate, EndDate, Location, HostID, Category, MaxParticipants, Note) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("sssssssis", $Title, $Description, $StartDate, $EndDate, $Location, $HostID, $Category, $MaxParticipants, $Note);
    $stmt->execute();
    $stmt->close();

    header("Location: index.php");
    exit();
}
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Event</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
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
            margin-bottom: 25px;
            color: #333;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
        }
        .form-group input,
        .form-group textarea,
        .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-group textarea {
            resize: vertical;
        }
        .form-actions {
            text-align: right;
        }
        .form-actions button {
            padding: 10px 25px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .form-actions button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="sidebar">
  <a href="homepage.php"><i class="fa-solid fa-house-chimney"></i>Homepage</a>
  <a href="index.php"><i class="fa-solid fa-calendar-days"></i><strong>Event</strong></a>
  <a href="post.php"><i class="fa-solid fa-comment"></i>Post</a>
  <a href="user_profile.php"><i class="fa-solid fa-user"></i>Profile</a>
  <a href="logout.php"><i class="fa-solid fa-right-from-bracket"></i>Logout</a>
</div>
    <div class="form-container">
        <div class="form-box"><h2>Create New Event</h2>
        <form method="POST">
            <div class="form-group">
                <label>Title</label>
                <input type="text" name="Title" required>
            </div>
            <div class="form-group">
                <label>Description</label>
                <textarea name="Description" rows="3" required></textarea>
            </div>
            <div class="form-group">
                <label>Start Date</label>
                <input type="date" name="StartDate" required>
            </div>
            <div class="form-group">
                <label>End Date</label>
                <input type="date" name="EndDate" required>
            </div>
            <div class="form-group">
                <label>Location</label>
                <input type="text" name="Location" required>
            </div>
            <div class="form-group">
                <label>Host</label>
                <select name="HostID" required>
                    <option value="">-- Select Host --</option>
                    <?php foreach ($users as $u): ?>
                        <option value="<?= $u['UserID'] ?>"><?= htmlspecialchars($u['FullName']) ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="form-group">
                <label>Category</label>
                <input type="text" name="Category" required>
            </div>
            <div class="form-group">
                <label>Max Participants</label>
                <input type="text" name="MaxParticipants" required>
            </div>
            <div class="form-group">
                <label>Note</label>
                <textarea name="Note" rows="2"></textarea>
            </div>
            <div class="form-actions">
                <button type="submit">Create Event</button>
            </div>
        </form>
    </div>
    </div>
</body>
</html>
