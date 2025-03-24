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
                <img src="IMAGE/lovepik-confident-workplace-business-male-image-png-image_400441790_wh1200.png" alt="Student">
                <p class="username">Student</p>
            </div>

            <ul>
                <li><a href="student?action=info"><i class="fas fa-users-cog"></i> Thông tin cá nhân</a></li>
                <li><a href="student?action=depa"><i class="far fa-window-maximize"></i>Lớp Học</a></li>
                <li><a href="student?action=grade"><i class="fas fa-trophy"></i>Xem Điểm</a></li>                
            </ul>

             
            <div class="logout">
                <a href="Login.jsp"><i class="fas fa-sign-out-alt"></i> Đăng Xuất</a>
            </div>
        </div>
