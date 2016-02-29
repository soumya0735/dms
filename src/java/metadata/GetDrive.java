/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package metadata;

import java.io.File;
import javax.swing.filechooser.FileSystemView;

/**
 *
 * @author CDAC-49
 */
public class GetDrive {
    public String getCDDrive(){
        File[] roots=File.listRoots();
        FileSystemView fsv=FileSystemView.getFileSystemView();
        for(int i=0;i<roots.length;i++){
            if(fsv.getSystemTypeDescription(roots[i]).equalsIgnoreCase("CD Drive")){
                return roots[i].toString();
            }     
        }
        return "No Drive";
    }
    
}
