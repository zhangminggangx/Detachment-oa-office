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
<meta http-equiv="Content-Type" content="text/html; charset=GBK"/>
<title>用户管理</title>
<link href="/oa/css/style.css" rel="stylesheet" type="text/css"/>
<script language="javascript" src="/oa/js/clientSideApp.js"></script>
<script language="javascript">
CSApp = parent.CSApp;
</script>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" >
<center>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="25" align="center" valign="bottom" class="td06"><table width="98%" border="0" cellspacing="3" cellpadding="0">
          <tr>
            <td width="15"><img src="/oa/images/index_32.gif" width="9" height="9"/></td>
            <td valign="bottom" class="title">用户管理</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <br/>
  <table width="95%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td align="right" class="td_page"><input name="Submit" type="button" class="buttonface02" onClick="location.href='query.htm'" value="  返回  "/></td>
    </tr>
  </table>
  <br/>
  <table width="95%" border="0" cellspacing="2" cellpadding="0">
    <tr>
      <td class="td_title">目前系统的系统管理员名单</td>
    </tr>
  </table>
    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="table01">
    <tr>
      <td nowrap class="td_top">登录名</td>
      <td nowrap class="td_top">部门</td>
      <td nowrap class="td_top">姓名 </td>
      <td nowrap class="td_top">性别</td>
      <td nowrap class="td_top">年龄</td>
      <td nowrap class="td_top">最后学历 </td>
      <td nowrap class="td_top">职务级别</td>
      <td nowrap class="td_top">政治面貌 </td>
      </tr>
    <tr>
      <td class="td_01">peng_bo</td>
      <td align="center" class="td_01">人事部</td>
      <td class="td_01">彭勃</td>
      <td class="td_01">男</td>
      <td class="td_01">31</td>
      <td class="td_01"></td>
      <td class="td_01"></td>
      <td class="td_01">群众</td>
      </tr>
    <tr>
      <td class="td_02">lee_yue</td>
      <td align="center" class="td_02">管理信息部</td>
      <td class="td_02">李岳</td>
      <td class="td_02">男</td>
      <td class="td_02">32</td>
      <td class="td_02">大学毕业</td>
      <td class="td_02">正处级</td>
      <td class="td_02">中共党员</td>
      </tr>
  </table>
</center>
</body>
</html>




