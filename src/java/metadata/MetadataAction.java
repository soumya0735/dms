/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package metadata;

import bean.ListValue;
import bean.metaDataBean;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import dao.Ibatis;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author Manas Chakraborty
 */
public class MetadataAction extends ActionSupport implements SessionAware {

    private int bookid;
    private int bookIdArr[];
    private String bookTitleArr[];
    private String title, title1, title2, title3;
    private String materialType, language, date1, bookheadno;
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
    private String pages2, onlytitle, microfilm_no, pdf_location;
    private int userIdArr[];
    private int userId;
    private String userName, operation;
    private String userPassword;
    private String name;
    private String role;
    private String email;
    private String phone;
    private String createdBy;
    private String disk_name, site_name, site_location, site_alias, subject1, subject2, xmlfile, rootfolder;
    private int site_id;
    private String filename;
    private Date creationDate;
    List metadataNonVerifiedList;
    Map<String, Object> session;
    List<metaDataBean> sites = new ArrayList<metaDataBean>();
    List<metaDataBean> metadataDetail = new ArrayList<metaDataBean>();
    metaDataBean metadata = new metaDataBean();
    private List<ListValue> languageList = new ArrayList<ListValue>();
    private List<ListValue> subjectList = new ArrayList<ListValue>();
    private List<ListValue> subjectList1 = new ArrayList<ListValue>();
    private List<ListValue> documentType1List = new ArrayList<ListValue>();
    private List<ListValue> documentType2List = new ArrayList<ListValue>();
    private List<ListValue> rightsList = new ArrayList<ListValue>();
    private List<ListValue> siteList = new ArrayList<ListValue>();

    public MetadataAction() {
    }

    public String execute() throws Exception {
        return SUCCESS;
    }

    public String getSitesList() throws Exception {
        sites = Ibatis.getSqlMap().queryForList("metadata.getsites");
        setFormComponents();
        session.put("sites", sites);
        session.put("languageList", languageList);
        session.put("documentType1List", documentType1List);
        session.put("documentType2List", documentType2List);
        session.put("subjectList", subjectList);
        session.put("subjectList1", subjectList1);
        session.put("rightsList", rightsList);
        return SUCCESS;
    }

    public String insertMetadata() throws Exception {
        System.out.println("title " + getTitle() + " creator " + getCreator());
        setFields();
        try {
            Ibatis.getSqlMap().insert("metadata.newMetadata", metadata);
            addActionMessage("Metadata Inserted Successfully");
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            addActionError("Unable to insert Metadata");
            return ERROR;
        }
    }

    public String updateMetadata() throws Exception {
        setFields();
        getSitesList();
        try {
            Ibatis.getSqlMap().update("metadata.metadataUpdate", metadata);
            addActionMessage("Data Updated Successfully");
            return SUCCESS;
        } catch (Exception e) {
            addActionError("Error! Update Unsuccessful");
            e.printStackTrace();
            return "error";
        }

    }

