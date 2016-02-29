/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package archive;

import bean.advanced_search_bean;
import bean.item_metadata;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import common.ScriptCheck;
import dao.Ibatis;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletContext;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.interceptor.validation.SkipValidation;
import org.apache.struts2.util.ServletContextAware;

/**
 *
 * @author CDAC-49
 */
public class GetAdvancedSearch extends ActionSupport implements SessionAware, ServletContextAware, Preparable {
    
    private int bookId;
    private List<String> bookheadno_list = new ArrayList<String>();
    private List<String> title_list = new ArrayList<String>();
    private List<String> creator_list = new ArrayList<String>();
    advanced_search_bean search_criteria = new advanced_search_bean();
    private List<item_metadata> itemMetadataList = new ArrayList<item_metadata>();
    ServletContext context;
    Map<String, Object> session;
    
    public GetAdvancedSearch() {
    }
    
    @Override
    public void prepare() throws Exception {
        bookheadno_list = Ibatis.getSqlMap().queryForList("metadata.getAllHeadNo");
        title_list = Ibatis.getSqlMap().queryForList("metadata.getAllTitle");
        creator_list = Ibatis.getSqlMap().queryForList("metadata.getAllCreator");
    }
    
    @SkipValidation
    @Override
    public String execute() {
        try {
            System.out.println("in Ajax");
            bookheadno_list = Ibatis.getSqlMap().queryForList("metadata.getAllHeadNo");
            title_list = Ibatis.getSqlMap().queryForList("metadata.getAllTitle");
            creator_list = Ibatis.getSqlMap().queryForList("metadata.getAllCreator");
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return SUCCESS;
        }
    }
    
    public String search() {
        System.out.println("in Search");
        try {
            itemMetadataList = Ibatis.getSqlMap().queryForList("metadata.getItem_metadata_advanced_search_result", search_criteria);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return SUCCESS;
        }
    }
    
    public int getBookId() {
        return bookId;
    }
    
    public void setBookId(int bookId) {
        this.bookId = bookId;
    }
    
    public List<String> getBookheadno_list() {
        return bookheadno_list;
    }
    
    public void setBookheadno_list(List<String> bookheadno_list) {
        this.bookheadno_list = bookheadno_list;
    }
    
    public List<String> getTitle_list() {
        return title_list;
    }
    
    public void setTitle_list(List<String> title_list) {
        this.title_list = title_list;
    }
    
    public List<String> getCreator_list() {
        return creator_list;
    }
    
    public void setCreator_list(List<String> creator_list) {
        this.creator_list = creator_list;
    }
    
    public advanced_search_bean getSearch_criteria() {
        return search_criteria;
    }
    
    public void setSearch_criteria(advanced_search_bean search_criteria) {
        this.search_criteria = search_criteria;
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
    
    @Override
    public void validate() {
        if (search_criteria.getBookheadno().trim() != null || !search_criteria.getBookheadno().trim().isEmpty()) {
            if (new ScriptCheck().Check(search_criteria.getBookheadno().trim())) {
                addActionError("Invalid character entered in Head No.");
            }
        }
        if (search_criteria.getTitle().trim() != null || !search_criteria.getTitle().trim().isEmpty()) {
            if (new ScriptCheck().Check(search_criteria.getTitle().trim())) {
                addActionError("Invalid character entered in Title");
            }
        }
        if (search_criteria.getCreator().trim() != null || !search_criteria.getCreator().trim().isEmpty()) {
            if (new ScriptCheck().Check(search_criteria.getCreator().trim())) {
                addActionError("Invalid character entered in Creator");
            }
        }
        if (search_criteria.getKeywords().trim() != null || !search_criteria.getKeywords().trim().isEmpty()) {
            if (new ScriptCheck().Check(search_criteria.getKeywords().trim())) {
                System.out.println(search_criteria.getKeywords().matches("\\d{1}"));
                addActionError("Invalid character entered in Keywords");
            }
        }
        if (Integer.toString(search_criteria.getFromPeriod()).matches("\\d{0}")) {
            addActionError("From Year accepts integer only, Please enter in YYYY format");
        }
        if (Integer.toString(search_criteria.getToPeriod()).matches("\\d{0}")) {
            addActionError("To Year accepts integer only, Please enter in YYYY format");
        }
        
        
    }
}
