/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ajax;

import com.opensymphony.xwork2.ActionSupport;
import dao.Ibatis;
import java.util.List;
import java.util.ArrayList;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
/**
 *
 * @author CDAC-49
 */
public class SearchController_audiocreator extends ActionSupport {

    List<String> list  = new ArrayList<String>();
    private String term;

    public SearchController_audiocreator() {
    }

  
    public String execute() {
        try {
            HttpServletResponse response=ServletActionContext.getResponse();
            HttpServletRequest request=ServletActionContext.getRequest();
            String text1 = request.getParameter("term");
            System.out.println("Language:-" + text1);
            UserDAO dao=new UserDAO();
            list  = dao.getaudiocreator(text1);
            System.out.println("Language:-" + list.size());
        } catch (Exception e) {
            e.printStackTrace();
        }

        return SUCCESS;

    }

    public List<String> getList() {
        return list;
    }

    public void setList(List<String> list) {
        this.list = list;
    }

   
}
