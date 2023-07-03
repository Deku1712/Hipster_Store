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

@WebServlet(urlPatterns = {"/RemoveUser"})
public class RemoveUser extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userRemove = req.getParameter("userRemove");
        HttpSession session = req.getSession();
        String user = (String) session.getAttribute("user");
        String page = "adminPage";
        try {
            User userLog = new UserDAO().getProfile(user);
            if(userLog.getRole().equals("admin")){
                new UserDAO().removeUser(userRemove);
            }

        } catch (ClassNotFoundException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        resp.sendRedirect(page);

    }
}
