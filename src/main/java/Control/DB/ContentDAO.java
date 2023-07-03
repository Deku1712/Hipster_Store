package Control.DB;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Model.Content;

public class ContentDAO {

    public Connection conn;
    PreparedStatement ps;
    ResultSet rs;

    // get list content
    public List<Content> getListContent() throws SQLException, ClassNotFoundException {
        conn = DBconnect.makeConnection();
        String query = "Select * from ContentCreator_Table";
        ps = conn.prepareStatement(query);
        rs = ps.executeQuery();
        List<Content> list_Content = new ArrayList<>();
        while (rs.next()) {
            Content p = new Content(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5),
                    rs.getDate(6), rs.getString(7), rs.getString(8));
            list_Content.add(p);
        }
        return list_Content;

    }

    // add content
    public void addContent(Content content) throws SQLException, ClassNotFoundException {
        conn = DBconnect.makeConnection();
        String query = "INSERT INTO ContentCreator_Table (username, title, img, content, created_at, update_at, detail_title, content_id) VALUES (?, ?, ?, ?, GETDATE(), GETDATE(), ?, ?)";
        ps = conn.prepareStatement(query);
        ps.setString(1, content.getUsername());
        ps.setString(2, content.getTitle());
        ps.setString(3, content.getImg());
        ps.setString(4, content.getContent());
        ps.setString(5, content.getDetail_title());
        ps.setString(6, content.getId());

        ps.executeUpdate();
    }

    // get content by id
    public Content getContentById(String contentId) throws SQLException, ClassNotFoundException {
        conn = DBconnect.makeConnection();
        String query = "SELECT * FROM ContentCreator_Table WHERE content_id = ?";
        ps = conn.prepareStatement(query);
        ps.setString(1, contentId);
        rs = ps.executeQuery();
        if (rs.next()) {
            Content content = new Content(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                    rs.getDate(5), rs.getDate(6), rs.getString(7), rs.getString(8));
            return content;
        }
        return null; // Return null if content with the given ID is not found
    }

    // delete content
    public void deleteContent(String contentId) throws SQLException, ClassNotFoundException {
        conn = DBconnect.makeConnection();
        String query = "DELETE FROM ContentCreator_Table WHERE content_id = ?";
        ps = conn.prepareStatement(query);
        ps.setString(1, contentId);
        ps.executeUpdate();
    }

    // Update content
    public void updateContent(Content content) throws SQLException, ClassNotFoundException {
        conn = DBconnect.makeConnection();
        String query = "UPDATE ContentCreator_Table SET title=?, img=?, content=?, update_at=GETDATE() WHERE content_id=?";
        ps = conn.prepareStatement(query);
        ps.setString(1, content.getTitle());
        ps.setString(2, content.getImg());
        ps.setString(3, content.getContent());
        ps.setString(4, content.getId());
        ps.executeUpdate();
    }

}