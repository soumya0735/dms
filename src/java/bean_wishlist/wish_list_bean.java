/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean_wishlist;

/**
 *
 * @author CDAC-49
 */
public class wish_list_bean {

    private int bookid;
    private String user_name;
    private String start_date;

    public wish_list_bean() {
    }

    public wish_list_bean(int bookid, String user_name) {
        this.bookid = bookid;
        this.user_name = user_name;
    }
    
    
    public int getBookid() {
        return bookid;
    }

    public void setBookid(int bookid) {
        this.bookid = bookid;
    }

    public String getStart_date() {
        return start_date;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }
}
