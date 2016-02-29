/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package metadata;

/**
 *
 * @author Administrator
 */
import java.io.*;

public class ExtensionFilter implements FilenameFilter {
  private String extension;
  public ExtensionFilter( String extension ) {
    this.extension = extension;             
  }
  
  public boolean accept(File dir, String name) {
    return (name.endsWith(extension));
  }
}
