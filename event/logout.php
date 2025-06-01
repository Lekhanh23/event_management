<?php 
    session_start();
    $_SESSION = [];
    session_destroy();
?>
<!-- bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
        <h2 class="text-success text-center d-flex justify-content-center align-items-center" style="height: 100vh;">Logout successfully! Your will back to login after 3s...</h2>
        <script>
            setTimeout(function() {
                window.location.href = "login.php";
            }, 3000);
        </script>
