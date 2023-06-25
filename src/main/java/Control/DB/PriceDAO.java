package Control.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Model.Product;

public class PriceDAO {
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;

    public void insertPrice(Product p) throws SQLException, ClassNotFoundException{
        conn = DBconnect.makeConnection();
        String query = "Insert into Price_Table Values(? , ? ,? ,?)";
        ps = conn.prepareStatement(query);
        ps.setInt(1, p.getProduct_id());
        ps.setFloat(2, p.getProfit_price());
        ps.setDate(3, p.getCreated_at());
        ps.setDate(4, p.getUpdate_at());
        ps.executeUpdate();
    }
}
