package bean;

import java.util.Date;
import java.util.List;



/**
 *
 * @author cdac
 */
public class metaDataBean {

    private int bookid;
    private int bookIdArr[];
    private String bookTitleArr[];
    private String title, title1, title2, title3;
    private String materialType, language, date, accessionNumber, bookheadno;
    private String creator, creator1, creator2, creator3, creator4, creator5, creator6, creator7, creator8, creator9;
    private String keywords, keywords1, keywords2, keywords3, keywords4, keywords5;
    private String description, subject;
    private String publisher, contributor, contributor1;
    private String documentType1, documentType2, format, identifier;
    private String source, relation, coverage, rights;
    private String copyrightDate;
    private String scanningCentre, scanningNumber;
    private String digitalPublisher, digitalrepublisher, digitalPublicationDate;
    private String pages;
    private String pages2,onlytitle,microfilm_no,pdf_location;
    private String filename;

    public String getDigitalrepublisher() {
        return digitalrepublisher;
    }

    public void setDigitalrepublisher(String digitalrepublisher) {
        this.digitalrepublisher = digitalrepublisher;
    }

    public String getMicrofilm_no() {
        return microfilm_no;
    }

    public void setMicrofilm_no(String microfilm_no) {
        this.microfilm_no = microfilm_no;
    }

    public String getPdf_location() {
        return pdf_location;
    }

    public void setPdf_location(String pdf_location) {
        this.pdf_location = pdf_location;
    }

    public String getBookheadno() {
        return bookheadno;
    }

    public void setBookheadno(String bookheadno) {
        this.bookheadno = bookheadno;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }
    
    
    

    public String getOnlytitle() {
        return onlytitle;
    }

    public void setOnlytitle(String onlytitle) {
        this.onlytitle = onlytitle;
    }

    public String getPages2() {
        return pages2;
    }

    public void setPages2(String pages2) {
        this.pages2 = pages2;
    }
    /*
     * Added By Niladri For PDF and JPEG Conversion Form
     */
    /*
     * Added By Niladri For Manage User Form
     */
    private int userIdArr[];
    private int userId;
    private String userName, operation;
    private String userPassword;
    private String name;
    private String role;
    private String email;
    private String phone;
    private String createdBy;

    private String disk_name, site_name, site_location,site_alias, subject1, subject2,xmlfile,rootfolder;
    private int site_id;

    public String getXmlfile() {
        return xmlfile;
    }

    public void setXmlfile(String xmlfile) {
        this.xmlfile = xmlfile;
    }

    public String getRootfolder() {
        return rootfolder;
    }

    public void setRootfolder(String rootfolder) {
        this.rootfolder = rootfolder;
    }

    
    public String getSite_alias() {
        return site_alias;
    }

    public void setSite_alias(String site_alias) {
        this.site_alias = site_alias;
    }

    public String getSite_location() {
        return site_location;
    }

    public void setSite_location(String site_location) {
        this.site_location = site_location;
    }

    public String getDisk_name() {
        return disk_name;
    }

    public void setDisk_name(String disk_name) {
        this.disk_name = disk_name;
    }

    public int getSite_id() {
        return site_id;
    }

    public void setSite_id(int site_id) {
        this.site_id = site_id;
    }

    public String getSite_name() {
        return site_name;
    }

    public void setSite_name(String site_name) {
        this.site_name = site_name;
    }

    public String[] getBookTitleArr() {
        return bookTitleArr;
    }

    public String getSubject1() {
        return subject1;
    }

    public void setSubject1(String subject1) {
        this.subject1 = subject1;
    }

    public String getSubject2() {
        return subject2;
    }

    public void setSubject2(String subject2) {
        this.subject2 = subject2;
    }

    public void setBookTitleArr(String[] bookTitleArr) {
        this.bookTitleArr = bookTitleArr;
    }
    private Date creationDate;
    List metadataNonVerifiedList;
   /*private FormFile tifFile;*/

    public String getOperation() {
        return operation;
    }

    public void setOperation(String operation) {
        this.operation = operation;
    }
   /* private FormFile metadataXmlFile,pdfFile;*/

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

   /* public FormFile getPdfFile() {
        return pdfFile;
    }

    public void setPdfFile(FormFile pdfFile) {
        this.pdfFile = pdfFile;
    }
*/
    /*
     * Added By Niladri For Manage User Form
     */
    public int[] getBookIdArr() {
        return bookIdArr;
    }

    public void setBookIdArr(int[] bookIdArr) {
        this.bookIdArr = bookIdArr;
    }

    public int getBookid() {
        return bookid;
    }

    public void setBookid(int bookid) {
        this.bookid = bookid;
    }

    public String getAccessionNumber() {
        return accessionNumber;
    }

    public void setAccessionNumber(String accessionNumber) {
        this.accessionNumber = accessionNumber;
    }

    /*
     * Added By Niladri For PDF and JPEG Conversion Form
     */
    public String getContributor() {
        return contributor;
    }

    public void setContributor(String contributor) {
        this.contributor = contributor;
    }

    public String getContributor1() {
        return contributor1;
    }

    public void setContributor1(String contributor1) {
        this.contributor1 = contributor1;
    }

    public String getCopyrightDate() {
        return copyrightDate;
    }

