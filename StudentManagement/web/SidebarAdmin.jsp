<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    
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
            <li><a href="QuanLyLopHoc.jsp"><i class="far fa-window-maximize"></i> Quản Lý Lớp Học</a></li>
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
