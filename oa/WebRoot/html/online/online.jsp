
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>当前在线</title>
<link href="../../css/style.css" rel="stylesheet" type="text/css">
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
<style type="text/css">
<!--
.style1 {color: #FF0000}
-->
</style>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="25" align="center" valign="bottom" class="td06"><table width="98%" border="0" cellspacing="3" cellpadding="0">
      <tr>
        <td width="15"><img src="../../images/index_32.gif" width="9" height="9"></td>
        <td valign="bottom" class="title">当前在线</td>
      </tr>
    </table></td>
  </tr>
</table>

<br>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td class="td_top">当前在线　共<span class="style1">10</span>人　（5分钟内活跃用户）</td>
  </tr>
</table>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="table01">
  <tr>
    <td width="25%" class="td07"><img src="../../images/User_03.gif" width="15" height="15" align="absmiddle">中心主任</td>
    <td width="25%" class="td07"><img src="../../images/User_03.gif" width="15" height="15" align="absmiddle">科研处处长</td>
    <td width="25%" class="td07"><img src="../../images/User_03.gif" width="15" height="15" align="absmiddle">中心出纳</td>
    <td width="25%" class="td07"><img src="../../images/User_03.gif" width="15" height="15" align="absmiddle">中心会计</td>
  </tr>
  <tr>
    <td class="td07"><img src="../../images/User_03.gif" width="15" height="15" align="absmiddle">办公室秘书</td>
    <td class="td07"><img src="../../images/User_03.gif" width="15" height="15" align="absmiddle">测试部主任</td>
    <td class="td07"><img src="../../images/User_03.gif" width="15" height="15" align="absmiddle">王霞</td>
    <td class="td07"><img src="../../images/User_03.gif" width="15" height="15" align="absmiddle">杨东娴</td>
  </tr>
  <tr>
    <td class="td07"><img src="../../images/User_03.gif" width="15" height="15" align="absmiddle">徐昂</td>
    <td class="td07"><img src="../../images/User_03.gif" width="15" height="15" align="absmiddle">办公室主任</td>
    <td class="td07">&nbsp;</td>
    <td class="td07">&nbsp;</td>
  </tr>
</table>
<br>
</body>
</html>
