package Control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.sendgrid.Response;

import Control.DB.ContentDAO;
import Model.Content;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet(urlPatterns = {"/blog"})
public class ContentServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<Content> list = new ContentDAO().getListContent();
            HttpSession session = req.getSession();
            session.setAttribute("listContent", list);
            // req.setAttribute("listContent", list);
            req.getRequestDispatcher("blog.jsp").forward(req, resp);
        } catch (SQLException | ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
    }

}