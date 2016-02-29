/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean_feedback;

/**
 *
 * @author Manas Chakraborty
 */
public class Feedback {

    private int feedback_Id;
    private String visitor_Name;
    private String visitor_Email;
    private String visitor_Organisation;
    private String visitor_Address;
    private String visitor_Comment;

    public Feedback() {
    }

    public String getVisitor_Name() {
        return visitor_Name;
    }

    public void setVisitor_Name(String visitor_Name) {
        this.visitor_Name = visitor_Name;
    }

    public String getVisitor_Email() {
        return visitor_Email;
    }

    public void setVisitor_Email(String visitor_Email) {
        this.visitor_Email = visitor_Email;
    }

    public String getVisitor_Organisation() {
        return visitor_Organisation;
    }

    public void setVisitor_Organisation(String visitor_Organisation) {
        this.visitor_Organisation = visitor_Organisation;
    }

    public String getVisitor_Address() {
        return visitor_Address;
    }

    public void setVisitor_Address(String visitor_Address) {
        this.visitor_Address = visitor_Address;
    }

    public String getVisitor_Comment() {
        return visitor_Comment;
    }

    public void setVisitor_Comment(String visitor_Comment) {
        this.visitor_Comment = visitor_Comment;
    }

    public int getFeedback_Id() {
        return feedback_Id;
    }

    public void setFeedback_Id(int feedback_Id) {
        this.feedback_Id = feedback_Id;
    }
    
    
}
