package Model;

import java.util.List;

public class Store {

    public float calculatorSales(List<Order> list_order) {
        float  total = 0;
        for (Order order : list_order) {
            if (order.getOrderDetail().getStatus_order().equals("Success") & order.getOrderDetail().getStatus_Payment().equals("Paid")){
                for (Product_Cart items : order.getList_item()){
                    total+= items.getProduct().getProfit_price() * items.getQuantity();
                }
            }
        }
        return total;
    }
    
}
