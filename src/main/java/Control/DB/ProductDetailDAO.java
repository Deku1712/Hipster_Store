package Control.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import Model.Product;
import Model.Product_Cart;

public class ProductDetailDAO {
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    public void updateQuantity(List<Product_Cart> list) throws SQLException, ClassNotFoundException {
        String query = "Update ProductDetail_Table Set quantityOfSize = quantityOfSize - ? where product_id = ? and size = ?";
        conn = DBconnect.makeConnection();
        ps = conn.prepareStatement(query);
        for (Product_Cart product_Cart : list) {
            ps.setInt(1, product_Cart.getQuantity());
            ps.setInt(2, product_Cart.getProduct().getProduct_id());
            ps.setInt(3, product_Cart.getSize());
            ps.executeUpdate();
        }
    }

    public int getQuantitySizeProduct(Product_Cart p) throws ClassNotFoundException, SQLException{
        String query = "Select quantityOfSize from ProductDetail_Table where product_id = ? and size =? ";
        conn = DBconnect.makeConnection();
        ps = conn.prepareStatement(query);
        ps.setInt(1, p.getProduct().getProduct_id());
        ps.setInt(2, p.getSize());
        rs = ps.executeQuery();
        while(rs.next()){
            return rs.getInt(1);
        }
        return -1;
    }

    public Map<Integer, Integer> getsizeAndQuantity(Product p) throws SQLException, ClassNotFoundException{
        Map<Integer, Integer> map = new HashMap<Integer, Integer>();
        String query = "Select size , quantityOfSize from ProductDetail_Table where product_id =?";
        conn = DBconnect.makeConnection();
        ps = conn.prepareStatement(query);
        ps.setInt(1, p.getProduct_id());
        rs = ps.executeQuery();
        while(rs.next()){
            map.put(rs.getInt(1), rs.getInt(2));
        }
        return map;

    }

    public void editQuantitysize(Product p) throws SQLException, ClassNotFoundException{
        conn = DBconnect.makeConnection();
        String query = "update ProductDetail_Table set quantityOfSize = ? where product_id = ? and size = ?";
        ps = conn.prepareStatement(query);
        for(Map.Entry<Integer, Integer> entry: p.getSizeAndQuantitysize().entrySet()){
            ps.setInt(1, entry.getValue());
            ps.setInt(2, p.getProduct_id());
            ps.setInt(3, entry.getKey());
            ps.executeUpdate();
        }
    }

    public void deleteProduct(int product_id) throws SQLException, ClassNotFoundException {
        conn = DBconnect.makeConnection();
        String query = "Update ProductDetail_Table set quantityOfSize = 0 where product_id = ?";
        ps = conn.prepareStatement(query);
        ps.setInt(1, product_id);
        ps.executeUpdate();
    }

    public void insertQuantityOfNewP(int lastId, Map<Integer, Integer> map) throws SQLException, ClassNotFoundException {

        conn = DBconnect.makeConnection();
        String query = "Insert into ProductDetail_Table Values(?, ?, ?)";
        ps = conn.prepareStatement(query);

        for(Map.Entry<Integer, Integer> entry : map.entrySet()){
            ps.setInt(1, lastId);
            ps.setInt(2, entry.getKey());
            ps.setInt(3, entry.getValue());
            ps.executeUpdate();
        }
    }


}
