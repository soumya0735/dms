package bean;





/**
 * @author cdac
 *
 */
public class SubjectMasterForm  {

    private int id;
    private String subject, materialType, language, publisher;

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }  
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getMaterialType() {
        return materialType;
    }

    public void setMaterialType(String materialType) {
        this.materialType = materialType;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    /**
     * Method validate
     *
     * @param mapping
     * @param request
     * @return ActionErrors
     */
    

    /**
     * Method reset
     *
     * @param mapping
     * @param request
     */
   
}