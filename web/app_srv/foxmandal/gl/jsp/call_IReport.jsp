<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*"%>
 <%@ page import ="in.cdacnoida.icmr.gl.adaptor.UserInformation,in.cdacnoida.icmr.gl.adaptor.resourceBundle"%>
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
        
        String xmlPath="";
         String xmlPath1="";
        String pdfPath="";
        String strProposalid="";
        String strVersion="";
        String userid="";
        
        if(request.getParameter("strPropId")!=null)
           strProposalid=request.getParameter("strPropId").toString();
           
        if(request.getParameter("strVersionId")!=null)
           strVersion=request.getParameter("strVersionId").toString();
        
        if(request.getParameter("strUserID")!=null)
           userid=request.getParameter("strUserID").toString();   
           
        String realContextPath="";
        ServletContext context = session.getServletContext();
        realContextPath = context.getRealPath(request.getContextPath());
        realContextPath = realContextPath.substring(0,realContextPath.length()-5);
        xmlPath=realContextPath+"app_srv"+File.separator+"tdc"+File.separator+"gl"+File.separator+"jrxml";	
        //xmlPath="/home/anshu/jdeveloper/newWork/MSIPS/public_html/"+"app_srv"+File.separator+"tdc"+File.separator+"gl"+File.separator+"jrxml";	
        System.out.println("xmlPath="+xmlPath);
        
              
                
        DBQueryManager _dbq= new DBQueryManager();  
        ConnectionManager cm = new ConnectionManager();
        
        String strReport="";
        String strFileName="";
        Map parameters = new HashMap();
       
        if(request.getParameter("reportName")!=null)
        {
        strReport=request.getParameter("reportName");
        }
        
          System.out.println("reportName="+strReport);
        if(strReport.equals("Profile"))
        {
         xmlPath1=xmlPath+File.separator+"profileProposer.jrxml";
         strFileName=userid+"_Profile.pdf";
          parameters.put("userID",userid);
        }
        else if(strReport.equals("EMCDetails"))
        {
         System.out.println("xmlPath in EMC="+xmlPath);
          xmlPath1=xmlPath+File.separator+"emcdetails.jrxml";
          System.out.println("xmlPath in EMC="+xmlPath);
          System.out.println("xmlPath1 in EMC="+xmlPath1);
          strFileName=strProposalid+"_"+strVersion+"_EMC.pdf";
          
          
          parameters.put("versionid",strVersion);
          parameters.put("proposalid",strProposalid);
        }
        else if(strReport.equals("ProjDetails"))
        {
          xmlPath1=xmlPath+File.separator+"ProjectDetails.jrxml";
          strFileName=strProposalid+"_"+strVersion+"_prj.pdf";
          parameters.put("versionid",strVersion);
          parameters.put("proposalid",strProposalid);
        }
         else if(strReport.equals("FinDetails"))
        {
          xmlPath1=xmlPath+File.separator+"FinDetails.jrxml";
          strFileName=strProposalid+"_"+strVersion+"_fin.pdf";
          parameters.put("versionid",strVersion);
          parameters.put("proposalid",strProposalid);
        }
         else if(strReport.equals("PayDetails"))
        {
          xmlPath1=xmlPath+File.separator+"PaymentDetails.jrxml";
          strFileName=strProposalid+"_"+strVersion+"_pay.pdf";
          parameters.put("versionid",strVersion);
          parameters.put("proposalid",strProposalid);
        }
         System.out.println("after report finding ="+xmlPath1);
        
        
        glModel _gmdl= new glModel();
          //xmlPath=resourceBundle.getValueFromKey("JRXMLPATH");
        //xmlPath=_gmdl.getFilePath("xml");    
      
        
        System.out.println("xml path in jsp..."+xmlPath);
        InputStream input=new FileInputStream(xmlPath1);  
        pdfPath=xmlPath+File.separator+strFileName;
        System.out.println("pdf path in jsp..."+pdfPath);
        JasperDesign design = JRXmlLoader.load(input);  
        System.out.println("pdf path in jsp333333...");
        JasperReport report = JasperCompileManager.compileReport(design);  
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition","attachment; filename="+strFileName);
        response.setHeader("Cache-Control", "no-cache");  
        ServletOutputStream srvoutput =response.getOutputStream();
        
       
       
            Connection _conn=cm.getConnection();
        byte[] bytes=null; 
        JasperPrint print = JasperFillManager.fillReport(report,parameters,_conn);
        System.out.println("4");
        try{
        out.clearBuffer();
         OutputStream output=new FileOutputStream(new File(pdfPath));
         System.out.println("output"+output);
        JasperExportManager.exportReportToPdfStream(print, output); 
        System.out.println("5");
        net.sf.jasperreports.engine.export.JRPdfExporter pdfExporter=new net.sf.jasperreports.engine.export.JRPdfExporter();
                System.out.println("5 1");

        Map<JRExporterParameter, Object> parameterExport = new HashMap<JRExporterParameter, Object>();
       System.out.println("5 2");
        parameterExport.put(JRExporterParameter.JASPER_PRINT, print);
        System.out.println("5 3");
        parameterExport.put(JRPdfExporterParameter.OUTPUT_STREAM, srvoutput);
        System.out.println("6");
        pdfExporter.setParameters(parameterExport);
        pdfExporter.exportReport();
        _conn.close();
        srvoutput.flush();
        srvoutput.close();
         File f1=new File(pdfPath);
     f1.delete();
 
  }catch(Exception e)
  {
     _conn.close();
  System.out.println("error"+e);
  }
     
%>
    
    
    </body>
</html>