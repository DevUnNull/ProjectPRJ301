<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="SidebarStudent.jsp"/>
<link rel="stylesheet" href="class.css">
        <div class="content">
            <!-- Form nhập mã sinh viên -->
      <div class="table-1">
        <form action="student" method="get">
            <input type="hidden" name="action" value="depa"/>
            Student Code: <input type="text" name="idsv" required/>
            <input type="submit" value="OK" />
        </form>
        <br/>

        <!-- Hiển thị thông báo lỗi nếu có -->
        <c:if test="${not empty Loi}">
            <p style="color: red;">${Loi}</p>
        </c:if>
            </div>
            <div class="table-2">
            <c:if test="${not empty existstudent}">
                <table border="1">
                    <thead>
                        <tr>
                            <th>ClassId</th>
                            <th>ClassName</th>
                            <th>Department</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="a" items="${existstudent}">
                        <tr>
                            <td>${a.getClaId()}</td>
                            <td>${a.getClaName()}</td>
                            <td>${a.getDepName()}</td>
                        </tr>
                            
                        </c:forEach>
                    </tbody>
                </table>

            </c:if>
                </div>
        <!-- Hiển thị danh sách lớp nếu có -->
            <p>${requestScope.ClassId}</p>
            <p>${requestScope.ClassName}</p>
            <p>${requestScope.Department}</p>
            
        
        </div>

    </body>
</html>
