package Model;

import java.util.ArrayList;
import java.util.List;



public class Order {
    private OrderDetail orderDetail;
    private List<Product_Cart> list_item = new ArrayList<>();

    public Order(OrderDetail orderDetail, List<Product_Cart> list_item) {
        this.orderDetail = orderDetail;
        this.list_item = list_item;
    }

    public Order() {
    }

    public OrderDetail getOrderDetail() {
        return orderDetail;
    }
    public void setOrderDetail(OrderDetail orderDetail) {
        this.orderDetail = orderDetail;
    }
    public List<Product_Cart> getList_item() {
        return list_item;
    }
    public void setList_item(List<Product_Cart> list_item) {
        this.list_item = list_item;
    }
    


     
}
