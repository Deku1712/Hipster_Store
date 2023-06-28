package Control.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import Model.Account_Google;
import Model.Account_SignUp;
import Model.User;

public class UserDAO {

    Connection conn;
    PreparedStatement ps;
    ResultSet rs;


    public void insertUserTable(Account_SignUp acc) throws  ClassNotFoundException, SQLException{
        

        String query = "Insert into User_Table (username, password, role , email , created_at, update_at , img) Values (?, ? ,?, ?, ? ,? ,? )";
        conn = DBconnect.makeConnection();
        Date currentDate = new Date();

        // Chuyển đổi sang kiểu java.sql.Date
        java.sql.Date sqlDate = new java.sql.Date(currentDate.getTime());
        ps = conn.prepareStatement(query);
        ps.setString(1, acc.getUsername());
        ps.setString(2, acc.getPassword());
        ps.setString(3, "customer");
        ps.setString(4, acc.getEmail());
        ps.setDate(5, sqlDate);
        ps.setDate(6, sqlDate);
        ps.setString(7, "./imgs/ava_user.jpg");
        try {
            ps.executeUpdate();
            
        } catch (SQLException e) {
            
        }

    }

    public void insertAccgmail(Account_Google acc) throws ClassNotFoundException, SQLException {
        String query = "Insert into User_Table(username, role, email , fullname , created_at, update_at , password , img) Values (?, ? ,? , ? ,? ,? , ? , ?)";
        conn = DBconnect.makeConnection();
        Date currentDate = new Date();

        // Chuyển đổi sang kiểu java.sql.Date
        java.sql.Date sqlDate = new java.sql.Date(currentDate.getTime());
        ps = conn.prepareStatement(query);
        ps.setString(1, acc.getEmail());
        ps.setString(2, "customer");
        ps.setString(3, acc.getEmail());
        ps.setString(4, acc.getName());
        ps.setDate(5, sqlDate);
        ps.setDate(6, sqlDate);
        ps.setString(7, "88888888888888");
        ps.setString(8, "./imgs/ava_user.jpg");
        try {
            ps.executeUpdate();
            
        } catch (SQLException e) {
            
            
        }
        
    }

    public boolean checkEmailAndUsername(Account_SignUp acc) throws SQLException, ClassNotFoundException{
        String query = "Select username , email From User_Table";
        conn = DBconnect.makeConnection();
        ps = conn.prepareStatement(query);
        rs = ps.executeQuery();
        while(rs.next()){
            if(rs.getString(1).equalsIgnoreCase(acc.getUsername()) || rs.getString(2).equalsIgnoreCase(acc.getEmail())){
                return true;
            }
        }
        return false;
    }

    public boolean checkEmail(Account_Google acc) throws SQLException, ClassNotFoundException{
        String query = "Select email From User_Table";
        conn = DBconnect.makeConnection();
        ps = conn.prepareStatement(query);
        rs = ps.executeQuery();
        while(rs.next()){
            if (rs.getString(1).equalsIgnoreCase(acc.getEmail())){
                return true;
            }
        }
        return false;
    }

    public List<Account_SignUp> getListAcc() throws SQLException, ClassNotFoundException{
        String query = "Select username , password , email From User_Table";
        conn = DBconnect.makeConnection();
        ps = conn.prepareStatement(query);
        rs= ps.executeQuery();
        List<Account_SignUp> list = new ArrayList<>()  ;
        while(rs.next()){
            list.add(new Account_SignUp(rs.getString(1), rs.getString(2), rs.getString(3)));
        }
        return list;
    }

    public boolean checkEmail(String email) throws SQLException, ClassNotFoundException{
        String query = "Select email From User_Table";
        conn = DBconnect.makeConnection();
        ps = conn.prepareStatement(query);
        rs = ps.executeQuery();
        while(rs.next()){
            if (rs.getString(1).equalsIgnoreCase(email)){
                
                return true;
            }
        }
        return false;
    }

    public void updatePassword(String email, String newpass) throws SQLException, ClassNotFoundException {
        String query = "Update User_Table Set password = ? , update_at = ?  where email = ?";
        conn = DBconnect.makeConnection();
        Date currentDate = new Date();

        // Chuyển đổi sang kiểu java.sql.Date
        java.sql.Date sqlDate = new java.sql.Date(currentDate.getTime());
        ps = conn.prepareStatement(query);
        ps.setString(1, newpass);
        ps.setDate(2, sqlDate);
        ps.setString(3  , email);
        ps.executeUpdate();

    }

    public String getEmailByUsername(String emailnusername) throws SQLException, ClassNotFoundException {
        String query = "Select email From User_Table where username = ?";
        conn = DBconnect.makeConnection();
        ps = conn.prepareStatement(query);
        ps.setString(1, emailnusername);
        rs = ps.executeQuery();
        while(rs.next()){
            return rs.getString(1);
        }
        return null;
    }

    public void editProfile( String name, String address, String username , String filename , String phone) throws SQLException, ClassNotFoundException{
        conn = DBconnect.makeConnection();
        String query = "Update User_Table Set fullname = ? , address = ? , phone = ? , img = ? where username = ?";
        ps = conn.prepareStatement(query);
        ps.setString(1, name);
        ps.setString(2, address);
        ps.setString(3, phone);
        ps.setString(4, "./imgs/" + filename);
        ps.setString(5, username);
        ps.executeUpdate();
    }

    public User getProfile(String username) throws SQLException, ClassNotFoundException{
        String query = "Select username, role, email, fullname, address, phone , img From User_Table where username = ? ";
        conn = DBconnect.makeConnection();
        ps = conn.prepareStatement(query);
        ps.setString(1, username);
        rs = ps.executeQuery();
        while(rs.next()){
            return new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));

        }
        return null;
    }

    public String getPass(String username) throws ClassNotFoundException, SQLException{
        conn = DBconnect.makeConnection();
        String query = "Select password from User_Table where username = ? " ;
        ps =conn.prepareStatement(query);
        ps.setString(1, username);
        rs = ps.executeQuery();
        while(rs.next()){
            return rs.getString(1);
        }
        return null;
    }

    public List<User> getListUser() throws SQLException, ClassNotFoundException{
        String query = "Select username, role, email, fullname, address, phone , img From User_Table ";
        List<User> list = new ArrayList<>();
        conn = DBconnect.makeConnection();
        ps = conn.prepareStatement(query);
        rs = ps.executeQuery();
        while(rs.next()){
            list.add(new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)));
        }
        System.out.println(list.size());
        return list;
    }

    public void updateRole(String userUpdate, String role) throws SQLException, ClassNotFoundException {
        conn= DBconnect.makeConnection();
        String query = "Update User_Table set role = ? where username = ?";
        ps  = conn.prepareStatement(query);
        ps.setString(1, role);
        ps.setString(2, userUpdate);
        ps.executeUpdate();
    }

    public void removeUser(String user) throws SQLException, ClassNotFoundException {
        conn = DBconnect.makeConnection();
        String query = "Update User_Table set role = ? where username = ?";
        ps = conn.prepareStatement(query);
        ps.setString(1, "customer");
        ps.setString(2, user);
        ps.executeUpdate();
        
    }

}

