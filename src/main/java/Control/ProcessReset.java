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

@WebServlet(urlPatterns = {"/UpdatePassWord"})
public class ProcessReset extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String email = session.getAttribute("email").toString();
        String newpass = req.getParameter("new_pass");
        try {
            new UserDAO().updatePassword(email, newpass);
            session.removeAttribute("email");
            req.setAttribute("check", "Successfully change password");
            req.getRequestDispatcher("Login_SignUp.jsp").forward(req, resp);
        } catch (ClassNotFoundException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        

    }

}
