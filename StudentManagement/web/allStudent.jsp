<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="SidebarStudent.jsp"/>

<c:if test="${not empty studentClass}">
    <table border="1">
        <thead>
            <tr>
                <th>Student ID</th>
                <th>Student Name</th>
                <th>Gender</th>
                <th>Address</th>
                <th>Phone</th>
                <th>Email</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="s" items="${studentClass}">
                <tr>
                <td>${s.getStudentID()}</td>
                <td>${s.getStudentName()}</td>
                <td>${s.getGender()}</td>
                <td>${s.getAddress()}</td>
                <td>${s.getPhone()}</td>
                <td>${s.getEmail()}</td>
            </tr>
            </c:forEach>
        </tbody>
    </table>

</c:if>
    </body>
</html>
