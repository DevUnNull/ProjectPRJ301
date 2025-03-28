package Controllers;

import dal.StudentDAO;
import dto.GradeJoin;
import dto.StuClaDepJoin;
import dto.StudentClass;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import models.Student;
import models.Account;
import models.Semester;

@WebServlet(name = "StudentController", urlPatterns = {"/student"})
public class StudentController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy session và kiểm tra quyền truy cập
        Account account = (Account) req.getSession().getAttribute("account");
        if (account == null || account.getRole() != 3) {
            resp.sendRedirect("login.jsp"); // Chuyển hướng về trang đăng nhập nếu không có quyền
            return;
        }

        StudentDAO studentDAO = new StudentDAO();
        String action = req.getParameter("action");

        try {
            //Hiển thị thông tin sinh viên
            if (action == null || action.equals("info")) {
                String idParam = req.getParameter("codesv");

                // Kiểm tra nếu ID không nhập hoặc sai định dạng
                if (idParam == null || idParam.trim().isEmpty()) {
                    req.setAttribute("error", "Vui lòng nhập mã sinh viên!");
                    req.getRequestDispatcher("infoStu.jsp").forward(req, resp);
                    return;
                }

                // Kiểm tra xem sinh viên có tồn tại không
                Student existStu = studentDAO.getStudentById(idParam);
                if (existStu == null) {
                    req.setAttribute("Errormes", "Không tìm thấy sinh viên!");
                } else {
                    req.setAttribute("existStudent", existStu);
                }

                req.getRequestDispatcher("infoStu.jsp").forward(req, resp);
            }
            //Hiển thị lớp và phòng học của sinh viên
            if (action == null || action.equals("depa")) {
                try {
                    String idsvStr = req.getParameter("idsv");

                    if (idsvStr != null) {
                        if (idsvStr.trim().isEmpty()) {
                            req.setAttribute("Loi", "Vui lòng nhập mã sinh viên!");
                        } else {
                            List<StuClaDepJoin> exstu = studentDAO.getClass(idsvStr);
                            if (exstu != null && !exstu.isEmpty()) {
                                req.setAttribute("existstudent", exstu);
                            }else{
                                req.setAttribute("Loi", "Mã sinh viên không tồn tại!");
                            }
                        }
                    }

                    req.getRequestDispatcher("class.jsp").forward(req, resp);
                } catch (Exception e) {
                    e.printStackTrace();
                    req.setAttribute("Loi", "Đã xảy ra lỗi hệ thống!");
                    req.getRequestDispatcher("class.jsp").forward(req, resp);
                }

            }
            // Hiển thị điểm của sinh viên
            if (action == null || action.equals("grade")) {
                try {
                    String id = req.getParameter("studentCode");
                    String semId = req.getParameter("semester");
                    String msg = "";

                    // Kiểm tra nếu không nhập mã sinh viên
                    if (id != null) {
                        if (id.trim().isEmpty()) {
                            msg = "Vui lòng nhập mã sinh viên!";
                            req.setAttribute("msg", msg);
                        } else {
                            List<GradeJoin> existGrade = studentDAO.getAllGrade(id, semId);
                            if (existGrade != null && !existGrade.isEmpty()) {
                                req.setAttribute("existGrade", existGrade);
                            } else {
                                msg = "Mã sinh viên không tồn tại hoặc không có điểm!";
                                req.setAttribute("msg", msg);
                            }
                        }
                    }

                    // Lấy danh sách học kỳ và gửi về JSP
                    List<Semester> existSe = studentDAO.getSemesterName();
                    req.setAttribute("semester", existSe);
                    req.getRequestDispatcher("grade.jsp").forward(req, resp);
                } catch (Exception e) {
                }

            }
            //Hiển thị thông tin sinh viên 1 lớp
            if ("stu".equals(action)) {
                String claName = req.getParameter("ClassName");
                List<StudentClass> sc = studentDAO.getAllStudentByClassName(claName);
                if(sc != null){
                    req.setAttribute("studentClass", sc);
                }
                req.getRequestDispatcher("allStudent.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            System.err.println("Lỗi: " + e.getMessage());
        }

    }

}
