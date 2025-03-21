package controller;

import dal.GradeDAO;
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

@WebServlet("/StudentController")
public class StudentController extends HttpServlet {
    private GradeDAO gradeDAO;

    public StudentController() {
        gradeDAO = new GradeDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
//        Integer role = (Integer) session.getAttribute("role");
//        if (role != null && role == 3) {
//            try {
                // Giả định sinh viên có ID được lưu trong session
//                int studentID = 1; // Thay bằng logic lấy từ session hoặc Account
//                List<Grades> grades = gradeDAO.getGradesByStudent(studentID);
//                request.setAttribute("grades", grades);
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//            request.getRequestDispatcher("/viewStudent.jsp").forward(request, response);
//        } else {
//            response.sendRedirect("Login.jsp");
//        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}