<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
<title>淡定OA办公系统 ::::::::::</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="style.css">
<link href="../../css/style.css" rel="stylesheet" type="text/css" />
 <SCRIPT src="Contact.js"></SCRIPT>
</head>

<body topmargin="0" leftmargin="0">
<div align="center">
  <center>
  <form name="frmContact" method="post" action="add_cont_succ.jsp" onSubmit="return CheckValue();">
  <table border="0" width="300" cellspacing="0" cellpadding="0" height="57" bgcolor="#E7E7F7">
    <tr>
      <td width="6" background="../../images/littletop-back.gif" height="8" valign="top" align="left"><img border="0" src="../../images/OWtop-addressleft.gif" width="19" height="31"></td>
      <td width="271" background="../../images/OWtop-addressback.gif" height="8" valign="middle" align="left"><img border="0" src="../../images/icon-add.gif" align="absmiddle" width="14" height="14"> 
        添加联系人
	  </td>
      <td width="6" background="../../images/littletop-back.gif" height="8" valign="top" align="left"><img border="0" src="../../images/OWtop-addressright.gif" width="20" height="31"></td>
    </tr>
    <tr>
      <td width="6" background="../../images/OWleft-address.gif" height="29">　</td>
      <td width="271" height="29" valign="middle" align="center">
          <table border="0" width="100%" cellpadding="2">
            <tr>
              <td width="29%" valign="middle" align="left">姓 名：</td>
              <td width="71%">
				<input type="text" name="UserName" size="20"><font color=red> * </font>
			  </td>
            </tr>
			<!--社科院项目--删除--20050425--
			<tr>
              <td width="29%" valign="middle" align="left">昵 称：</td>
              <td width="71%"><input type="text" name="NickName" size="20"></td>
            </tr>
            <tr>
              <td width="29%" valign="middle" align="left">联系电话：</td>
              <td width="71%"><input type="text" name="Telephone" size="20"></td>
            </tr>
			-->
			<!--社科院项目--添加--开始--20050425-->
			<tr>
              <td width="29%" valign="middle" align="left">真实姓名：</td>
              <td width="71%"><input type="text" name="TrueName" size="20"></td>
            </tr>
            <tr>
              <td width="29%" valign="middle" align="left">办公电话：</td>
              <td width="71%"><input type="text" name="exbgshdh" size="20"></td>
            </tr>
            <tr>
              <td width="29%" valign="middle" align="left">住宅电话：</td>
              <td width="71%"><input type="text" name="exzhzdh" size="20"></td>
            </tr>
			<!--社科院项目--添加--结束--20050425-->
            <tr>
              <td width="29%" valign="middle" align="left">手 机：</td>
              <td width="71%"><input type="text" name="Mobile" size="20"></td>
            </tr>
            <tr>
              <td width="29%" valign="middle" align="left">电子邮件：</td>
              <td width="71%"><input type="text" name="Email" size="24"></td>
            </tr>
            <tr>
              <td width="29%" valign="middle" align="left">地 址：</td>
              <td width="71%"><input type="text" name="Address" size="24"></td>
            </tr>
            <tr>
              <td width="29%" valign="top" align="left">简单描述：</td>
              <td width="71%"><textarea rows="3" name="Desc" cols="23"></textarea><br>
                &nbsp;&nbsp;&nbsp;&nbsp;（最多200个字符）
			  </td>
            </tr>
			<tr>
              <td width="29%" valign="middle" align="left">&nbsp;</td>
              <td width="71%">&nbsp;</td>
            </tr>
            <tr align="center">
              <td colspan="2" width="100%">
				<input type="image"  src="../../images/button-add.gif" width="50" height="20" alt="确定增加">&nbsp;       
                <img border="0" src="../../images/button-reset1.gif" width="50" height="20"   alt="重新填写" onMouseOver="this.style.cursor='hand'" onClick="ClearMess()">&nbsp;       
                <img border="0" src="../../images/button-cancle.gif" width="50" height="20"   alt="取消操作" onMouseOver="this.style.cursor='hand'" onClick="javascript:window.close()">
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
			<input type="hidden" name="GroupId" value="0">
  </form>
  </center>
</div>
</body>
</html>