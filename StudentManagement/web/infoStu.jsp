<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="SidebarStudent.jsp"/>
<link rel="stylesheet" href="infoStu.css">
<div class="content">
    <div class="table-1">
        <form action="student">
            Student Code: <input type="text" name="codesv" required="Please enter the studentId"/>
            <input type="submit" value="OK" />
        </form>

        <c:if test="${not empty requestScope.Errormes}">
            <p style="color: red;">${requestScope.Errormes}</p>
        </c:if>
    </div>
    <div class="table-2">
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
        </div>
</div>

</body>
</html>
