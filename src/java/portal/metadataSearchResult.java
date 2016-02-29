/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package portal;

import bean.item_metadata;
import com.opensymphony.xwork2.ActionSupport;
import dao.Ibatis;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author CDAC-49
 */
public class metadataSearchResult extends ActionSupport {
    
    private List<item_metadata> itemList=new ArrayList<item_metadata>();
    private int bookId;
    
    public metadataSearchResult() {
    }
           
    public String showBookMetadata() throws Exception {
        itemList=Ibatis.getSqlMap().queryForList("visvabharati.getBookmetadata",bookId);
        System.out.println(itemList.get(0).getBookid());
        return SUCCESS;
    }
    
    public String showAudioMetadata() throws Exception {
        itemList=Ibatis.getSqlMap().queryForList("visvabharati.getBookmetadata",bookId);
        System.out.println(itemList.get(0).getBookid());
        return SUCCESS;
    }

    public List<item_metadata> getItemList() {
        return itemList;
    }

    public void setItemList(List<item_metadata> itemList) {
        this.itemList = itemList;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }
               
}
