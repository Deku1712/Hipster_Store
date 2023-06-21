package Control.ControlWeb;

import java.sql.SQLException;
import java.util.List;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import Control.DB.UserDAO;
import Model.Account_SignUp;
import Model.Product_Cart;

public class Send {
   final String username ="hipsterstore08@gmail.com";
   final String password = "rsfdqomljclxmgip";
   final String host = "smtp.gmail.com"; 
    public void sendEmail(Account_SignUp acc) {
        
        
        int port = 587; 
        String fromEmail = username;
        String toEmail = acc.getEmail();

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");

        Authenticator auth = new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        };

        Session session = Session.getInstance(props, auth);

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject("Authenticate your Gmail account");

            String htmlContent = "<html><body><h1>Verify gmail: </h1><a href='http://localhost:8080/final_project/process?username=" + acc.getUsername() + "&email="+acc.getEmail()+"&password="+acc.getPassword()+"'>Click Me</a></body></html>";
            message.setContent(htmlContent, "text/html");

            Transport.send(message);

            System.out.println("Email sent successfully.");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    public void sendEmailReset(String email){
        int port = 587; 
        String fromEmail = username;
        String toEmail = email;

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");

        Authenticator auth = new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        };

        Session session = Session.getInstance(props, auth);

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject("Reset Password");

            String htmlContent = "<html><body><h1>Reset password: </h1><a href='http://localhost:8080/final_project/reset?email=" + email +"'>Click Me</a></body></html>";
            message.setContent(htmlContent, "text/html");

            Transport.send(message);

            System.out.println("Reset Password.");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    public void SendOrder(String code, List<Product_Cart> list_order_cart, String user, String address, float total) throws ClassNotFoundException, SQLException {
        String email = new UserDAO().getEmailByUsername(user);
        StringBuilder content = new StringBuilder();
        String itemcontent="";
        for (Product_Cart product_Cart : list_order_cart) {
            itemcontent = "<tr>"
        + "<td class=\"tg-0pky\">"
        + "<div class=\"img\">"
        + "<img src=\"" + product_Cart.getProduct().getImg() + "\" alt=\"\">"
        + "</div>"
        + "</td>"
        + "<td class=\"tg-0pky\">"+product_Cart.getProduct().getProduct_name()+"<br>"+ product_Cart.getProduct().getProfit_price()+"</td>"
        + "<td class=\"tg-0pky\">x"+product_Cart.getQuantity()+"</td>"
        + "<td class=\"tg-0pky\">"+product_Cart.getSize()+"</td>"
        + "<td class=\"tg-0pky\">"+product_Cart.getProduct().getProfit_price()*product_Cart.getQuantity()+"</td>"
        + "</tr>";
        content.append(itemcontent);
        }
        itemcontent = "<tr>"
        + "<td class=\"tg-0pky\" colspan=\"2\">Address</td>"
        + "<td class=\"tg-0pky\" colspan=\"3\">"+address+"</td>"
        + "</tr>"
        + "<tr>"
        + "<td class=\"tg-0pky\"></td>"
        + "<td class=\"tg-0pky\"></td>"
        + "<td class=\"tg-0pky\">Total</td>"
        + "<td class=\"tg-0pky\" colspan=\"2\">"+total+"</td>"
        + "</tr>";
        content.append(itemcontent);

        String htmlString = "<style type=\"text/css\">"
        + ".tg  {border-collapse:collapse;border-spacing:0;}"
        + ".tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;"
        + "overflow:hidden;padding:10px 5px;word-break:normal;}"
        + ".tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;"
        + "font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}"
        + ".tg .tg-0pky{border-color:inherit;text-align:left;vertical-align:top}"
        + ".img{"
        + "width: 70px;"
        + "height: 70px;"
        + "}"
        + ".img img{"
        + "width: 100%;"
        + "height: 100%;"
        + "object-fit: cover;"
        + "}"
        + "</style>"
        + "<table class=\"tg\">"
        + "<thead>"
        + "<tr>"
        + "<th class=\"tg-0pky\" colspan=\"2\">code:"+code+"</th>"
        + "<th class=\"tg-0pky\" colspan=\"3\">username:"+user+"</th>"
        + "</tr>"
        +content.toString()
        + "</thead>"
        + "<tbody>"
        + "</tbody>"
        + "</table>";

        mail(email, htmlString, "Confirm Order");
        

    }

    public void mail(String email, String content, String title){
        int port = 587; 
        String fromEmail = username;
        String toEmail = email;

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");

        Authenticator auth = new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        };

        Session session = Session.getInstance(props, auth);

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject(title);

            String htmlContent = content;
            message.setContent(htmlContent, "text/html");

            Transport.send(message);

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    public void sendEmailChange(String email) {
        String htmlContent = "<html><body><h1>Verify Gmail: </h1><a href='http://localhost:8080/final_project/ChangeEmail.jsp>Click Me</a></body></html>";
        String title = "Verify gmail";
        mail(email, htmlContent, title);
    }
    public void confirmNewEmail(String email){
            String htmlContent = "<html><body><h1>Confirm Gmail: </h1><a href='http://localhost:8080/final_project/updateGmail?gmail="+ email+">Click Me</a></body></html>";
            String title= "Confirm gmail";
            mail(email, htmlContent, title);

    }
}
