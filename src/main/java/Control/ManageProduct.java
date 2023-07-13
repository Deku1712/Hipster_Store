package Control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Control.DB.ProductDAO;
import Model.Price;
import Model.Product;
import Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet(urlPatterns = {"/manageProduct"})
public class ManageProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String page = "Home.jsp";
        User ad = (User) session.getAttribute("admin");
        if(ad != null) {

            if(ad.getRole().equals("admin") || ad.getRole().equals("seller")){
    
                page = "ManageProduct.jsp";
                try {
                    List<Product> list_p = new ProductDAO().getListProducttoManage();
                    
                    
                    req.setAttribute("manageProduct", list_p);
                } catch (ClassNotFoundException | SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
        }

        req.getRequestDispatcher(page).forward(req, resp); 
        
    }

    

    

    
    
    


}
