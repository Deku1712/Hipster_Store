package Control.ControlWeb;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import Control.DB.CartDAO;
import Control.DB.CartUserDAO;
import Control.DB.FeeDao;
import Control.DB.UserDAO;
import Model.Account_Google;
import Model.Account_SignUp;
import Model.Cart;
import Model.Constants;
import Model.Fee;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.apache.http.client.ClientProtocolException;



@WebServlet(urlPatterns = {"/GoogleLogin"})
public class LoginByGoogle extends HttpServlet {
    
    protected void processRequest(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException, ClassNotFoundException, SQLException {
		String code = req.getParameter("code");
		String accessToken = getToken(code);
		Account_Google acc = getUserInfo(accessToken);
		if (!new UserDAO().checkEmail(acc)){
			new UserDAO().insertAccgmail(acc);
			new CartDAO().insertCartTable(acc.getEmail());
		}
		HttpSession session = req.getSession();
		session.setAttribute("user", acc.getEmail());

		Cart cart = new Cart( );
		int cart_id = new CartDAO().getCartId(acc.getEmail());
		cart.setCartId(cart_id);
		cart.setList_product(new CartUserDAO().getListProductInCart(cart_id));
		List<Fee> listFee = new FeeDao().getListFee();
        session.setAttribute("list_fee", listFee);
		session.setAttribute("cart_user", cart);
		
		
	}

	public String getToken(String code) throws ClientProtocolException, IOException {
		// call api to get token
		String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
				.bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
						.add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
						.add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
						.add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
				.execute().returnContent().asString();

		JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
		String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
		return accessToken;
	}

	public Account_Google getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
		String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
		String response = Request.Get(link).execute().returnContent().asString();
		System.out.println(response);

		Account_Google googlePojo = new Gson().fromJson(response, Account_Google.class);

		return googlePojo;
	}
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			processRequest(request, response);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		RequestDispatcher requestDispatcher = request.getRequestDispatcher("Home.jsp");
		requestDispatcher.forward(request, response);
	}
}
