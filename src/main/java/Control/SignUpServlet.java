package Control;

import java.io.IOException;
import java.sql.SQLException;

import Control.DB.UserDAO;
import Model.Account_SignUp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet(urlPatterns = {"/signUp"})
public class SignUpServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("name");
        String password = req.getParameter("password");
        String email= req.getParameter("email");

        Account_SignUp acc = new Account_SignUp(username, password, email);
        try {
            if (!new UserDAO().checkEmailAndUsername(acc)){
                new Send().sendEmail(acc);
                req.setAttribute("check", "We sent an email to authenticate your account, check your inbox");
                req.getRequestDispatcher("Login_SignUp.jsp").forward(req, resp);

            }
            else{
                req.setAttribute("nofication_up", "0");
                req.getRequestDispatcher("Login_SignUp.jsp").forward(req, resp);
            }
        } catch (ClassNotFoundException | SQLException e) {
            // TODO Auto-generated catch block
            
        }

    }

}
