package Control.Shipper;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.stream.Collectors;

import Control.DB.OrderDAO;
import Model.Order;
import Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet(urlPatterns = {"/orderManagement"})
public class OrderManagement extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Order> list_order;
        HttpSession session = req.getSession();
        User ad = (User)  session.getAttribute("admin");
        String page ="Home.jsp";
        if(ad != null & ad.getRole().equals("shipper")){
            try {
                list_order = new OrderDAO().getAllOrder();
                List<Order> list_order_prepare = list_order.stream().filter(order -> order.getOrderDetail().getStatus_order().equals(" Preparing for delivery")).collect(Collectors.toList());
                req.setAttribute("list_order_prepare", list_order_prepare);
                page ="ship_orders.jsp";
            } catch (ClassNotFoundException | SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

        }
        req.getRequestDispatcher(page).forward(req, resp);
    }
    
}
