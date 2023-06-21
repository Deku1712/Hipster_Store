package Model;

import java.sql.Date;

public class OrderDetail {
    private String order_id;
    private String username;
    private String status_order;
    private String delivery_address;
    private float total_price;
    private Date created_at;
    private Date update_at;
    private String status_Payment;

    
    public OrderDetail(String order_id, String username, String status_order, String delivery_address, float total_price,
            Date created_at, Date update_at, String status_Payment) {
        this.order_id = order_id;
        this.username = username;
        this.status_order = status_order;
        this.delivery_address = delivery_address;
        this.total_price = total_price;
        this.created_at = created_at;
        this.update_at = update_at;
        this.status_Payment = status_Payment;
    }
    public String getOrder_id() {
        return order_id;
    }
    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getStatus_order() {
        return status_order;
    }
    public void setStatus_order(String status_order) {
        this.status_order = status_order;
    }
    public String getDelivery_address() {
        return delivery_address;
    }
    public void setDelivery_address(String delivery_address) {
        this.delivery_address = delivery_address;
    }
    public float getTotal_price() {
        return total_price;
    }
    public void setTotal_price(float total_price) {
        this.total_price = total_price;
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
    public String getStatus_Payment() {
        return status_Payment;
    }
    public void setStatus_Payment(String status_Payment) {
        this.status_Payment = status_Payment;
    }

}