    public String getMetadataById() throws Exception {
        metadataDetail = Ibatis.getSqlMap().queryForList("metadata.getMetadataForUpdate", String.valueOf(bookid));
        setBookid(metadataDetail.get(0).getBookid());
        setBookheadno(metadataDetail.get(0).getBookheadno());
        setContributor(metadataDetail.get(0).getContributor());
        setContributor1(metadataDetail.get(0).getContributor1());
        if (metadataDetail.get(0).getCopyrightDate() == null) {
            setCopyrightDate("0000-00-00");
        } else {
            setCopyrightDate(metadataDetail.get(0).getCopyrightDate());
        }
        setCoverage(metadataDetail.get(0).getCoverage());
        setCreatedBy(metadataDetail.get(0).getCreatedBy());
        setCreator(metadataDetail.get(0).getCreator());
        setCreator1(metadataDetail.get(0).getCreator1());
        setCreator2(metadataDetail.get(0).getCreator2());
        setCreator3(metadataDetail.get(0).getCreator3());
        setCreator4(metadataDetail.get(0).getCreator4());
        setCreator5(metadataDetail.get(0).getCreator5());
        setCreator6(metadataDetail.get(0).getCreator6());
        setCreator7(metadataDetail.get(0).getCreator7());
        setCreator8(metadataDetail.get(0).getCreator8());
        setCreator9(metadataDetail.get(0).getCreator9());
        /*
         * if (metadataDetail.get(0).getDate() == null) {
         * setDate1("0000-00-00"); } else {
         * setDate1(metadataDetail.get(0).getDate()); }
         */

        setDescription(metadataDetail.get(0).getDescription());
        if (metadataDetail.get(0).getDigitalPublicationDate() == "0000-00-00") {
            setDigitalPublicationDate(null);
        } else {
            setDigitalPublicationDate(metadataDetail.get(0).getDigitalPublicationDate());
        }


        setDigitalPublisher(metadataDetail.get(0).getDigitalPublisher());

        setDisk_name(metadataDetail.get(0).getDisk_name());
        setDocumentType1(metadataDetail.get(0).getDocumentType1());
        setDocumentType2(metadataDetail.get(0).getDocumentType2());
        setEmail(metadataDetail.get(0).getEmail());
        setFormat(metadataDetail.get(0).getFormat());
        setIdentifier(metadataDetail.get(0).getIdentifier());
        setKeywords(metadataDetail.get(0).getKeywords());
        setKeywords1(metadataDetail.get(0).getKeywords1());
        setKeywords2(metadataDetail.get(0).getKeywords2());
        setKeywords3(metadataDetail.get(0).getKeywords3());
        setKeywords4(metadataDetail.get(0).getKeywords4());
        setKeywords5(metadataDetail.get(0).getKeywords5());
        setLanguage(metadataDetail.get(0).getLanguage());
        setMaterialType(metadataDetail.get(0).getMaterialType());
        setPages(metadataDetail.get(0).getPages());
        setPages2(metadataDetail.get(0).getPages2());
        setPublisher(metadataDetail.get(0).getPublisher());
        setRelation(metadataDetail.get(0).getRelation());
        setRights(metadataDetail.get(0).getRights());
        setScanningCentre(metadataDetail.get(0).getScanningCentre());
        setScanningNumber(metadataDetail.get(0).getScanningNumber());
        setSubject(metadataDetail.get(0).getSubject());
        setSubject1(metadataDetail.get(0).getSubject1());
        setSubject2(metadataDetail.get(0).getSubject2());
        setSite_id(metadataDetail.get(0).getSite_id());
        setTitle(metadataDetail.get(0).getTitle());
        setTitle1(metadataDetail.get(0).getTitle1());
        setTitle2(metadataDetail.get(0).getTitle2());
        setTitle3(metadataDetail.get(0).getTitle3());
        setSource(metadataDetail.get(0).getSource());
        setFilename(metadataDetail.get(0).getFilename());
        sites = Ibatis.getSqlMap().queryForList("metadata.getsites");
        setFormComponents();
        return SUCCESS;
    }

    public List<metaDataBean> getSites() {
        return sites;
    }

