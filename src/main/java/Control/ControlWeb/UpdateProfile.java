package Control.ControlWeb;

import java.io.IOException;
import java.sql.SQLException;

import Control.Feature;
import Control.DB.NotificationDAO;
import Control.DB.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
@MultipartConfig(
    location = "D:\\SU23\\SWP301\\WorkSpace_SWP\\vai2\\hipster_sneaker_shop\\src\\main\\webapp\\imgs"
)
@WebServlet(urlPatterns = {"/updateProfile"})
public class UpdateProfile extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fullName = req.getParameter("nameUpdate");
        String address = req.getParameter("address");
        String phone = req.getParameter("phone");
        Part part = req.getPart("linkimg");
        String filename = new Feature().getFileName(part);
        part.write( filename);
        HttpSession session = req.getSession();
        String username = (String)session.getAttribute("user");
        String title = "Update profile Success";
        String content ="Update profile success, view your change in your profile";
        try {
            new UserDAO().editProfile(fullName, address, username , filename , phone );
            new NotificationDAO().insertNoti(username, title, content);
            resp.sendRedirect("profile");
        } catch (ClassNotFoundException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }
}
