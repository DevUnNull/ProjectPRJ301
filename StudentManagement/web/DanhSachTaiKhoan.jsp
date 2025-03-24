<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="models.Account" %>
<%@ page import="dal.AccountDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh Sách Tài Khoản</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>

<h2>Danh Sách Tài Khoản</h2>

<%
    AccountDAO accountDAO = new AccountDAO();
    List<Account> accounts = accountDAO.getAllAccounts();
%>

<table>
    <tr>
        <th>ID</th>
        <th>Username</th>
        <th>Email</th>
        <th>Role</th>
    </tr>
    <%
        for (Account acc : accounts) {
    %>
    <tr>
        <td><%= acc.getId() %></td>
        <td><%= acc.getUsername() %></td>
        <td><%= acc.getEmail() %></td>
        <td><%= acc.getRole() %></td>
    </tr>
    <%
        }
    %>
</table>

</body>
</html>
