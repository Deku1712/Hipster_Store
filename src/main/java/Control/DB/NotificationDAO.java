package Control.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Model.Notification;

public class NotificationDAO {
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;

    public void insertNoti(String username, String title, String content) throws SQLException, ClassNotFoundException{
        conn = DBconnect.makeConnection();
        String query = "insert into Notification_Table values (? ,?, ?, getdate())";
        ps = conn.prepareStatement(query);
        ps.setString(1, username);
        ps.setString(2, title);
        ps.setString(3, content);
        ps.executeUpdate();
        
    }

    public List<Notification> getNotificationForUser(String user) throws ClassNotFoundException, SQLException{
        conn = DBconnect.makeConnection();
        String query = "Select * from Notification_Table where username = ? order by Notification_Table.notification_id desc";
        ps = conn.prepareStatement(query);
        ps.setString(1, user);
        rs = ps.executeQuery();
        List<Notification> list = new ArrayList<>();
        while(rs.next()){
            list.add(new Notification(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5)));

        }
        return list;
    }

    public void deleteNoti(String username) throws SQLException, ClassNotFoundException {
        conn = DBconnect.makeConnection();
        String query = "Delete from Notification_Table where username =? ";
        ps = conn.prepareStatement(query);
        ps.setString(1, username);
        ps.executeUpdate();
    }
}
