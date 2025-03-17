<%-- 
    Document   : Menu
    Created on : Mar 17, 2025, 7:37:05 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Menu Bên Trái</title>
        <link rel="stylesheet" href="Menu.css">
        <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    </head>
    <body>

        <div class="sidebar">
            <!-- Thông tin tài khoản -->
            <div class="user-info">
                <img src="IMAGE/lovepik-confident-workplace-business-male-image-png-image_400441790_wh1200.png" alt="Admin">
                <p class="username">Admin</p>
            </div>

            <ul>
                <li class="dropdown">
                    <a href="#"><i class="fas fa-users-cog"></i> Quản Lý Tài Khoản</a>
                    <ul class="submenu">
                        <li><a href="#">Quản Lý Sinh Viên</a></li>
                        <li><a href="#">Quản Lý Giáo Viên</a></li>
                    </ul>
                <li><a href="#"><i class="far fa-window-maximize"></i>Quản Lý Lớp Học</a></li>
                <li><a href="#"><i class="fas fa-trophy"></i>Quản Lý Điểm</a></li>                
            </ul>

            <div class="logout">
                <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Đăng Xuất</a>
            </div>
        </div>

        <div class="content">
            <h1>Chào mừng đến với trang web!</h1>
            <p>Đây là phần nội dung chính, bạn có thể thay đổi nội dung ở đây.</p>
        </div>

    </body>
</html>
