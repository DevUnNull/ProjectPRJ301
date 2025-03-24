<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="SidebarStudent.jsp"/>
<link rel="stylesheet" href="grade.css">
        <div class="content">
             <form action="student">
                 <div class="table-1">
                 <table>
                <tbody>
                    <tr class="Search">
                        <td>Enter the student code:</td>
                        <td><input type="text" name="studentCode"/></td>
                    </tr>
                    <tr>
                  <input type="hidden" name="action" value="grade">
                    </tr>
                    <tr>
                        <td><input type="submit" value="OK" /></td>
                            <c:if test="${not empty requestScope.msg}">
                            <td>
                                ${requestScope.msg}
                            </td>
                        </c:if>

                    </tr>
                </tbody>
            </table>
                     </div>
        </form>
        <c:if test="${not empty requestScope.existGrade}">
            <div class="table-2">
            <table border="1">
                <thead class="Table-Header">
                    <tr>
                        <th>Subject Name</th>
                        <th>Factor 1</th>
                        <th>Factor 3</th>
                        <th>Factor 6</th>
                        <th>Total Grade</th>
                    </tr>
                </thead>
                <tbody class="tab">

                    <c:forEach var="g" items="${requestScope.existGrade}">
                        <tr>
                            <td><a href="subject?action=sub&subjectName=${g.getSubName()}">${g.getSubName()}</a></td>
                            <td>${g.getF1()}</td>
                            <td>${g.getF2()}</td>
                            <td>${g.getF3()}</td>
                            <td>${g.getTotalGrade()}</td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
                </div>
        </c:if>
        </div>

    </body>
</html>
