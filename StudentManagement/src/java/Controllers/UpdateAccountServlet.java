package Controllers;

import dal.AccountDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "UpdateAccountServlet", urlPatterns = {"/UpdateAccountServlet"})
public class UpdateAccountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Nhận tham số từ request
        String idParam = request.getParameter("id");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String roleParam = request.getParameter("role");
        String deleteParam = request.getParameter("delete"); // Kiểm tra nếu có thao tác xóa
        String message = ""; // Biến chứa thông báo lỗi

        // Kiểm tra ID hợp lệ
        if (idParam == null || idParam.isEmpty()) {
            message = "Lỗi: Không có ID được cung cấp!";
        } else {
            try {
                int id = Integer.parseInt(idParam);
                AccountDAO dao = new AccountDAO();

                if (deleteParam != null) {
                    // Nếu có tham số "delete", đặt role về 0
                    boolean deleted = dao.updateAccountRole(id, 0);
                    if (deleted) {
                        response.sendRedirect("DanhSachTaiKhoan.jsp"); // Thành công -> về danh sách
                        return;
                    } else {
                        message = "Lỗi: Không thể xóa tài khoản!";
                    }
                } else {
                    // Nếu không phải thao tác xóa, tiến hành cập nhật thông tin tài khoản
                    int role = (roleParam != null && !roleParam.isEmpty()) ? Integer.parseInt(roleParam) : 0;

                    // Kiểm tra username và email không rỗng
                    if (username == null || username.trim().isEmpty()) {
                        message = "Lỗi: Username không được để trống!";
                    } else if (email == null || email.trim().isEmpty()) {
                        message = "Lỗi: Email không được để trống!";
                    } else {
                        boolean updated = dao.updateAccountDetails(id, username, email, role);
                        if (updated) {
                            response.sendRedirect("DanhSachTaiKhoan.jsp"); // Thành công -> về danh sách
                            return;
                        } else {
                            message = "Lỗi: Không thể cập nhật tài khoản!";
                        }
                    }
                }
            } catch (NumberFormatException e) {
                message = "Lỗi: ID hoặc Role không hợp lệ!";
                e.printStackTrace();
            }
        }

        // Nếu có lỗi -> Chuyển hướng về trang cũ với thông báo
        response.sendRedirect("editAccount.jsp?id=" + idParam + "&error=" + message);
    
        
    }
}
