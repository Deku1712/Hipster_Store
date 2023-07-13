package Control;

import Control.DB.OrderDAO;
import Model.Order;
import Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(urlPatterns = {"/manageOrder"})
public class ManageOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = "Home.jsp";
        HttpSession session = req.getSession();
        User ad = (User) session.getAttribute("admin");
        if(ad != null) {

            if(ad.getRole().equals("admin") || ad.getRole().equals("seller")){
                url = "ManageOrder.jsp";
                try {
                    List<Order> list = new OrderDAO().getAllOrder();
                    req.setAttribute("listOrders", list);
                    
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
            }
        }

        req.getRequestDispatcher(url).forward(req, resp);
        

    }
    
    
}
