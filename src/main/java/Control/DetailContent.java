package Control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.sendgrid.Request;

import Control.DB.ContentDAO;
import Model.Content;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet(urlPatterns = {"/blog-detail"})
public class DetailContent extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        String content_id = req.getParameter("content_id");
        HttpSession session = req.getSession();
        List<Content> list = (List<Content>) session.getAttribute("listContent");
        for (Content content : list) {
            if(content.getId().equals(content_id)){
                req.setAttribute("content_choose", content);
                break;
            }
        }
        req.getRequestDispatcher("blog-detail.jsp").forward(req, resp);
        
        }
}