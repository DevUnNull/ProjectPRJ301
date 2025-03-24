<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="SidebarStudent.jsp"/>
<link rel="stylesheet" href="subject.css">

        <div class="content">
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
        </div>

    </body>
</html>
