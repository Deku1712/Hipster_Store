package Model;

import java.sql.Date;
import java.util.List;

public class Shipper {


    private int ship_id;
    private String username;
    private Order order;
    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    private Date time_pick_up;
    private String reason;
    private String phone;

    public Date getTime_pick_up() {
        return time_pick_up;
    }

    public void setTime_pick_up(Date time_pick_up) {
        this.time_pick_up = time_pick_up;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Shipper() {
    }

    

    public int getShip_id() {
        return ship_id;
    }

    public void setShip_id(int ship_id) {
        this.ship_id = ship_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }


}
