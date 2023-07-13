package Control.Shipper;

import Control.DB.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
@WebServlet(urlPatterns = {"/success"})
public class SuccessOrder extends HttpServlet  {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String order_id = req.getParameter("order_id");
        String status_order = "success";
        String page ="Home.jsp";
        try {
            new OrderDAO().updateOrderId(status_order, order_id);
            page = "shipmentManagement";

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        resp.sendRedirect(page);
    }
}
