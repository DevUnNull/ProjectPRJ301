<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quản Lý Sinh Viên</title>
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
    <h2>Quản Lý Sinh Viên</h2>
    <a href="ThemSinhVien.jsp">➕ Thêm sinh viên</a>
    <table>
        <tr>
            <th>Mã SV</th>
            <th>Họ và Tên</th>
            <th>Ngày Sinh</th>
            <th>Email</th>
            <th>Thao tác</th>
        </tr>

        <c:choose>
            <c:when test="${not empty students}">
                <c:forEach var="sv" items="${students}">
                    <tr>
                        <td>${sv.id}</td>
                        <td>${sv.fullName}</td>
                        <td>${sv.birthDate}</td>
                        <td>${sv.email}</td>
                        <td class="action-links">
                            <a href="SuaSinhVien.jsp?id=${sv.id}">✏ Chỉnh sửa</a> | 
                            <a href="XoaSinhVienController?id=${sv.id}" onclick="return confirm('Bạn có chắc muốn xóa?');">❌ Xóa</a>
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
