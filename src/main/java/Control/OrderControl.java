package Control;

import java.io.IOException;
import java.lang.reflect.Array;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import javax.mail.Flags.Flag;

import Control.DB.CartDAO;
import Control.DB.CartUserDAO;
import Control.DB.NotificationDAO;
import Control.DB.OrderDAO;
import Control.DB.ProductDAO;
import Model.Cart;
import Model.Product_Cart;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = { "/order", "/afterPay" })
public class OrderControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String user = (String) session.getAttribute("user");
        String request_url = req.getRequestURI();
        Cart cart = (Cart) session.getAttribute("cart_user");
        String page = "profile";

        if (request_url.contains("order")) {
            String list_order_String = req.getParameter("list_order");
            String[] list_orderString = list_order_String.split("--");
            List<String> list_order = new ArrayList<>(Arrays.asList(list_orderString));
            
            String city = req.getParameter("city");
            String pay = req.getParameter("pay");
            String address = req.getParameter("address");
            String total_String = req.getParameter("total");
            float total = Float.parseFloat(req.getParameter("total").replace("$", ""));
            System.out.println(pay);
            System.out.println(total_String);
            System.out.println(cart.getList_product().size());
            List<Product_Cart> list_order_cart = new ArrayList<>();
            
            System.out.println(list_order);

            List<Product_Cart> afterRemove = new ArrayList<>(cart.getList_product());
            for (Product_Cart product_Cart : afterRemove) {
                String codeCheck = product_Cart.getProduct().getProduct_id() + "/" + product_Cart.getSize();
                Iterator<String> iterator = list_order.iterator();
                while(iterator.hasNext()){
                    String s = iterator.next();
                    System.out.println("code check: " + codeCheck + "/ s: " + s );
                    if(s.equals(codeCheck)){
                        list_order_cart.add(product_Cart);
                        iterator.remove();
                    }
                }
                
            }

            
            
            System.out.println("after remvoe:" + afterRemove.size());
            for (Product_Cart product_Cart : list_order_cart) {
                if (afterRemove.contains(product_Cart)) {
                    afterRemove.remove(product_Cart);
                }
            }
            System.out.println("after remvoe:" + afterRemove.size());


            try {
                Product_Cart p = new ProductDAO().checkQuantityProduct(list_order_cart);
                if (p != null) {
                    String title = "Not enough.";
                    String content = "The product:'" + p.getProduct().getProduct_name() + "_size: '" + p.getSize()
                            + " you selected is currently unavailable in the store. And that product will be removed from your cart. Please choose another product";
                    new NotificationDAO().insertNoti(user, title, content);
                    cart.deleteP(p.getProduct().getProduct_id(), p.getSize());
                    session.setAttribute("cart_user", cart);
                } else {
                    if (pay.equals("VnPay")) {
                        System.out.println("qua day chua");
                        page = "VnpayMethod?amount=" + new Feature().getTotal(total_String);
                        session.setAttribute("cartAfterpay", afterRemove);
                        session.setAttribute("list_order_cart", list_order_cart);
                        session.setAttribute("address", address);
                        session.setAttribute("total", total);
                        System.out.println(cart.getList_product().size());
                    }

                    else {
                        String status_payment = "COD";
                        cart.setList_product(afterRemove);
                        session.setAttribute("cart_user", cart);
                        String code = new Feature().getCode();
                        System.out.println("qua cho cod chua");
                        Boolean check = true;
                        while (check) {
                            try {
                                new OrderDAO().insertOrder(code, user, address, total, list_order_cart, status_payment);
                                new CartUserDAO().editCart(cart);
                                new Send().SendOrder(code, list_order_cart, user, address, total);
                                check = false;

                            } catch (ClassNotFoundException | SQLException e) {
                                code = new Feature().getCode();
                            }

                        }

                        String title = "Order Success";
                        String content = "Hello" + user + " , Order" + code
                                + " has been received Hipster store would like to thank and hope you will continue to trust and choose Hipster products in the future.";
                        try {
                            new NotificationDAO().insertNoti(user, title, content);
                        } catch (ClassNotFoundException | SQLException e) {
                            // TODO Auto-generated catch block
                            e.printStackTrace();
                        }

                    }
                }
            } catch (ClassNotFoundException | SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

        }

        else if (request_url.contains("afterPay")) {
            String payStatus = req.getParameter("statusPay");
            System.out.println(payStatus);
            System.out.println(cart.getList_product().size());
            ;

            if (payStatus.equals("Success")) {
                String status_payment = "Paid";
                List<Product_Cart> afterRemove = (List<Product_Cart>) session.getAttribute("cartAfterpay");
                List<Product_Cart> list_order_cart = (List<Product_Cart>) session.getAttribute("list_order_cart");
                Float total = Float.parseFloat(session.getAttribute("total").toString());
                String address = (String) session.getAttribute("address");
                cart.setList_product(afterRemove);
                session.setAttribute("cart_user", cart);
                String code = new Feature().getCode();
                Boolean check = true;
                while (check) {
                    try {
                        new OrderDAO().insertOrder(code, user, address, total, list_order_cart, status_payment);
                        new CartUserDAO().editCart(cart);
                        new Send().SendOrder(code, list_order_cart, user, address, total);
                        check = false;

                    } catch (ClassNotFoundException | SQLException e) {
                        code = new Feature().getCode();
                    }

                }
                String title = "Order Success";
                String content = "Hello : " + user + " , Order ' " + code
                        + " ' has been received Hipster store would like to thank and hope you will continue to trust and choose Hipster products in the future.";
                try {
                    new NotificationDAO().insertNoti(user, title, content);
                } catch (ClassNotFoundException | SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            } else {
                String title = "Order Faild";
                String content = "Order placed unsuccessfully";
                try {
                    new NotificationDAO().insertNoti(user, title, content);
                } catch (ClassNotFoundException | SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }

        }

        resp.sendRedirect(page);
    }
}
