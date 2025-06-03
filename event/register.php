<?php
session_start();

// Thông tin kết nối cơ sở dữ liệu – hãy thay bằng thông tin thực tế của bạn
$servername = "localhost";
$db_username = "root";       // Thay bằng username MySQL thực tế
$db_password = "";   // Thay bằng password MySQL thực tế
$dbname = "event";

// Kết nối
$conn = new mysqli($servername, $db_username, $db_password, $dbname);
if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}

// Biến lưu lỗi và thông báo
$errors = [];
$success = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Lấy dữ liệu từ form
    $fullname    = trim($_POST["fullname"]);
    $email       = trim($_POST["email"]);
    $phone       = trim($_POST["phone"]);
    $username    = trim($_POST["username"]);
    $password    = trim($_POST["password"]);
    $confirmPass = trim($_POST["confirm_password"]);
    $dob         = $_POST["dob"]; // yyyy-mm-dd

    // 1. Kiểm tra bắt buộc: không để trống
    if (empty($fullname)) {
        $errors[] = "Vui lòng nhập họ tên.";
    }
    if (empty($email)) {
        $errors[] = "Vui lòng nhập email.";
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors[] = "Email không hợp lệ.";
    }
    if (empty($phone)) {
        $errors[] = "Vui lòng nhập số điện thoại.";
    }
    if (empty($username)) {
        $errors[] = "Vui lòng nhập tên đăng nhập.";
    }
    if (empty($password)) {
        $errors[] = "Vui lòng nhập mật khẩu.";
    }
    if ($password !== $confirmPass) {
        $errors[] = "Mật khẩu và xác nhận mật khẩu không khớp.";
    }
    if (empty($dob)) {
        $errors[] = "Vui lòng chọn ngày sinh.";
    }

    // 2. Kiểm tra trùng email hoặc username
    if (empty($errors)) {
        $stmt = $conn->prepare("SELECT UserID FROM user WHERE Email = ? OR username = ? LIMIT 1");
        $stmt->bind_param("ss", $email, $username);
        $stmt->execute();
        $stmt->store_result();
        if ($stmt->num_rows > 0) {
            $errors[] = "Email hoặc tên đăng nhập đã tồn tại. Vui lòng chọn email/username khác.";
        }
        $stmt->close();
    }

    // 3. Nếu không có lỗi, tiến hành chèn vào bảng `user`
    if (empty($errors)) {
        // Lưu ý: trong ví dụ này, mật khẩu được lưu **chưa mã hóa** để tương đồng với hệ thống hiện tại.
        // Nếu muốn bảo mật hơn, bạn có thể dùng password_hash() và khi login dùng password_verify().
        $joinDate = date("Y-m-d H:i:s");
        $stmt = $conn->prepare("INSERT INTO user (FullName, Email, PhoneNumber, username, password, DateOfBirth, JoinDate) VALUES (?, ?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("sssssss", $fullname, $email, $phone, $username, $password, $dob, $joinDate);

        if ($stmt->execute()) {
            $success = "Đăng ký thành công! Bạn có thể <a href='login.php'>đăng nhập</a> ngay bây giờ.";
        } else {
            $errors[] = "Có lỗi xảy ra khi lưu thông tin. Vui lòng thử lại.";
        }

        $stmt->close();
    }
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <link rel="stylesheet" href="styles.css"> <!-- Đảm bảo đường dẫn đúng -->
</head>
<body>
    <div class="login-container">
        <div class="login-left">
        <h1><i class="fas fa-university"></i> Event Management</h1>
        </div>
    </div>
    <div class="login-right">
        <div class="login-form-box">
            <h2>Sign Up</h2>
            <?php if (!empty($errors)): ?>
            <div class="alert error">
                <?php foreach ($errors as $err): ?>
                    <p><?php echo htmlspecialchars($err, ENT_QUOTES, 'UTF-8'); ?></p>
                <?php endforeach; ?>
            </div>
        <?php endif; ?>

        <?php if (!empty($success)): ?>
            <div class="alert success">
                <p><?php echo $success; ?></p>
            </div>
        <?php else: ?>
            <form action="register.php" method="post" class="form">
                <div>
                    <label for="fullname">Full Name</label>
                    <input type="text" name="fullname" id="fullname" required value="<?php echo isset($fullname) ? htmlspecialchars($fullname, ENT_QUOTES, 'UTF-8') : ''; ?>">
                </div>

                <div>
                    <label for="email">Email</label>
                    <input type="email" name="email" id="email" required value="<?php echo isset($email) ? htmlspecialchars($email, ENT_QUOTES, 'UTF-8') : ''; ?>">
                </div>

                <div>
                    <label for="phone">Phone Number</label>
                    <input type="text" name="phone" id="phone" required value="<?php echo isset($phone) ? htmlspecialchars($phone, ENT_QUOTES, 'UTF-8') : ''; ?>">
                </div>

                <div>
                    <label for="username">Username</label>
                    <input type="text" name="username" id="username" required value="<?php echo isset($username) ? htmlspecialchars($username, ENT_QUOTES, 'UTF-8') : ''; ?>">
                </div>

                <div>
                    <label for="password">Password</label>
                    <input type="password" name="password" id="password" required>
                </div>

                <div>
                    <label for="confirm_password">Confirm Password</label>
                    <input type="password" name="confirm_password" id="confirm_password" required>
                </div>

                <div>
                    <label for="dob">Date of Birth</label>
                    <input type="date" name="dob" id="dob" required value="<?php echo isset($dob) ? htmlspecialchars($dob, ENT_QUOTES, 'UTF-8') : ''; ?>">
                </div>

                <button type="submit" class="login-btn">Sign up</button>
                <p class="note">Have an account? <a href="login.php">Login</a></p>
            </form>
        <?php endif; ?>
        </div>

        
    </div>
</body>
</html>
