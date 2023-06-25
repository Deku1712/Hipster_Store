package Control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import Control.DB.CartUserDAO;
import Model.Cart;
import Model.Product_Cart;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/updateCart"})
public class UpdateCart  extends HttpServlet{
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Cart cart = (Cart)session.getAttribute("cart_user");
        List<Product_Cart> list = cart.getList_product();
        for (Product_Cart product_Car : list) {
            int p_id = product_Car.getProduct().getProduct_id();
            String quantitString = p_id + "quantitysize"+product_Car.getSize();
            String sizeString = p_id+"size"+product_Car.getSize();
            int quantity = Integer.parseInt(req.getParameter(quantitString));
            int size = Integer.parseInt(req.getParameter(sizeString));
            product_Car.setQuantity(quantity);
            product_Car.setSize(size);
        }
        try {
            new CartUserDAO().editCart(cart);
            cart.setList_product(new CartUserDAO().getListProductInCart(cart.getCartId()));          
        } catch (ClassNotFoundException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        session.setAttribute("cart_user", cart);
        resp.sendRedirect("shoping-cart.jsp");
    }
}
