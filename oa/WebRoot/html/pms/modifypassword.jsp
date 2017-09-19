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
<title>修改密码</title>

<link href="/oa/css/style.css" rel="stylesheet" type="text/css"/>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<center>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="25" align="center" valign="bottom" class="td06"><table width="98%" border="0" cellspacing="3" cellpadding="0">
          <tr>
            <td width="15"><img src="/oa/images/index_32.gif" width="9" height="9"/></td>
            <td valign="bottom" class="title">修改操作员密码</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <form name="form1" method="post" action="" >
  <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="90" align="center" class="td_form01" >新密码</td>
      <td class="td_form02"><input name="textfield" type="password" class="input" value="455687123444565578"/></td>
    </tr>
    <tr>
      <td class="td_form01">确认密码</td>
      <td class="td_form02"><input name="textfield" type="password" class="input" value="455687123444565578"/></td>
    </tr>
  </table>
  <br/>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td align="center"><input name="Submit" type="submit" class="buttonface02" value="  保存  "/>
        <input name="Submit" type="submit" class="buttonface02" onClick="window.close()" value="  关闭  "/></td>
    </tr>
  </table>
  </form>
</center>
</body>
</html>
