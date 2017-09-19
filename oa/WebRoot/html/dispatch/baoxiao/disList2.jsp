<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>启动流程2</title>
<link href="/oa/css/style.css" rel="stylesheet" type="text/css">
<script language="javascript" src="/oa/js/clientSideApp.js"></script>
<link rel="stylesheet" href="/oa/small/multibox.css" type="text/css" media="screen" />
<script type="text/javascript" src="/oa/small/jquery.min.js"></script>


</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="25" align="center" valign="bottom" class="td06"><table width="98%" border="0" cellspacing="3" cellpadding="0">
      <tr>
        <td width="15"><img src="/oa/images/index_32.gif" width="9" height="9"></td>
        <td valign="bottom" class="title">启动流程</td>
      </tr>
    </table></td>
  </tr>
</table>
<br>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">

 
   <tr>
   <td class="td_01"><img src="/oa/images/arrow_01.gif" width="14" height="14" align="absmiddle">&nbsp;&nbsp;&nbsp;<a href="/oa/GetAllProServlet" target="mainFrame" class="a14">&nbsp;报销申请</a></td>
  </tr>
  <tr> 

    <td class="td_02"><img src="/oa/images/arrow_01.gif" width="14" height="14" align="absmiddle">&nbsp;&nbsp;&nbsp;
    <a href="/oa/include2.html" rel="width:740,height:230" class="advanced" title=" " style=" font-family:'Tahoma'; font-size: 14px; color: #2777BE; text-decoration: none; font-weight:bold">报销帮助</a></td>
  </tr>

 
</table>

<br>
<script type="text/javascript">
jQuery.noConflict();
jQuery(document).ready(function() {
	GnbHandler.init();
	ssc.Keywords.init();
});
</script>
<script type="text/javascript" src="/oa/small/gnb_new.js"></script>
<script type="text/javascript" src="/oa/small/mootools-yui-compressed.js"></script>
<script type="text/javascript" src="/oa/small/overlay.js"></script>
<script type="text/javascript" src="/oa/small/multibox.js"></script>
<script type="text/javascript">
	window.addEvent('domready', function(){
		var box = new multiBox('mb', {
			overlay: new overlay()
		});
		var advanced = new multiBox('advanced', {
			overlay: new overlay(),
			descClassName: 'advancedDesc'
		});
	});
</script>
</body>
</html>