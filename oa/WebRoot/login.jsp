<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>淡定OA办公系统</title>
<link href="/oa/css/style.css" rel="stylesheet" type="text/css">
</head>

<body>
<div>
<div style="background-color: #72a3c3; width: 100%; height: 80px;"></div>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="109" height="8" background="/oa/images/login_01.gif"><img src="/oa/images/spacer.gif" width="1" height="1"></td>
    <td width="794" bgcolor="#72a3c3"></td>
    <td background="/oa/images/login_01.gif"><img src="/oa/images/spacer.gif" width="1" height="1"></td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0" background="/oa/images/login_03.gif">
  <tr>
    <td width="109" height="97">&nbsp;</td>
    <td width="300" valign="top"><img src="/oa/images/login_05.gif" width="291" height="71"></td>
    <td width="494" align="right" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="11"><img src="/oa/images/spacer.gif" width="1" height="1"></td>
        </tr>
      <tr>
        <td align="right"><a href="#"><img src="/oa/images/login_08.gif" width="71" height="17" border="0"></a></td>
        </tr>
    </table></td>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="109" height="10"><img src="/oa/images/spacer.gif" width="1" height="1"></td>
    <td><img src="/oa/images/spacer.gif" width="1" height="1"></td>
    <td width="281"><img src="/oa/images/spacer.gif" width="1" height="1"></td>
    <td><img src="/oa/images/spacer.gif" width="1" height="1"></td>
    <td><img src="/oa/images/spacer.gif" width="1" height="1"></td>
    <td bgcolor="#92BBD7"><img src="/oa/images/spacer.gif" width="1" height="1"></td>
  </tr>
  <tr>
    <td><img src="/oa/images/login_13.gif" width="109" height="181"></td>
    <td width="10"><img src="/oa/images/spacer.gif" width="1" height="1"></td>
    <td><img src="/oa/images/login_15.jpg" width="281" height="181"></td>
    <td width="493" align="center" background="/oa/images/login_16.jpg">
    <table width="90%" border="0" cellspacing="5" cellpadding="0">
<form name="form2" method="post" action="/oa/LoginServlet">
      <tr>
        <td width="70" align="right" class="F02">用户名：</td>
        <td>
          <input name="uname" type="text" class="input3" size="25">
        </td>
      </tr>
      <tr>
        <td align="right" class="F02">密　码：</td>
        <td><input name="upwd" type="password" class="input3" size="25">
          <input name="Button" type="submit" class="buttonface" value="  登录  " ></td>
      </tr><%--
      <tr>
	  
        <td>&nbsp;</td>
        <td class="F02">
           <input type="checkbox" name="checkbox2" value="checkbox">
            记住密码</td>
      </tr>
        --%></form>
    </table></td>
    <td width="10"><img src="/oa/images/spacer.gif" width="1" height="1"></td>
    <td><img src="/oa/images/login_18.gif" width="100" height="181"></td>
  </tr>
  <tr>
    <td height="10"><img src="/oa/images/spacer.gif" width="1" height="1"></td>
    <td><img src="/oa/images/spacer.gif" width="1" height="1"></td>
    <td><img src="/oa/images/spacer.gif" width="1" height="1"></td>
    <td><img src="/oa/images/spacer.gif" width="1" height="1"></td>
    <td><img src="/oa/images/spacer.gif" width="1" height="1"></td>
    <td><img src="/oa/images/login_21.gif" width="100" height="10"></td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
<form name="form1" method="post" action="">
  <tr>
    <td width="109" height="93" background="/oa/images/login_22.gif">&nbsp;</td>
    <td width="291" valign="bottom" background="/oa/images/login_22.gif"><img src="/oa/images/login_40.gif" width="291" height="68"></td>
    <td align="right" valign="top" background="/oa/images/login_22.gif"></td>
    </tr>
  <tr>
    <td height="100" class="td02">&nbsp;</td>
    <td class="td02">&nbsp;</td>
    <td class="td02">&nbsp;</td>
    </tr>
</form>
</table>
</div>
<div style="background-color: #92bbd7; width: 100%; height: 180px;"></div>
</body>
</html>

