package Control.Shipper;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import Control.DB.OrderDAO;
import Control.DB.ShipDAO;
import Model.Order;
import Model.Shipper;
import Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet(urlPatterns = {"/shipmentManagement"})
public class ShipmentManagement  extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User ad = (User) session.getAttribute("admin");
        String page = "Home.jsp";
        if(ad != null & ad.getRole().equals("shipper")){
            try {
                List<Shipper> list_shipper = new ShipDAO().getOrderFollowShipper(ad.getUsername());
                List<Shipper> list_ship = list_shipper.stream().filter(s -> s.getOrder().getOrderDetail().getStatus_order().equals("shipping")).collect(Collectors.toList());
                
                req.setAttribute("shipper", list_ship);
                page = "ship_transit.jsp";
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }
        req.getRequestDispatcher(page).forward(req, resp);
        
    }
}
