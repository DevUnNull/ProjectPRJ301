package Controllers;

import dal.StudentDAO;
import dto.GradeJoin;
import dto.StuClaDepJoin;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import models.Student;
import models.Account;

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
            //HIển tị lớp và phòng học của sinh viên
            if (action == null || "depa".equals(action)) {
                try {
                    String idsvStr = req.getParameter("idsv");
                    List<StuClaDepJoin> exstu = studentDAO.getClass(idsvStr);

                    if (idsvStr != null) {
                        req.setAttribute("existstudent", exstu);
                    } else {
                        req.setAttribute("Loi", "Không tồn tại mã sinh viên này");
                    }

                    req.getRequestDispatcher("class.jsp").forward(req, resp);
                } catch (Exception e) {
                    e.printStackTrace();
                    req.setAttribute("Loi", "Đã xảy ra lỗi hệ thống!");
                    req.getRequestDispatcher("class.jsp").forward(req, resp);
                }

            }
            //Hiển thị điểm của sinh viên
            if ("grade".equals(action)) {
                try {
                    String id = req.getParameter("studentCode");
                    String msg = "";
                    if (id == null || id.trim().isEmpty()) {
                        msg = "Vui lòng nhập mã sinh viên!";
                        req.setAttribute("msg", msg);
                    }
                    List<GradeJoin> existGrade = studentDAO.getAllGrade(id);
                    if (existGrade != null && !existGrade.isEmpty()) {
                        req.setAttribute("existGrade", existGrade);
                    } else {
                        msg = "Mã sinh viên không tồn tại!";
                        req.setAttribute("msg", msg);
                    }
                    req.getRequestDispatcher("grade.jsp").forward(req, resp);
                } catch (Exception e) {
                }                
            }
        } catch (Exception e) {
            System.err.println("Lỗi: " + e.getMessage());
        }

    }

}
