package Control.ControlWeb;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Control.DB.ProductDAO;
import Model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/OrderBy" , "/range"})
public class Filter  extends HttpServlet{
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> listProduct = new ArrayList<>();
        
        String url = req.getRequestURI();
       

        if(url.contains("OrderBy")){
            String orderby = req.getParameter("orderby");
            
            try {
                listProduct = new ProductDAO().getListProduct(orderby);
                req.setAttribute("listProduct", listProduct);
            req.getRequestDispatcher("product.jsp").forward(req, resp);
            } catch (ClassNotFoundException | SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        else if(url.contains("range")){
            float min = Float.parseFloat(req.getParameter("min"));
            float max = Float.parseFloat(req.getParameter("max"));
            
            try {
                listProduct = new ProductDAO().getListProduct(min, max);
                req.setAttribute("listProduct", listProduct);
                req.getRequestDispatcher("product.jsp").forward(req, resp);
            } catch (ClassNotFoundException | SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }
}
