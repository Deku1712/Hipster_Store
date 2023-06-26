package Control.DB;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Model.Price;
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

    public Price getPriceForTime(int product_id, Date order_time) throws SQLException, ClassNotFoundException {
        conn = DBconnect.makeConnection();
        String query = "Select * from Price_Table where product_id = ? and startofdate <= ? and endofdate >= ? order by id_price asc ";
        ps = conn.prepareStatement(query);
        ps.setInt(1, product_id);
        ps.setDate(2, order_time);
        ps.setDate(3, order_time);
        rs = ps.executeQuery();
        Price p = new Price();
        while(rs.next()){
            p.setId_price(rs.getInt(1));
            p.setProduct_id(rs.getInt(2));
            p.setPrice_input(rs.getFloat(3));
            p.setStartOfDate(rs.getDate(4));
            p.setEndOfDate(rs.getDate(5));
            return p;
        }
        return p;
    }

    public Price getLastestPrice(int product_id) throws SQLException, ClassNotFoundException {
        conn = DBconnect.makeConnection();
        String query = "Select * from Price_Table where product_id = ? order by id_price desc";
        ps = conn.prepareStatement(query);
        ps.setInt(1, product_id);
        rs = ps.executeQuery();
        while(rs.next()){
            return new Price(rs.getInt(1), rs.getInt(2), rs.getFloat(3), rs.getDate(4), rs.getDate(5));
        }
        return null;

    }

    public List<Price> getHistoryChange(int product_id) throws SQLException, ClassNotFoundException {
        conn = DBconnect.makeConnection();
        String query = "select * from Price_Table where product_id = ? order by id_price asc";
        ps = conn.prepareStatement(query);
        ps.setInt(1, product_id);
        rs = ps.executeQuery();
        List<Price> list = new ArrayList<>();
        while(rs.next()){
            list.add(new Price(rs.getInt(1), rs.getInt(2), rs.getFloat(3), rs.getDate(4), rs.getDate(5)));

        }
        return list;
    }
}
