/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package metadata;

import bean.metaDataBean;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionSupport;
import dao.Ibatis;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.apache.struts2.util.ServletContextAware;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

/**
 *
 * @author CDAC-49
 */
public class ImportBatchMetadataAction extends ActionSupport implements ServletContextAware {

    ServletContext context;
    private String selectedFileName;
    private List<String> fileList = new ArrayList();
    metaDataBean metadataFile = new metaDataBean();

    public String getSelectedFileName() {
        return selectedFileName;
    }

    public void setSelectedFileName(String selectedFileName) {
        this.selectedFileName = selectedFileName;
    }

    public List<String> getFileList() {
        return fileList;
    }

    public void setFileList(List<String> fileList) {
        this.fileList = fileList;
    }

    public ImportBatchMetadataAction() {
    }

    public String importBatchMetadata() {
        System.out.println("In Action");
        String filePath = context.getInitParameter("image_folder") + selectedFileName + "/";
        System.out.println(filePath);
        File[] listFiles = new File(filePath).listFiles();
        int totalmetadataFiles = 0, metadataFileCount = 0;
        String failedstring = "";
        String xmlfile = null;
        System.out.println(listFiles.length);
        for (File file : listFiles) {
            if (file.isDirectory()) {
                System.out.println(file.getName());
                ExtensionFilter filter = new ExtensionFilter("xml");
                File[] listFiles2 = new File(filePath + file.getName() + "/").listFiles(filter);
                System.out.println("FP:" + filePath + file.getName());
                for (File file2 : listFiles2) {
                    xmlfile = filePath + file.getName() + "/" + file2.getName();

                }
            } else {
                xmlfile = filePath + file.getName();
            }
            metadataFile.setRootfolder(file.getName());
            System.out.println(xmlfile);
            File fis = new File(xmlfile);

            try {
                totalmetadataFiles++;
                DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
                DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
                Document doc = (Document) dBuilder.parse(fis);
                doc.getDocumentElement().normalize();
                if (doc.getDocumentElement().getNodeName().equals("dublincore")) {
                    NodeList nList = doc.getElementsByTagName("dublincore");
                    for (int temp = 0; temp < nList.getLength(); temp++) {
                        Node nNode = nList.item(temp);
                        if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                            Element eElement = (Element) nNode;
                            metadataFile.setMaterialType("Book");

                            /*
                             * if (getTagValue("date", eElement) != null) {
                             * metadataFile.setDate(getTagValue("date",
                             * eElement));
                            }
                             */
                            if (getTagValue("language", eElement) != null) {
                                metadataFile.setLanguage(getTagValue("language", eElement));
                            }
                            if (getTagValue("title", eElement) != null) {
                                metadataFile.setTitle(getTagValue("title", eElement));
                            }
                            if (getTagValue("title1", eElement) != null) {
                                metadataFile.setTitle1(getTagValue("title1", eElement));
                            }
                            if (getTagValue("title2", eElement) != null) {
                                metadataFile.setTitle2(getTagValue("title2", eElement));
                            }
                            if (getTagValue("title3", eElement) != null) {
                                metadataFile.setTitle3(getTagValue("title3", eElement));
                            }
                            if (getTagValue("creator", eElement) != null) {
                                metadataFile.setCreator(getTagValue("creator", eElement));
                            }
                            if (getTagValue("creator1", eElement) != null) {
                                metadataFile.setCreator1(getTagValue("creator1", eElement));
                            }
                            if (getTagValue("creator2", eElement) != null) {
                                metadataFile.setCreator2(getTagValue("creator2", eElement));
                            }
                            if (getTagValue("creator3", eElement) != null) {
                                metadataFile.setCreator3(getTagValue("creator3", eElement));
                            }
                            if (getTagValue("creator4", eElement) != null) {
                                metadataFile.setCreator4(getTagValue("creator4", eElement));
                            }
                            if (getTagValue("creator5", eElement) != null) {
                                metadataFile.setCreator5(getTagValue("creator5", eElement));
                            }
                            if (getTagValue("creator6", eElement) != null) {
                                metadataFile.setCreator6(getTagValue("creator6", eElement));
                            }
                            if (getTagValue("creator7", eElement) != null) {
                                metadataFile.setCreator7(getTagValue("creator7", eElement));
                            }
                            if (getTagValue("creator8", eElement) != null) {
                                metadataFile.setCreator8(getTagValue("creator8", eElement));
                            }
                            if (getTagValue("creator9", eElement) != null) {
                                metadataFile.setCreator9(getTagValue("creator9", eElement));
                            }
                            if (getTagValue("keywords", eElement) != null) {
                                metadataFile.setKeywords(getTagValue("keywords", eElement));
                            }
                            if (getTagValue("keywords1", eElement) != null) {
                                metadataFile.setKeywords1(getTagValue("keywords1", eElement));
                            }
                            if (getTagValue("keywords2", eElement) != null) {
                                metadataFile.setKeywords2(getTagValue("keywords2", eElement));
                            }
                            if (getTagValue("keywords3", eElement) != null) {
                                metadataFile.setKeywords3(getTagValue("keywords3", eElement));
                            }
                            if (getTagValue("keywords4", eElement) != null) {
                                metadataFile.setKeywords4(getTagValue("keywords4", eElement));
                            }
                            if (getTagValue("keywords5", eElement) != null) {
                                metadataFile.setKeywords5(getTagValue("keywords5", eElement));
                            }
                            if (getTagValue("description", eElement) != null) {
                                metadataFile.setDescription(getTagValue("description", eElement));
                            }
                            if (getTagValue("subject", eElement) != null) {
                                metadataFile.setSubject(getTagValue("subject", eElement));
                            }
                            if (getTagValue("subject1", eElement) != null) {
                                metadataFile.setSubject1(getTagValue("subject1", eElement));
                            }
                            if (getTagValue("subject2", eElement) != null) {
                                metadataFile.setSubject2(getTagValue("subject2", eElement));
                            }
                            if (getTagValue("publisher", eElement) != null) {
                                metadataFile.setPublisher(getTagValue("publisher", eElement));
                            }
                            if (getTagValue("contributor", eElement) != null) {
                                metadataFile.setContributor(getTagValue("contributor", eElement));
                            }
                            if (getTagValue("contributor1", eElement) != null) {
                                metadataFile.setContributor1(getTagValue("contributor1", eElement));
                            }
                            if (getTagValue("format", eElement) != null) {
                                metadataFile.setFormat(getTagValue("format", eElement));
                            }
                            if (getTagValue("identifier", eElement) != null) {
                                metadataFile.setIdentifier(getTagValue("identifier", eElement));
                            }
                            if (getTagValue("source", eElement) != null) {
                                metadataFile.setSource(getTagValue("source", eElement));
                            }
                            if (getTagValue("relation", eElement) != null) {
                                metadataFile.setRelation(getTagValue("relation", eElement));
                            }
                            if (getTagValue("coverage", eElement) != null) {
                                metadataFile.setCoverage(getTagValue("coverage", eElement));
                            }
                            if (getTagValue("rights", eElement) != null) {
                                metadataFile.setRights(getTagValue("rights", eElement));
                            }
                            if (getTagValue("copyrightdate", eElement) != null) {
                                metadataFile.setCopyrightDate(getTagValue("date", eElement));
                            }
                            if (getTagValue("scanningcentre", eElement) != null) {
                                metadataFile.setScanningCentre(getTagValue("scanningcentre", eElement));
                            }
                            if (getTagValue("scanningnumber", eElement) != null) {
                                metadataFile.setScanningNumber(getTagValue("scanningnumber", eElement));
                            }
                            if (getTagValue("digitalrepublisher", eElement) != null) {
                                metadataFile.setDigitalPublisher(getTagValue("digitalrepublisher", eElement));
                            }
                            if (getTagValue("digitalpublicationdate", eElement) != null) {
                                metadataFile.setDigitalPublicationDate(getTagValue("digitalpublicationdate", eElement));
                            }
                            if (getTagValue("totalpages", eElement) != null) {
                                metadataFile.setPages(getTagValue("totalpages", eElement));
                            }
                            if (getTagValue("documenttype", eElement) != null) {
                                metadataFile.setDocumentType1(getTagValue("documenttype", eElement));
                            }
                            if (getTagValue1("documenttype", eElement) != null) {
                                metadataFile.setDocumentType2(getTagValue1("documenttype", eElement));
                            }
                            if (getTagValue("bookheadno", eElement) != null) {
                                metadataFile.setBookheadno(getTagValue("bookheadno", eElement));
                            }
                            if (getTagValue("filename", eElement) != null) {
                                metadataFile.setFilename(getTagValue("filename", eElement));
                            }

                            metadataFile.setDisk_name(selectedFileName);

                            String MESSAGE;
                            try {

                                String copyrightDate = metadataFile.getCopyrightDate();
                                if (copyrightDate.equalsIgnoreCase("")) {
                                    metadataFile.setCopyrightDate("0000-00-00");
                                }
////                                else if (copyrightDate.equalsIgnoreCase("//")) {
////                                    metadataFile.setCopyrightDate("0000-00-00");
////                                }

                                Ibatis.getSqlMap().insert("metadata.newMetadata", metadataFile);
                                System.out.println("Metadata Inserted!!");
                                metadataFileCount++;
                            } catch (Exception e) {
                                failedstring += " \"" +file.getName() + "\"";
                                e.printStackTrace();
                                MESSAGE = "META-DATA INSERT FAILED !!";
                                System.out.println("Unable to insert data into the item_metadata" + e.getMessage());
                            }
                            MESSAGE = "Metadata Inserted into the database !!";
                            //metadataFileCount++;
                        }
                    }
                }
            } catch (Exception e) {
                //failedstring += file.getName() + "<br/>";
                e.printStackTrace();
            }

        }

