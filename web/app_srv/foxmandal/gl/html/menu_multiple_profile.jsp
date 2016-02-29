<script>
 function logout()
  {
  var log=confirm("Do you really want to Logout ?");
  if(log==true)
     location.href="/ICMR/app_srv/icmr/gl/jsp/logout.jsp";
     }
</script>
<body>
<nav class="menu inline padded">
<ul id="qm0" class="qmmc">

	<li><a href="/ICMR/multipleProfilePage.do?role=Y">User Home</a></li>
	<li><a href="javascript:logout();">Logout</a></li>
</ul>
</nav>
<!-- Create Menu Settings: (Menu ID, Is Vertical, Show Timer, Hide Timer, On Click (options: 'all' * 'all-always-open' * 'main' * 'lev2'), Right to Left, Horizontal Subs, Flush Left, Flush Top) -->
<script type="text/javascript">qm_create(0,false,0,500,false,false,false,false,false);</script>
	
	</body>

</html>

