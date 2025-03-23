<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="SidebarStudent.jsp"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Subject</title>
    </head>
    <body>
        <h2>Thông tin môn học</h2>

    <c:if test="${not empty subject}">
        <p><strong>Mã môn học:</strong> ${subject.getSubId()}</p><br/>
        <p><strong>Tên môn học:</strong> ${subject.getSubName()}</p><br/>
        <p><strong>Số tín chỉ:</strong> ${subject.getCreditName()}</p><br/>
        <p><strong>Branch:</strong> ${subject.getBranchName()}</p><br/>
    </c:if>

    <c:if test="${not empty error}">
        <p style="color:red">${error}</p>
    </c:if>

    <a href="grade.jsp">Quay lại</a>
    </body>
</html>
