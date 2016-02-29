/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package metadata;

import bean.metaDataBean;
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
public class DuplicateMetadataAction extends ActionSupport implements SessionAware{
    Map<String, Object> session;
    public List<metaDataBean> duplicateMetadataList=new ArrayList<metaDataBean>();
    private int bookid;
    
            
    
    public DuplicateMetadataAction() {
    }
    
    public String execute() throws Exception {
        duplicateMetadataList= Ibatis.getSqlMap().queryForList("metadata.getDuplicateMetaDataList");
        return SUCCESS;
    }

    public String deleteDuplicateData()throws Exception {
        Ibatis.getSqlMap().delete("metadata.deleteMetaData",bookid);
        return SUCCESS;
    }
    public List<metaDataBean> getDuplicateMetadataList() {
        return duplicateMetadataList;
    }

    public void setDuplicateMetadataList(List<metaDataBean> duplicateMetadataList) {
        this.duplicateMetadataList = duplicateMetadataList;
    }

    public int getBookid() {
        return bookid;
    }

    public void setBookid(int bookid) {
        this.bookid = bookid;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session=session; //To change body of generated methods, choose Tools | Templates.
    }
}