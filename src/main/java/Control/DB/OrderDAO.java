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
        new OrderItemDAO().insertItemsForOrder(code, list , sqlDate);
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
            List<Product_Cart> list_items = new OrderItemDAO().getListItemForORderId(o.getOrderDetail().getOrder_id() , o.getOrderDetail().getCreated_at());
            o.setList_item(list_items);
            list.add(o);
        }
        return list;
    }

    public List<Order> getAllOrder() throws SQLException, ClassNotFoundException{
        List<Order> list = new ArrayList<>();
        conn = DBconnect.makeConnection();
        String query = "Select * From Order_Table order by created_at desc ";

        ps = conn.prepareStatement(query);
        rs = ps.executeQuery();
        while(rs.next()){
            Order o = new Order();
            OrderDetail orderDetail = new OrderDetail(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getFloat(5), rs.getDate(6), rs.getDate(7), rs.getString(8));
            o.setOrderDetail(orderDetail);
            List<Product_Cart> list_items = new OrderItemDAO().getListItemForORderId(o.getOrderDetail().getOrder_id() , o.getOrderDetail().getCreated_at());
            o.setList_item(list_items);
            list.add(o);
        }
        return list;
    }

    public void updateOrderId(String type, String orderId) throws SQLException, ClassNotFoundException {
        conn = DBconnect.makeConnection();
        String query = "Update Order_Table Set status_order = ? where order_id = ?";
        ps = conn.prepareStatement(query);
        ps.setString(2, orderId);

        if(type.contains("receiveOrder")){
            ps.setString(1, " Preparing for delivery");
            ps.executeUpdate();
        }
        else if(type.contains("cancelOrder")){
            ps.setString(1 , "Cancel");
            ps.executeUpdate();
        }
        else if (type.equals("shipping")){
            ps.setString(1 , "shipping");
            ps.executeUpdate();
        }
        else if (type.equals("success")){
            ps.setString(1, "success");
            ps.executeUpdate();
        }
        else if (type.equals("faild")){
            ps.setString(1, "faild");
            ps.executeUpdate();
        }
    }

    public Order getOrder(String order_id) throws SQLException, ClassNotFoundException {
        String query = "Select * from Order_Table where order_id = ?";
        conn = DBconnect.makeConnection();
        ps = conn.prepareStatement(query);
        ps.setString(1,order_id);
        rs = ps.executeQuery();
        Order o = new Order();
        while (rs.next()){
            OrderDetail orderDetail = new OrderDetail(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getFloat(5), rs.getDate(6), rs.getDate(7), rs.getString(8));
            o.setOrderDetail(orderDetail);
            List<Product_Cart> list_items = new OrderItemDAO().getListItemForORderId(o.getOrderDetail().getOrder_id() , o.getOrderDetail().getCreated_at());
            o.setList_item(list_items);
        }
        return o;

    }
}