    public void setFields() {
        metadata.setBookheadno(bookheadno);
        metadata.setBookIdArr(bookIdArr);
        metadata.setBookTitleArr(bookTitleArr);
        metadata.setBookid(bookid);
        metadata.setContributor(contributor);
        metadata.setContributor1(contributor1);
        metadata.setCreationDate(creationDate);
        metadata.setCreator(creator);
        metadata.setCreator1(creator1);
        metadata.setCreator2(creator2);
        metadata.setCreator3(creator3);
        metadata.setCreator4(creator4);
        metadata.setCreator5(creator5);
        metadata.setCreator6(creator6);
        metadata.setCreator7(creator7);
        metadata.setCreator8(creator8);
        metadata.setCreator9(creator9);
        metadata.setCoverage(coverage);
        if (getCopyrightDate() == null) {
            metadata.setCopyrightDate("0000-00-00");
        } else {
            metadata.setCopyrightDate(copyrightDate);
        }
        /*
         * if (getDate1() == null) { metadata.setDate("0000-00-00"); } else {
         * metadata.setDate(date1); }
         */

        metadata.setDescription(description);
        if (getDigitalPublicationDate() == null || getDigitalPublicationDate().isEmpty()) {
            metadata.setDigitalPublicationDate("0000-00-00");
        } else {
            metadata.setDigitalPublicationDate(digitalPublicationDate);
        }
        metadata.setDigitalPublisher(digitalPublisher);
        metadata.setDisk_name(disk_name);
        metadata.setDocumentType1(documentType1);
        metadata.setDocumentType2(documentType2);
        metadata.setEmail(email);
        metadata.setFormat(format);
        metadata.setIdentifier(identifier);
        metadata.setKeywords(keywords);
        metadata.setKeywords1(keywords1);
        metadata.setKeywords2(keywords2);
        metadata.setKeywords3(keywords3);
        metadata.setKeywords4(keywords4);
        metadata.setKeywords5(keywords5);
        metadata.setLanguage(language);
        metadata.setMaterialType(materialType);
        metadata.setMetadataNonVerifiedList(metadataNonVerifiedList);
        metadata.setMicrofilm_no(microfilm_no);
        metadata.setName(name);
        metadata.setOnlytitle(onlytitle);
        metadata.setOperation(operation);
        metadata.setPages(pages);
        metadata.setPages2(pages2);
        metadata.setPdf_location(pdf_location);
        metadata.setPublisher(publisher);
        metadata.setRelation(relation);
        metadata.setRights(rights);
        metadata.setRole(role);
        metadata.setRootfolder(rootfolder);
        metadata.setScanningCentre(scanningCentre);
        metadata.setScanningNumber(scanningNumber);
        metadata.setSite_alias(site_alias);
        metadata.setSite_id(site_id);
        metadata.setSite_location(site_location);
        metadata.setSite_name(site_name);
        metadata.setSource(source);
        metadata.setSubject(subject);
        metadata.setSubject1(subject1);
        metadata.setSubject2(subject2);
        metadata.setTitle(title);
        metadata.setTitle1(title1);
        metadata.setTitle2(title2);
        metadata.setTitle3(title3);
        metadata.setFilename(filename);
    }

