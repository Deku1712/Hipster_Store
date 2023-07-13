package Control.Action;

import java.io.IOException;
import java.sql.SQLException;

import Control.DB.UserDAO;
import Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/updateRole"})
public class UpdateRole extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String role = req.getParameter("role");
        HttpSession session = req.getSession();
        String username = (String) session.getAttribute("user");
        String userUpdate = req.getParameter("userUpdate");
        User user;
        try {
            user = new UserDAO().getProfile(username);
             if (user.getRole().equals("admin")){
            new UserDAO().updateRole(userUpdate , role);
        }
        } catch (ClassNotFoundException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
       
        resp.sendRedirect("AdminPage");
    }

    
}
