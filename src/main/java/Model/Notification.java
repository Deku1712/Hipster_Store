package Model;

import java.sql.Date;

public class Notification {
    private int notification_id;
    private String username;
    private String title;
    private String content;
    private Date create_at;
    public Notification(int notification_id, String username, String title, String content, Date create_at) {
        this.notification_id = notification_id;
        this.username = username;
        this.title = title;
        this.content = content;
        this.create_at = create_at;
    }
    public int getNotification_id() {
        return notification_id;
    }
    public void setNotification_id(int notification_id) {
        this.notification_id = notification_id;
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
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public Date getCreate_at() {
        return create_at;
    }
    public void setCreate_at(Date create_at) {
        this.create_at = create_at;
    }
    

}
