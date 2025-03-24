<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <style>
    /* Sidebar */
    .sidebar {
        width: 250px;
        height: 100vh;
        position: fixed;
        top: 0;
        left: 0;
        background-color: #1E3A5F;
        padding: 20px;
        box-shadow: 2px 0 5px rgba(0, 0, 0, 0.2);
        color: white;
    }

    .sidebar .user-info {
        text-align: center;
    }

    .sidebar .user-info img {
        width: 80px;
        height: 80px;
        border-radius: 50%;
        margin-bottom: 10px;
    }

    .sidebar .username {
        font-size: 18px;
        font-weight: bold;
    }

    .sidebar ul {
        list-style-type: none;
        padding: 0;
    }

    .sidebar ul li {
        margin: 15px 0;
    }

    .sidebar ul li a {
        text-decoration: none;
        color: white;
        font-size: 16px;
        display: flex;
        align-items: center;
        padding: 10px;
    }

    .sidebar ul li a:hover {
        background-color: #304B7A;
        border-radius: 5px;
    }

    .sidebar ul li a i {
        margin-right: 10px;
    }

    /* Khu vực nội dung */
    #contentArea {
        margin-left: 20px; /* Đẩy nội dung sang phải */
        padding: 20px;
    }
</style>

    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Quản Lý</title>
    <link rel="stylesheet" href="Menu.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- Import jQuery -->
</head>
<body>

    <div class="sidebar">
        <!-- Thông tin tài khoản -->
        <div class="user-info">
            <img src="IMAGE/lovepik-confident-workplace-business-male-image-png-image_400441790_wh1200.png" alt="Admin">
            <p class="username">Admin</p>
        </div>

        <ul>
            <li><a href="AccountController" onclick="loadContent('QuanLyTaiKhoan.jsp')"><i class="fas fa-users-cog"></i> Quản Lý Tài Khoản</a></li>
            <li><a href="#" onclick="loadContent('QuanLyLopHoc.jsp')"><i class="far fa-window-maximize"></i> Quản Lý Lớp Học</a></li>
            <li><a href="#" onclick="loadContent('QuanLySinhVien.jsp')"><i class="far fa-window-maximize"></i> Quản Lý Sinh Viên</a></li>
            <li><a href="#" onclick="loadContent('QuanLyGiaoVien.jsp')"><i class="far fa-window-maximize"></i> Quản Lý Giáo Viên</a></li>
            <li><a href="#" onclick="loadContent('QuanLyDiem.jsp')"><i class="fas fa-trophy"></i> Quản Lý Điểm</a></li>
        </ul>

        <div class="logout">
            <a href="Login.jsp"><i class="fas fa-sign-out-alt"></i> Đăng Xuất</a>
        </div>
    </div>

    <!-- Khu vực hiển thị nội dung động -->
    <div id="contentArea">
        <h2>Chào mừng đến với Trang Quản Lý</h2>
        <p>Hãy chọn một chức năng từ menu bên trái.</p>
    </div>

    <script>
        function loadContent(page) {
            $.ajax({
                url: page,
                type: "GET",
                success: function(data) {
                    $("#contentArea").html(data); // Chèn nội dung vào #contentArea
                },
                error: function() {
                    alert("Không thể tải nội dung. Vui lòng thử lại!");
                }
            });
        }
    </script>

</body>
</html>
