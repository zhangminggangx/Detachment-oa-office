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
 <SCRIPT src="Contact.js"></SCRIPT>
</head>

<body topmargin="0" leftmargin="0">
<div align="center">
  <center>
  <form name="frmContact" method="post" action="edit_cont_succ.jsp">
  <table border="0" width="300" cellspacing="0" cellpadding="0" height="57" bgcolor="#E7E7F7">
    <tr>
      <td width="6" background="../../images/littletop-back.gif" height="8" valign="top" align="left"><img border="0" src="../../images/OWtop-addressleft.gif" width="19" height="31"></td>
      <td width="271" background="../../images/OWtop-addressback.gif" height="8" valign="middle" align="left"><img border="0" src="../../images/icon-add.gif" align="absmiddle" width="14" height="14"> 
        修改联系人</td>
      <td width="6" background="../../images/littletop-back.gif" height="8" valign="top" align="left"><img border="0" src="../../images/OWtop-addressright.gif" width="20" height="31"></td>
    </tr>
    <tr>
      <td width="6" background="../../images/OWleft-address.gif" height="29">　</td>
      <td width="271" height="29" valign="middle" align="center">
		  <table border="0" width="100%" cellpadding="2">
            <tr>
              <td width="29%" valign="middle" align="left">姓 名：</td>
              <td width="71%">
				<input type="text" name="UserName" size="20" value="Draco"><font color=red> * </font>
			  </td>
            </tr>
			<!--社科院项目--删除--20050425
            <tr>
              <td width="29%" valign="middle" align="left">真实姓名：</td>
              <td width="71%"><input type="text" name="NickName" size="20" value="Draco Yang"></td>
            </tr>
            <tr>
              <td width="29%" valign="middle" align="left">联系电话：</td>
              <td width="71%"><input type="text" name="Telephone" size="20" value=""></td>
            </tr>
			-->
			<!--社科院项目--添加--开始--20050425-->
            <tr>
              <td width="29%" valign="middle" align="left">真实姓名：</td>
              <td width="71%"><input type="text" name="NickName" size="20" value="Draco Yang"></td>
            </tr>
            <tr>
              <td width="29%" valign="middle" align="left">办公电话：</td>
              <td width="71%"><input type="text" name="exbgshdh" size="20" value="1234567"></td>
            </tr>
            <tr>
              <td width="29%" valign="middle" align="left">住宅电话：</td>
              <td width="71%"><input type="text" name="exzhzdh" size="20" value="1234567"></td>
            </tr>
			<!--社科院项目--添加--结束--20050425-->
            <tr>
              <td width="29%" valign="middle" align="left">手 机：</td>
              <td width="71%"><input type="text" name="Mobile" size="20" value="13522003361"></td>
            </tr>
            <tr>
              <td width="29%" valign="middle" align="left">电子邮件：</td>
              <td width="71%"><input type="text" name="Email" size="24" value="Draco@Yang.com"></td>
            </tr>
            <tr>
              <td width="29%" valign="middle" align="left">地 址：</td>
              <td width="71%"><input type="text" name="Address" size="24" value="14141 14 124123j 4;"></td>
            </tr>
			<tr>
              <td width="29%" valign="middle" align="left">当前组：</td>
              <td width="71%"><input type="text" name="CurrGroup" size="15" value="根目录组" readonly title="不允许修改！"></td>
            </tr>
			<tr>
              <td width="29%" valign="middle" align="left">转移到：</td>
              <td width="71%">
					<select name="NewGroup">
						<option value="0" selected>根目录组</option>
					
						<option value="485" >同事</option>
					
					</select>
			  </td>
            </tr>
            <tr>
              <td width="29%" valign="top" align="left">简单描述：</td>
              <td width="71%">
				<textarea rows="3" name="Desc" cols="23">asdfa asdfasdfasdfasdf</textarea><br>
                &nbsp;&nbsp;&nbsp;&nbsp;（最多200个字符）
			  </td>
            </tr>
			<tr>
              <td width="29%" valign="middle" align="left">创建时间：</td>
              <td width="71%">2006-06-26 10:18:13</td>
            </tr>
			<tr>
              <td width="29%" valign="middle" align="left">&nbsp;</td>
              <td width="71%">&nbsp;</td>
            </tr>
            <tr align="center">
              <td colspan="2" width="71%">
				<input type="image"  src="../../images/button-modify.gif" width="50" height="20" alt="确定修改">&nbsp;&nbsp;&nbsp;&nbsp;
                <img border="0" src="../../images/button-cancle.gif" width="50" height="20" alt="取消操作" onMouseOver="this.style.cursor='hand'" onClick="javascript:window.close()"></td>
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
			  <input type="hidden" name="GroupId"   value="0">
			  <input type="hidden" name="ContactId" value="1105">
  </form>
  </center>
</div>
</body>
</html>