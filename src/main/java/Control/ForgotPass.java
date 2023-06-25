package Control;

import java.io.IOException;
import java.sql.SQLException;


import Control.DB.UserDAO;
import Model.Valid;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet(urlPatterns = {"/forgot"})
public class ForgotPass extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String emailnusername = req.getParameter("forgot");
        if (new Valid().validEmail(emailnusername)){
            new Send().sendEmailReset(emailnusername);
        }
        else{
            String email;
            try {
                email = new UserDAO().getEmailByUsername(emailnusername);
                if (email != null){
                    new Send().sendEmailReset(email);
                }
            } catch (ClassNotFoundException | SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            
        }
        req.setAttribute("check", "We sent an email to reset you password, check your inbox");
        req.getRequestDispatcher("Login_SignUp.jsp").forward(req, resp);


    }
}
