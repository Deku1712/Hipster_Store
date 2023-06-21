package Control.ControlWeb;

import java.io.IOException;
import java.sql.SQLException;

import Control.DB.NotificationDAO;
import Control.DB.UserDAO;
import Model.Notification;
import Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/changePassWord"})
public class ChangePassword extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String current = req.getParameter("currentPass");
        String newpass = req.getParameter("newPass");
        String confirmpass = req.getParameter("confirmPass");
        HttpSession session = req.getSession();
        String user = (String) session.getAttribute("user");
        String password;
        String title = "Change PassWord";
        String content ="";
        try {
            password = new UserDAO().getPass(user);
            User u = new UserDAO().getProfile(user);
            if(current.equals(password)){
                if(newpass.equals(confirmpass)){
                    new UserDAO().updatePassword(u.getEmail(), newpass);
                    content = "Password changed successfully, please login again to update the latest changes.";
                    
                }
                else{
                    content = "Password change failed";
                }
        }
        else{
            content = "Password change failed";
        }
        new NotificationDAO().insertNoti(user, title, content);
        } catch (ClassNotFoundException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        resp.sendRedirect("profile");
        
    }
    
}
