/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ajax;

/**
 *
 * @author CDAC-36
 */



import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.util.Collections;


public class UserDAO {
// Start bookajax
    public ArrayList getLanguages(String s) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {

        ArrayList userList = new ArrayList();
        Database db = new Database();
        Connection connection = db.getConnection();
        try {
            PreparedStatement ps_author = connection.prepareStatement("SELECT distinct(language) FROM portal_cms.item_metadata WHERE materialType='book' and language like ?");
            ps_author.setString(1, s + "%");
            ResultSet rs_author = ps_author.executeQuery();
            while (rs_author.next()) {
                userList.add(rs_author.getString("language"));
            }
            Collections.sort(userList);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return userList;
    }
    
     public ArrayList getCreators(String s) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {

        ArrayList userList = new ArrayList();
        Database db = new Database();
        Connection connection = db.getConnection();
        try {
            PreparedStatement ps_author = connection.prepareStatement("SELECT distinct(creator) FROM portal_cms.item_metadata WHERE materialType='book' and creator like ?");
            ps_author.setString(1, s + "%");
            ResultSet rs_author = ps_author.executeQuery();
            while (rs_author.next()) {
                userList.add(rs_author.getString("creator"));
            }
            Collections.sort(userList);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return userList;
    }
     
     public ArrayList getTitles(String s) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {

        ArrayList userList = new ArrayList();
        Database db = new Database();
        Connection connection = db.getConnection();
        try {
            PreparedStatement ps_author = connection.prepareStatement("SELECT distinct(title) FROM portal_cms.item_metadata WHERE materialType='book' and title like ?");
            ps_author.setString(1, s + "%");
            ResultSet rs_author = ps_author.executeQuery();
            while (rs_author.next()) {
                userList.add(rs_author.getString("title"));
            }
            Collections.sort(userList);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return userList;
    }
     
     public ArrayList getSubjects(String s) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {

        ArrayList userList = new ArrayList();
        Database db = new Database();
        Connection connection = db.getConnection();
        try {
            PreparedStatement ps_author = connection.prepareStatement("SELECT distinct(subject) FROM portal_cms.item_metadata WHERE materialType='book' and subject like ?");
            ps_author.setString(1, s + "%");
            ResultSet rs_author = ps_author.executeQuery();
            while (rs_author.next()) {
                userList.add(rs_author.getString("subject"));
            }
            Collections.sort(userList);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return userList;
    }
   // end bookajax
     
   // Start audioajax 
     
      public ArrayList getaudioTitles(String s) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {

        ArrayList userList = new ArrayList();
        Database db = new Database();
        Connection connection = db.getConnection();
        try {
            PreparedStatement ps_author = connection.prepareStatement("SELECT distinct(title) FROM portal_cms.item_metadata WHERE materialType='audio' and title like ?");
            ps_author.setString(1, s + "%");
            ResultSet rs_author = ps_author.executeQuery();
            while (rs_author.next()) {
                userList.add(rs_author.getString("title"));
            }
            Collections.sort(userList);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return userList;
    }
      
    public ArrayList getaudiocreator(String s) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {

        ArrayList userList = new ArrayList();
        Database db = new Database();
        Connection connection = db.getConnection();
        try {
            PreparedStatement ps_author = connection.prepareStatement("SELECT distinct(creator) FROM portal_cms.item_metadata WHERE materialType='audio' and creator like ?");
            ps_author.setString(1, s + "%");
            ResultSet rs_author = ps_author.executeQuery();
            while (rs_author.next()) {
                userList.add(rs_author.getString("creator"));
            }
            Collections.sort(userList);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return userList;
    }  
    
    public ArrayList getaudioSubject(String s) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {

        ArrayList userList = new ArrayList();
        Database db = new Database();
        Connection connection = db.getConnection();
        try {
            PreparedStatement ps_author = connection.prepareStatement("SELECT distinct(subject) FROM portal_cms.item_metadata WHERE materialType='audio' and subject like ?");
            ps_author.setString(1, s + "%");
            ResultSet rs_author = ps_author.executeQuery();
            while (rs_author.next()) {
                userList.add(rs_author.getString("subject"));
            }
            Collections.sort(userList);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return userList;
    }
      
    public ArrayList getaudioLanguage(String s) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {

        ArrayList userList = new ArrayList();
        Database db = new Database();
        Connection connection = db.getConnection();
        try {
            PreparedStatement ps_author = connection.prepareStatement("SELECT distinct(language) FROM portal_cms.item_metadata WHERE materialType='audio' and language like ?");
            ps_author.setString(1, s + "%");
            ResultSet rs_author = ps_author.executeQuery();
            while (rs_author.next()) {
                userList.add(rs_author.getString("language"));
            }
            Collections.sort(userList);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return userList;
    }  
    public ArrayList getaudioKeywords(String s) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {

        ArrayList userList = new ArrayList();
        Database db = new Database();
        Connection connection = db.getConnection();
        try {
            PreparedStatement ps_author = connection.prepareStatement("SELECT distinct(keywords) FROM portal_cms.item_metadata WHERE materialType='audio' and keywords like ?");
            ps_author.setString(1, s + "%");
            ResultSet rs_author = ps_author.executeQuery();
            while (rs_author.next()) {
                userList.add(rs_author.getString("keywords"));
            }
            Collections.sort(userList);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return userList;
    }  
    
   // end bookajax
}
