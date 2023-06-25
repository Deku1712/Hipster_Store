package Control;

import java.io.IOException;
import java.sql.SQLException;

import Control.DB.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/reset"})
public class Reset  extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        try {
            if (new UserDAO().checkEmail(email)){
                HttpSession session = req.getSession();
                session.setAttribute("email", email);
                req.setAttribute("check", "1");
                System.out.println("qua day chuwa ");
            }
        } catch (ClassNotFoundException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        req.getRequestDispatcher("Forgot_Password.jsp").forward(req, resp);
    }
}
