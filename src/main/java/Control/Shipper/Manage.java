package Control.Shipper;

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

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(urlPatterns = {"/manageShip"})
public class Manage  extends HttpServlet  {

    

    
}
