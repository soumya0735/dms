/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean_application;

/**
 *
 * @author CDAC-49
 */
public class requisition_form_bean {
    
    private int requisitionId;
    private String  callNo;
    private String issueDate;
    private String authorName;
    private String title; 
    private String issuerName; 
    private String issuerDepartment;
    private String issuedBy;

    public requisition_form_bean() {
    }

    public requisition_form_bean(String callNo, String issueDate, String authorName, String title, String issuerName, String issuerDepartment, String issuedBy) {
        this.callNo = callNo;
        this.issueDate = issueDate;
        this.authorName = authorName;
        this.title = title;
        this.issuerName = issuerName;
        this.issuerDepartment = issuerDepartment;
        this.issuedBy = issuedBy;
    }

    public requisition_form_bean(int requisitionId, String callNo, String issueDate, String authorName, String title, String issuerName, String issuerDepartment, String issuedBy) {
        this.requisitionId = requisitionId;
        this.callNo = callNo;
        this.issueDate = issueDate;
        this.authorName = authorName;
        this.title = title;
        this.issuerName = issuerName;
        this.issuerDepartment = issuerDepartment;
        this.issuedBy = issuedBy;
    }
    
    

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public String getCallNo() {
        return callNo;
    }

    public void setCallNo(String callNo) {
        this.callNo = callNo;
    }

    public String getIssueDate() {
        return issueDate;
    }

    public void setIssueDate(String issueDate) {
        this.issueDate = issueDate;
    }

    public String getIssuedBy() {
        return issuedBy;
    }

    public void setIssuedBy(String issuedBy) {
        this.issuedBy = issuedBy;
    }

    public String getIssuerDepartment() {
        return issuerDepartment;
    }

    public void setIssuerDepartment(String issuerDepartment) {
        this.issuerDepartment = issuerDepartment;
    }

    public String getIssuerName() {
        return issuerName;
    }

    public void setIssuerName(String issuerName) {
        this.issuerName = issuerName;
    }

    public int getRequisitionId() {
        return requisitionId;
    }

    public void setRequisitionId(int requisitionId) {
        this.requisitionId = requisitionId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
    
    
    
}
