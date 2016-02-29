/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package news;

import com.opensymphony.xwork2.ActionSupport;
import java.util.Date;
import java.util.Locale;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
//import org.apache.struts.action.ActionErrors;
//import org.apache.struts.action.ActionMapping;
//import org.apache.struts.action.ActionMessage;
//import org.apache.struts.action.ActionForm;
//import org.apache.struts.upload.FormFile;
import java.math.BigDecimal;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author CDAC-36
 */
public class newsForm extends ActionSupport implements SessionAware {
    // For SessionAware

    Map<String, Object> session;

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }
    private final static String SUCCESS = "success";
    private int articleid, id;
    private String name, news_matter;

    public int getArticleid() {
        return articleid;
    }

    public void setArticleid(int articleid) {
        this.articleid = articleid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNews_matter() {
        return news_matter;
    }

    public void setNews_matter(String news_matter) {
        this.news_matter = news_matter;
    }
}