    public void setFormComponents() {

        languageList.add(new ListValue("Asammese", "Asammese"));
        languageList.add(new ListValue("Bengali", "Bengali"));
        languageList.add(new ListValue("English", "English"));
        languageList.add(new ListValue("Gujarati", "Gujarati"));
        languageList.add(new ListValue("Hindi", "Hindi"));
        languageList.add(new ListValue("Kannada", "Kannada"));
        languageList.add(new ListValue("Malayalam", "Malayalam"));
        languageList.add(new ListValue("Marathi", "Marathi"));
        languageList.add(new ListValue("Oriya", "Oriya"));
        languageList.add(new ListValue("Persian", "Persian"));
        languageList.add(new ListValue("Panjabi", "Panjabi"));
        languageList.add(new ListValue("Sanskrit", "Sanskrit"));
        languageList.add(new ListValue("Tamil", "Tamil"));
        languageList.add(new ListValue("Telegu", "Telegu"));
        languageList.add(new ListValue("Urdu", "Urdu"));
        languageList.add(new ListValue("Others", "Others"));

        /**
         * ******** Subject **********************
         */
        subjectList.add(new ListValue("Generalities", "Generalities"));
        subjectList.add(new ListValue("History And Geography", "History And Geography"));
        subjectList.add(new ListValue("Literature", "Literature"));
        subjectList.add(new ListValue("Natural Science", "Natural Science"));
        subjectList.add(new ListValue("Religion", "Religion"));
        subjectList.add(new ListValue("Social Sciences", "Social Sciences"));
        subjectList.add(new ListValue("Technology", "Technology"));
        subjectList.add(new ListValue("The Arts", "The Arts"));
        /**
         * ******** Subject **********************
         */
        /**
         * ******** Subject1 **********************
         */
        subjectList1.add(new ListValue("Area Planning And Landscape Architecture", "Area Planning And Landscape Architecture"));
        subjectList1.add(new ListValue("Biography And Genealogy", "Biography And Genealogy"));
        subjectList1.add(new ListValue("Biology", "Biology"));
        subjectList1.add(new ListValue("Customs, Etiquette And Folklore", "Customs, Etiquette And Folklore"));
        subjectList1.add(new ListValue("Education", "Education"));
        subjectList1.add(new ListValue("English And Old English Literatures", "English And Old English Literatures"));
        subjectList1.add(new ListValue("Geography And Travel", "Geography And Travel"));
        subjectList1.add(new ListValue("History", "History"));
        subjectList1.add(new ListValue("History Of India", "History Of India"));
        subjectList1.add(new ListValue("Medicine And Health", "Medicine And Health"));
        subjectList1.add(new ListValue("Other Religions", "Other Religions"));
        subjectList1.add(new ListValue("Political Science", "Political Science"));
        subjectList1.add(new ListValue("Public Administration", "Public Administration"));
        subjectList1.add(new ListValue("Public Administration And Military Science", "Public Administration And Military Science"));
        subjectList1.add(new ListValue("Sericulture", "Sericulture"));
        subjectList1.add(new ListValue("Social Problems And Social Services", "Social Problems And Social Services"));
        subjectList1.add(new ListValue("Social Sciences, Sociology And Anthropology", "Social Sciences, Sociology And Anthropology"));

        /**
         * ******** Subject1 **********************
         */
        documentType1List.add(new ListValue("Print - Paper", "Print - Paper"));
        documentType1List.add(new ListValue("Print - Palm leaf", "Print - Palm leaf"));
        documentType1List.add(new ListValue("Print - Fabric", "Print - Fabric"));
        documentType1List.add(new ListValue("Print - Glass", "Print - Glass"));
        documentType1List.add(new ListValue("Print - Wood", "Print - Wood"));

        documentType2List.add(new ListValue("Abstract", "Abstract"));
        documentType2List.add(new ListValue("Annals", "Annals"));
        documentType2List.add(new ListValue("Announcement", "Announcement"));
        documentType2List.add(new ListValue("Article", "Article"));
        documentType2List.add(new ListValue("Bibliography", "Bibliography"));
        documentType2List.add(new ListValue("Book", "Book"));
        documentType2List.add(new ListValue("Cartographic data -Atlas", "Cartographic data -Atlas"));
        documentType2List.add(new ListValue("Cartographic data -Globe", "Cartographic data -Globe"));
        documentType2List.add(new ListValue("Cartographic data -Map", "Cartographic data -Map"));
        documentType2List.add(new ListValue("Catalog", "Catalog"));
        documentType2List.add(new ListValue("Chat", "Chat"));
        documentType2List.add(new ListValue("Dictionary", "Dictionary"));
        documentType2List.add(new ListValue("Directory", "Directory"));
        documentType2List.add(new ListValue("Editorial", "Editorial"));
        documentType2List.add(new ListValue("Erratum", "Erratum"));
        documentType2List.add(new ListValue("Index", "Index"));
        documentType2List.add(new ListValue("Journal", "Journal"));
        documentType2List.add(new ListValue("Magazine", "Magazine"));
        documentType2List.add(new ListValue("Manuscript", "Magazine"));
        documentType2List.add(new ListValue("Minutes", "Minutes"));
        documentType2List.add(new ListValue("Narration", "Narration"));
        documentType2List.add(new ListValue("Newsletter", "Newsletter"));
        documentType2List.add(new ListValue("Newspaper", "Newspaper"));
        documentType2List.add(new ListValue("Numeric data", "Numeric data"));
        documentType2List.add(new ListValue("Proceedings", "Proceedings"));
        documentType2List.add(new ListValue("Review", "Review"));
        documentType2List.add(new ListValue("Statistical data", "Statistical data"));
        documentType2List.add(new ListValue("Still image or graphics", "Still image or graphics"));
        documentType2List.add(new ListValue("Technical and Annual Reports", "Technical and Annual Reports"));
        documentType2List.add(new ListValue("Thesis", "Thesis"));

        rightsList.add(new ListValue("Not Applicable", "Not Applicable"));
        rightsList.add(new ListValue("Copyright Permitted", "Copyright Permitted"));
        rightsList.add(new ListValue("In Public Domain", "In Public Domain"));
        rightsList.add(new ListValue("Not Available", "Not Available"));

        //siteList.add(new ListValue("Site1", "1"));
    }

    public List<ListValue> getLanguageList() {
        return languageList;
    }

