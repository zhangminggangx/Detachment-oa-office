<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
<title>角色管理</title>
<script language="javascript">
function windowOpen(theURL,winName,features,width,hight,scrollbars,top,left) 
{
  var parameter="top="+top+",left="+left+",width="+width+",height="+hight;
  if(scrollbars=="no")
 {parameter+=",scrollbars=no";}
  else
 {parameter+=",scrollbars=yes";}
  window.open(theURL,winName,parameter);
}
</script>
<link href="/oa/css/style.css" rel="stylesheet" type="text/css"/>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<center>
<form name="form1" method="post" action="">
  <br/>
  <table width="95%"  border="0" cellspacing="2" cellpadding="0">
    <tr>
      <td class="td_title">当前用户所建角色列表 </td>
    </tr>
  </table>
  <table width="95%" border="0" cellpadding="0" cellspacing="0" class="table01">
    <tr>
      <td align="center" class="td_top">选择</td>
      <td class="td_top">角色名称</td>
      </tr>
    <tr>
      <td align="center" class="td_01"><input name="radiobutton" type="checkbox" value="radiobutton"/></td>
      <td class="td_01">系统管理员</td>
      </tr>
	<tr>
      <td align="center" class="td_02"><input name="radiobutton" type="checkbox" value="radiobutton"/></td>
      <td class="td_02">计调处管理员</td>
      </tr>
	<tr>
      <td align="center" class="td_01"><input name="radiobutton" type="checkbox" value="radiobutton"/></td>
      <td class="td_01">档案管理员</td>
      </tr>
	<tr>
      <td align="center" class="td_02"><input name="radiobutton" type="checkbox" value="radiobutton"/></td>
      <td class="td_02">普通人员</td>
      </tr>
	<tr>
      <td align="center" class="td_01"><input name="radiobutton" type="checkbox" value="radiobutton"/></td>
      <td class="td_01">出回国业务办理员</td>
      </tr>
  </table>
  <br>
  <table width="95%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td align="center"><input name="Submit" type="button" class="buttonface02" value="  确定  "/>
        <input name="Submit" type="button" class="buttonface02" onClick="window.close()" value="  关闭  "/></td>
    </tr>
  </table>
</form>
</center>
</body>
</html>
