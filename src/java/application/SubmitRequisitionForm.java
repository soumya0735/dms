/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package application;

import bean_application.requisition_form_bean;
import com.opensymphony.xwork2.ActionSupport;
import common.ScriptCheck;
import dao.Ibatis;

/**
 *
 * @author CDAC-49
 */
public class SubmitRequisitionForm extends ActionSupport {

    private requisition_form_bean requisitionForm;

    public SubmitRequisitionForm() {
    }

    public String SaveRequisitionForm() {
        try {
            Ibatis.getSqlMap().insert("wbsl.insertRequisitionForm", requisitionForm);
            addActionMessage("Application saved successfully");
            requisitionForm = new requisition_form_bean();
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            addActionError("Unable to save Application!!!");
            return ERROR;
        }

    }
    
    

    public requisition_form_bean getRequisitionForm() {
        return requisitionForm;
    }

    public void setRequisitionForm(requisition_form_bean requisitionForm) {
        this.requisitionForm = requisitionForm;
    }

   

    @Override
    public void validate() {
        if (requisitionForm.getCallNo().trim() == null || requisitionForm.getCallNo().trim().isEmpty()) {
            addActionError("Call No. is required.");
        } else if (new ScriptCheck().Check(requisitionForm.getCallNo().trim())) {
            addActionError("Invalid character entered in Call No.");
        }
        if (requisitionForm.getIssueDate().trim() == null || requisitionForm.getIssueDate().trim().isEmpty()) {
            addActionError("Issue date is required.");
        } else if (new ScriptCheck().Check(requisitionForm.getIssueDate().trim())) {
            addActionError("Invalid character entered in Issue date");
        }
        if (requisitionForm.getAuthorName().trim() == null || requisitionForm.getAuthorName().trim().isEmpty()) {
            addActionError("Author Name is required.");
        } else if (new ScriptCheck().Check(requisitionForm.getAuthorName().trim())) {
            addActionError("Invalid character entered in Author Name");
        }
        if (requisitionForm.getTitle().trim() == null || requisitionForm.getTitle().trim().isEmpty()) {
            addActionError("Title is required.");
        } else if (new ScriptCheck().Check(requisitionForm.getTitle().trim())) {
            addActionError("Invalid character entered in Title");
        }
        if (requisitionForm.getIssuerName().trim() == null || requisitionForm.getIssuerName().trim().isEmpty()) {
            addActionError("Issuer name is required.");
        } else if (new ScriptCheck().Check(requisitionForm.getIssuerName().trim())) {
            addActionError("Invalid character entered in Issuer name");
        }
        if (requisitionForm.getIssuerDepartment().trim() == null || requisitionForm.getIssuerDepartment().trim().isEmpty()) {
            addActionError("Department is required.");
        } else if (new ScriptCheck().Check(requisitionForm.getIssuerDepartment().trim())) {
            addActionError("Invalid character entered in Department");
        }
        if (requisitionForm.getIssuedBy().trim() == null || requisitionForm.getIssuedBy().trim().isEmpty()) {
            addActionError("Issued by is required.");
        } else if (new ScriptCheck().Check(requisitionForm.getIssuedBy().trim())) {
            addActionError("Invalid character entered in Issued by");
        }
        
    }
}