    public void setLanguageList(List<ListValue> languageList) {
        this.languageList = languageList;
    }

    public List<ListValue> getSubjectList() {
        return subjectList;
    }

    public void setSubjectList(List<ListValue> subjectList) {
        this.subjectList = subjectList;
    }

    public List<ListValue> getSubjectList1() {
        return subjectList1;
    }

    public void setSubjectList1(List<ListValue> subjectList1) {
        this.subjectList1 = subjectList1;
    }

    public List<ListValue> getDocumentType1List() {
        return documentType1List;
    }

    public void setDocumentType1List(List<ListValue> documentType1List) {
        this.documentType1List = documentType1List;
    }

    public List<ListValue> getDocumentType2List() {
        return documentType2List;
    }

    public void setDocumentType2List(List<ListValue> documentType2List) {
        this.documentType2List = documentType2List;
    }

    public List<ListValue> getRightsList() {
        return rightsList;
    }

    public void setRightsList(List<ListValue> rightsList) {
        this.rightsList = rightsList;
    }

    public int getBookid() {
        return bookid;
    }

    public void setBookid(int bookid) {
        this.bookid = bookid;
    }

    public int[] getBookIdArr() {
        return bookIdArr;
    }

    public void setBookIdArr(int[] bookIdArr) {
        this.bookIdArr = bookIdArr;
    }

    public String[] getBookTitleArr() {
        return bookTitleArr;
    }

    public void setBookTitleArr(String[] bookTitleArr) {
        this.bookTitleArr = bookTitleArr;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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

    public String getMaterialType() {
        return materialType;
    }

    public void setMaterialType(String materialType) {
        this.materialType = materialType;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getDate1() {
        return date1;
    }

    public void setDate1(String date1) {
        this.date1 = date1;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

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

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getRelation() {
        return relation;
    }

    public void setRelation(String relation) {
        this.relation = relation;
    }

    public String getCoverage() {
        return coverage;
    }

    public void setCoverage(String coverage) {
        this.coverage = coverage;
    }

    public String getRights() {
        return rights;
    }

    public void setRights(String rights) {
        this.rights = rights;
    }

    public String getCopyrightDate() {
        return copyrightDate;
    }

    public void setCopyrightDate(String copyrightDate) {
        this.copyrightDate = copyrightDate;
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

    public String getDigitalPublisher() {
        return digitalPublisher;
    }

    public void setDigitalPublisher(String digitalPublisher) {
        this.digitalPublisher = digitalPublisher;
    }

    public String getDigitalPublicationDate() {
        return digitalPublicationDate;
    }

    public void setDigitalPublicationDate(String digitalPublicationDate) {
        this.digitalPublicationDate = digitalPublicationDate;
    }

    public String getPages() {
        return pages;
    }

    public void setPages(String pages) {
        this.pages = pages;
    }

    public String getPages2() {
        return pages2;
    }

    public void setPages2(String pages2) {
        this.pages2 = pages2;
    }

    public String getOnlytitle() {
        return onlytitle;
    }

    public void setOnlytitle(String onlytitle) {
        this.onlytitle = onlytitle;
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

    public int[] getUserIdArr() {
        return userIdArr;
    }

    public void setUserIdArr(int[] userIdArr) {
        this.userIdArr = userIdArr;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getOperation() {
        return operation;
    }

    public void setOperation(String operation) {
        this.operation = operation;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public String getDisk_name() {
        return disk_name;
    }

    public void setDisk_name(String disk_name) {
        this.disk_name = disk_name;
    }

    public String getSite_name() {
        return site_name;
    }

    public void setSite_name(String site_name) {
        this.site_name = site_name;
    }

    public String getSite_location() {
        return site_location;
    }

    public void setSite_location(String site_location) {
        this.site_location = site_location;
    }

    public String getSite_alias() {
        return site_alias;
    }

    public void setSite_alias(String site_alias) {
        this.site_alias = site_alias;
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

    public int getSite_id() {
        return site_id;
    }

    public void setSite_id(int site_id) {
        this.site_id = site_id;
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

    public void setSites(List<metaDataBean> sites) {
        this.sites = sites;
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

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session; //To change body of generated methods, choose Tools | Templates.
    }
}