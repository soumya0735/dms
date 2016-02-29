/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package archive;

import bean.item_metadata;
import com.opensymphony.xwork2.ActionSupport;
import dao.Ibatis;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.util.ServletContextAware;

/**
 *
 * @author CDAC-49
 */
public class SearchArchive extends ActionSupport implements SessionAware, ServletContextAware {

    private int bookId;
    private List<item_metadata> itemMetadataList = new ArrayList<item_metadata>();
    private List<item_metadata> itemList = new ArrayList<item_metadata>();
    ServletContext context;
    Map<String, Object> session;

    public SearchArchive() {
    }

    @Override
    public String execute() {
        System.out.println("in Ajax");
        try {
            itemMetadataList = (List<item_metadata>) context.getAttribute("itemMetadataList");;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return SUCCESS;
        }
    }

    public String showBookMetadata() {
        try {
            itemList = Ibatis.getSqlMap().queryForList("wbsl.getBookmetadata", bookId);
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            return SUCCESS;
        }
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public List<item_metadata> getItemList() {
        return itemList;
    }

    public void setItemList(List<item_metadata> itemList) {
        this.itemList = itemList;
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

    @Override
    public void setServletContext(ServletContext context) {
        this.context = context;
    }
}
