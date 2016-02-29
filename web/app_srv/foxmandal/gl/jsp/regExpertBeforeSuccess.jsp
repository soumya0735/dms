<% if(session.getAttribute("userInfo")==null)  
{%>
<script type="text/javascript">
location.href="/ICMR/app_srv/icmr/gl/jsp/regExpertSuccess.jsp";
</script>
<%} else {
if(session.getAttribute("partialreg")=="partialreg")
{%>
<script type="text/javascript">
location.href="/ICMR/app_srv/icmr/gl/jsp/partialregSuccess.jsp";
</script>
<%}
else
{%>
<script type="text/javascript">
location.href="/ICMR/app_srv/icmr/gl/jsp/regSuccessAlloc.jsp";
</script>
<%}
}%>
