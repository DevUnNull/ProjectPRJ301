<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="SidebarStudent.jsp"/>

        <div class="content">
             <form action="student">
            <table>
                <tbody>
                    <tr>
                        <td>Enter the student code:</td>
                        <td><input type="text" name="studentCode"/></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="hidden" name="action" value="grade"></td>
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
        </form>
        <c:if test="${not empty requestScope.existGrade}">
            <table border="1">
                <thead>
                    <tr>
                        <th>Subject Name</th>
                        <th>Factor 1</th>
                        <th>Factor 3</th>
                        <th>Factor 6</th>
                        <th>Total Grade</th>
                    </tr>
                </thead>
                <tbody>

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
        </c:if>
        </div>

    </body>
</html>
