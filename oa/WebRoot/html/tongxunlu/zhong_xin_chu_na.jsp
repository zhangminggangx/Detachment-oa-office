<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>社科院电子所务 ::::::::::</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="style.css">
<link href="../../css/style.css" rel="stylesheet" type="text/css" />
</head>

<body topmargin="0" leftmargin="0">
<div align="center">
  <center>
  <form name="frmAddress" method="post" action="move_user_succ.jsp">
  <table border="0" width="300" cellspacing="0" cellpadding="0" height="57" bgcolor="#E7E7F7">
    <tr>
      <td width="6" background="../../images/littletop-back.gif" height="8" valign="top" align="left"><img border="0" src="../../images/OWtop-addressleft.gif" width="19" height="31"></td>
      <td width="271" background="../../images/OWtop-addressback.gif" height="8" valign="middle" align="left"><img border="0" src="../../images/icon-add.gif" align="absmiddle" width="14" height="14"> 
        移动用户到新组</td>
      <td width="6" background="../../images/littletop-back.gif" height="8" valign="top" align="left"><img border="0" src="../../images/OWtop-addressright.gif" width="20" height="31"></td>
    </tr>
    <tr>
      <td width="6" background="../../images/OWleft-address.gif" height="39">　</td>
      <td width="271" height="29" valign="middle" align="center">
		  <table border="0" width="100%" cellpadding="2">
            <tr>
              <td width="29%" valign="middle" align="left">用户名：</td>
              <td width="71%">中心出纳</td>
            </tr>
			<tr>
              <td width="29%" valign="middle" align="left">真实姓名：</td>
              <td width="71%">中心出纳</td>
            </tr>
			<!--社科院项目--删除--20050423
			<!--tr>
              <td width="29%" valign="middle" align="left">昵 称：</td>
              <td width="71%">
				NickName
			  </td>
            </tr>
            <tr>
              <td width="29%" valign="middle" align="left">联系电话：</td>
              <td width="71%">
				Tel
			  </td>
            </tr-->
			<tr>
              <td width="29%" valign="middle" align="left">办公电话：</td>
              <td width="71%">
				
			  </td>
            </tr>
			<tr>
              <td width="29%" valign="middle" align="left">住宅电话：</td>
              <td width="71%">
				
			  </td>
            </tr>
            <tr>
              <td width="29%" valign="middle" align="left">手 机：</td>
              <td width="71%">
				
			  </td>
            </tr>
            <tr>
              <td width="29%" valign="middle" align="left">电子邮件：</td>
              <td width="71%">
				
			  </td>
            </tr>
            <tr>
              <td width="29%" valign="middle" align="left">地 址：</td>
              <td width="71%">
				
			  </td>
            </tr>
			<tr>
              <td width="29%" valign="middle" align="left">当前组：</td>
              <td width="71%">
				
					同事
				
			  </td>
            </tr>
			<tr>
              <td width="29%" valign="middle" align="left">转移到：</td>
              <td width="71%">
				<select name="NewGroup">
				<option value="0">根目录组</option>
			
				<option value="485">同事</option>
			
				</select>
			  </td>
            </tr>
            <tr>
              <td width="29%" valign="middle" align="left">导入时间：</td>
              <td width="71%">2006-03-06 11:31:07</td>
            </tr>
			<tr>
              <td width="29%" valign="middle" align="left">&nbsp;</td>
              <td width="71%">&nbsp;</td>
            </tr>
            <tr>
              <td width="29%"></td>
              <td width="71%">
				   <input type="image"  src="../../images/button-submit.gif" width="50" height="20" border="0" alt="确定移动">&nbsp;&nbsp;&nbsp;&nbsp;
				   <img  src="../../images/button-cancle.gif" width="50" height="20" border="0" onMouseOver="this.style.cursor='hand'" onclick="javascript:window.close()" alt="取消操作">
			  </td>
            </tr>
          </table>
      </td>
      <td width="6" background="../../images/OWright-address.gif" height="29">　</td>
    </tr>
    <tr>
      <td width="6" background="../../images/littlebottom-back.gif" height="20" valign="top" align="left"><img border="0" src="../../images/OWbottom-addressleft.gif" width="19" height="33"></td>
      <td width="271" background="../../images/OWbottom-addressback.gif" height="20" valign="top" align="left">　</td>
      <td width="6" background="../../images/littlebottom-back.gif" height="20" valign="top" align="left"><img border="0" src="../../images/OWbottom-addressright.gif" width="20" height="33"></td>
    </tr>
  </table>
			<input type="hidden" name="AddrId"   value="11485">
			<input type="hidden" name="GroupId"  value="485">
  </form>
  </center>
</div>
</body>
</html>