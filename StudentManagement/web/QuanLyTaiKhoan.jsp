<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="SidebarAdmin.jsp"/>
<link rel="stylesheet" href="QuanLyTaiKhoan.css">
<div class="content">
    <h2>Quản Lý Tài Khoản</h2>
    <% System.out.println("✅ accounts trong JSP: " + request.getAttribute("accounts")); %>
    <a href="ThemTaiKhoan.jsp">➕ Thêm tài khoản</a>
    <table boder="1">
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Email</th>
            <th>Role</th>
            <th>Thao tác</th>
        </tr>

        <c:choose>
            <c:when test="${not empty accounts}">
                <c:forEach var="acc" items="${accounts}">
                    <tr>
                        <td>${acc.id}</td>
                        <td>${acc.username}</td>
                        <td>${acc.email}</td>
                        <td>${acc.role == 1 ? "Admin" : "User"}</td>
                        <td class="action-links">
                            <a href="SuaTaiKhoan.jsp?id=${acc.id}">✏ Chỉnh sửa</a> | 
                            <a href="XoaTaiKhoanController?id=${acc.id}" onclick="return confirm('Bạn có chắc muốn xóa?');">❌ Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="5" class="no-data">⚠️ Không có dữ liệu</td>
                </tr>
            </c:otherwise>
        </c:choose>
    </table>
</div>
</body>
</html>



