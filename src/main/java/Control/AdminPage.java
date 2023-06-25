package Control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import Control.DB.UserDAO;
import Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/AdminPage"})
public class AdminPage extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String page = "Home.jsp";
        String username = (String) session.getAttribute("user");
        System.out.println(username);
        if(username != null){
            try {
                User user = new UserDAO().getProfile(username);
                if(user.getRole().equals("admin")){
                    page = "AdminPage.jsp";
                    List<User> list = new UserDAO().getListUser();
                    req.setAttribute("admin", user);
                    req.setAttribute("list_user", list);
                    
                }
            } catch (ClassNotFoundException | SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        req.getRequestDispatcher(page).forward(req, resp);
    }

}
