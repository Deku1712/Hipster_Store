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

public class ProductDAO {

   
    public Connection conn;
    PreparedStatement ps;
    ResultSet rs;


    public List<Product> getListProduct() throws SQLException, ClassNotFoundException{
        conn = DBconnect.makeConnection();
        java.util.Date dateutil = new java.util.Date();
        Date date = new Date(dateutil.getTime());
        
        String query = "Select * from Product_Table where quantity > 0";
        ps = conn.prepareStatement(query);
        rs = ps.executeQuery();
        List<Product> list_product = new ArrayList<>();
        while(rs.next()){
            Product p = new Product(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4), rs.getFloat(5), rs.getString(6), rs.getInt(7), rs.getDate(8), rs.getDate(9),rs.getString(10));
            Price price = new PriceDAO().getPriceForTime(p.getProduct_id(), date);
            p.setProfit_price(price.getPrice_input()+50);
            list_product.add(p);
        }
        return list_product;
    }


    public Product getProduct(int product_id) throws SQLException, ClassNotFoundException{
        conn = DBconnect.makeConnection();
        java.util.Date dateutil = new java.util.Date();
        Date date = new Date(dateutil.getTime());
        String query = "Select * from Product_Table where product_id = ?";
        ps = conn.prepareStatement(query);
        ps.setInt(1  , product_id);
        rs = ps.executeQuery();
        while(rs.next()){
            Product p = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getFloat(5), rs.getString(6), rs.getInt(7), rs.getDate(8), rs.getDate(9), rs.getString(10));
            Price price = new PriceDAO().getPriceForTime(p.getProduct_id(), date);
            p.setProfit_price(price.getPrice_input()+50);
            return p;
        }
        return null;
    }

    public List<Product> getListProductRelated(String brand , float profit_price, String color) throws ClassNotFoundException, SQLException{
        List<Product> list = new ArrayList<>();
        Float max_price = profit_price + 25;
        Float min_price = profit_price - 25;
        String query = "Select * From Product_Table where brand = ? and color = ? and profit_price between ? and ?";
        conn = DBconnect.makeConnection();
        ps = conn.prepareStatement(query);
        ps.setString(1, brand);
        ps.setString(2, color);
        ps.setFloat(3, min_price);
        ps.setFloat(4, max_price);
        rs = ps.executeQuery();
        while(rs.next()){
            Product p = new Product(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4), rs.getFloat(5), rs.getString(6), rs.getInt(7), rs.getDate(8), rs.getDate(9), rs.getString(10));
            list.add(p);
        }
        System.out.println(list.size());
        System.out.println(max_price);
        System.out.println(min_price);
        return list;
    }
    public Product_Cart checkQuantityProduct(List<Product_Cart> list) throws ClassNotFoundException, SQLException{
        for (Product_Cart p : list) {
            int quantity = new ProductDetailDAO().getQuantitySizeProduct(p);
            if (p.getQuantity() > quantity){
                return p;
            }
        }

        return null;
        
        
    }


    public List<Product> getListPSearch(String search) throws SQLException, ClassNotFoundException {
        conn = DBconnect.makeConnection();
        List<Product> list = new ArrayList<>();
        String query = "Select * from Product_Table";
        ps = conn.prepareStatement(query);
        rs = ps.executeQuery();
        while(rs.next()){
            if(rs.getString(2).toUpperCase().contains(search.toUpperCase())){
                Product p = new Product(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4), rs.getFloat(5), rs.getString(6), rs.getInt(7), rs.getDate(8), rs.getDate(9), rs.getString(10));
                list.add(p);
            }
        }
        return list;
    }


    public List<Product> getListProduct(String orderby) throws ClassNotFoundException, SQLException {
        conn = DBconnect.makeConnection();
        String query = "Select * from Product_Table order by profit_price " + orderby;
        ps = conn.prepareStatement(query);
        rs = ps.executeQuery();
        List<Product> list_product = new ArrayList<>();
        while(rs.next()){
            Product p = new Product(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4), rs.getFloat(5), rs.getString(6), rs.getInt(7), rs.getDate(8), rs.getDate(9),rs.getString(10));
            list_product.add(p);
        }
        return list_product;
    }


    public List<Product> getListProduct(float min, float max) throws SQLException, ClassNotFoundException {
        conn = DBconnect.makeConnection();
        String query = "Select * from Product_Table where profit_price >= ? and profit_price <= ?";
        ps = conn.prepareStatement(query);
        ps.setFloat(1, min);
        ps.setFloat(2, max);
        rs = ps.executeQuery();
        List<Product> list_product = new ArrayList<>();
        while(rs.next()){
            Product p = new Product(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4), rs.getFloat(5), rs.getString(6), rs.getInt(7), rs.getDate(8), rs.getDate(9),rs.getString(10));
            list_product.add(p);
        }
        return list_product;
    }



    public List<Product> getListProducttoManage() throws SQLException, ClassNotFoundException{
        conn = DBconnect.makeConnection();
        String query = "Select * from Product_Table where quantity > 0 ";
        ps = conn.prepareStatement(query);
        rs = ps.executeQuery();
        List<Product> list_product = new ArrayList<>();
        while(rs.next()){
            Product p = new Product(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4), rs.getFloat(5), rs.getString(6), rs.getInt(7), rs.getDate(8), rs.getDate(9),rs.getString(10));
            p.setSizeAndQuantitysize(new ProductDetailDAO().getsizeAndQuantity(p));
            Price price = new PriceDAO().getLastestPrice(p.getProduct_id());
            p.setPrice(price);
            List<Price> historyChange = new PriceDAO().getHistoryChange(p.getProduct_id());
            p.setHistoryChange(historyChange);
            list_product.add(p);
        }
        return list_product;
    }

    public void editProduct(Product p) throws SQLException, ClassNotFoundException{
        conn = DBconnect.makeConnection();
        String query = "Update Product_Table set product_name = ? , brand = ? , product_description = ? , img = ? , update_at = getDate(), color =? where product_id = ? ";
        ps = conn.prepareStatement(query);
        ps.setString(1, p.getProduct_name());
        ps.setString(2, p.getBrand());
        ps.setString(3, p.getProuduct_description());
        ps.setString(4,  p.getImg());
        ps.setString(5, p.getColor());
        ps.setInt(6, p.getProduct_id());
        ps.executeUpdate();
    }


    public Product getProduct(int product_id , Date order_time) throws SQLException, ClassNotFoundException{
        conn = DBconnect.makeConnection();
        String query = "Select * from Product_Table where product_id = ?";
        ps = conn.prepareStatement(query);
        ps.setInt(1  , product_id);
        rs = ps.executeQuery();
        while(rs.next()){
            Product p = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getFloat(5), rs.getString(6), rs.getInt(7), rs.getDate(8), rs.getDate(9), rs.getString(10));
            Price price = new PriceDAO().getPriceForTime(p.getProduct_id(), order_time);
            p.setPrice(price);
            p.setProfit_price(p.getPrice().getPrice_input() + 50);
            
            return p;
        }
        return null;
    }


}
   

