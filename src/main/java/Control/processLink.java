package Control;

import java.io.IOException;
import java.sql.SQLException;

import Control.DB.CartDAO;
import Control.DB.UserDAO;
import Model.Account_SignUp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet(urlPatterns = {"/process"})
public class processLink extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        Account_SignUp  acc = new Account_SignUp(username, password, email);
        try {
            new UserDAO().insertUserTable(acc);
            new CartDAO().insertCartTable(username);
            req.setAttribute("nofication_in", "1");
            req.getRequestDispatcher("Login_SignUp.jsp").forward(req, resp);
        } catch (ClassNotFoundException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
