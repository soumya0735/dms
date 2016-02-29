/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean_feedback;

import java.util.Date;

/**
 *
 * @author CDAC-49
 */
public class FeedbackAdmin {
    private int id;
    private String admin_Name; 
    private String admin_Email;
    private String isValid;
    private Date updated_On;
    private String updated_By;

    public FeedbackAdmin() {
    }

    public String getAdmin_Email() {
        return admin_Email;
    }

    public void setAdmin_Email(String admin_Email) {
        this.admin_Email = admin_Email;
    }

    public String getAdmin_Name() {
        return admin_Name;
    }

    public void setAdmin_Name(String admin_Name) {
        this.admin_Name = admin_Name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getIsValid() {
        return isValid;
    }

    public void setIsValid(String isValid) {
        this.isValid = isValid;
    }

    public String getUpdated_By() {
        return updated_By;
    }

    public void setUpdated_By(String updated_By) {
        this.updated_By = updated_By;
    }

    public Date getUpdated_On() {
        return updated_On;
    }

    public void setUpdated_On(Date updated_On) {
        this.updated_On = updated_On;
    }
  
}
