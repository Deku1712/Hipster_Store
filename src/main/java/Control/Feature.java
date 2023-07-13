package Control;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Random;
import java.util.logging.SimpleFormatter;

import jakarta.servlet.http.Part;

public class Feature {
    public String getCode(){
        String character = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        int length = 10;

        Random random = new Random();
        StringBuilder code = new StringBuilder(length);

        for(int i = 0 ; i < length ; i++){
            int randomIndex = random.nextInt(character.length());
            char randomChar = character.charAt(randomIndex);
            code.append(randomChar);
        }
        return code.toString();
    }

    public int getTotal(String total){
        int result = 0;
        int dot = total.indexOf(".");
        if (dot!= -1) {
            String str = total.substring(0, dot);
            result = Integer.parseInt(str);
        }
        return result;
    }

    public String getFileName(Part part){
        String content = part.getHeader("content-disposition");
        if(!content.contains("filename=")){
            return null;
        }
        int beginIndex = content.indexOf("filename=") + 10;
        int endIndex = content.length()-1;
        return content.substring(beginIndex, endIndex);
    }

    public String checkRole(String role){
        String page = "";
        switch (role) {
            case "customer":
                page = "Home.jsp";
                break;
            case "content":
                page = "ContentPage";
                break;
            case "admin":
            page = "AdminPage";
            break;
            case "shipper":
            page = "orderManagement";
            break;
            case "seller":{
                page = "manageOrder";
                break;
            }
        }
        return page;
    }

    public Date convertDate(String dateString) throws ParseException{
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date date = sdf.parse(dateString);
        Date date2 = new Date(date.getTime());
        return date2;
    }


    

    
}
