package Control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import Control.DB.OrderDAO;
import Control.DB.UserDAO;
import Model.Order;
import Model.Store;
import Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/AdminPage"})
public class AdminPage extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String page = "Home.jsp";
        String username = (String) session.getAttribute("user");
        System.out.println(username);
        if(username != null){
            User ad = (User) session.getAttribute("admin");
            if(ad.getRole().equals("admin")){
                try {
                    List<Order> list_order = new OrderDAO().getAllOrder();
                    float sales = new Store().calculatorSales(list_order);
                    page = "AdminPage.jsp";
                    List<User> list = new UserDAO().getListUser();
                    req.setAttribute("list_user", list);
                    req.setAttribute("listOrders", list_order);
                    req.setAttribute("Sales", sales);
                } catch (ClassNotFoundException | SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
        }
        req.getRequestDispatcher(page).forward(req, resp);
    }
    

}
