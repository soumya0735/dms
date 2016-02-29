/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package wishlist;

import bean.item_metadata;
import bean_wishlist.wish_list_bean;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import dao.Ibatis;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author CDAC-49
 */
public class ShowWishList extends ActionSupport implements SessionAware, Preparable {

    private String bookId;
    private List<item_metadata> itemMetadataList = new ArrayList<item_metadata>();
    Map<String, Object> session;

    public ShowWishList() {
    }

    @Override
    public void prepare() throws Exception {
        show();
    }

    public String show() {
        if (session.get("userName") == null) {
            addActionError("Session Expired, Please login into the system.");
            return "showLogin";
        } else {
            try {
                String user_name = session.get("userName").toString();
                itemMetadataList = Ibatis.getSqlMap().queryForList("wbsl.getWish_List", user_name);
            } catch (Exception ex) {
                ex.printStackTrace();
                addActionError("Unable to show in the wishlist");
            } finally {
                return "success";
            }
        }
    }

    public String getBookId() {
        return bookId;
    }

    public void setBookId(String bookId) {
        this.bookId = bookId;
    }

    public List<item_metadata> getItemMetadataList() {
        return itemMetadataList;
    }

    public void setItemMetadataList(List<item_metadata> itemMetadataList) {
        this.itemMetadataList = itemMetadataList;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }
}
