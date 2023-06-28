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
import Model.Product_Cart;

public class OrderItemDAO {
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    public void insertItemsForOrder(String code, List<Product_Cart> list, Date sqlDate) throws ClassNotFoundException, SQLException {
        String query = "Insert into OrderItems_Table Values(?,?, ?, ?, ?)";
        conn = DBconnect.makeConnection();
        ps = conn.prepareStatement(query);
        for (Product_Cart product_Cart : list) {
            Price price = new PriceDAO().getPriceForTime(product_Cart.getProduct().getProduct_id(), sqlDate);
            ps.setString(1, code);
            ps.setInt(2, product_Cart.getProduct().getProduct_id());
            ps.setInt(3, product_Cart.getSize());
            ps.setInt(4, product_Cart.getQuantity());
            ps.setInt(5, price.getId_price());
            ps.executeUpdate();
        }

    }
    public List<Product_Cart> getListItemForORderId(String order_id, Date create_at) throws SQLException, ClassNotFoundException {
        List<Product_Cart> list = new ArrayList<>();
        conn = DBconnect.makeConnection();
        String query = "Select * From OrderItems_Table where order_id = ?";
        ps = conn.prepareStatement(query);
        ps.setString(1, order_id);
        rs = ps.executeQuery();
        while(rs.next()){
           Product p = new ProductDAO().getProductForOrder(rs.getInt(2) , rs.getInt(5));
           Product_Cart item = new Product_Cart(p, rs.getInt(3), rs.getInt(4));
           list.add(item);
        }
        return list;
    }

    
}
