<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="SidebarAdmin.jsp"/>
<%@ page import="dal.AccountDAO, models.Account" %>
<link rel="stylesheet" href="SuaTaiKhoan.css">
<div class="content">


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



    <title>Chỉnh sửa tài khoản</title>




    <h2>Chỉnh sửa tài khoản</h2>

    <%= message %>

    <% if (acc != null) { %>
    <form action="UpdateAccountServlet" method="post">
        <input type="hidden" name="id" value="<%= acc.getId() %>">

        <div class="form-group">
            <label>Tên đăng nhập:</label>
            <input type="text" name="username" value="<%= acc.getUsername() %>" required>
        </div>

        <div class="form-group">
            <label>Email:</label>
            <input type="email" name="email" value="<%= acc.getEmail() %>" required>
        </div>

        <div class="form-group">
            <label>Quyền (Role):</label>
            <input type="number" name="role" value="<%= acc.getRole() %>" required>
        </div>

        <input type="submit" value="Cập nhật">
    </form>



    <!-- Nút đưa role về 0 thay vì xóa -->
    <form action="UpdateAccountServlet" method="post" onsubmit="return confirm('Bạn có chắc chắn muốn vô hiệu hóa tài khoản này không?');">
        <input type="hidden" name="id" value="<%= acc.getId() %>">
        <input type="hidden" name="delete" value="1">
        <input type="submit" value="Vô hiệu hóa tài khoản" class="disable-account">

    </form>


    <% } else { %>
    <p style="color:red;">Không tìm thấy tài khoản hoặc ID không hợp lệ!</p>
    <% } %>

</div>

</body>
</html>
