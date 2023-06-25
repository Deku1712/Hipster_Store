package Control.Action;

import java.io.IOException;
import java.sql.SQLException;

import Control.DB.CartUserDAO;
import Model.Cart;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/deleteInCart"})
public class Delete extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int product_id = Integer.parseInt(req.getParameter("product_id"));
        int size = Integer.parseInt(req.getParameter("size"));
        HttpSession session = req.getSession();
        Cart cart = (Cart)session.getAttribute("cart_user");

        try {
            new CartUserDAO().delete(cart.getCartId(), product_id, size);
        } catch (ClassNotFoundException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        cart.deleteP(product_id, size);
        session.setAttribute("cart_user", cart);
        resp.sendRedirect("product");

    }
}