    public void setCopyrightDate(String copyrightDate) {
        this.copyrightDate = copyrightDate;
    }

    public String getCoverage() {
        return coverage;
    }

    public void setCoverage(String coverage) {
        this.coverage = coverage;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDigitalPublicationDate() {
        return digitalPublicationDate;
    }

    public void setDigitalPublicationDate(String digitalPublicationDate) {
        this.digitalPublicationDate = digitalPublicationDate;
    }

    public String getDigitalPublisher() {
        return digitalPublisher;
    }

    public void setDigitalPublisher(String digitalPublisher) {
        this.digitalPublisher = digitalPublisher;
    }

    public String getDocumentType1() {
        return documentType1;
    }

    public void setDocumentType1(String documentType1) {
        this.documentType1 = documentType1;
    }

    public String getDocumentType2() {
        return documentType2;
    }

    public void setDocumentType2(String documentType2) {
        this.documentType2 = documentType2;
    }

    public String getFormat() {
        return format;
    }

    public void setFormat(String format) {
        this.format = format;
    }

    public String getIdentifier() {
        return identifier;
    }

    public void setIdentifier(String identifier) {
        this.identifier = identifier;
    }

    public String getPages() {
        return pages;
    }

    public void setPages(String pages) {
        this.pages = pages;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getRelation() {
        return relation;
    }

    public void setRelation(String relation) {
        this.relation = relation;
    }

    public String getRights() {
        return rights;
    }

    public void setRights(String rights) {
        this.rights = rights;
    }

    public String getScanningCentre() {
        return scanningCentre;
    }

    public void setScanningCentre(String scanningCentre) {
        this.scanningCentre = scanningCentre;
    }

    public String getScanningNumber() {
        return scanningNumber;
    }

    public void setScanningNumber(String scanningNumber) {
        this.scanningNumber = scanningNumber;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getTitle() {
        return title;
    }

    public String getTitle1() {
        return title1;
    }

    public void setTitle1(String title1) {
        this.title1 = title1;
    }

    public String getTitle2() {
        return title2;
    }

    public void setTitle2(String title2) {
        this.title2 = title2;
    }

    public String getTitle3() {
        return title3;
    }

    public void setTitle3(String title3) {
        this.title3 = title3;
    }

    public void setTitle(String title) {
        this.title = title;
    }

/*    public FormFile getTifFile() {
        return tifFile;
    }

    public void setTifFile(FormFile tifFile) {
        this.tifFile = tifFile;
    }*/

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator;
    }

    public String getCreator1() {
        return creator1;
    }

    public void setCreator1(String creator1) {
        this.creator1 = creator1;
    }

    public String getCreator2() {
        return creator2;
    }

    public void setCreator2(String creator2) {
        this.creator2 = creator2;
    }

    public String getCreator3() {
        return creator3;
    }

    public void setCreator3(String creator3) {
        this.creator3 = creator3;
    }

    public String getCreator4() {
        return creator4;
    }

    public void setCreator4(String creator4) {
        this.creator4 = creator4;
    }

    public String getCreator5() {
        return creator5;
    }

    public void setCreator5(String creator5) {
        this.creator5 = creator5;
    }

    public String getCreator6() {
        return creator6;
    }

    public void setCreator6(String creator6) {
        this.creator6 = creator6;
    }

    public String getCreator7() {
        return creator7;
    }

    public void setCreator7(String creator7) {
        this.creator7 = creator7;
    }

    public String getCreator8() {
        return creator8;
    }

    public void setCreator8(String creator8) {
        this.creator8 = creator8;
    }

    public String getCreator9() {
        return creator9;
    }

    public void setCreator9(String creator9) {
        this.creator9 = creator9;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public String getKeywords1() {
        return keywords1;
    }

    public void setKeywords1(String keywords1) {
        this.keywords1 = keywords1;
    }

    public String getKeywords2() {
        return keywords2;
    }

    public void setKeywords2(String keywords2) {
        this.keywords2 = keywords2;
    }

    public String getKeywords3() {
        return keywords3;
    }

    public void setKeywords3(String keywords3) {
        this.keywords3 = keywords3;
    }

    public String getKeywords4() {
        return keywords4;
    }

    public void setKeywords4(String keywords4) {
        this.keywords4 = keywords4;
    }

    public String getKeywords5() {
        return keywords5;
    }

    public void setKeywords5(String keywords5) {
        this.keywords5 = keywords5;
    }

    public String getMaterialType() {
        return materialType;
    }

    public void setMaterialType(String materialType) {
        this.materialType = materialType;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int[] getUserIdArr() {
        return userIdArr;
    }

    public void setUserIdArr(int[] userIdArr) {
        this.userIdArr = userIdArr;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public List getMetadataNonVerifiedList() {
        return metadataNonVerifiedList;
    }

    public void setMetadataNonVerifiedList(List metadataNonVerifiedList) {
        this.metadataNonVerifiedList = metadataNonVerifiedList;
    }

/*    public FormFile getMetadataXmlFile() {
        return metadataXmlFile;
    }

    public void setMetadataXmlFile(FormFile metadataXmlFile) {
        this.metadataXmlFile = metadataXmlFile;
    }

    public void reset(ActionMapping mapping, HttpServletRequest request) {
    }*/
}
