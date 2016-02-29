<%@ page contentType="text/html;charset=windows-1252"%>

<%     // String strUserType = "P";
    //String strUserId="";
    // if(session.getAttribute("userInfo")!=null)
    //strUserType=((UserInformation)session.getAttribute("userInfo")).getStrUserType();
    //strUserId=((UserInformation)session.getAttribute("userInfo")).getStrUserID();
%>
<script>
   

    function logout() {
        var log = confirm("Do You Really Want to Logout ?");
        if (log == true)
            location.href = "/ICMR/app_srv/icmr/gl/jsp/logout.jsp";
    }

  
</script>
<body>
    <nav class="inline menu padded">
        <ul>
            <li>
                <a href="applicationIndex.action"><i class="icon-home"></i> Home</a>


            </li>
            <c:if test="${sessionScope.role == 'A' || sessionScope.role=='U' || sessionScope.role=='V'}">
                <li><a href="showWishList.action" title="Wish List" >Wish List</a></li>  
            </c:if>
            <c:if test="${sessionScope.role == 'A'}"> 
                <li><a href="importMetaDataShow.action" title="Batch Ingest"><i class="icon-upload-alt"></i> Batch Ingest</a></li>
            </c:if>
            <c:if test="${sessionScope.role == 'A' || sessionScope.role=='U' || sessionScope.role=='V'}">
                <li> <a href="changePassword.action" title="Change Password"><i class="icon-wrench"></i>Change Password</a></li>  
            </c:if>

            <li><a href="eArchive.action" title="Archive"><i class="icon-archive"></i>Archive</a></li>
            <li><a href="getAdvancedSearch.action" title="Advanced Search" ><i class="icon-search"></i>Advanced Search</a></li>
            <li><a href="logout.action" ><i class="icon-signout"></i> Log out</a></li>


        </ul>
    </nav>
</body>
</html>