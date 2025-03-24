package Controllers;

import dal.AccountDAO;
import models.Account;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "AccountController", urlPatterns = {"/account"})
public class AccountController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AccountDAO accountDAO = new AccountDAO();
        List<Account> accounts = accountDAO.getAllAccounts();

        // Debug: Kiểm tra danh sách tài khoản có dữ liệu không
        if (accounts == null || accounts.isEmpty()) {
            System.out.println("⚠️ Danh sách tài khoản rỗng hoặc không có dữ liệu.");
        } else {
            for (Account acc : accounts) {
                System.out.println("ID: " + acc.getId() + ", Username: " + acc.getUsername());
            }
        }

        request.setAttribute("accounts", accounts);

        // Chuyển hướng về trang JSP
        request.getRequestDispatcher("/QuanLyTaiKhoan.jsp").forward(request, response);
    
        System.out.println("✅ Số tài khoản lấy được: " + accounts.size());
        for (Account acc : accounts) {
            System.out.println("ID: " + acc.getId() + ", Username: " + acc.getUsername());
        }

    }  
}
