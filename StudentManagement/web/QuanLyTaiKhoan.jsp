<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quản Lý Tài Khoản</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        .no-data {
            text-align: center;
            font-style: italic;
            color: gray;
        }
        .action-links a {
            margin: 0 5px;
            text-decoration: none;
            color: blue;
        }
        .action-links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h2>Quản Lý Tài Khoản</h2>
    <% System.out.println("✅ accounts trong JSP: " + request.getAttribute("accounts")); %>
    <a href="ThemTaiKhoan.jsp">➕ Thêm tài khoản</a>
    <table>
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
</body>
</html>
