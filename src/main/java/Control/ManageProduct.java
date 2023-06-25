package Control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import Control.DB.ProductDAO;
import Model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet(urlPatterns = {"/manageProduct"})
public class ManageProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String page = "ManageProduct.jsp";
        try {
            List<Product> list_p = new ProductDAO().getListProducttoManage();
            req.setAttribute("manageProduct", list_p);
        } catch (ClassNotFoundException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        req.getRequestDispatcher(page).forward(req, resp); 
    }
}
