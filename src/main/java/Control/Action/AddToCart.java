package Control.Action;

import java.io.IOException;
import java.sql.SQLException;

import Control.DB.CartUserDAO;
import Control.DB.ProductDAO;
import Model.Cart;
import Model.Product;
import Model.Product_Cart;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/addToCart"})
public class AddToCart extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int product_id = Integer.parseInt(req.getParameter("product_id"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        int size =  Integer.parseInt(req.getParameter("size"));

        HttpSession session = req.getSession();
        if (session.getAttribute("user") != null)
        
        try {
            Product product = new ProductDAO().getProduct(product_id);
            Product_Cart product_Cart = new Product_Cart(product, size, quantity);
            Cart cart = (Cart) session.getAttribute("cart_user");
            cart.addP(product_Cart);
            session.setAttribute("cart_user", cart);
            new CartUserDAO().insertProduct(cart.getCartId(), product_id, quantity, size);

            resp.sendRedirect("product");


        } catch (ClassNotFoundException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        else{
            resp.sendRedirect("Login_SignUp.jsp");
        }
        
        
        
        

    }
}
