<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>

<ul id="nav">
    <li> <a href="applicationIndex.aspx" title="Home">Ingest</a>
        <ul>
            <li><a href="#" title="#rabindrabhavan" >Metadata</a>
                <ul>
                    <c:if test="%{#session['role'] == 'A' || #session['role']=='U'}"> 
                        <li><a href="metaDateCreationShow.aspx?name=RB" title="Create">Create</a></li>
                        </c:if>
                        <c:if test="%{#session['role'] == 'A' || #session['role']=='V'}"> 
                        <li><a href="metaDateVerifyShow.aspx" title="Verify">Verify</a></li>
                        <li><a href="duplicateMetadataShow.aspx" title="Duplicate">Duplicate</a>

                            <ul>
                                <li><a href="duplicateMetadataShow.aspx" title="Delete">Delete</a></li>
                                <li><a href="duplicateMetadataShow.aspx" title="View">View</a></li>
                            </ul>
                        </c:if>
                        <c:if test="%{#session['role'] == 'A'}"> 
                        <li><a href="showmicrofilmupdate.aspx" title="Update Microfilm">Upd Microfilm</a></li>    

                    </c:if>
            </li>
        </ul>
    </li>
    <c:if test="%{#session['role'] == 'A' || #session['role']=='U'}"> 
        <li><a href="#sangeetbhavan" title="Batch Ingest">Batch Ingest</a>
            <ul>
                <li><a href="importMetaDataShow.aspx" title="Import">Import DVD</a></li>
                <li><a href="importMetaDataShow2.aspx" title="Import">Import PDF</a></li>
                <li><a href="export.aspx" title="Export">Export</a></li>
            </ul>
        </li>
    </c:if>
</ul>
</li>
<li><a href="#" title="Rabindra Bhavana">Utility Tools</a>
    <ul>
        <li><a href="#" title="Conversion">Conversion</a>
            <ul>
                <li><a href="convertTiffPdfShow.aspx" title="TIFF to PDF">TIFF to PDF</a>
                <li><a href="convertTiffJpegShow.aspx" title="TIFF to JPEG">TIFF to JPEG</a>
            </ul>
        </li>
    </ul>
</li>
<c:if test="%{#session['role'] == 'A'}"> 
    <li><a href="#kalabhavan" title="Backup">Backup</a>
        <ul>
            <li><a href="exportimportShow.aspx" title="Backup">Backup</a>
            <li><a href="exportimportShow.aspx" title="Restore">Restore</a>
        </ul>
    </li>
    <li><a href="#kalabhavan" title="Kala Bhavana">User</a>
        <ul>
            <li><a href="createUsersShow.aspx" title="Create">Create</a>
            <li><a href="deleteUsersShow.aspx" title="Delete User">Delete</a>
        </ul>
    </li>

    <li><a href="#" title="Master">Master</a>
        <ul>
            <li><a href="viewSubjectMaster.aspx" title="subject">Subject Master</a>
            <li><a href="viewPublisherMaster.aspx" title="publisher">Publisher Master</a>
        </ul>   
    </li>
</c:if>
<li><a href="#" title="About Us">About Us</a>

</li>
<li><a href="login.aspx" >Log out</a>

</li>
</ul>