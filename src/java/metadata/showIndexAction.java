/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package metadata;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author CDAC-01
 */
public class showIndexAction extends ActionSupport implements SessionAware {

    Map<String, Object> session;

    public showIndexAction() {
    }

    public String execute() throws Exception {
        System.out.println("test");
        return SUCCESS;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session; //To change body of generated methods, choose Tools | Templates.
    }
}