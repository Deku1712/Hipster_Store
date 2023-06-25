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

@WebServlet(urlPatterns = {"/detailProduct"})
public class DetailProduct extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        float price = Float.parseFloat(req.getParameter("profit_price"));
        String brand = req.getParameter("brand");
        String color = req.getParameter("color");

        System.out.println(price + "--"+ brand + "--" + color);
        try {
            List<Product> list = new ProductDAO().getListProductRelated(brand, price, color);
            req.setAttribute("list_product_related", list);
        } catch (ClassNotFoundException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        req.getRequestDispatcher("product-detail.jsp").forward(req, resp);
    }
}
