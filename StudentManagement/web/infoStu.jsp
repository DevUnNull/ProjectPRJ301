<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="SidebarStudent.jsp"/>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Information Student</title>
</head>
<body>
    
    <form action="student">
        Mã sinh viên: <input type="text" name="codesv" required="Please enter the studentId"/>
        <input type="submit" value="OK" />
    </form>

    <c:if test="${not empty requestScope.Errormes}">
        <p style="color: red;">${requestScope.Errormes}</p>
    </c:if>

    <c:if test="${not empty requestScope.existStudent}">
        <table border="1">
            <thead>
                <tr>
                    <th>StudentId</th>
                    <th>Name</th>
                    <th>Gender</th>
                    <th>Address</th>
                    <th>Phone</th>
                    <th>Email</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>${existStudent.studentID}</td>
                    <td>${existStudent.studentName}</td>
                    <td>${existStudent.gender}</td>
                    <td>${existStudent.address}</td>
                    <td>${existStudent.phone}</td>
                    <td>${existStudent.email}</td>
                </tr>
            </tbody>
        </table>
    </c:if>
</body>
</html>
