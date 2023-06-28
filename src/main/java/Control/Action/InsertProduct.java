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
import Control.DB.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet(urlPatterns = {"/insertProduct"})

@MultipartConfig(
    location = "D:\\SU23\\SWP301\\WorkSpace_SWP\\vai2\\hipster_sneaker_shop\\src\\main\\webapp\\imgs"
)
public class InsertProduct extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String brand = req.getParameter("brand+");
        String nameProduct = req.getParameter("name+");
        String color = req.getParameter("color+");
        String description = req.getParameter("description+");
        float ori_price = Float.parseFloat(req.getParameter("price+"));
        Part part = req.getPart("linkimg");
        String filename = new Feature().getFileName(part);
        part.write(filename);
        filename = "./imgs/" + filename;
        List<Integer> list_size = new ArrayList<>();
        for(int i = 36 ; i<= 43 ; i++){
            list_size.add(i);
        }
        Map<Integer , Integer> map = new HashMap<>();
        for (Integer size : list_size) {
            int quantity = Integer.parseInt(req.getParameter(String.valueOf(size)));
            map.put(size, quantity);
        }

        try {
            Date start = new Feature().convertDate(req.getParameter("start+"));
            Date end = new Feature().convertDate(req.getParameter("end+"));

            new ProductDAO().insertProduct(brand, nameProduct, color, description, filename, ori_price, map, start, end);
        } catch (ParseException | ClassNotFoundException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        
        

    }
}
