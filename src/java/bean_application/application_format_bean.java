/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean_application;

import java.io.File;

/**
 *
 * @author CDAC-49
 */
public class application_format_bean {

    private int applicationId;
    private String applicantType;
    private String applicantName;
    private String addressResidence;
    private String addressOffice;
    private String organisationName;
    private String phoneNo;
    private String mobileNo;
    private String emailAddress;
    private String nationality;
    private String designation;
    private String subject;
    private String officeName;
    private String recommendedBy;
    
    private File inputFile;
    private String inputFileContentType;
    private String inputFileFileName;
    private String inputFilePath;
    
    byte[] inputFileData ;

    public application_format_bean() {
    }

    public application_format_bean(String applicantType, String applicantName, String addressResidence, String addressOffice, String organisationName, String phoneNo, String mobileNo, String emailAddress, String nationality, String designation, String subject, String officeName, String recommendedBy,File inputFile,byte[] inputFileData) {
        this.applicantType = applicantType;
        this.applicantName = applicantName;
        this.addressResidence = addressResidence;
        this.addressOffice = addressOffice;
        this.organisationName = organisationName;
        this.phoneNo = phoneNo;
        this.mobileNo = mobileNo;
        this.emailAddress = emailAddress;
        this.nationality = nationality;
        this.designation = designation;
        this.subject = subject;
        this.officeName = officeName;
        this.recommendedBy = recommendedBy;
        this.inputFile=inputFile;
        this.inputFileData=inputFileData;
    }

    public application_format_bean(int applicationId, String applicantType, String applicantName, String addressResidence, String addressOffice, String organisationName, String phoneNo, String mobileNo, String emailAddress, String nationality, String designation, String subject, String officeName, String recommendedBy, File inputFile, byte[] inputFileData) {
        this.applicationId = applicationId;
        this.applicantType = applicantType;
        this.applicantName = applicantName;
        this.addressResidence = addressResidence;
        this.addressOffice = addressOffice;
        this.organisationName = organisationName;
        this.phoneNo = phoneNo;
        this.mobileNo = mobileNo;
        this.emailAddress = emailAddress;
        this.nationality = nationality;
        this.designation = designation;
        this.subject = subject;
        this.officeName = officeName;
        this.recommendedBy = recommendedBy;
        this.inputFile=inputFile;
        this.inputFileData=inputFileData;
    }
    
    

    public String getAddressOffice() {
        return addressOffice;
    }

    public void setAddressOffice(String addressOffice) {
        this.addressOffice = addressOffice;
    }

    public String getAddressResidence() {
        return addressResidence;
    }

    public void setAddressResidence(String addressResidence) {
        this.addressResidence = addressResidence;
    }

    public String getApplicantName() {
        return applicantName;
    }

    public void setApplicantName(String applicantName) {
        this.applicantName = applicantName;
    }

    public String getApplicantType() {
        return applicantType;
    }

    public void setApplicantType(String applicantType) {
        this.applicantType = applicantType;
    }

    public int getApplicationId() {
        return applicationId;
    }

    public void setApplicationId(int applicationId) {
        this.applicationId = applicationId;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public String getMobileNo() {
        return mobileNo;
    }

    public void setMobileNo(String mobileNo) {
        this.mobileNo = mobileNo;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getOfficeName() {
        return officeName;
    }

    public void setOfficeName(String officeName) {
        this.officeName = officeName;
    }

    public String getOrganisationName() {
        return organisationName;
    }

    public void setOrganisationName(String organisationName) {
        this.organisationName = organisationName;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    public String getRecommendedBy() {
        return recommendedBy;
    }

    public void setRecommendedBy(String recommendedBy) {
        this.recommendedBy = recommendedBy;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public File getInputFile() {
        return inputFile;
    }

    public void setInputFile(File inputFile) {
        this.inputFile = inputFile;
    }

    public String getInputFileContentType() {
        return inputFileContentType;
    }

    public void setInputFileContentType(String inputFileContentType) {
        this.inputFileContentType = inputFileContentType;
    }

    public String getInputFileFileName() {
        return inputFileFileName;
    }

    public void setInputFileFileName(String inputFileFileName) {
        this.inputFileFileName = inputFileFileName;
    }

    public String getInputFilePath() {
        return inputFilePath;
    }

    public void setInputFilePath(String inputFilePath) {
        this.inputFilePath = inputFilePath;
    }

    public byte[] getInputFileData() {
        return inputFileData;
    }

    public void setInputFileData(byte[] inputFileData) {
        this.inputFileData = inputFileData;
    }
    
    
    
    
}
