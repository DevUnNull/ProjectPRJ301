<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="dal.AccountDAO, models.Account" %>

<%
    String idParam = request.getParameter("id");
    int id = 0; // Giá trị mặc định
    String message = "";

    if (idParam != null && !idParam.isEmpty()) {
        try {
            id = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            message = "<p style='color:red;'>Lỗi: ID không hợp lệ!</p>";
        }
    } else {
        message = "<p style='color:red;'>Lỗi: ID không được cung cấp!</p>";
    }

    Account acc = null;
    if (id > 0) {
        AccountDAO dao = new AccountDAO();
        acc = dao.getAccountById(id);
    }
%>

<html>
<head>
    <title>Chỉnh sửa tài khoản</title>
</head>
<body>
    <h2>Chỉnh sửa tài khoản</h2>

    <%= message %>

    <% if (acc != null) { %>
        <form action="UpdateAccountServlet" method="post">
            <input type="hidden" name="id" value="<%= acc.getId() %>">

            <label>Tên đăng nhập:</label>
            <input type="text" name="username" value="<%= acc.getUsername() %>" required><br>

            <label>Email:</label>
            <input type="email" name="email" value="<%= acc.getEmail() %>" required><br>

            <label>Quyền (Role):</label>
            <input type="number" name="role" value="<%= acc.getRole() %>" required><br>

            <input type="submit" value="Cập nhật">
        </form>

        <!-- Nút đưa role về 0 thay vì xóa -->
        <!-- Nút đưa role về 0 thay vì xóa -->
<form action="UpdateAccountServlet" method="post" onsubmit="return confirm('Bạn có chắc chắn muốn vô hiệu hóa tài khoản này không?');">
    <input type="hidden" name="id" value="<%= acc.getId() %>">
    <input type="hidden" name="delete" value="1">
    <input type="submit" value="Vô hiệu hóa tài khoản" style="background-color:red; color:white;">
</form>


    <% } else { %>
        <p style="color:red;">Không tìm thấy tài khoản hoặc ID không hợp lệ!</p>
    <% } %>
</body>
</html>
