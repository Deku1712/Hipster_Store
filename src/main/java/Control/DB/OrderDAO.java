package Control.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import Control.Feature;
import Model.Order;
import Model.OrderDetail;
import Model.Product_Cart;

public class OrderDAO {
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;

    public void insertOrder(String code,String username, String address, float total , List<Product_Cart> list, String status_payment) throws  ClassNotFoundException, SQLException{
        String query = "Insert into Order_Table Values(?,?,?,?,?,?,?,?) ";
        String status = "Processing";
        Date currentDate = new Date();

        // Chuyển đổi sang kiểu java.sql.Date
        java.sql.Date sqlDate = new java.sql.Date(currentDate.getTime());
        conn = DBconnect.makeConnection();
        ps = conn.prepareStatement(query);
        ps.setString(1, code);
        ps.setString(2, username);
        ps.setString(3, status);
        ps.setString(4, address);
        ps.setFloat(5, total);
        ps.setDate(6, sqlDate);
        ps.setDate(7, sqlDate);
        ps.setString(8, status_payment);
        ps.execute();
        new OrderItemDAO().insertItemsForOrder(code, list);
        new ProductDetailDAO().updateQuantity(list);

    }

    public List<Order> getListOrderForUser(String username) throws ClassNotFoundException, SQLException{
        List<Order> list = new ArrayList<>();
        conn = DBconnect.makeConnection();
        String query = "Select * From Order_Table where username = ? order by created_at desc ";

        ps = conn.prepareStatement(query);
        ps.setString(1, username);
        rs = ps.executeQuery();
        while(rs.next()){
            Order o = new Order();
            OrderDetail orderDetail = new OrderDetail(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getFloat(5), rs.getDate(6), rs.getDate(7), rs.getString(8));
            o.setOrderDetail(orderDetail);
            List<Product_Cart> list_items = new OrderItemDAO().getListItemForORderId(o.getOrderDetail().getOrder_id());
            o.setList_item(list_items);
            list.add(o);
        }
        return list;
    }
}
