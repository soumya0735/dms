/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package portal;

import bean.item_metadata;
import java.util.ArrayList;
import java.util.List;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
import javax.servlet.ServletContext;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.util.ServletContextAware;
import org.hamcrest.Matchers;
import java.util.List;
import static ch.lambdaj.Lambda.on;
import static ch.lambdaj.Lambda.select;
import static ch.lambdaj.Lambda.having;
import com.sun.org.apache.bcel.internal.generic.BREAKPOINT;
import org.apache.commons.lang.StringEscapeUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.tomcat.util.http.mapper.MappingData;

/**
 *
 * @author CDAC-49
 */
public class getItemMetadata extends ActionSupport implements SessionAware, ServletContextAware {

    private List<item_metadata> itemMetadataList = new ArrayList<item_metadata>();
    private String title;
    private String creator;
    private String keywords;
    private String subject;
    private String language;
    private String searchtype;
    private boolean status = true;
    ServletContext context;
    Map<String, Object> session;

    public getItemMetadata() {
    }

    public String getItem() {
        try {
            System.out.println(getSearchtype());
            // itemMetadataList.clear();
            session.put("searchType", getSearchtype());
            if (getSearchtype().equals("book")) {
                itemMetadataList = (List<item_metadata>) context.getAttribute("itemMetadataList");
                System.out.println("Length1" + itemMetadataList.size());
                if (!getTitle().trim().isEmpty()) {
                    if (getTitle().toLowerCase().contains("<script") || getTitle().toLowerCase().contains("<iframe") || getTitle().toLowerCase().contains("<img")) {
                        status = false;
                    } else {
                        itemMetadataList = select(itemMetadataList, having(on(item_metadata.class).getTitle(), Matchers.containsString(StringUtils.capitalize(getTitle()))));
                    }
                }

                if (!getCreator().trim().isEmpty()) {
                    if (getCreator().toLowerCase().contains("<script") || getCreator().toLowerCase().contains("<iframe") || getCreator().toLowerCase().contains("<img")) {
                        status = false;
                    } else {
                        itemMetadataList = select(itemMetadataList, having(on(item_metadata.class).getCreator(), Matchers.containsString(StringUtils.capitalize(getCreator()))));
                    }
                }
                if (!getKeywords().trim().isEmpty()) {
                    if (getKeywords().toLowerCase().contains("<script") || getKeywords().toLowerCase().contains("<iframe") || getKeywords().toLowerCase().contains("<img")) {
                        status = false;
                    } else {
                        itemMetadataList = select(itemMetadataList, having(on(item_metadata.class).getKeywords(), Matchers.containsString(StringUtils.capitalize(getKeywords()))));
                    }
                }
                if (!getSubject().trim().isEmpty()) {
                    if (getSubject().toLowerCase().contains("<script") || getSubject().toLowerCase().contains("<iframe") || getSubject().toLowerCase().contains("<img")) {
                        status = false;
                    } else {
                        itemMetadataList = select(itemMetadataList, having(on(item_metadata.class).getSubject(), Matchers.containsString(StringUtils.capitalize(getSubject()))));
                    }
                }
                if (!getLanguage().trim().isEmpty()) {
                    if (getLanguage().toLowerCase().contains("<script") || getLanguage().toLowerCase().contains("<iframe") || getLanguage().toLowerCase().contains("<img")) {
                        status = false;
                    } else {
                        itemMetadataList = select(itemMetadataList, having(on(item_metadata.class).getLanguage(), Matchers.containsString(StringUtils.capitalize(getLanguage()))));
                    }
                }
            } else {
                //itemMetadataList.clear();
                itemMetadataList = (List<item_metadata>) context.getAttribute("audioMetadataList");

                if (!getTitle().trim().isEmpty()) {
                    if (getTitle().toLowerCase().contains("<script") || getTitle().toLowerCase().contains("<iframe") || getTitle().toLowerCase().contains("<img")) {
                        status = false;
                    } else {
                        itemMetadataList = select(itemMetadataList, having(on(item_metadata.class).getTitle(), Matchers.containsString(StringUtils.capitalize(getTitle()))));
                    }
                }
                if (!getCreator().trim().isEmpty()) {
                    if (getCreator().toLowerCase().contains("<script") || getCreator().toLowerCase().contains("<iframe") || getCreator().toLowerCase().contains("<img")) {
                        status = false;
                    } else {
                        itemMetadataList = select(itemMetadataList, having(on(item_metadata.class).getCreator(), Matchers.containsString(StringUtils.capitalize(getCreator()))));
                    }
                }
                if (!getKeywords().trim().isEmpty()) {
                    if (getKeywords().toLowerCase().contains("<script") || getKeywords().toLowerCase().contains("<iframe") || getKeywords().toLowerCase().contains("<img")) {
                        status = false;
                    } else {
                        itemMetadataList = select(itemMetadataList, having(on(item_metadata.class).getKeywords(), Matchers.containsString(StringUtils.capitalize(getKeywords()))));
                    }
                }
                if (!getSubject().trim().isEmpty()) {
                    if (getSubject().toLowerCase().contains("<script") || getSubject().toLowerCase().contains("<iframe") || getSubject().toLowerCase().contains("<img")) {
                        status = false;
                    } else {
                        itemMetadataList = select(itemMetadataList, having(on(item_metadata.class).getSubject(), Matchers.containsString(StringUtils.capitalize(getSubject()))));
                    }
                }
                if (!getLanguage().trim().isEmpty()) {
                    if (getLanguage().toLowerCase().contains("<script") || getLanguage().toLowerCase().contains("<iframe") || getLanguage().toLowerCase().contains("<img")) {
                        status = false;
                    } else {
                        itemMetadataList = select(itemMetadataList, having(on(item_metadata.class).getLanguage(), Matchers.containsString(StringUtils.capitalize(getLanguage()))));
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            System.out.println("Length" + itemMetadataList.size());
            if (getSearchtype().equals("book")) {
                System.out.println("Status:- " + status);
                if (status) {
                    return "book";
                } else {
                    addActionError("Invalid Characters Entered");
                    //itemMetadataList.clear();
                    return "errorBook";
                }
            } else if (getSearchtype().equals("audio")) {
                if (status) {
                    return "audio";
                } else {
                    addActionError("Invalid Characters Entered");
                    return "errorAudio";
                }

            }
            return "book";
        }
    }

    public String freshDataTable() {
        itemMetadataList.clear();
        return SUCCESS;
    }

    public String showBookSearch() {
        itemMetadataList.clear();
        return SUCCESS;
    }

    public String showAudioSearch() {
        itemMetadataList.clear();
        return SUCCESS;
    }

    public List<item_metadata> getItemMetadataList() {
        return itemMetadataList;
    }

    public void setItemMetadataList(List<item_metadata> itemMetadataList) {
        this.itemMetadataList = itemMetadataList;
    }

    @Override
    public void setServletContext(ServletContext context) {
        this.context = context;
    }

    @Override
    public void setSession(Map<String, Object> map) {
        this.session = map;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSearchtype() {
        return searchtype;
    }

    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public void setSearchtype(String searchtype) {
        this.searchtype = searchtype;
    }
}
