package Control.DB;

import Model.Order;
import Model.Shipper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ShipDAO {
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;


    public void insertOrderToShip(String username, String order_id) throws SQLException, ClassNotFoundException{
        String query = "Insert into Ship_Table Values(?, ? , getDate() , ?, ?)";
        conn = DBconnect.makeConnection();
        String phone = new UserDAO().getPhone(order_id);
        System.out.println(phone);
        ps = conn.prepareStatement(query);
        ps.setString(1, username);
        ps.setString(2, order_id);
        ps.setString(3, "");
        ps.setString(4, phone);
        ps.execute();
        
    }

    public List<Shipper> getOrderFollowShipper(String username) throws SQLException, ClassNotFoundException {
        String query ="Select * from Ship_Table where shipper  = ?";
        conn = DBconnect.makeConnection();
        ps = conn.prepareStatement(query);
        ps.setString(1, username);
        rs= ps.executeQuery();
        List<Shipper> list= new ArrayList<>();
        while (rs.next()){
            Shipper shipper = new Shipper();
            shipper.setUsername(rs.getString(2));
            Order o = new OrderDAO().getOrder(rs.getString(3));
            shipper.setOrder(o);
            shipper.setTime_pick_up(rs.getDate(4));
            shipper.setReason(rs.getString(5));
            shipper.setPhone(rs.getString(6));
            list.add(shipper);
        }
        return  list;

    }

    


    public void updateShip(String orderId, String reason) throws SQLException, ClassNotFoundException {
        conn = DBconnect.makeConnection();
        String query = "Update Ship_Table set reason = ? where order_id = ?";
        ps = conn.prepareStatement(query);
        ps.setString(1,reason);
        ps.setString(2,orderId);
        ps.executeUpdate();

    }
}
