<?php
    session_start();

    // Nếu chưa đăng nhập, chuyển về login.php
    if (!isset($_SESSION['user_id'])) {
        header('Location: login.php');
        exit();
    }

    // Thông tin kết nối DB – thay cho đúng với hệ thống của bạn
    $dbhost     = 'localhost';
    $dbuser     = 'root';
    $dbpassword = '';
    $dbname     = 'event';

    $conn = new mysqli($dbhost, $dbuser, $dbpassword, $dbname);
    if ($conn->connect_error) {
        die("Kết nối thất bại: " . $conn->connect_error);
    }

    // Mảng lưu lỗi để hiển thị (nếu có)
    $errors = [];

    // Khi form được submit
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        // Lấy input từ form
        $userId     = $_SESSION['user_id']; 
        $eventId    = $_POST['event_id'] ?? null;
        $content    = trim($_POST['content'] ?? '');
        $visibility = $_POST['visibility'] ?? 'Public'; // public là mặc định
        $timestamp  = date('Y-m-d H:i:s');

        // 1. Kiểm tra bắt buộc
        if (empty($eventId)) {
            $errors[] = "Vui lòng chọn sự kiện.";
        }
        if (empty($content)) {
            $errors[] = "Nội dung bài viết không được để trống.";
        }
        if (!in_array($visibility, ['Public', 'Private'])) {
            $errors[] = "Giá trị Visibility không hợp lệ.";
        }

        // 2. Xử lý upload ảnh (nếu có)
        $imagePath = null;
        if (isset($_FILES['image']) && $_FILES['image']['error'] !== UPLOAD_ERR_NO_FILE) {
            $allowedTypes = ['image/jpeg','image/png','image/gif','image/webp'];
            if ($_FILES['image']['error'] !== UPLOAD_ERR_OK) {
                $errors[] = "Lỗi khi upload ảnh.";
            } elseif (!in_array($_FILES['image']['type'], $allowedTypes)) {
                $errors[] = "Chỉ chấp nhận file ảnh (jpg, png, gif, webp).";
            } else {
                // Tạo thư mục uploads nếu chưa tồn tại
                $uploadDir = __DIR__ . '/uploads/';
                if (!file_exists($uploadDir)) {
                    mkdir($uploadDir, 0755, true);
                }
                $ext       = pathinfo($_FILES['image']['name'], PATHINFO_EXTENSION);
                $newName   = 'post_' . time() . '_' . rand(1000,9999) . '.' . $ext;
                $destination = $uploadDir . $newName;

                if (move_uploaded_file($_FILES['image']['tmp_name'], $destination)) {
                    // Lưu đường dẫn relative để ghi vào CSDL
                    $imagePath = 'uploads/' . $newName;
                } else {
                    $errors[] = "Không thể di chuyển file ảnh.";
                }
            }
        }

        // 3. Nếu không có lỗi, chèn vào bảng `post`
        if (empty($errors)) {
            $sql = "INSERT INTO post 
                        (UserID, EventID, Content, Timestamp, Visibility, image, likes)
                    VALUES 
                        (?, ?, ?, ?, ?, ?, 0)";
            $stmt = $conn->prepare($sql);
            if (!$stmt) {
                $errors[] = "Lỗi chuẩn bị câu lệnh SQL: " . $conn->error;
            } else {
                // Nếu không upload ảnh, truyền NULL cho trường image
                $imgParam = $imagePath !== null ? $imagePath : null;
                $stmt->bind_param(
                    "iissss", 
                    $userId, 
                    $eventId, 
                    $content, 
                    $timestamp, 
                    $visibility, 
                    $imgParam
                );
                if ($stmt->execute()) {
                    // Chuyển về trang post.php sau khi tạo thành công
                    header('Location: post.php');
                    exit();
                } else {
                    $errors[] = "Lỗi khi thêm bài: " . $stmt->error;
                }
                $stmt->close();
            }
        }
    }

    // Trước khi hiển thị form, ta cần lấy danh sách sự kiện để người dùng chọn
    $events = [];
    $sqlE = "SELECT EventID, Title FROM event ORDER BY Title ASC";
    $resE = $conn->query($sqlE);
    if ($resE) {
        while ($row = $resE->fetch_assoc()) {
            $events[] = $row;
        }
        $resE->free();
    }

    $conn->close();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Create Post – Event Management</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- Bootstrap CSS giống update.php -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    />
    <!-- Font Awesome -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
      integrity="sha512--…"
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <!-- styles.css chung (sidebar, .main-content, v.v…) -->
    <link rel="stylesheet" href="styles.css" />
    <!-- Bootstrap JS (nếu cần các component của Bootstrap JS) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body class="container py-4">
  <!-- Sidebar copy y hệt từ update.php -->
  <div class="sidebar">
    <a href="homepage.php"><i class="fa-solid fa-house-chimney"></i><strong>Homepage</strong></a>
    <a href="index.php"><i class="fa-solid fa-calendar-days"></i>Event</a>
    <a href="post.php"><i class="fa-solid fa-comment"></i>Post</a>
    <a href="user_profile.php"><i class="fa-solid fa-user"></i>Profile</a>
    <a href="logout.php"><i class="fa-solid fa-right-from-bracket"></i>Logout</a>
  </div>

  <!-- Main content -->
  <div class="main-content">
    <div class="text-center mb-5">
      <h1>Create New Post</h1>
      <p class="text-muted">Please share your thoughts about the event.</p>
    </div>

    <div class="row justify-content-center">
      <div class="col-md-8">
        <!-- Hiển thị lỗi (nếu có) -->
        <?php if (!empty($errors)): ?>
          <div class="alert alert-danger">
            <?php foreach ($errors as $err): ?>
              <div><?php echo htmlspecialchars($err, ENT_QUOTES, 'UTF-8'); ?></div>
            <?php endforeach; ?>
          </div>
        <?php endif; ?>

        <!-- Form tạo bài -->
        <div class="card shadow-sm mb-4">
          <div class="card-body">
            <form
              action="create_post.php"
              method="post"
              enctype="multipart/form-data" 
            >
              <!-- Chọn Event -->
              <div class="mb-3">
                <label for="event_id" class="form-label">Select Event</label>
                <select
                  name="event_id"
                  id="event_id"
                  class="form-select"
                  required
                >
                  <option value="" selected disabled>-- Select option --</option>
                  <?php foreach ($events as $ev): ?>
                    <option
                      value="<?php echo $ev['EventID']; ?>"
                      <?php 
                        if (isset($_POST['event_id']) && $_POST['event_id'] == $ev['EventID']) {
                          echo 'selected';
                        }
                      ?>
                    >
                      <?php echo htmlspecialchars($ev['Title'], ENT_QUOTES, 'UTF-8'); ?>
                    </option>
                  <?php endforeach; ?>
                </select>
              </div>

              <!-- Nội dung (Content) -->
              <div class="mb-3">
                <label for="content" class="form-label">Content</label>
                <textarea
                  name="content"
                  id="content"
                  rows="5"
                  class="form-control"
                  placeholder="Write a status, a comment,..."
                  required
                ><?php echo isset($_POST['content']) ? htmlspecialchars($_POST['content'], ENT_QUOTES, 'UTF-8') : ''; ?></textarea>
              </div>

              <!-- Visibility -->
              <div class="mb-3">
                <label for="visibility" class="form-label">Display mode</label>
                <select
                  name="visibility"
                  id="visibility"
                  class="form-select"
                  required
                >
                  <option value="Public"  <?php echo (isset($_POST['visibility']) && $_POST['visibility']=='Public')  ? 'selected' : ''; ?>>Public</option>
                  <option value="Private" <?php echo (isset($_POST['visibility']) && $_POST['visibility']=='Private') ? 'selected' : ''; ?>>Private</option>
                </select>
              </div>


              <button type="submit" class="btn btn-primary">
                <i class="fa-solid fa-paper-plane"></i> Create
              </button>
              <a href="post.php" class="btn btn-secondary ms-2">
                <i class="fa-solid fa-chevron-left"></i> Back
              </a>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
