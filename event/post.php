<?php
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
    $sql = "SELECT post.*, event.Title AS EventTitle 
    FROM post
    JOIN event ON post.EventID = event.EventID
    ORDER BY post.PostID DESC";
    
    // filter by EventID
    if (isset($_GET['PostID']) && !empty($_GET['PostID'])) {
        $PostID = $_GET['PostID'];
        $sql .= " AND PostID LIKE '%$PostID%'";
    }
    
    // TODO: more filter

    // pagination
    $limit = 3; // number of items / page
    
    // total pages
    $countSql = "SELECT COUNT(*) AS total from ($sql) t";
    $result = mysqli_query($conn, $countSql);
    $row = mysqli_fetch_assoc($result);
    $totalRecords = $row['total'];

    // var_dump($totalRecords);
    $totalPages = ceil($totalRecords / $limit);

    $page = 1;
    // get data from url = user defined page
    if (isset($_GET['page'])) {
        $page = $_GET['page'];
    }
    $offset = ($page-1) * $limit;

    $sql .= " LIMIT $limit OFFSET $offset";
    

    $result = @mysqli_query($conn, $sql);
    
    $post = @mysqli_fetch_all($result, MYSQLI_ASSOC);

    shuffle($post);
    // var_dump($eventsystem);

    // free result
    @mysqli_free_result($result);

    // close connection
    @mysqli_close($conn);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event Listings</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Custom CSS for styling -->
    <style>
        body {
            background-color: #f4f4f9;
        }

        .event-card {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }

        .event-image {
            max-height: 200px;
            object-fit: cover;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }

        .event-details {
            padding: 60px;
        }

        .event-title {
            font-size: 1.5rem;
            font-weight: bold;
        }

        .event-content {
            color: #555;
            margin-bottom: 10px;
        }

        .pagination {
            justify-content: center;
        }

        .no-data {
            text-align: center;
            color: #999;
        }
    </style>
</head>
<body class="container py-4">
<div class="sidebar">
  <a href="homepage.php"><i class="fa-solid fa-house-chimney"></i>Homepage</a>
  <a href="index.php"><i class="fa-solid fa-calendar-days"></i>Event</a>
  <a href="post.php"><i class="fa-solid fa-comment"></i><strong>Post</strong></a>
  <a href="user_profile.php"><i class="fa-solid fa-user"></i>Profile</a>
  <a href="logout.php"><i class="fa-solid fa-right-from-bracket"></i>Logout</a>
</div>
<div class="main-content">
<div class="my-5">
        <h1 class="text-center">All Post of Event</h1>
    </div>

    <?php if (empty($post)): ?>
    <p class="no-data">No events found.</p>
    <?php else: ?>
        <div class="row">
            <?php foreach ($post as $post): ?>
            <div class="col-md-6 col-lg-4 mb-4">
                <div class="event-card">
                    <!-- Event Image (You can add image URL to this part) -->
                    <div class="event-details">
                        <h3><?= htmlspecialchars($post['EventTitle']) ?></h3>
                        <p class="event-content"><?php echo $post['Content']; ?></p>
                        <p><strong>User: </strong><?php echo $post['UserID']; ?></p>
                        <p class="text-muted">Posted on: <?php echo $post['Timestamp']; ?></p>
                        <p><strong>Visibility: </strong> <?php echo $post['Visibility']; ?></p>
                        <a href="post_details.php?post_id=<?php echo $post['PostID']; ?>" class="btn btn-primary">View</a>
                    </div>
                </div>
            </div>
            <?php endforeach; ?>
        </div>
    <?php endif; ?>

    <!-- HTML page -->
    <nav aria-label="Page navigation example">
    <ul class="pagination">
        <?php
            // Xác định giới hạn hiển thị (số trang hiển thị cùng lúc)
            $limit = 3;
            $start = max(1, $page - 1); // Trang bắt đầu
            $end = min($totalPages, $page + 1); // Trang kết thúc

            // Đảm bảo luôn hiển thị đủ $limit trang nếu có thể
            if ($page == 1) {
                $end = min($totalPages, $start + $limit - 1);
            } elseif ($page == $totalPages) {
                $start = max(1, $end - $limit + 1);
            }
        ?>

        <!-- Nút "Previous" -->
        <?php if ($page > 1): ?>
            <li class="page-item">
                <a class="page-link" href="?page=<?php echo $page - 1; ?>"><</a>
            </li>
        <?php endif; ?>

        <!-- Hiển thị các trang -->
        <?php for ($i = $start; $i <= $end; $i++): ?>
            <li class="page-item <?php echo ($i == $page) ? 'active' : ''; ?>">
                <a class="page-link" href="?page=<?php echo $i; ?>">
                    <?php echo $i; ?>
                </a>
            </li>
        <?php endfor; ?>

        <!-- Nút "Next" -->
        <?php if ($page < $totalPages): ?>
            <li class="page-item">
                <a class="page-link" href="?page=<?php echo $page + 1; ?>">></a>
            </li>
        <?php endif; ?>
    </ul>
</nav>
</div>
</body>
</html>
