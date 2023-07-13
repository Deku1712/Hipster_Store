package Control.Action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import Control.Feature;
import Control.DB.CartDAO;
import Control.DB.CartUserDAO;
import Control.DB.FeeDao;
import Control.DB.UserDAO;
import Model.Account_SignUp;
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
@WebServlet(urlPatterns = {"/login"})
public class Login extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String remember = req.getParameter("rem");
        boolean check = false;
        String page ="";
        try {
            List<Account_SignUp> list_acc = new UserDAO().getListAcc();
          for (Account_SignUp acc : list_acc) {
            if(acc.getUsername().equals(username)&acc.getPassword().equals(password)){
                if(remember!= null){
                    Cookie cookie = new Cookie("user", username);
                    cookie.setMaxAge(3000);
                    resp.addCookie(cookie);
                }
                HttpSession session = req.getSession();
                session.setAttribute("user", username);
                User ad  = new UserDAO().getProfile(username);
                session.setAttribute("admin", ad);
                Cart cart = new Cart( );
                int cart_id = new CartDAO().getCartId(username);
                cart.setCartId(cart_id);
                cart.setList_product(new CartUserDAO().getListProductInCart(cart_id));

                List<Fee> listFee = new FeeDao().getListFee();
                session.setAttribute("list_fee", listFee);
                session.setAttribute("cart_user", cart);
                check = true;
                User user = new UserDAO().getProfile(username);
                page = new Feature().checkRole(user.getRole());
                break;
            }
            
          }
        } catch (ClassNotFoundException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        if (check){
             resp.sendRedirect(page);
        }
        else{

            req.setAttribute("nofication_in", "0" );
            req.getRequestDispatcher("/Login_SignUp.jsp").forward(req, resp);
        }
        


    }
}