        String MESSAGE = "Total " + totalmetadataFiles + " Metadata processed. " + metadataFileCount + " Metadata inserted successfully.\n";
        if ((totalmetadataFiles - metadataFileCount) > 0) {
            MESSAGE += "Following metadata failed to insert: \n" + failedstring;
        }
        refreshPage();
        addActionMessage(MESSAGE);
        return SUCCESS;
    }

    private static String getTagValue(String sTag, Element eElement) {
        try {
            NodeList nlList = eElement.getElementsByTagName(sTag).item(0).getChildNodes();
            Node nValue = (Node) nlList.item(0);
            if (nValue == null) {
                return "";
            }
            return nValue.getNodeValue();
        } catch (Exception e) {
            return "";
        }

    }

    private static String getTagValue1(String sTag, Element eElement) {
        try {
            NodeList nlList = eElement.getElementsByTagName(sTag).item(1).getChildNodes();
            Node nValue = (Node) nlList.item(0);
            if (nValue == null) {
                return "";
            }
            return nValue.getNodeValue();
        } catch (Exception e) {
            return "";
        }
    }

    public void refreshPage() {
        String filePath = context.getInitParameter("image_folder");
        //String filePath="G:\\";
        File[] listFiles = new File(filePath).listFiles();
        for (File file : listFiles) {
            if (file.isDirectory()) {
                fileList.add(file.getName());
                System.out.println(file.getName());
            }
        }
    }

    @Override
    public void setServletContext(ServletContext context) {
        this.context = context;
    }
}
