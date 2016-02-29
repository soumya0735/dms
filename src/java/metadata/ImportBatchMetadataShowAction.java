/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package metadata;

import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import javax.swing.filechooser.FileSystemView;
import org.apache.struts2.util.ServletContextAware;

/**
 *
 * @author Manas Chakraborty
 */
public class ImportBatchMetadataShowAction extends ActionSupport implements ServletContextAware {

    private List<String> fileList = new ArrayList();
    private ServletContext servletContext;

    public ImportBatchMetadataShowAction() {
    }

    public List<String> getFileList() {
        return fileList;
    }

    public void setFileList(List<String> fileList) {
        this.fileList = fileList;
    }

    public String execute() {
        //String filePath="G:\\";
        try {
            String filePath = servletContext.getInitParameter("image_folder");
            System.out.println("test " + filePath);
            File[] listFiles = new File(filePath).listFiles();
            System.out.println("length " + listFiles.length);
            for (File file : listFiles) {
                if (file.isDirectory()) {
                    fileList.add(file.getName());
                    System.out.println(file.getName());
                }
            }
            return SUCCESS;
        } catch (Exception e) {
            addActionError("Specified Folder not Found");
            e.printStackTrace();
            return "error";
        }


    }

    @Override
    public void setServletContext(ServletContext context) {
        this.servletContext = context;
    }
}
