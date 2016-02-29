/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package news;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.Date;
import java.util.Locale;
import java.text.SimpleDateFormat;

//import org.apache.struts.action.Action;
//import org.apache.struts.action.ActionForm;
//import org.apache.struts.action.ActionMapping;
//import org.apache.struts.action.ActionForward;


import javax.servlet.http.HttpSession;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionSupport;
import dao.Ibatis;
import java.util.ArrayList;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author CDAC-36
 */
public class news extends ActionSupport implements SessionAware {

    // For SessionAware
    Map<String, Object> session;

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }
    List<newsForm> newsList = new ArrayList<newsForm>();
    private final static String SUCCESS = "success";

    public String execute() throws Exception {

        System.out.println("In file news.java");

        SqlMapClient sqlMap = Ibatis.getSqlMap();     
        newsList = Ibatis.getSqlMap().queryForList("visvabharati.newsUpdate");
        
        System.out.println(newsList.size() + " size");

        return SUCCESS;
    }

    public List<newsForm> getNewsList() {
        return newsList;
    }

    public void setNewsList(List<newsForm> newsList) {
        this.newsList = newsList;
    }
}
