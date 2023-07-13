package Control.Shipper;

import Control.DB.OrderDAO;
import Control.DB.ShipDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns = {"/faildDelivery"})
public class FaildDelivery extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String order_id = req.getParameter("order_id");
        String reason = req.getParameter("reason");
        String page = "Home.jsp";
        String status_order = "faild";

        try {
            new OrderDAO().updateOrderId(status_order, order_id);
            new ShipDAO().updateShip(order_id, reason);
            page = "shipmentManagement";
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        resp.sendRedirect(page);
    }
}
