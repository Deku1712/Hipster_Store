package Control;

import Control.DB.NotificationDAO;
import Control.DB.OrderDAO;
import Model.Order;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns = {"/receiveOrder", "/cancelOrder"})
public class AdminOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getRequestURI();
        System.out.println("request: " + type);
        String order_id = req.getParameter("order_id");
        String username = req.getParameter("username");
        
        try {
            new OrderDAO().updateOrderId(type,order_id);
            if (type.contains("receiveOrder")) {
                String title = "Received orders";
                String content = "Order: -" + order_id
                        + "- has been received, it will be delivered to you soon in the next few days";
                new NotificationDAO().insertNoti(username, title, content);
            } else if (type.contains("cancelOrder")) {
                String title = "Cancel Orders";
                String content = "Order: -" + order_id
                        + "- was canceled for some reason in the store, Sorry for the inconvenience. ";
                new NotificationDAO().insertNoti(username, title, content);
              
            }
        } catch (ClassNotFoundException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    

            

        req.getRequestDispatcher("manageOrder").forward(req,resp);
    }
}
