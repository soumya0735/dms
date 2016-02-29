/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package home;

/**
 *
 * @author CDAC-49
 */
import com.opensymphony.xwork2.ActionContext;
import java.util.Map;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import org.apache.struts2.StrutsStatics;

public class LoginInterceptor implements Interceptor, StrutsStatics {

    private static final long serialVersionUID = 1L;

    @Override
    public void destroy() {
        // TODO Auto-generated method stub
    }

    @Override
    public void init() {
        // TODO Auto-generated method stub
    }

    @Override
    public String intercept(ActionInvocation invocation) throws Exception {
        System.out.println("Intercepter Working");
        Map<String, Object> sessionAttributes = invocation.getInvocationContext().getSession();
        //ActionContext context = ActionContext.getContext();                
        System.out.println("Username from Session: " + invocation.getInvocationContext().getSession().toString());
        if (sessionAttributes == null
                || sessionAttributes.get("userName") == null) {
            return "SessionExpired";
        } else {
            if (!((String) sessionAttributes.get("userName")).equals(null)) {
                return invocation.invoke();
            } else {
                return "SessionExpired";
            }
        }

    }
}
