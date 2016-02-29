<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.io.*, java.util.*,java.io.File"%>
<%@ page import ="in.cdacnoida.icmr.gl.adaptor.resourceBundle,in.cdacnoida.icmr.gl.adaptor.EncryptPDF"%>
<%@ page import="java.lang.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    </head>
    <body>
    
    <%
      String strFilePath=resourceBundle.getValueFromKey("FILEPATH");
    EncryptPDF _encPDF=new EncryptPDF();
    
         String   strCertificatePath=resourceBundle.getValueFromKey("CertificatesPath");
        String strPublicKeyPath=strCertificatePath+"nitin.crt";
        String strPrivateKeyPath=strCertificatePath+"nitin.pfx";
        String strFilePathToDecrypt="";
        String strWheretoDecrypt="";
      
        strFilePathToDecrypt=strFilePath+"fullproposal"+File.separator+"folder-2"+File.separator+"prabha"+File.separator;
        strWheretoDecrypt=strFilePath+"decrypt"+File.separator+"new"+File.separator+"prabha"+File.separator;
   
    System.out.println(" strFilePathToDecrypt="+ strFilePathToDecrypt);
      System.out.println(" strWheretoDecrypt="+ strWheretoDecrypt);
    File folder = new File(strFilePathToDecrypt);
    System.out.println("1");
    File[] listOfFiles = folder.listFiles();
System.out.println("2");
    for (int i = 0; i < listOfFiles.length; i++) {
      if (listOfFiles[i].isFile()) {
      System.out.println("File1");
      strFilePathToDecrypt=strFilePathToDecrypt+listOfFiles[i].getName();
       strWheretoDecrypt= strWheretoDecrypt+listOfFiles[i].getName();
          String status="";//_encPDF.decryptPdfFile("nitin","l",strFilePathToDecrypt,strWheretoDecrypt);
           strFilePathToDecrypt=strFilePath+"fullproposal"+File.separator+"folder-2"+File.separator+"prabha"+File.separator;
           strWheretoDecrypt=strFilePath+"decrypt"+File.separator+"new"+File.separator+"prabha"+File.separator;
        System.out.println("File " + listOfFiles[i].getName());
      } else {
        System.out.println("there is error");
      }
    }  
    
    %>
    
    
    
    </body>
</html>