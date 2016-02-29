<%@ page contentType="text/html;charset=windows-1252"%>
<html>

<%
session.removeAttribute("userInfo");
session.invalidate();

System.out.println("session invallidated");
%>

<script>
location.href="/ICMR/app_srv/icmr/gl/jsp/quickpath.jsp";
</script>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>untitled</title>
  </head>
  <body>
  </body>
</html>
