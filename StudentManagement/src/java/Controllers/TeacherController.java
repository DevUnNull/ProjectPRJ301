package controller;

import dal.StudentDAO;
import dal.GradeDAO;
import models.Student;
import models.Grades;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/TeacherController")
public class TeacherController extends HttpServlet {
    private StudentDAO studentDAO;
    private GradeDAO gradeDAO;

    public TeacherController() {
        studentDAO = new StudentDAO();
        gradeDAO = new GradeDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer role = (Integer) session.getAttribute("role");
        if (role != null && role == 2) {
            try {
                List<Student> students = studentDAO.getAllStudents();
                request.setAttribute("students", students);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            request.getRequestDispatcher("/viewTeacher.jsp").forward(request, response);
        } else {
            response.sendRedirect("Login.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer role = (Integer) session.getAttribute("role");
        if (role != null && role == 2) {
            String action = request.getParameter("action");
            try {
                if ("addGrade".equals(action)) {
                    Grades grade = new Grades(
                        Integer.parseInt(request.getParameter("gradeID")),
                        Float.parseFloat(request.getParameter("factor1")),
                        Float.parseFloat(request.getParameter("factor3")),
                        Float.parseFloat(request.getParameter("factor6")),
                        Float.parseFloat(request.getParameter("totalGrade")),
                        request.getParameter("teacherID"),
                        Integer.parseInt(request.getParameter("studentID")),
                        request.getParameter("subjectID"),
                        request.getParameter("creditID"),
                        request.getParameter("branchID"),
                        request.getParameter("semesterID"),
                        request.getParameter("academicYearID")
                    );
                    gradeDAO.addGrade(grade);
                } else if ("updateGrade".equals(action)) {
                    Grades grade = new Grades(
                        Integer.parseInt(request.getParameter("gradeID")),
                        Float.parseFloat(request.getParameter("factor1")),
                        Float.parseFloat(request.getParameter("factor3")),
                        Float.parseFloat(request.getParameter("factor6")),
                        Float.parseFloat(request.getParameter("totalGrade")),
                        request.getParameter("teacherID"),
                        Integer.parseInt(request.getParameter("studentID")),
                        request.getParameter("subjectID"),
                        request.getParameter("creditID"),
                        request.getParameter("branchID"),
                        request.getParameter("semesterID"),
                        request.getParameter("academicYearID")
                    );
                    gradeDAO.updateGrade(grade);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            doGet(request, response);
        } else {
            response.sendRedirect("Login.jsp");
        }
    }
}