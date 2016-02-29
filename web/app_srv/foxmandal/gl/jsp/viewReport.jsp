<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*"%>
<%@ page import="java.io.*, java.util.*, javax.naming.InitialContext"%>
<%@ page import="net.sf.jasperreports.engine.*"%>
<%@ page import="net.sf.jasperreports.engine.export.*"%>
<%@ page import="net.sf.jasperreports.engine.JasperFillManager,net.sf.jasperreports.engine.design.JasperDesign,net.sf.jasperreports.view.JasperViewer,net.sf.jasperreports.engine.util.JRProperties, net.sf.jasperreports.engine.design.JasperDesign,net.sf.jasperreports.engine.xml.JRXmlLoader"%>
<%@page import="in.cdacnoida.icmr.gl.adaptor.ConnectionManager,in.cdacnoida.icmr.gl.model.glModel,in.cdacnoida.icmr.gl.adaptor.DBQueryManager"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="net.sf.jasperreports.engine.JasperExportManager"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    </head>
    <body>
    <%
    System.out.println("in view jsp");
    String filename="report1.pdf";
    String xmlPath="";
     String pdfPath="";
   DBQueryManager _dbq= new DBQueryManager();  
   ConnectionManager cm = new ConnectionManager();
   
   
   glModel _gmdl= new glModel();
   xmlPath=_gmdl.getFilePath("xml");
    
    xmlPath=xmlPath+"report1.jrxml";
   System.out.println(xmlPath);
   
        
   InputStream input=new FileInputStream(xmlPath);
  System.out.println("testing"); 
   
  
  pdfPath=_gmdl.getFilePath("xml")+File.separator+"report1.pdf";
  
  JasperDesign design = JRXmlLoader.load(input);
   System.out.println("2");
  
  JasperReport report = JasperCompileManager.compileReport(design);
   System.out.println("3");
  

  
   
    response.setContentType("application/pdf");
response.setHeader("Content-Disposition", "attachment; filename=\"report1.pdf\"");
  Map parameters = new HashMap();
 parameters.put("ReportTitle", "PDF JasperReport");
 ServletOutputStream srvoutput =response.getOutputStream();
   
    byte[] bytes=null; 
    JasperPrint print = JasperFillManager.fillReport(report, 
     parameters,cm.getConnection());
      System.out.println("4");
    OutputStream output=new FileOutputStream(new File(pdfPath));
    JasperExportManager.exportReportToPdfStream(print, output); 
    net.sf.jasperreports.engine.export.JRPdfExporter pdfExporter=new net.sf.jasperreports.engine.export.JRPdfExporter();
   
Map<JRExporterParameter, Object> parameterExport = new HashMap<JRExporterParameter, Object>();
parameterExport.put(JRExporterParameter.JASPER_PRINT, print);
parameterExport.put(JRPdfExporterParameter.OUTPUT_STREAM, srvoutput);
pdfExporter.setParameters(parameterExport);
pdfExporter.exportReport();

srvoutput.flush();

 
 
 
 
%>
    
    
    </body>
</html>