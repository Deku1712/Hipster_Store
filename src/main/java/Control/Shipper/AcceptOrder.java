package Control.Shipper;

import Control.DB.OrderDAO;
import Control.DB.ShipDAO;
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

@WebServlet(urlPatterns = {"/acceptOrder"})
public class AcceptOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String order_id = req.getParameter("order_id");
        String status_order = "shipping";
        HttpSession session = req.getSession();
        User ship = (User) session.getAttribute("admin");
        try {
            new OrderDAO().updateOrderId(status_order , order_id );
            new ShipDAO().insertOrderToShip(ship.getUsername(), order_id);
        } catch (ClassNotFoundException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
            
        resp.sendRedirect("orderManagement");
    }
}
