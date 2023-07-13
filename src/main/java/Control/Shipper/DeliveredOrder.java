package Control.Shipper;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.stream.Collectors;

import Control.DB.ShipDAO;
import Model.Shipper;
import Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet(urlPatterns = {"/delivereddOrder"})
public class DeliveredOrder extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
        HttpSession session = req.getSession();
        User ad = (User)  session.getAttribute("admin");
        String page ="Home.jsp";
        if(ad != null & ad.getRole().equals("shipper")){
            try {
                List<Shipper> list = new ShipDAO().getOrderFollowShipper(ad.getUsername());
                List<Shipper> list_deliveredOrder = list.stream().filter(s -> (s.getOrder().getOrderDetail().getStatus_order().equals("success"))||(s.getOrder().getOrderDetail().getStatus_order().equals("faild"))).collect(Collectors.toList());
                int faild = 0;
                int success = 0; 
                float total = 0;
                for (Shipper shipper : list_deliveredOrder) {
                    if(shipper.getOrder().getOrderDetail().getStatus_order().equals("faild")){
                        faild += 1;
                    }
                    else {
                        success += 1;
                        total += shipper.getOrder().getOrderDetail().getTotal_price();
                    }
                }
                
                

                req.setAttribute("faild", faild);
                req.setAttribute("success", success);
                req.setAttribute("revenue", total);
                req.setAttribute("deliveredOrder", list_deliveredOrder);
                page = "ship_delivered.jsp";
            } catch (ClassNotFoundException | SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        req.getRequestDispatcher(page).forward(req, resp);
        
    }
    
    
}
