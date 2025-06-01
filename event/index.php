<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
    session_start();
    
    // redirect if not logged in
    if (!isset($_SESSION['user_id'])) {
        header('Location: login.php');
    }
    
    // process logic
    // prepare data for html

    // connect db
    $dbhost = 'localhost';
    $dbuser = 'root';
    $dbpassword = '';
    $dbname = 'event';

    $conn = @mysqli_connect($dbhost, $dbuser, $dbpassword, $dbname) 
        or die ('Failed to connect to db.');

    // select
    $sql = "SELECT e.EventID, e.Title, e.Description, e.StartDate, e.EndDate, 
               e.Location, e.Category, e.MaxParticipants, u.FullName AS HostName
        FROM event e
        JOIN user u ON e.HostID = u.UserID
        WHERE 1=1";

if (isset($_GET['EventID']) && !empty($_GET['EventID'])) {
    $EventID = $_GET['EventID'];
    $sql .= " AND e.EventID LIKE '%$EventID%'";
}
$result = $conn->query($sql);
if (!$result) {
    die("Query failed: " . $conn->error);
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Events</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <!-- bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body class="container py-4">
<div class="sidebar">
  <a href="homepage.php"><i class="fa-solid fa-house-chimney"></i>Homepage</a>
  <a href="index.php"><i class="fa-solid fa-calendar-days"></i><strong>Event</strong></a>
  <a href="post.php"><i class="fa-solid fa-comment"></i>Post</a>
  <a href="user_profile.php"><i class="fa-solid fa-user"></i>Profile</a>
  <a href="logout.php"><i class="fa-solid fa-right-from-bracket"></i>Logout</a>
</div>
<div class="main-content">
<h1 class="mb-4"> Manage Event</h1>

<!-- Khối container trắng đổ bóng chứa toàn bộ content -->
<div class="bg-white shadow rounded p-4">

  <!-- Header: Nút Create + Form Filter -->
  <div class="d-flex justify-content-between align-items-end mb-3 flex-wrap gap-2">
    <a href="create.php" class="btn btn-success">Create Event</a>

    <!-- Filter Form -->
    <form action="" class="d-flex align-items-end">
      <div class="me-2">
        <label for="EventID" class="form-label mb-1"></label>
        <input type="text" name="EventID" id="EventID" class="form-control form-control-sm" 
          placeholder="Search ID" value="<?php echo isset($_GET['EventID']) ? htmlspecialchars($_GET['EventID']) : '' ?>">
      </div>
      <button type="submit" class="btn btn-primary btn-sm mb-1">Search</button>
    </form>
  </div>

  <!-- Table -->
    <div class="table-responsive">
      <table class="table table-bordered table-striped table-hover align-middle">
        <thead class="table-primary">
          <tr>
            <th class="text-center">EventID</th>
            <th class="text-center">Title</th>
            <th class="text-center">Description</th>
            <th class="text-center">StartDate</th>
            <th class="text-center">EndDate</th>
            <th class="text-center">Location</th>
            <th class="text-center">Host Name</th>
            <th class="text-center">Category</th>
            <th class="text-center">Max Participants</th>
            <th class="text-center">Actions</th>
          </tr>
        </thead>
        <tbody>
        <?php while ($row = $result->fetch_assoc()): ?>
          <tr>
            <td class="text-center"><?php echo $row['EventID']; ?></td>
            <td class="text-center"><?php echo htmlspecialchars($row['Title']); ?></td>
            <td class="text-center"><?php echo htmlspecialchars($row['Description'] ?? ''); ?></td>
            <td class="text-center"><?php echo $row['StartDate']; ?></td>
            <td class="text-center"><?php echo $row['EndDate']; ?></td>
            <td class="text-center"><?php echo $row['Location']; ?></td>
            <td class="text-center"><?php echo htmlspecialchars($row['HostName']); ?></td> <!-- Hiển thị tên Host -->
            <td class="text-center"><?php echo $row['Category']; ?></td>
            <td class="text-center"><?php echo $row['MaxParticipants']; ?></td>
            <td class="text-center">
                <div class="d-flex flex-column gap-1">
                  <a href="update.php?id=<?php echo $row['EventID'] ?>"class="btn btn-primary btn-sm w-100 text-center" style="min-width: 90px;">Update</a>
                  <a href="delete.php?id=<?php echo $row['EventID'] ?>"class="btn btn-danger btn-sm w-100 text-center"style="min-width: 90px;"onclick="return confirm('Are you sure you want to delete this event?')">Delete</a>
                </div>
            </td>
          </tr>
          <?php endwhile; ?>
        </tbody>
      </table>
    </div>
</div>
</div>

</body>

</html>