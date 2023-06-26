package Model;

import java.sql.Date;

public class Price {
    private int id_price;
    private int product_id;
    private float price_input;
    private Date startOfDate;
    private Date endOfDate;

    public Price(int id_price, int product_id, float price_input, Date startOfDate, Date endOfDate) {
        this.id_price = id_price;
        this.product_id = product_id;
        this.price_input = price_input;
        this.startOfDate = startOfDate;
        this.endOfDate = endOfDate;
    }

    public Price() {
    }

    public int getId_price() {
        return id_price;
    }
    public void setId_price(int id_price) {
        this.id_price = id_price;
    }
    public int getProduct_id() {
        return product_id;
    }
    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }
    public float getPrice_input() {
        return price_input;
    }
    public void setPrice_input(float price_input) {
        this.price_input = price_input;
    }
    public Date getStartOfDate() {
        return startOfDate;
    }
    public void setStartOfDate(Date startOfDate) {
        this.startOfDate = startOfDate;
    }
    public Date getEndOfDate() {
        return endOfDate;
    }
    public void setEndOfDate(Date endOfDate) {
        this.endOfDate = endOfDate;
    }
    


}
