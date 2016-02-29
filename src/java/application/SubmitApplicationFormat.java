/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package application;

import bean_application.application_format_bean;
import com.opensymphony.xwork2.ActionSupport;
import common.ScriptCheck;
import dao.Ibatis;
import java.io.FileInputStream;
import org.apache.struts2.interceptor.validation.SkipValidation;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author CDAC-49
 */
public class SubmitApplicationFormat extends ActionSupport {

    private application_format_bean applicationFormatForm;

    public SubmitApplicationFormat() {
    }

    public String SaveApplicationFormat() {
        try {
            FileInputStream is = new FileInputStream(applicationFormatForm.getInputFile());
            byte[] data = new byte[is.available()];
            is.read(data);
            is.close();
            applicationFormatForm.setInputFileData(data);
            Ibatis.getSqlMap().insert("wbsl.insertApplicationFormat", applicationFormatForm);
            addActionMessage("Application saved successfully");
            applicationFormatForm = new application_format_bean();
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            addActionError("Unable to save Application!!!");
            return ERROR;
        }

    }

    @SkipValidation
    public String ResetApplicationFormat() {
        applicationFormatForm = new application_format_bean();
        return SUCCESS;
    }

    public application_format_bean getApplicationFormatForm() {
        return applicationFormatForm;
    }

    public void setApplicationFormatForm(application_format_bean applicationFormatForm) {
        this.applicationFormatForm = applicationFormatForm;
    }

    @Override
    public void validate() {
        System.out.println("Content Type"+applicationFormatForm.getInputFileContentType());
        if (applicationFormatForm.getApplicantType().equals("-1")) {
            addActionError("Please select Applicant type");
        }
        if (applicationFormatForm.getInputFile() != null) {
            if (applicationFormatForm.getInputFile().length() > 64000) {
                addActionError("Image size should be less than 64 kb");
            }else if (!applicationFormatForm.getInputFileContentType().equals("image/jpeg") && !applicationFormatForm.getInputFileContentType().equals("image/png")) {
                addActionError( "Uploaded file should be in PNG/JPEG format");
            }
        }
        if (applicationFormatForm.getApplicantName().trim() == null || applicationFormatForm.getApplicantName().trim().isEmpty()) {
            addActionError("Applicant name is required.");
        } else if (new ScriptCheck().Check(applicationFormatForm.getApplicantName().trim().trim())) {
            addActionError("Invalid character entered in Applicant name");
        }
        if (applicationFormatForm.getAddressResidence().trim() == null || applicationFormatForm.getAddressResidence().trim().isEmpty()) {
            addActionError("Residence Address is required.");
        } else if (new ScriptCheck().Check(applicationFormatForm.getAddressResidence().trim())) {
            addActionError("Invalid character entered in Residence Address");
        }
        if (applicationFormatForm.getAddressOffice().trim() == null || applicationFormatForm.getAddressOffice().trim().isEmpty()) {
            addActionError("Office Address is required.");
        } else if (new ScriptCheck().Check(applicationFormatForm.getAddressOffice().trim())) {
            addActionError("Invalid character entered in Office Address");
        }
        if (applicationFormatForm.getOrganisationName().trim() == null || applicationFormatForm.getOrganisationName().trim().isEmpty()) {
            addActionError("Organisation Name is required.");
        } else if (new ScriptCheck().Check(applicationFormatForm.getOrganisationName().trim())) {
            addActionError("Invalid character entered in Organisation Name");
        }
        if (applicationFormatForm.getPhoneNo().trim() != null || applicationFormatForm.getPhoneNo().trim().isEmpty()) {
            if (!validatePhoneNumber(applicationFormatForm.getPhoneNo())) {
                addActionError("Invalid phone number");
            }
        }
        if (applicationFormatForm.getMobileNo().trim() != null || applicationFormatForm.getMobileNo().trim().isEmpty()) {
            if (!validatePhoneNumber(applicationFormatForm.getMobileNo())) {
                addActionError("Invalid mobile number");
            }
        }
        if (applicationFormatForm.getEmailAddress().trim() != null || applicationFormatForm.getEmailAddress().trim().isEmpty()) {
            if (new ScriptCheck().Check(applicationFormatForm.getEmailAddress().trim())) {
                addActionError("Invalid character entered in Email");
            } else if (!validateEmail(applicationFormatForm.getEmailAddress().trim())) {
                addActionError("Invalid Email");
            }
        }
        if (applicationFormatForm.getNationality().trim() == null || applicationFormatForm.getNationality().trim().isEmpty()) {
            addActionError("Nationality is required.");
        } else if (new ScriptCheck().Check(applicationFormatForm.getNationality().trim())) {
            addActionError("Invalid character entered in Nationality");
        }
        if (applicationFormatForm.getDesignation().trim() != null || applicationFormatForm.getDesignation().trim().isEmpty()) {
            if (new ScriptCheck().Check(applicationFormatForm.getDesignation().trim())) {
                addActionError("Invalid character entered in Profession/Designation");
            }
        }
        if (applicationFormatForm.getSubject().trim() != null || applicationFormatForm.getSubject().trim().isEmpty()) {
            if (new ScriptCheck().Check(applicationFormatForm.getSubject().trim())) {
                addActionError("Invalid character entered in Subject of Research/Paper/Books");
            }
        }

        if (applicationFormatForm.getOfficeName().trim() == null || applicationFormatForm.getOfficeName().trim().isEmpty()) {
            addActionError("Name of recommended office is required.");
        } else if (new ScriptCheck().Check(applicationFormatForm.getOfficeName().trim())) {
            addActionError("Invalid character entered in Name of recommended office");
        }
        if (applicationFormatForm.getRecommendedBy().trim() == null || applicationFormatForm.getRecommendedBy().trim().isEmpty()) {
            addActionError("Recommended by is required.");
        } else if (new ScriptCheck().Check(applicationFormatForm.getRecommendedBy().trim())) {
            addActionError("Invalid character entered in Recommended by");
        }



    }

    public boolean validatePhoneNumber(String chkString) {
        if (chkString.matches("\\d{10}")) {
            return true;
        } else if (chkString.matches("\\d{11}")) {
            return true;
        } //validating phone number with -, . or spaces
        else if (chkString.matches("\\d{3}[-\\.\\s]\\d{3}[-\\.\\s]\\d{4}")) {
            return true;
        } //validating phone number with extension length from 3 to 5
        else if (chkString.matches("\\d{3}-\\d{3}-\\d{4}\\s(x|(ext))\\d{3,5}")) {
            return true;
        } //validating phone number where area code is in braces ()
        else if (chkString.matches("\\(\\d{3}\\)-\\d{3}-\\d{4}")) {
            return true;
        } //return false if nothing matches the input
        else {
            return false;
        }
    }

    public boolean validateEmail(String chkString) {
        String regex = "^(.+)@(.+)$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(chkString);
        return matcher.matches();
    }
}
