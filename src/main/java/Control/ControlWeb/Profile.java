package Control.ControlWeb;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import Control.DB.NotificationDAO;
import Control.DB.OrderDAO;
import Control.DB.UserDAO;
import Model.Notification;
import Model.Order;
import Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet(urlPatterns = {"/profile"})
public class Profile extends HttpServlet  {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        try {
            User user = new UserDAO().getProfile(session.getAttribute("user").toString());
            List<Order> list_order = new OrderDAO().getListOrderForUser((String)session.getAttribute("user"));
            List<Notification> list_noti = new NotificationDAO().getNotificationForUser(session.getAttribute("user").toString());
            req.setAttribute("list_noti", list_noti);
            req.setAttribute("list_order", list_order);
            req.setAttribute("profile_user", user);
            req.getRequestDispatcher("Profile.jsp").forward(req, resp);
            
        } catch (ClassNotFoundException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
    }
}
