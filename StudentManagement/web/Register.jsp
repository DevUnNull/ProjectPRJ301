<%-- 
    Document   : Register
    Created on : Mar 12, 2025, 7:44:55 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
      <head>
        <title>Quản Lý Sinh Viên</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="Login.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <body>
        <div class="wrapper">
        <form action="">
            <h1>Register</h1>

            <div class="input-box">
                <input type="text" placeholder="Username" required>
                <i class='bx bx-user-circle'></i>
            </div>
            <div class="input-box">
                <input type="password" placeholder="Password" required>
                <i class='bx bxs-lock-open'></i>
            </div>
            <div class="input-box">
                <input type="password" placeholder="Re-enter password" required>
                <i class='bx bxs-lock-open'></i>
            </div>
            
            

            <button type="submit" class="btn">Đăng Ký</button>

            
        </form>
    </div>
    </body>
</html>
