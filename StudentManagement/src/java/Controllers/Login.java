package Controllers;

import dal.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Account;

/**
 *
 * @author Admin
 */
@WebServlet(name = "Login", urlPatterns = {"/login"})
public class Login extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Xử lý thông tin acount
        String em = req.getParameter("email");
        String pw = req.getParameter("password");
        Account existAccount = new LoginDAO().login(em, pw);
        // Kiểm tra đăng nhập
        try {
            if (existAccount != null) {
                // Tạo session
                HttpSession session = req.getSession();
                session.setAttribute("account", existAccount);

                // Kiểm tra role để chuyển hướng
                int role = existAccount.getRole();
                if (role == 1) {
                    resp.sendRedirect(req.getContextPath() + "/viewAdmin.jsp");
                } else if (role == 2) {
                    resp.sendRedirect(req.getContextPath() + "/viewTeacher.jsp");
                } else if (role == 3) {
                    resp.sendRedirect(req.getContextPath() + "/viewStudent.jsp");
                } else {
                    req.setAttribute("mes", "Role không hợp lệ!");
                    req.getRequestDispatcher("/Login.jsp").forward(req, resp);
                }
                return; // Dừng tại đây để tránh chạy tiếp forward()
            }

            // Nếu đăng nhập thất bại
            req.setAttribute("mes", "Email hoặc mật khẩu không đúng!");
            req.getRequestDispatcher("/Login.jsp").forward(req, resp);
        } catch (Exception e) {
            System.err.println("Lỗi: " + e.getMessage());
            req.setAttribute("mes", "Đã xảy ra lỗi hệ thống!");
            req.getRequestDispatcher("/Login.jsp").forward(req, resp);
        }

    }
}
