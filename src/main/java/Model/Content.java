package Model;

import java.sql.Date;



public class Content {
    
    private String username;
    private String title;
    private String img;
    private String content;
    private Date created_at;
    private Date update_at;
    private String detail_title;
    private String id;

     public Content(String username, String title, String img, String content, Date created_at, Date update_at, String detail_title, String id) {
        this.username = username;
        this.title = title;
        this.img = img;
        this.content = content;
        this.created_at = created_at;
        this.update_at = update_at;
        this.detail_title = detail_title;
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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

    public String getDetail_title() {
        return detail_title;
    }

    public void setDetail_title(String detail_title) {
        this.detail_title = detail_title;
    }
    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    

}