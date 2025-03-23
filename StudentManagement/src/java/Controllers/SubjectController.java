package Controllers;

import dal.SubjectDAO;
import dto.SubjectJoin;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "SubjectController", urlPatterns = {"/subject"})
public class SubjectController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if ("sub".equals(action)) {
            String subName = req.getParameter("subjectName");
            if (subName == null || subName.trim().isEmpty()) {
                req.setAttribute("error", "Không có tên môn học!");
                req.getRequestDispatcher("subject.jsp").forward(req, resp);
                return;
            }
            SubjectDAO subjectDAO = new SubjectDAO();
            SubjectJoin subjectJoin = subjectDAO.getInfoSubjectByName(subName);
            if (subjectJoin != null) {
                req.setAttribute("subject", subjectJoin);
            } else {
                req.setAttribute("error", "Không tìm thấy môn học.");
            }
            req.getRequestDispatcher("subject.jsp").forward(req, resp);
        }
    }
}
