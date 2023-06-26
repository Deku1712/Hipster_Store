package Control.Action;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import Control.Feature;
import Control.DB.PriceDAO;
import Control.DB.ProductDAO;
import Control.DB.ProductDetailDAO;
import Model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet(urlPatterns = {"/updateProduct"})

@MultipartConfig(
    location = "D:\\SU23\\SWP301\\WorkSpace_SWP\\vai2\\hipster_sneaker_shop\\src\\main\\webapp\\imgs"
)
public class UpdateProductStore extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("product_id"));
        String brand = req.getParameter("brandupdate");
        String color = req.getParameter("colorup");
        String name = req.getParameter("nameup");
        String description = req.getParameter("description");
        String filename=req.getParameter("oldimg");
        System.out.println(filename);
        Part part = req.getPart("linkimg");
        System.out.println(part);
        if(part.getSize() != 0){
            filename = new Feature().getFileName(part);
            part.write(filename);
            filename = "./imgs/" + filename;
        }
        System.out.println(filename);
        
        float price = Float.parseFloat(req.getParameter("priceup"));
        List<Integer> list_size = new ArrayList<>();
        for (int i = 36 ; i < 43 ; i++){
            list_size.add(i);
        }
        Map<Integer, Integer> map_size = new HashMap<Integer,Integer>();
        for (Integer size : list_size) {
            int quantity = Integer.parseInt(req.getParameter(String.valueOf(size)));
            map_size.put(size, quantity);
        }
        Date start;
        Date end;
        try {
            start = new Feature().convertDate(req.getParameter("start"));
            end = new Feature().convertDate(req.getParameter("end"));
            for(Map.Entry<Integer, Integer> entry : map_size.entrySet()){
                System.out.println("size" + entry.getKey() + ":" + entry.getValue());
            }
            Product p = new Product(id, name, brand, description, price, filename, 0, start, end, color, map_size);
            new ProductDAO().editProduct(p);
            new ProductDetailDAO().editQuantitysize(p);
            new PriceDAO().insertPrice(p);
        } catch (ParseException | ClassNotFoundException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        resp.sendRedirect("manageProduct");

        


        

    }
}
