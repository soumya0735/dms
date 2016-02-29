<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>		
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <sx:head debug="true" parseContent="true"/>

    </head>
    <body>
        <div id="left-menu-wrapper">
            <div id="left-menu">
                <label style="font: bold 15px Verdana, Arial, Helvetica, sans-serif; color: white; vertical-align: middle">Metadata Menu</label>
            </div>
            <br/>
            <div style="position: relative;left: 10px">
                <sx:tree  id="menuList" label="<b style='font: bold 14px Verdana, Arial, Helvetica, sans-serif; height:60px'>Menu</b>" cssStyle="position:relative;left:5px" >                    
                    <sx:treenode label="<a style='font: bold 12px Verdana, Arial, Helvetica, sans-serif' href='showInsertMetaData.action?name=RB'>Metadata Creation</a>"/>
                    <sx:treenode label="<a style='font: bold 12px Verdana, Arial, Helvetica, sans-serif' href='metaDateVerifyShow.action'>Verify</a>"/>
                    <sx:treenode label="<a style='font: bold 12px Verdana, Arial, Helvetica, sans-serif' href='duplicateMetadataShow.action'>Duplicate</a>">
                        <sx:treenode label="<a style='font: bold 12px Verdana, Arial, Helvetica, sans-serif' href='duplicateMetadataShow.action'>Delete</a>"/>
                        <sx:treenode label="<a style='font: bold 12px Verdana, Arial, Helvetica, sans-serif' href='duplicateMetadataShow.action'>View</a>"/>
                    </sx:treenode>
                    <sx:treenode label="<a style='font: bold 12px Verdana, Arial, Helvetica, sans-serif' href='#'>Batch Ingest</a>">
                        <sx:treenode label="<a style='font: bold 12px Verdana, Arial, Helvetica, sans-serif' href='importMetaDataShow.action'>Import DVD</a>"/>
                        <sx:treenode label="<a style='font: bold 12px Verdana, Arial, Helvetica, sans-serif' href='importMetaDataShow2.action'>Import PDF</a>"/> 
                    </sx:treenode>
                    <sx:treenode label="<a style='font: bold 12px Verdana, Arial, Helvetica, sans-serif' href='#'>User Management</a>">
                        <sx:treenode label="<a style='font: bold 12px Verdana, Arial, Helvetica, sans-serif' href='createUsersShow.action'>Create</a>"/>
                        <sx:treenode label="<a style='font: bold 12px Verdana, Arial, Helvetica, sans-serif' href='deleteUsersShow.action'>Delete</a>"/>
                    </sx:treenode>
                </sx:tree>
            </div>
        </div>

    </body>
</html>
