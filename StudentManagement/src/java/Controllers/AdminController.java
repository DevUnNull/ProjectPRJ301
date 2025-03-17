package controller;

import dal.StudentDAO;
import dal.TeacherDAO;
import dal.GradeDAO;
import dal.AccountDAO;
import models.Student;
import models.Teacher;
import models.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/AdminController")
public class AdminController extends HttpServlet {

    private StudentDAO studentDAO;
    private TeacherDAO teacherDAO;
    private GradeDAO gradeDAO;
    private AccountDAO accountDAO;

    public AdminController() {
        studentDAO = new StudentDAO();
        teacherDAO = new TeacherDAO();
        gradeDAO = new GradeDAO();
        accountDAO = new AccountDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Integer role = (Integer) session.getAttribute("role");
        if (role != null && role == 1) {
            String action = request.getParameter("action");
            try {
                if ("manageStudents".equals(action)) {
                    List<Student> students = studentDAO.getAllStudents();
                    request.setAttribute("students", students);
                } else if ("manageTeachers".equals(action)) {
                    List<Teacher> teachers = teacherDAO.getAllTeachers();
                    request.setAttribute("teachers", teachers);
                } else if ("manageAccounts".equals(action)) { // Thêm logic hiển thị tài khoản
                    List<Account> accounts = accountDAO.getAllAccounts();
                    request.setAttribute("accounts", accounts);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            request.getRequestDispatcher("/viewAdmin.jsp").forward(request, response);
        } else {
            response.sendRedirect("Login.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer role = (Integer) session.getAttribute("role");
        if (role != null && role == 1) {
            String action = request.getParameter("action");
            try {
                if ("addStudent".equals(action)) {
                    Student student = new Student(
                            Integer.parseInt(request.getParameter("studentID")),
                            request.getParameter("studentName"),
                            request.getParameter("address"),
                            Long.parseLong(request.getParameter("phone")),
                            request.getParameter("email"),
                            Integer.parseInt(request.getParameter("classID"))
                    );
                    studentDAO.addStudent(student);
                } else if ("deleteStudent".equals(action)) {
                    int studentID = Integer.parseInt(request.getParameter("studentID"));
                    studentDAO.deleteStudent(studentID);
                } else if ("addTeacher".equals(action)) {
                    Teacher teacher = new Teacher(
                            request.getParameter("teacherID"),
                            request.getParameter("teacherName"),
                            request.getParameter("address"),
                            Long.parseLong(request.getParameter("phone")),
                            request.getParameter("email")
                    );
                    teacherDAO.addTeacher(teacher);
                } else if ("deleteTeacher".equals(action)) {
                    String teacherID = request.getParameter("teacherID");
                    teacherDAO.deleteTeacher(teacherID);
                } else if ("deleteGrade".equals(action)) {
                    int gradeID = Integer.parseInt(request.getParameter("gradeID"));
                    gradeDAO.deleteGrade(gradeID);
                } else if ("addAccount".equals(action)) {
                    Account account = new Account(
                            Integer.parseInt(request.getParameter("id")),
                            request.getParameter("username"),
                            request.getParameter("password"),
                            request.getParameter("email"),
                            Integer.parseInt(request.getParameter("role"))
                    );
                    accountDAO.addAccount(account);
                } else if ("deleteAccount".equals(action)) { // Thêm logic xóa tài khoản
                    int accountID = Integer.parseInt(request.getParameter("id"));
                    accountDAO.deleteAccount(accountID);
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
