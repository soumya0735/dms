/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package metadata;

import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author CDAC-36
 */
public class updateMetadataSearch extends ActionSupport implements SessionAware {

    Map<String, Object> session;

    public updateMetadataSearch() {
    }

    public String execute() throws Exception {
        return SUCCESS;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session; //To change body of generated methods, choose Tools | Templates.
    }
}
