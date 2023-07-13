package Control.Action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import Control.Feature;
import Control.DB.CartDAO;
import Control.DB.CartUserDAO;
import Control.DB.FeeDao;
import Control.DB.UserDAO;
import Model.Cart;
import Model.Fee;
import Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/checkCookie"})
public class CheckCookie  extends HttpServlet{
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Cookie[] cookies = req.getCookies();
        String page = "Login_SignUp.jsp";
        for (Cookie cookie : cookies) {
            if(cookie.getName().equals("user")){
                session.setAttribute("user", cookie.getValue());
                Cart cart = new Cart();
                int cart_id;
                try {
                    cart_id = new CartDAO().getCartId(cookie.getValue());
                    cart.setCartId(cart_id);
                    cart.setList_product(new CartUserDAO().getListProductInCart(cart_id));
                    
                    List<Fee> listFee = new FeeDao().getListFee();
                    session.setAttribute("list_fee", listFee);
                    session.setAttribute("cart_user", cart);
                    User user = new UserDAO().getProfile(cookie.getValue());
                    session.setAttribute("admin", user);
                    page = new Feature().checkRole(user.getRole());
                } catch (ClassNotFoundException | SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
                break;
            }
        }
        resp.sendRedirect(page);

    }
}
