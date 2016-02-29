/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package metadata;

import bean.metaDataBean;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import dao.Ibatis;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author CDAC-01
 */
public class metadataVerifyAction extends ActionSupport implements SessionAware {

    Map<String, Object> session;
    List<metaDataBean> metadataList = new ArrayList<metaDataBean>();
    List<metaDataBean> itemDetailsList = new ArrayList<metaDataBean>();
    public String actionNm;
    public String bookid;
    public int bookIdArr[];
    metaDataBean metadata = new metaDataBean();

    public metadataVerifyAction() {
    }

    public String execute() throws Exception {
        System.out.println("test " + bookIdArr.length);
        try{
        for (int count = 0; count < bookIdArr.length; count++) {            
            metadata.setUserId(Integer.parseInt(session.get("userId").toString()));            
            metadata.setOperation("Metadata Verified");            
            metadata.setBookid(bookIdArr[count]);            
            Ibatis.getSqlMap().insert("metadata.insertLog", metadata);            
            Ibatis.getSqlMap().update("metadata.setVerifiedTag",String.valueOf(bookIdArr[count]));
        }
        return SUCCESS;
        }catch(Exception e){
            e.printStackTrace();
            return "input";
        }
    }

    public String getItemDetails() throws Exception {
        //getItemDetailsDataBookId
        itemDetailsList = Ibatis.getSqlMap().queryForList("metadata.getItemDetailsDataBookId", bookid);
        return SUCCESS;
    }

    public String getMetadataListNonVerified() throws Exception {
        metadataList = Ibatis.getSqlMap().queryForList("metadata.metadataList");
        return SUCCESS;
    }

    public List<metaDataBean> getMetadataList() {
        return metadataList;
    }

    public void setMetadataList(List<metaDataBean> metadataList) {
        this.metadataList = metadataList;
    }

    public int[] getBookIdArr() {
        return bookIdArr;
    }

    public void setBookIdArr(int[] bookIdArr) {
        this.bookIdArr = bookIdArr;
    }

   

    

    public List<metaDataBean> getItemDetailsList() {
        return itemDetailsList;
    }

    public void setItemDetailsList(List<metaDataBean> itemDetailsList) {
        this.itemDetailsList = itemDetailsList;
    }

    public String getBookid() {
        return bookid;
    }

    public void setBookid(String bookid) {
        this.bookid = bookid;
    }

    public String getActionNm() {
        return actionNm;
    }

    public void setActionNm(String actionNm) {
        this.actionNm = actionNm;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session; //To change body of generated methods, choose Tools | Templates.
    }
}