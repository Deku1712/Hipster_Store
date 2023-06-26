package Model;

import java.sql.Date;
import java.util.List;
import java.util.Map;

public class Product {
    private int product_id;
    private String product_name;
    private String brand;
    private String prouduct_description;
    private float profit_price;
    private String img;
    private int quantity;
    private Date created_at;
    private Date update_at;
    private String color;
    private Map<Integer, Integer> sizeAndQuantitysize;
    private Price price;
    private List<Price> historyChange;

    

    public List<Price> getHistoryChange() {
        return historyChange;
    }

    public void setHistoryChange(List<Price> historyChange) {
        this.historyChange = historyChange;
    }

    public Price getPrice() {
        return price;
    }

    public void setPrice(Price price) {
        this.price = price;
    }

    public Product(int product_id, String product_name, String brand, String prouduct_description, float profit_price,
            String img, int quantity, Date created_at, Date update_at, String color,
            Map<Integer, Integer> sizeAndQuantitysize) {
        this.product_id = product_id;
        this.product_name = product_name;
        this.brand = brand;
        this.prouduct_description = prouduct_description;
        this.profit_price = profit_price;
        this.img = img;
        this.quantity = quantity;
        this.created_at = created_at;
        this.update_at = update_at;
        this.color = color;
        this.sizeAndQuantitysize = sizeAndQuantitysize;
    }

    public Map<Integer, Integer> getSizeAndQuantitysize() {
        return sizeAndQuantitysize;
    }

    public void setSizeAndQuantitysize(Map<Integer, Integer> sizeAndQuantitysize) {
        this.sizeAndQuantitysize = sizeAndQuantitysize;
    }

    public Product(int product_id, String product_name,String brand ,String prouduct_description, float profit_price, String img,
            int quantity, Date created_at, Date update_at, String color) {
        this.product_id = product_id;
        this.product_name = product_name;
        this.brand = brand;
        this.prouduct_description = prouduct_description;
        this.profit_price = profit_price;
        this.img = img;
        this.quantity = quantity;
        this.created_at = created_at;
        this.update_at = update_at;
        this.color = color;
    }

    public String getBrand() {
        return brand;
    }


    public void setBrand(String brand) {
        this.brand = brand;
    }
    public int getProduct_id() {
        return product_id;
    }


    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }


    public String getProduct_name() {
        return product_name;
    }


    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }


    public String getProuduct_description() {
        return prouduct_description;
    }


    public void setProuduct_description(String prouduct_description) {
        this.prouduct_description = prouduct_description;
    }


    public float getProfit_price() {
        return profit_price;
    }


    public void setProfit_price(float profit_price) {
        this.profit_price = profit_price;
    }


    public String getImg() {
        return img;
    }


    public void setImg(String img) {
        this.img = img;
    }


    public int getQuantity() {
        return quantity;
    }


    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }


    public Date getCreated_at() {
        return created_at;
    }


    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }


    public Date getUpdate_at() {
        return update_at;
    }


    public void setUpdate_at(Date update_at) {
        this.update_at = update_at;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    

    

}
