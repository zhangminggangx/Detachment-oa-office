<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>站内消息</title>
<link href="../../css/style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/javascript" src="../../js/win_center.js"></script>
<SCRIPT language=JavaScript type=text/JavaScript>
function windowOpen(theURL,winName,features,width,hight,scrollbars,top,left) 
{
  var parameter="top="+top+",left="+left+",width="+width+",height="+hight;
  if(scrollbars=="no")
 {parameter+=",scrollbars=no";}
  else
 {parameter+=",scrollbars=yes";}
  window.open(theURL,winName,parameter);
}
</SCRIPT>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="25" align="center" valign="bottom" class="td06"><table width="98%" border="0" cellspacing="3" cellpadding="0">
      <tr>
        <td width="15"><img src="../../images/index_32.gif" width="9" height="9"></td>
        <td valign="bottom" class="title">详细信息</td>
      </tr>
    </table></td>
  </tr>
</table>
<br>


<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
   <tr>
    <td width="130" class="td_form01"><div align="center">发送人：</div></td>
    <td width="616" class="td_form02">办公室</td>
   </tr>	
   <tr>
    <td width="130" class="td_form01"><div align="center">标题：</div></td>
    <td class="td_form02">通过（2006.4.3-2006.4.5）</td>
   </tr>	
   <tr>
    <td width="130" class="td_form01"><div align="center">内容：</div></td>
    <td class="td_form02">&nbsp;</td>
   </tr>	
</table>
  <tr>
    <div align="center">     </div>
  </tr>
</body>
</html>


